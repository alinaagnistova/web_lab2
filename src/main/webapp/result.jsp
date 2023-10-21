<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <title>lab2</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="shortcut icon" href="images/emoji.ico" type="image/x-icon"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" async></script>
</head>
<body>
<div class="header">
    <h1>
        Агнистова Алина Юрьевна
    </h1>
    <h3>Группа: P3225</h3>
    <h3>Номер варианта:861204</h3>
    <button id="theme-toggle" class="change-theme-button">
        <img src="images/daynight.ico" alt="Иконка" width="25" height="25">
    </button>
</div>
<div class="result-table">
    <table id="result-table" cellspacing="6" cellpadding="15">
        <caption><b>Результат</b></caption>
        <tr>
            <th>Координата X</th>
            <th>Координата Y</th>
            <th>Радиус R</th>
            <th>Факт попадания в область</th>
            <th>Текущее время</th>
            <th>Время выполнения скрипта (ms)</th>
        </tr>
        <tr>
            <td>${row.getX()}</td>
            <td>${row.getY()}</td>
            <td>${row.getR()}</td>
            <td>${row.getResult()}</td>
            <td>${row.getTime()}</td>
            <td>${row.getScriptTime()}</td>
        </tr>
    </table>
</div>
<button class="return-button" onclick="redirectToIndex()">Вернуться на главную</button>
</body>
<script src="js/script.js"></script>
<script src="js/themeToggle.js"></script>
<script src="js/lib.js"></script>

</html>


