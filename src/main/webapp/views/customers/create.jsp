<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
</head>
<body>
<h1>Create new customer</h1>

<p>

    <c:if test='${requestScope["message"] != null}'>

        <span class="message">${requestScope["message"]}</span>

    </c:if>

</p>

<p>

    <a href="/customer">Back to customer list</a>

</p>

<form action="/customer" method="post">

    <fieldset>

        <legend>Customer information</legend>

        <table>
            <tr>

                <td>Name</td>

                <td><input type="text" name="name" id="name"/></td>

            </tr>

            <tr>

                <td>Email</td>

                <td><input type="text" name="email" id="email"/></td>

            </tr>

            <tr>

                <td>Address</td>

                <td><input type="text" name="address" id="address"/></td>

            </tr>

            <tr>
                <td></td>

                <td>
                    <button type="submit">Create customer</button>
                </td>

            </tr>

        </table>

    </fieldset>

</form>
</body>
</html>