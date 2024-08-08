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
        .contact-info {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .messenger-links {
            text-align: center;
            margin-top: 10px;
        }
        .messenger-links a {
            margin: 0 10px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
    <!-- Подключение jQuery UI для календаря -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

<div class="contact-info">
    <p>Для бронирования отеля звоните по телефону 8 (988) 152 33-35</p>
</div>

<div class="messenger-links">
    <a href="${telegramUrl}" target="_blank">Телеграмм</a>
    <a href="${whatsappUrl}" target="_blank">Ватсап</a>
</div>

<!-- Форма для ввода дат -->
<div class="date-selection">
    <form action="/" method="get">
        <label for="startDate">Дата заезда:</label>
        <input type="text" id="startDate" name="startDate" class="datepicker" required>

        <label for="endDate">Дата выезда:</label>
        <input type="text" id="endDate" name="endDate" class="datepicker" required>

        <button type="submit">Проверить доступные номера</button>
    </form>
</div>

<!-- Список доступных номеров -->
<div>
    <h2>Available Rooms</h2>
    <ul>
        <#list rooms as room>
            <li>
                <h3>${room.name}</h3>
                <p>${room.description}</p>
                <p>Price: ${room.price}</p>
                <div>
                    <#list room.images as image>
                        <img src="/image/${image.id}" alt="Image of ${room.name}" width="150px" />
                    </#list>
                </div>
            </li>
        </#list>
    </ul>
</div>

<!-- Подключение jQuery и jQuery UI для календаря -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(document).ready(function () {
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });
</script>
</body>
</html>
