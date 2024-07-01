<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
</head>
<body>
<table class="table table-hover table-dark">
    <tr>
        <th scope="col">Логин</th>
        <th scope="col">Почта</th>
        <th scope="col">Телефон</th>
        <th scope="col">Роли</th>

    </tr>
        <#list users as user>
            <tr>
                <th>${user.username}</th>
                <th>${user.email}</th>
                <th>${user.phone}</th>
                <th>${user.role}</th>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
</table>
</body>
</html>