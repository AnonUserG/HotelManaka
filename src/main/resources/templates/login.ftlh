<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login</h1>
<form action="/login" method="post">
    <div>
        <label>Username:</label>
        <input type="text" name="username" required />
    </div>
    <div>
        <label>Password:</label>
        <input type="password" name="password" required />
    </div>
    <div>
        <button type="submit">Login</button>
    </div>
</form>
<div>
    <p>Еще нет аккаунта? <a href="/register">Зарегистрироваться</a></p>
</div>
    <#if error??>
        <div style="color: red;">
            <p>${error}</p>
        </div>
    </#if>
</body>
</html>