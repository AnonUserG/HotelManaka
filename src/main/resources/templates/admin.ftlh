<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
</head>
<body>
<h1>Admin Panel</h1>

<form action="/admin/addRoom" method="post" enctype="multipart/form-data">
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
        <label>Главная фотография:</label>
        <input type="file" name="file1" accept="image/*" required />
    </div>
    <div>
        <label>Первая фотография:</label>
        <input type="file" name="file2" accept="image/*" />
    </div>
    <div>
        <label>Вторая фотография:</label>
        <input type="file" name="file3" accept="image/*" />
    </div>
    <div>
        <label>Третья фотография:</label>
        <input type="file" name="file4" accept="image/*" />
    </div>
    <div>
        <button type="submit">Добавить Номер</button>
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

<h2>Available Rooms</h2>
<table border="1">
    <thead>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
            <#if rooms?? && (rooms?size > 0)>
                <#list rooms as room>
                    <tr>
                        <td>${room.name}</td>
                        <td>${room.description}</td>
                        <td>${room.price}</td>
                        <td>
                            <a href="/admin/deleteRoom/${room.id}">Удалить</a>
                        </td>
                    </tr>
                </#list>
            <#else>
                <tr>
                    <td colspan="4">No rooms available.</td>
                </tr>
            </#if>
    </tbody>
</table>

</body>
</html>
