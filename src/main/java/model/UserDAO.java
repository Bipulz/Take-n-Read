package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean userRegister(User us) {
        try {
            String sql = "INSERT INTO users(name, email, phno, password, address, landmark, city, state, zip, accept_terms) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getPassword());
            ps.setString(5, us.getAddress());
            ps.setString(6, us.getLandmark());
            ps.setString(7, us.getCity());
            ps.setString(8, us.getState());
            ps.setString(9, us.getZip());
            ps.setBoolean(10, us.isAcceptTerms());

            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters: name=" + us.getName() + ", email=" + us.getEmail() + ", phno=" + us.getPhno() +
                              ", password=" + us.getPassword() + ", address=" + us.getAddress() + ", landmark=" + us.getLandmark() +
                              ", city=" + us.getCity() + ", state=" + us.getState() + ", zip=" + us.getZip() +
                              ", accept_terms=" + us.isAcceptTerms());

            int i = ps.executeUpdate();
            System.out.println("Rows affected: " + i);
            return i == 1;
        } catch (SQLException e) {
            System.err.println("SQL Error in userRegister: " + e.getMessage());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.err.println("Unexpected error in userRegister: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByEmail(String email) {
        try {
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhno(rs.getString("phno"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setLandmark(rs.getString("landmark"));
                user.setCity(rs.getString("city"));
                user.setState(rs.getString("state"));
                user.setZip(rs.getString("zip"));
                user.setAcceptTerms(rs.getBoolean("accept_terms"));
                user.setProfileImage(rs.getString("profile_image"));
                return user;
            }
            System.out.println("No user found with email: " + email);
            return null;
        } catch (SQLException e) {
            System.err.println("SQL Error in getUserByEmail: " + e.getMessage());
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            System.err.println("Unexpected error in getUserByEmail: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public boolean updateProfileImage(String email, String imagePath) {
        try {
            String sql = "UPDATE users SET profile_image = ? WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, imagePath);
            ps.setString(2, email);

            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters: imagePath=" + imagePath + ", email=" + email);

            int i = ps.executeUpdate();
            System.out.println("Rows affected: " + i);
            return i == 1;
        } catch (SQLException e) {
            System.err.println("SQL Error in updateProfileImage: " + e.getMessage());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.err.println("Unexpected error in updateProfileImage: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(User us) {
        try {
            String sql = "UPDATE users SET name = ?, address = ?, landmark = ?, city = ?, state = ?, zip = ? WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getAddress());
            ps.setString(3, us.getLandmark());
            ps.setString(4, us.getCity());
            ps.setString(5, us.getState());
            ps.setString(6, us.getZip());
            ps.setString(7, us.getEmail());

            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters: name=" + us.getName() + ", address=" + us.getAddress() + ", landmark=" + us.getLandmark() +
                              ", city=" + us.getCity() + ", state=" + us.getState() + ", zip=" + us.getZip() + ", email=" + us.getEmail());

            int i = ps.executeUpdate();
            System.out.println("Rows affected: " + i);
            return i == 1;
        } catch (SQLException e) {
            System.err.println("SQL Error in updateUser: " + e.getMessage());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.err.println("Unexpected error in updateUser: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserAndImage(User us, String imagePath) {
        try {
            String sql = "UPDATE users SET name = ?, address = ?, landmark = ?, city = ?, state = ?, zip = ?, profile_image = ? WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getAddress());
            ps.setString(3, us.getLandmark());
            ps.setString(4, us.getCity());
            ps.setString(5, us.getState());
            ps.setString(6, us.getZip());
            ps.setString(7, imagePath != null ? imagePath : us.getProfileImage());
            ps.setString(8, us.getEmail());

            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters: name=" + us.getName() + ", address=" + us.getAddress() + ", landmark=" + us.getLandmark() +
                              ", city=" + us.getCity() + ", state=" + us.getState() + ", zip=" + us.getZip() +
                              ", profile_image=" + (imagePath != null ? imagePath : us.getProfileImage()) + ", email=" + us.getEmail());

            int i = ps.executeUpdate();
            System.out.println("Rows affected: " + i);
            return i == 1;
        } catch (SQLException e) {
            System.err.println("SQL Error in updateUserAndImage: " + e.getMessage());
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            System.err.println("Unexpected error in updateUserAndImage: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}