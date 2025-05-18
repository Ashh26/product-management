
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>ProductHub - Product List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #eef2fc;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ccc;
        }
        header h1 {
            color: #333;
            font-size: 24px;
            margin: 0;
        }
        .btn {
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: inline-block;
        }
        .btn-primary {
            background-color: #6366f1;
            color: white;
            border: none;
        }
        .btn-edit {
            background-color: #3b82f6;
            color: white;
        }
        .btn-delete {
            background-color: #ef4444;
            color: white;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 14px 20px;
            text-align: left;
        }
        th {
            background-color: #f1f5f9;
            font-weight: 600;
        }
        tr:nth-child(even) {
            background-color: #f9fafb;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .empty-state {
            text-align: center;
            color: #6b7280;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<header>
    <h1>📦 ProductHub</h1>
    <a href="${pageContext.request.contextPath}/products/new" class="btn btn-primary">➕ Add Product</a>
</header>

<div class="container">
    <c:if test="${empty products }">
        <div class="empty-state">
            <h3>No products found</h3>
            <p>Add a new product or adjust your search criteria.</p>
        </div>
  </c:if>
    
    <c:if test="${not empty products}">
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price (₹)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.id }</td>
                <td>${p.name }</td>
                <td>${p.price}</td>
                <td class="action-buttons">
                    <a href="${pageContext.request.contextPath}/products/edit/${p.id}" class="btn btn-edit">✏️ Edit</a>
                    <a href="${pageContext.request.contextPath}/products/delete/${p.id}" class="btn btn-delete" onclick="return confirm('Are you sure you want to delete this product?');">🗑️ Delete</a>
                </td>
            </tr>
            </c:forEach>
        </tbody>
        
    </table>
      </c:if>
</div>

</body>
</html>






