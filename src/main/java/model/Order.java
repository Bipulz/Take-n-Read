package model;

public class Order {
    private int id;
    private String orderId;
    private String userName;
    private String address;
    private String email;
    private String phone;
    private String bookName;
    private String author;
    private double price;
    private String payment;

    // Constructor for creating a new order 
    public Order(String orderId, String userName, String address, String email, String phone, String bookName, String author, double price, String payment) {
        this.orderId = orderId;
        this.userName = userName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.payment = payment;
    }

    // Constructor for retrieving existing order 
    public Order(int id, String orderId, String userName, String address, String email, String phone, String bookName, String author, double price, String payment) {
        this.id = id;
        this.orderId = orderId;
        this.userName = userName;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.payment = payment;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

}