<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h1>Register</h1>
<form action="/register" method="post">
    <div>
        <label>Username:</label>
        <input type="text" name="username" required />
    </div>
    <div>
        <label>Password:</label>
        <input type="password" name="password" required />
    </div>
    <div>
        <label>Email:</label>
        <input type="email" name="email" required />
    </div>
    <div>
        <label>Phone:</label>
        <input type="text" name="phone" required />
    </div>
    <div>
        <button type="submit">Register</button>
    </div>
</form>
    <#if error??>
        <div style="color: red;">
            <p>${error}</p>
        </div>
    </#if>
</body>
</html>