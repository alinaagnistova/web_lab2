<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
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
<div class="form-block">
    <div class="window">
        <svg width="320" height="320" id="areas">
            <line x1="0" y1="160" x2="320" y2="160" stroke-width="1.6"/>
            <line x1="160" y1="0" x2="160" y2="320" stroke-width="1.6"/>

            <polygon id="1" points="320,160 312,156 312,164"/>
            <polygon id="1"points="160,0 156,8 164,8"/>

            <line x1="40" y1="156" x2="40" y2="164" stroke-width="1.6"/>
            <line x1="120" y1="156" x2="120" y2="164" stroke-width="1.6"/>
            <line x1="200" y1="156" x2="200" y2="164" stroke-width="1.6"/>
            <line x1="280" y1="156" x2="280" y2="164" stroke-width="1.6"/>
            <line x1="360" y1="156" x2="360" y2="164" stroke-width="1.6"/>

            <text id="capt" x="35" y="152">-R</text>
            <text id="capt" x="115" y="152">-R/2</text>
            <text id="capt" x="200" y="152">R/2</text>
            <text id="capt" x="275" y="152">R</text>
            <line x1="156" y1="40" x2="164" y2="40" stroke-width="1.6"/>
            <line x1="156" y1="120" x2="164" y2="120" stroke-width="1.6"/>
            <line x1="156" y1="200" x2="164" y2="200" stroke-width="1.6"/>
            <line x1="156" y1="280" x2="164" y2="280" stroke-width="1.6"/>
            <line x1="156" y1="360" x2="164" y2="360" stroke-width="1.6"/>
            <text x="144" y="44" id="capt">R</text>
            <text x="141" y="124" id="capt">R/2</text>
            <text x="144" y="204" id="capt">-R/2</text>
            <text x="144" y="284" id="capt">-R</text>
            <path id="circle" d="M160,120 A40,40 0 0,1 200,160 L160,160 Z" fill="rgb(51,153,255)"
                  stroke-width="1.6"/>
            <polygon id="triangle" points="160,280 160,160 40,160" fill="rgb(51,153,255)"
                     stroke-width="1.6"></polygon>
            <polygon id="square" points="280,160 160,160 160,280 280,280" fill="rgb(51,153,255)" stroke="black"
                     stroke-width="1.6"></polygon>
        </svg>
    </div>
    <div id="message"></div>
    <form id="valForm" method="get">
        <label>Координата X:</label>
        <label><input type="text" id="x" placeholder="{-3...3}" maxlength="10" required></label>

        <label for="y">Координата Y:</label>
        <div id="y-select">
            <select name="y" id="y" required>
                <option value="-5">-5</option>
                <option value="-4">-4</option>
                <option value="-3">-3</option>
                <option value="-2">-2</option>
                <option value="-1">-1</option>
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
        </div>
        <label>Радиус R:</label>
        <div class="r-radio">
            <label><input type="radio" name="r" value="1" required>1</label>
            <label><input type="radio" name="r" value="2">2</label>
            <label><input type="radio" name="r" value="3">3</label>
            <label><input type="radio" name="r" value="4">4</label>
            <label><input type="radio" name="r" value="5">5</label>
        </div>
        <table class="buttons" id="buttons-table">
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
<script src="js/svgInteractive.js" defer></script>

</html>