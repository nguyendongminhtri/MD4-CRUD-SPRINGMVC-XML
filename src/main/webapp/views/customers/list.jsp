<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html >

<style>
    table {
        width: 100%;
    }
</style>

<head>

    <title>List Customer</title>

</head>

<body>
<h1>Customer</h1>

<p>

    <%--    <a href="customers?action=create">Create new customer</a>--%>
    <a href="/customer/create">Create</a>
</p>

<table border="1">

    <tr>
        <td>STT</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Detail</td>
        <td>Edit</td>
        <td>Delete</td>

    </tr>

    <c:forEach items='${requestScope["customers"]}' var="customer">

        <tr>

                <%--            <td><a href="customers?action=view&id=${customer.getId()}">${customer.getName()}</a></td>--%>
            <td><a href="/create"> ${customer.getId()}</a></td>
            <td>${customer.getName()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>

            <td><a href="/customer/${customer.getId()}">Detail</a></td>
                <%--            <td><a href="/detail/{${customer.getId()}}">Edit</a> </td>--%>
            <td><a href="/customer/edit/${customer.getId()}">Edit</a></td>
            <td><a href="/customer/delete/${customer.getId()}">Delete</a></td>

                <%--            <td><a href="customers?action=delete&id=${customer.getId()}">Delete</a></td>--%>

        </tr>

    </c:forEach>

</table>
</body>

</html>