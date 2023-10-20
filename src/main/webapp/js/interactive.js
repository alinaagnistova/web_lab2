document.addEventListener('DOMContentLoaded', function () {
    var svg = document.querySelector('svg');
    svg.addEventListener('click', function (event) {
        var x = event.clientX;
        var y = event.clientY;
        var point = svg.createSVGPoint();
        point.x = x;
        point.y = y;
        var transformedPoint = point.matrixTransform(svg.getScreenCTM().inverse());
        checkClickArea(transformedPoint.x, transformedPoint.y);
    });

    function checkClickArea(x, y) {
        if ((x >= 40 && x <= 280) && (y >= 40 && y <= 280)) {
            const r = document.querySelector('input[name="r"]:checked');
            if (r) {
                var radius = r.value;
                let toSendX = ((x - 160) / 80 * radius).toFixed(5);
                let toSendY = ((160 - y) / 80 * radius).toFixed(5);
                if (toSendX >= -3 && toSendX <= 3 && toSendY >= -5 && toSendY <= 3) {
                    $.ajax({
                        type: "GET",
                        url: "/ControllerServlet",
                        async: false,
                        data: {"x": toSendX, "y": toSendY, "r": radius},
                        success: function (data) {
                            window.location.replace('./result.jsp');
                        },
                        error: function (xhr, textStatus, err) {
                            console.log("readyState: " + xhr.readyState + "\n" +
                                "responseText: " + xhr.responseText + "\n" +
                                "status: " + xhr.status + "\n" +
                                "text status: " + textStatus + "\n" +
                                "error: " + err);
                        }
                    });
                } else {
                    showError(svg, 'Выход значений за пределы допустимого');
                }
            } else {
                showError(svg, 'R не выбран');
            }
        } else {
            showError(svg, 'Вы не попали в область');
        }
    }
});
// const interactiveElement = document.querySelector('svg');
// const radiusInput = document.querySelector('input[name="r"]:checked');
//
// if (radiusInput) {
//     interactiveElement.addEventListener('click', handleImageClick);
// } else {
//     showError(interactiveElement, 'Сначала выберите радиус области');
// }
//
// function handleImageClick(event) {
//     const x = event.clientX;
//     const y = event.clientY;
//     const radius = radiusInput.value;
//     sendCoordinates(x, y, radius);
// }
// function updateImage(isPointInside) {
//     // Здесь вам нужно добавить код для обновления изображения с учетом факта попадания точки
//     // Можете использовать SVG-элементы или изменять атрибуты/стили существующих элементов
//
//     if (isPointInside) {
//         // Если точка попала в область, добавьте код для отображения новой точки на изображении
//         const circleElement = document.createElement('circle');
//         circleElement.setAttribute('cx', x);
//         circleElement.setAttribute('cy', y);
//         circleElement.setAttribute('r', '3');
//         circleElement.setAttribute('fill', 'red');
//         interactiveElement.appendChild(circleElement);
//     } else {
//         // Если точка не попала в область, добавьте код для отображения сообщения об этом на изображении
//         const textElement = document.createElement('text');
//         textElement.setAttribute('x', x);
//         textElement.setAttribute('y', y);
//         textElement.setAttribute('fill', 'red');
//         textElement.textContent = 'Точка не попала в область';
//         interactiveElement.appendChild(textElement);
//     }
// }