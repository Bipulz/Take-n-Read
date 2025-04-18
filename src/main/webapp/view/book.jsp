<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books - Take n' Read</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
</head>
<body>
    
    <div class="book-container recent-books">
        <h3>Recent Books</h3>
        <div class="books-grid">
            <div class="book-card">
                <img alt="Book Cover" src="img/harry-potter-sorcerer.jpg">
                <div class="book-info">
                    <h4 class="book-title">Harry Potter and the Sorcerer's Stone</h4>
                    <p class="book-author">J.K. Rowling</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fantasy</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 499</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/harry-potter-chamber.jpg">
                <div class="book-info">
                    <h4 class="book-title">Harry Potter and the Chamber of Secrets</h4>
                    <p class="book-author">J.K. Rowling</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fantasy</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 499</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/one-piece.jpg">
                <div class="book-info">
                    <h4 class="book-title">One Piece</h4>
                    <p class="book-author">Eiichiro Oda</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Manga</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 299</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/great-expectations.jpg">
                <div class="book-info">
                    <h4 class="book-title">Great Expectations</h4>
                    <p class="book-author">Charles Dickens</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fiction</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 399</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/jane-eyre.jpg">
                <div class="book-info">
                    <h4 class="book-title">Jane Eyre</h4>
                    <p class="book-author">Charlotte Brontë</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fiction</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 349</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/muna-madan.jpg">
                <div class="book-info">
                    <h4 class="book-title">Muna Madan</h4>
                    <p class="book-author">Laxmi Prasad Devkota</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Nepali Literature</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 250</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-al">
            <a href="#" class="btn"><i class="fas fa-book"></i> View All Books</a>
        </div>
    </div>
    <div class="section-divider"></div>


    <div class="book-container new-books">
        <h3>New Books</h3>
        <div class="books-grid">
            <div class="book-card">
                <img alt="Book Cover" src="img/harry-potter-sorcerer.jpg">
                <div class="book-info">
                    <h4 class="book-title">Harry Potter and the Sorcerer's Stone</h4>
                    <p class="book-author">J.K. Rowling</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fantasy</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 499</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/harry-potter-chamber.jpg">
                <div class="book-info">
                    <h4 class="book-title">Harry Potter and the Chamber of Secrets</h4>
                    <p class="book-author">J.K. Rowling</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fantasy</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 499</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/harry-potter-prisoner.jpg">
                <div class="book-info">
                    <h4 class="book-title">Harry Potter and the Prisoner of Azkaban</h4>
                    <p class="book-author">J.K. Rowling</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fantasy</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 529</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/one-piece.jpg">
                <div class="book-info">
                    <h4 class="book-title">One Piece</h4>
                    <p class="book-author">Eiichiro Oda</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Manga</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 299</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/naruto.jpg">
                <div class="book-info">
                    <h4 class="book-title">Naruto</h4>
                    <p class="book-author">Masashi Kishimoto</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Manga</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 279</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/muna-madan.jpg">
                <div class="book-info">
                    <h4 class="book-title">Muna Madan</h4>
                    <p class="book-author">Laxmi Prasad Devkota</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Nepali Literature</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 250</span>
                    <div class="row">
                        <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-al">
            <a href="#" class="btn"><i class="fas fa-book"></i> View All Books</a>
        </div>
    </div>
    <div class="section-divider"></div>

  
    <div class="book-container old-books">
        <h3>Old Books</h3>
        <div class="books-grid">
            <div class="book-card">
                <img alt="Book Cover" src="img/great-expectations.jpg">
                <div class="book-info">
                    <h4 class="book-title">Great Expectations</h4>
                    <p class="book-author">Charles Dickens</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fiction</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 399</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/jane-eyre.jpg">
                <div class="book-info">
                    <h4 class="book-title">Jane Eyre</h4>
                    <p class="book-author">Charlotte Brontë</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fiction</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 349</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/wuthering-heights.jpg">
                <div class="book-info">
                    <h4 class="book-title">Wuthering Heights</h4>
                    <p class="book-author">Emily Brontë</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fiction</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 329</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/frankenstein.jpg">
                <div class="book-info">
                    <h4 class="book-title">Frankenstein</h4>
                    <p class="book-author">Mary Shelley</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fiction</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 429</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/dracula.jpg">
                <div class="book-info">
                    <h4 class="book-title">Dracula</h4>
                    <p class="book-author">Bram Stoker</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Fiction</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 359</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
            <div class="book-card">
                <img alt="Book Cover" src="img/muna-madan.jpg">
                <div class="book-info">
                    <h4 class="book-title">Muna Madan</h4>
                    <p class="book-author">Laxmi Prasad Devkota</p>
                    <p class="book-category"><i class="fas fa-bookmark"></i> Nepali Literature</p>
                    <span class="price"><i class="fas fa-tag"></i> Rs. 250</span>
                    <div class="row">
                        <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-al">
            <a href="#" class="btn"><i class="fas fa-book"></i> View All Books</a>
        </div>
    </div>
</body>
</html>