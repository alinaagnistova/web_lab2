document.addEventListener('DOMContentLoaded', function () {
    const svg = document.querySelector('svg');
    svg.addEventListener('click', function (event) {
        let x = event.clientX;
        let y = event.clientY;
        let point = svg.createSVGPoint();
        point.x = x;
        point.y = y;
        let transformedPoint = point.matrixTransform(svg.getScreenCTM().inverse());
        checkClick(transformedPoint.x, transformedPoint.y);
        let circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
        circle.setAttribute("cx", transformedPoint.x);
        circle.setAttribute("cy", transformedPoint.y);
        circle.setAttribute("r", "3");
        circle.setAttribute("fill", "red");
        svg.appendChild(circle);
    });

    function checkClick(x, y) {
        if ((x >= 40 && x <= 280) && (y >= 40 && y <= 280)) {
            const r = document.querySelector('input[name="r"]:checked');
            if (r) {
                let radius = r.value;
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