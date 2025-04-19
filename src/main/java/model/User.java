package model;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String phno;
    private String address;
    private String landmark;
    private String city;
    private String state;
    private String zip;
    private boolean acceptTerms;
    private String profileImage;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getPhno() { return phno; }
    public void setPhno(String phno) { this.phno = phno; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getLandmark() { return landmark; }
    public void setLandmark(String landmark) { this.landmark = landmark; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getState() { return state; }
    public void setState(String state) { this.state = state; }
    public String getZip() { return zip; }
    public void setZip(String zip) { this.zip = zip; }
    public boolean isAcceptTerms() { return acceptTerms; }
    public void setAcceptTerms(boolean acceptTerms) { this.acceptTerms = acceptTerms; }
    public String getProfileImage() { return profileImage; }
    public void setProfileImage(String profileImage) { this.profileImage = profileImage; }

    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phno=" + phno
                + ", address=" + address + ", landmark=" + landmark + ", city=" + city + ", state=" + state + ", zip=" + zip
                + ", acceptTerms=" + acceptTerms + ", profileImage=" + profileImage + "]";
    }
}