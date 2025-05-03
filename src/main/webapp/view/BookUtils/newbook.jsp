	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <title>New books - Take n' Read</title>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
	</head>
<body>
<% if (request.getAttribute("fromIndex") == null) { %>
    <%@ include file="../utils/Navbar.jsp" %>
<% } %>

<div class="book-container new-books">
	    <h3>New Books</h3>
	    <div class="books-grid">
	        <div class="book-card">
	            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/ijoriya.jpg">

	            <div class="book-info">
	                <h4 class="book-title">Ijoriya</h4>
	                <p class="book-author">Subin Bhattarai</p>
	                <p class="book-category"><i class="fas fa-bookmark"></i> Romance</p>
	                <span class="price"><i class="fas fa-tag"></i> Rs. 375</span>
	                <div class="row">
	                    <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
	                    <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
	                </div>
	            </div>
	        </div>
	        <div class="book-card">
	            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/summer-love.jpg">
	            <div class="book-info">
	                <h4 class="book-title">Summer Love</h4>
	                <p class="book-author">Subin Bhattarai</p>
	                <p class="book-category"><i class="fas fa-bookmark"></i> Romance</p>
	                <span class="price"><i class="fas fa-tag"></i> Rs. 340</span>
	                <div class="row">
	                    <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
	                    <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
	                </div>
	            </div>
	        </div>
			<div class="book-card">
			
			    <img alt="Book Cover" src="${pageContext.request.contextPath}/img/himalpari_ko_huri.jpg">
			    <div class="book-info">
			        <h4 class="book-title">Himalpari Ko Huri</h4>
			        <p class="book-author">Sudhir Sharma</p>
			        <p class="book-category"><i class="fas fa-bookmark"></i> Nepali Literature</p>
			        <span class="price"><i class="fas fa-tag"></i> Rs. 350</span>
			        <div class="row">
			            <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
			            <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
			        </div>
			    </div>
			</div>

	        <div class="book-card">
	            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/radha.jpg">
	            <div class="book-info">
	                <h4 class="book-title">Radha</h4>
	                <p class="book-author">Krishna Dharabasi</p>
	                <p class="book-category"><i class="fas fa-bookmark"></i> Mythological Fiction</p>
	                <span class="price"><i class="fas fa-tag"></i> Rs. 360</span>
	                <div class="row">
	                    <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
	                    <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
	                </div>
	            </div>
	        </div>
			<div class="book-card">
			    <img alt="Book Cover" src="${pageContext.request.contextPath}/img/witch_doctor_essays.jpg">
			    <div class="book-info">
			        <h4 class="book-title">The Witch Doctor & Other Essays</h4>
			        <p class="book-author">Laxmi Prasad Devkota</p>
			        <p class="book-category"><i class="fas fa-bookmark"></i> Essays</p>
			        <span class="price"><i class="fas fa-tag"></i> Rs. 400</span>
			        <div class="row">
			            <a href="#" class="btn add-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
			            <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
			        </div>
			    </div>
			</div>

	        <div class="book-card">
	            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/palpasa-cafe.jpg">
	            <div class="book-info">
	                <h4 class="book-title">Palpasa Cafe</h4>
	                <p class="book-author">Narayan Wagle</p>
	                <p class="book-category"><i class="fas fa-bookmark"></i> Contemporary Fiction</p>
	                <span class="price"><i class="fas fa-tag"></i> Rs. 350</span>
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
</body>
</html>