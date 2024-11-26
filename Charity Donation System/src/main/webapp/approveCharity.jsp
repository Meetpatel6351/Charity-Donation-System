<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Approve Charities</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
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

    <h1>Pending Charity Approvals</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Registration Date</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="charity" items="${charities}">
            <tr>
                <td>${charity[0]}</td>
                <td>${charity[1]}</td>
                <td>${charity[2]}</td>
                <td>
                    <form action="approveCharity" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${charity[0]}">
                        <button type="submit" name="action" value="approve">Approve</button>
                    </form>
                    <form action="approveCharity" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${charity[0]}">
                        <button type="submit" name="action" value="reject">Reject</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
