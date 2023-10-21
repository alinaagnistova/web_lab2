<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c3" %>
<c3:set var="error" value="${applicationScope.error}"/>

<html lang="ru">
<head>
    <title>lab2</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="shortcut icon" href="images/emoji.ico" type="image/x-icon"/>
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
<h2>Error message: ${error}</h2>
<button class="return-button" onclick="redirectToIndex()">Вернуться на главную</button>
<script src="js/lib.js"></script>
<script src="js/themeToggle.js"></script>
</body>
</html>
