<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Manage Users</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .tabs { display: flex; gap: 10px; }
        .tab { padding: 10px 20px; border: 1px solid #ccc; background: #f9f9f9; text-decoration: none; color: #333; }
        .tab.active { background: #ddd; font-weight: bold; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background: #f4f4f4; }
    </style>
</head>
<body>
	<div style="position: fixed; top: 10px; right: 10px;">
    <a href="index.jsp" style="
        text-decoration: none; 
        font-size: 18px; 
        font-weight: bold; 
        padding: 10px 20px; 
        background-color: #007bff; 
        color: white; 
        border-radius: 5px; 
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); 
        transition: background-color 0.3s ease, transform 0.2s ease;">
        Home
    </a>
</div>
	
    <h1>Manage Users - ${role}</h1>
    <div class="tabs">
        <a href="manageUsers?role=Admin" class="tab ${role == 'Admin' ? 'active' : ''}">Admin</a>
        <a href="manageUsers?role=Fundraiser" class="tab ${role == 'Fundraiser' ? 'active' : ''}">Fundraiser</a>
        <a href="manageUsers?role=Donor" class="tab ${role == 'Donor' ? 'active' : ''}">Donor</a>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Name</th>
            <th>Status</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user[0]}</td>
                <td>${user[1]}</td>
                <td>${user[2]}</td>
                <td>${user[3]}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
