package model;

public class Cart {
    private int cartId;
    private int bookId;
    private int userId;
    private String bookName;
    private String author;
    private double price;
    private double totalPrice;
    private int quantity;

 
    public Cart(int bookId, int userId, String bookName, String author, double price, double totalPrice, int quantity) {
        this.bookId = bookId;
        this.userId = userId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }

 
    public Cart(int cartId, int bookId, int userId, String bookName, String author, double price, double totalPrice, int quantity) {
        this.cartId = cartId;
        this.bookId = bookId;
        this.userId = userId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.totalPrice = totalPrice;
        this.quantity = quantity;
    }


    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}