package model;

public class User {
    private int id;
    private String name, email, phno, address, landmark, city, state, zip, profileImage, password;
    private boolean acceptTerms;

    // No-args constructor
    public User() {
    }

    // Parameterized constructor
    public User(int id, String name, String email, String phno, String address, String landmark, String city, String state, String zip, String profileImage, String password, boolean acceptTerms) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phno = phno;
        this.address = address;
        this.landmark = landmark;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.profileImage = profileImage;
        this.password = password;
        this.acceptTerms = acceptTerms;
    }
 // Getters
    public int getId() {
        return id;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhno() {
        return phno;
    }

    public String getAddress() {
        return address;
    }

    public String getLandmark() {
        return landmark;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getZip() {
        return zip;
    }

    public String getPassword() {
        return password;
    }

    public boolean isAcceptTerms() {
        return acceptTerms;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setLandmark(String landmark) {
        this.landmark = landmark;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAcceptTerms(boolean acceptTerms) {
        this.acceptTerms = acceptTerms;
    }

}