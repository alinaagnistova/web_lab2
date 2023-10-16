<%--
  Created by IntelliJ IDEA.
  User: agnis
  Date: 03.10.2023
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>lab1</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="shortcut icon" href="images/emoji.ico" type="image/x-icon"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="header">
    <h1>
        Агнистова Алина Юрьевна
    </h1>
    <h3>Группа: P3225</h3>
    <h3>Номер варианта:3500</h3>
    <button id="theme-toggle" class="change-theme-button">
        <img src = "images/daynight.ico" alt="Иконка" width="25" height="25">
    </button>
</div>
<div class="form-block">
    <figure class="areas-pic">
        <img src="images/areas.png" alt="areas" id="areas">
    </figure>
    <div id="message"></div>
    <form id="valForm" method="get">
        <label>Координата X:</label>
        <div class="x-radio">
            <label><input type="radio" name="x" value="-2" required>-2</label>
            <label><input type="radio" name="x" value="-1.5">-1.5</label>
            <label><input type="radio" name="x" value="-1">-1</label>
            <label><input type="radio" name="x" value="-0.5">-0.5</label>
            <label><input type="radio" name="x" value="0">0</label>
            <label><input type="radio" name="x" value="0.5">0.5</label>
            <label><input type="radio" name="x" value="1">1</label>
            <label><input type="radio" name="x" value="1.5">1.5</label>
            <label><input type="radio" name="x" value="2">2</label>
        </div>

        <label for="y">Координата Y:</label>
        <label><input type="text" id="y" placeholder="{-5...5}" maxlength="10" required></label>

        <label for="r">Радиус R:</label>
        <label><input type="text" id="r" placeholder="{1...4}" maxlength="10" required></label>
        <table class="buttons">
            <tr>
                <th><input type="submit" class="data-button" value="Отправить данные"></th>
                <th><input type="reset" class="data-button" onclick="resetForm()" value="Сбросить данные"></th>
            </tr>
        </table>


    </form>
</div>
<div class="table-block">
    <table id="table" cellspacing="6" cellpadding="15">
        <caption><b>Результаты</b></caption>
        <tr>
            <th>Координата X</th>
            <th>Координата Y</th>
            <th>Радиус R</th>
            <th>Факт попадания в область</th>
            <th>Текущее время</th>
            <th>Время выполнения скрипта (ms)</th>
        </tr>
        <c:forEach items="${table.getTable()}" var="el">
            <tr>
                <td>${el.getX()}</td>
                <td>${el.getY()}</td>
                <td>${el.getR()}</td>
                <td>${el.getResult()}</td>
                <td>${el.getTime()}</td>
                <td>${el.getScriptTime()}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script src="js/script.js"></script>
<script src="js/themeToggle.js"></script>
</html>