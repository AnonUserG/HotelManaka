<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Подключение jQuery и jQuery UI для календаря -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<div class="container mt-5">
    <h1>Admin Panel</h1>

    <form action="/admin/addRoom" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Room Name:</label>
            <input type="text" class="form-control" name="name" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Description:</label>
            <textarea class="form-control" name="description" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Price:</label>
            <input type="number" class="form-control" name="price" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Главная фотография:</label>
            <input type="file" class="form-control" name="file1" accept="image/*" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Первая фотография:</label>
            <input type="file" class="form-control" name="file2" accept="image/*" />
        </div>
        <div class="mb-3">
            <label class="form-label">Вторая фотография:</label>
            <input type="file" class="form-control" name="file3" accept="image/*" />
        </div>
        <div class="mb-3">
            <label class="form-label">Третья фотография:</label>
            <input type="file" class="form-control" name="file4" accept="image/*" />
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-success">Добавить Номер</button>
        </div>
    </form>

    <h2 class="mt-5">Registered Users</h2>
    <table class="table table-striped">
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
                            <a href="/admin/deactivateUser/${user.id}" class="btn btn-warning">Бан</a>
                        <#else>
                            <a href="/admin/activateUser/${user.id}" class="btn btn-danger">Забанен</a>
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

    <h2 class="mt-5">Available Rooms</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Action</th>
            <th>Забронировать</th>
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
                        <a href="/admin/deleteRoom/${room.id}" class="btn btn-danger">Удалить</a>
                    </td>
                    <td>
                        <button class="btn btn-primary" onclick="showCalendar(${room.id})">Бронь</button>
                    </td>
                </tr>
            </#list>
        <#else>
            <tr>
                <td colspan="5">No rooms available.</td>
            </tr>
        </#if>
        </tbody>
    </table>
</div>

<!-- Модальное окно для бронирования -->
<div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="reservationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reservationModalLabel">Бронирование номера</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/admin/bookRoom" method="post">
                    <input type="hidden" id="roomId" name="roomId">
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Дата начала:</label>
                        <input type="text" class="form-control datepicker" id="startDate" name="startDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">Дата окончания:</label>
                        <input type="text" class="form-control datepicker" id="endDate" name="endDate" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Забронировать</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Подключение Bootstrap JS и jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- Подключение jQuery UI для календаря -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(document).ready(function () {
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });

    function showCalendar(roomId) {
        $('#roomId').val(roomId);
        $('#reservationModal').modal('show');
    }
</script>
</body>
</html>
