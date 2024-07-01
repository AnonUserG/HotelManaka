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
<div>
    <p><a href="/admin/users">Список всех зарегистрированных пользователей</a></p>
</div>
</body>
</html>