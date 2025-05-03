	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="UTF-8">
	    <title>User Added books - Take n' Read</title>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600&family=Open+Sans:wght@400;500&display=swap">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
	</head>
<body>
<% if (request.getAttribute("fromIndex") == null) { %>
    <%@ include file="../utils/Navbar.jsp" %>
<% } %>
	<div class="book-container old-books">
	    <h3>Old Books</h3>
	    <div class="books-grid">
		<div class="book-card">
		    <img alt="Book Cover" src="${pageContext.request.contextPath}/img/fossil.jpg">
		    <div class="book-info">
		        <h4 class="book-title">Fossil</h4>
		        <p class="book-author">Kumar Nagarkoti</p>
		        <p class="book-category"><i class="fas fa-bookmark"></i> Nepali Literature</p>
		        <span class="price"><i class="fas fa-tag"></i> Rs. 450</span>
		        <div class="row">
		           
		            <a href="#" class="btn view-dtl"><i class="fas fa-eye"></i> View Details</a>
		        </div>
		    </div>
		</div>

	        <div class="book-card">
	            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/muna-madan.jpg">
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
	        <div class="book-card">
	            <img alt="Book Cover" src="${pageContext.request.contextPath}/img/shirishko-phool.jpg">
	            <div class="book-info">
	                <h4 class="book-title">Shirishko Phool</h4>
	                <p class="book-author">Parijat</p>
	                <p class="book-category"><i class="fas fa-bookmark"></i> Nepali Literature</p>
	                <span class="price"><i class="fas fa-tag"></i> Rs. 280</span>
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