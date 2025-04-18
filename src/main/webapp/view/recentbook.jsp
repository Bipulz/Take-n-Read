<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books - ReadSphere</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recentbook.css">
</head>
<body>
    <div class="book-container">
        <h3>Recent Books</h3>
        <div class="books-grid">
            <div class="book-card">
                <img alt="Book Cover" src="img/muna-madan.jpg">
                <div class="book-info">
                    <h4 class="book-title">Muna Madan</h4>
                    <p class="book-author">Laxmi Prasad Devkota</p>
                    <p class="book-category">Poetry</p>
                    <div class="row">
                        <a href="register.jsp" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 299</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/to-kill-a-mockingbird.jpg">
                <div class="book-info">
                    <h4 class="book-title">To Kill a Mockingbird</h4>
                    <p class="book-author">Harper Lee</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 399</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/1984.jpg">
                <div class="book-info">
                    <h4 class="book-title">1984</h4>
                    <p class="book-author">George Orwell</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 349</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/pride-and-prejudice.jpg">
                <div class="book-info">
                    <h4 class="book-title">Pride and Prejudice</h4>
                    <p class="book-author">Jane Austen</p>
                    <p class="book-category">Romance</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 499</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/the-great-gatsby.jpg">
                <div class="book-info">
                    <h4 class="book-title">The Great Gatsby</h4>
                    <p class="book-author">F. Scott Fitzgerald</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 449</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/lord-of-the-flies.jpg">
                <div class="book-info">
                    <h4 class="book-title">Lord of the Flies</h4>
                    <p class="book-author">William Golding</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 379</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/catcher-in-the-rye.jpg">
                <div class="book-info">
                    <h4 class="book-title">The Catcher in the Rye</h4>
                    <p class="book-author">J.D. Salinger</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 429</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-al">
            <a href="#" class="btn add-cart"><i class="fas fa-book"></i> View All Books</a>
        </div>
    </div>

    <div class="book-container">
        <h3>New Books</h3>
        <div class="books-grid">
            <div class="book-card">
                <img alt="Book Cover" src="img/game-of-thrones.jpg">
                <div class="book-info">
                    <h4 class="book-title">A Game of Thrones</h4>
                    <p class="book-author">George R.R. Martin</p>
                    <p class="book-category">Fantasy</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 599</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/harry-potter.jpg">
                <div class="book-info">
                    <h4 class="book-title">Harry Potter and the Sorcerer's Stone</h4>
                    <p class="book-author">J.K. Rowling</p>
                    <p class="book-category">Fantasy</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i>-split- Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 499</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/lord-of-the-rings.jpg">
                <div class="book-info">
                    <h4 class="book-title">The Lord of the Rings</h4>
                    <p class="book-author">J.R.R. Tolkien</p>
                    <p class="book-category">Fantasy</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 699</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/hobbit.jpg">
                <div class="book-info">
                    <h4 class="book-title">The Hobbit</h4>
                    <p class="book-author">J.R.R. Tolkien</p>
                    <p class="book-category">Fantasy</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 449</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/da-vinci-code.jpg">
                <div class="book-info">
                    <h4 class="book-title">The Da Vinci Code</h4>
                    <p class="book-author">Dan Brown</p>
                    <p class="book-category">Thriller</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 479</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/twilight.jpg">
                <div class="book-info">
                    <h4 class="book-title">Twilight</h4>
                    <p class="book-author">Stephenie Meyer</p>
                    <p class="book-category">Romance</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 529</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/hunger-games.jpg">
                <div class="book-info">
                    <h4 class="book-title">The Hunger Games</h4>
                    <p class="book-author">Suzanne Collins</p>
                    <p class="book-category">Dystopian</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 459</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-al">
            <a href="#" class="btn add-cart"><i class="fas fa-book"></i> View All Books</a>
        </div>
    </div>

    <div class="book-container">
        <h3>Book Added By user (Old Book)</h3>
        <div class="books-grid">
            <div class="book-card">
                <img alt="Book Cover" src="img/great-expectations.jpg">
                <div class="book-info">
                    <h4 class="book-title">Great Expectations</h4>
                    <p class="book-author">Charles Dickens</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 399</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/jane-eyre.jpg">
                <div class="book-info">
                    <h4 class="book-title">Jane Eyre</h4>
                    <p class="book-author">Charlotte Brontë</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 349</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/wuthering-heights.jpg">
                <div class="book-info">
                    <h4 class="book-title">Wuthering Heights</h4>
                    <p class="book-author">Emily Brontë</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 329</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/moby-dick.jpg">
                <div class="book-info">
                    <h4 class="book-title">Moby-Dick</h4>
                    <p class="book-author">Herman Melville</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 399</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/frankenstein.jpg">
                <div class="book-info">
                    <h4 class="book-title">Frankenstein</h4>
                    <p class="book-author">Mary Shelley</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 429</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/dracula.jpg">
                <div class="book-info">
                    <h4 class="book-title">Dracula</h4>
                    <p class="book-author">Bram Stoker</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 359</span>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/adventures-of-huckleberry-finn.jpg">
                <div class="book-info">
                    <h4 class="book-title">Adventures of Huckleberry Finn</h4>
                    <p class="book-author">Mark Twain</p>
                    <p class="book-category">Fiction</p>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                        <span class="price">Rs. 379</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-al">
            <a href="#" class="btn add-cart"><i class="fas fa-book"></i> View All Books</a>
        </div>
    </div>
</body>
</html>