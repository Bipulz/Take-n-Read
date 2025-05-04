package controller;

import java.io.File;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;
import model.UserDAO;
import model.connectionDAO;

@WebServlet("/updateProfileAndImage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB  
public class UploadProfileImageServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            session.setAttribute("errorMessage", "Please log in to update your profile.");
            System.out.println("Update profile denied: User not logged in");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            // Get form data
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String landmark = request.getParameter("landmark");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            Part filePart = request.getPart("profileImage");

            System.out.println("Received data: name=" + name + ", address=" + address + ", landmark=" + landmark +
                              ", city=" + city + ", state=" + state + ", zip=" + zip + ", filePart=" + (filePart != null ? filePart.getSubmittedFileName() : "null"));

            // Validate name
            if (name == null || name.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Full name is required.");
                System.out.println("Validation failed: Missing or empty name");
                response.sendRedirect(request.getContextPath() + "/profile");
                return;
            }

            // Create updated User object
            User updatedUser = new User();
            updatedUser.setName(name);
            updatedUser.setEmail(user.getEmail());
            updatedUser.setPhno(user.getPhno());
            updatedUser.setPassword(user.getPassword());
            updatedUser.setAddress(address);
            updatedUser.setLandmark(landmark);
            updatedUser.setCity(city);
            updatedUser.setState(state);
            updatedUser.setZip(zip);
            updatedUser.setAcceptTerms(user.isAcceptTerms());
            updatedUser.setProfileImage(user.getProfileImage());

            // Handle image upload
            String dbFilePath = null;
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = extractFileName(filePart);
                if (fileName == null || fileName.isEmpty()) {
                    session.setAttribute("errorMessage", "Invalid file name.");
                    System.out.println("Image upload failed: Invalid file name");
                    response.sendRedirect(request.getContextPath() + "/profile");
                    return;
                }

                String contentType = filePart.getContentType();
                if (!contentType.startsWith("image/")) {
                    session.setAttribute("errorMessage", "Only image files are allowed.");
                    System.out.println("Image upload failed: Invalid file type - " + contentType);
                    response.sendRedirect(request.getContextPath() + "/profile");
                    return;
                }

                String applicationPath = request.getServletContext().getRealPath("");
                String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    System.out.println("Creating upload directory: " + uploadPath);
                    uploadDir.mkdirs();
                }

                if (!uploadDir.canWrite()) {
                    session.setAttribute("errorMessage", "Server error: Cannot write to upload directory.");
                    System.out.println("Image upload failed: No write permission for " + uploadPath);
                    response.sendRedirect(request.getContextPath() + "/profile");
                    return;
                }

                String uniqueFileName = user.getEmail().replace("@", "_") + "_" + System.currentTimeMillis() + "_" + fileName;
                String filePath = uploadPath + File.separator + uniqueFileName;
                System.out.println("Saving file to: " + filePath);
                filePart.write(filePath);
                dbFilePath = UPLOAD_DIR + "/" + uniqueFileName;
            }

            // Update database
            UserDAO dao = new UserDAO(connectionDAO.getconn());
            boolean success = dao.updateUserAndImage(updatedUser, dbFilePath);

            if (success) {
                User refreshedUser = dao.getUserByEmail(user.getEmail());
                session.setAttribute("user", refreshedUser);  
                session.setAttribute("successMessage", "Profile and image updated successfully!");
                System.out.println("Profile updated for email: " + user.getEmail() + ", image: " + (dbFilePath != null ? dbFilePath : "unchanged"));
            } else {
                session.setAttribute("errorMessage", "Failed to update profile. Please try again.");
                System.out.println("Profile update failed: Database update failed");
            }
            response.sendRedirect(request.getContextPath() + "/profile");
        } catch (Exception e) {
            System.err.println("Error in UpdateProfileAndImageServlet: " + e.getMessage());
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/profile");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp == null) return null;
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                String fileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                return fileName.isEmpty() ? null : fileName;
            }
        }
        return null;
    }
}