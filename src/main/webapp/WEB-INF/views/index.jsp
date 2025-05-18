<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ProductHub</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	background: #f9fafb;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	background: #eef2ff;
}

.title {
	font-size: 24px;
	font-weight: bold;
	color: #3730a3;
}

.search-bar input {
	padding: 8px 10px;
	width: 250px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

.add-btn {
	background: #6366f1;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	font-weight: bold;
	cursor: pointer;
	transition: background 0.3s;
}
.add-btn:hover {
	background: #4f46e5;
}

.content {
	text-align: center;
	padding: 40px 20px;
}

.product-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
	padding: 20px;
}

.product-card {
	background: white;
	border-radius: 8px;
	padding: 20px;
	width: 220px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	transition: transform 0.2s;
}
.product-card:hover {
	transform: translateY(-5px);
}

.btn {
	display: inline-block;
	padding: 8px 12px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: bold;
	transition: all 0.2s ease-in-out;
	font-size: 14px;
}

.btn-edit {
	background-color: #3b82f6;
	color: white;
}
.btn-edit:hover {
	background-color: #2563eb;
	transform: scale(1.05);
}

.btn-delete {
	background-color: #ef4444;
	color: white;
}
.btn-delete:hover {
	background-color: #dc2626;
	transform: scale(1.05);
}

.action-buttons {
	display: flex;
	gap: 10px;
	justify-content: center;
	margin-top: 10px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border-radius: 10px;
	width: 300px;
	box-shadow: 0 5px 10px rgba(0,0,0,0.3);
	text-align: center;
}

.toast {
	position: fixed;
	top: 20px;
	right: 20px;
	background-color: #10b981;
	color: white;
	padding: 12px 20px;
	border-radius: 8px;
	font-weight: bold;
	display: none;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
<script>
function showDeleteModal(productId) {
	document.getElementById("deleteModal").style.display = "block";
	document.getElementById("confirmDeleteBtn").onclick = function() {
		window.location.href = 'products/delete/' + productId;
	};
}

function closeDeleteModal() {
	document.getElementById("deleteModal").style.display = "none";
}

function showToast(message) {
	const toast = document.getElementById("toast");
	toast.textContent = message;
	toast.style.display = "block";
	setTimeout(() => toast.style.display = "none", 3000);
}
</script>
</head>
<body>

	<div class="header">
		<div class="title">ProductHub</div>
		<div class="search-bar">
			<input type="text" placeholder="Search products..." />
			<a href="${pageContext.request.contextPath}/products/new">
				<button class="add-btn">Add Product</button>
			</a>
		</div>
	</div>

	<div class="content">
		<c:choose>
			<c:when test="${empty products}">
				<h2>No products found</h2>
				<p>Add a new product or adjust your search criteria</p>
			</c:when>
			<c:otherwise>
				<div class="product-list">
					<c:forEach var="p" items="${products}">
						<div class="product-card">
							<h3>${p.name}</h3>
							<p>Price: ₹${p.price}</p>
							<div class="action-buttons">
								<a href="${pageContext.request.contextPath}/products/edit/${p.id}" class="btn btn-edit">✏️ Edit</a>
								<a href="javascript:void(0);" onclick="showDeleteModal(${p.id})" class="btn btn-delete">🗑️ Delete</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- Delete Confirmation Modal -->
	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<h3>Confirm Delete</h3>
			<p>Are you sure you want to delete this product?</p>
			<div style="margin-top: 15px;">
				<button onclick="closeDeleteModal()" class="btn btn-edit">Cancel</button>
				<button id="confirmDeleteBtn" class="btn btn-delete">Yes, Delete</button>
			</div>
		</div>
	</div>

	<!-- Toast -->
	<div id="toast" class="toast"></div>
</body>
</html>
