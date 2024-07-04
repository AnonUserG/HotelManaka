<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
</head>
<body>
<h1>Admin Panel</h1>
<form action="/admin/addRoom" method="post">
    <div>
        <label>Room Name:</label>
        <input type="text" name="name" required />
    </div>
    <div>
        <label>Description:</label>
        <textarea name="description" required></textarea>
    </div>
    <div>
        <label>Price:</label>
        <input type="number" name="price" required />
    </div>
    <div>
        <button type="submit">Add Room</button>
    </div>
</form>

<h2>Registered Users</h2>
<table border="1">
    <thead>
    <tr>
        <th>Логин</th>
        <th>Почта</th>
        <th>Телефон</th>
        <th>Роли</th>
        <th>Бан</th>
    </tr>
    </thead>
    <tbody>
            <#if users?? && (users?size > 0)>
                <#list users as user>
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.role}</td>
                        <td>
                            <#if user.isActive>
                                <a href="/admin/deactivateUser/${user.id}">Бан</a>
                            <#else>
                                <a href="/admin/activateUser/${user.id}">Забанен</a>
                            </#if>
                        </td>
                    </tr>
                </#list>
            <#else>
                <tr>
                    <td colspan="5">No registered users found.</td>
                </tr>
            </#if>
    </tbody>
</table>
</body>
</html>
