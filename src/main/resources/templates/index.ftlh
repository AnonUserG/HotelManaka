<!DOCTYPE html>
<html>
<head>
    <title>Hotel Landing Page</title>
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }
        .login-button, .logout-button, .admin-button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Welcome to Our Hotel</h1>
    <div>
            <#if loggedInUser??>
                <#if isAdmin>
                    <a href="/admin" class="admin-button">Admin Panel</a>
                </#if>
                <a href="/logout" class="logout-button">Выйти из аккаунта</a>
            <#else>
                <a href="/login" class="login-button">Войти в аккаунт</a>
            </#if>
    </div>
</div>
<div>
    <h2>Available Rooms</h2>
    <ul>
            <#list rooms as room>
                <li>
                    <h3>${room.name}</h3>
                    <p>${room.description}</p>
                    <p>Price: ${room.price}</p>
                </li>
            </#list>
    </ul>
</div>
</body>
</html>