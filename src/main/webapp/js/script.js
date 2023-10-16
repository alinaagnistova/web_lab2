document.getElementById('valForm').addEventListener('submit', function (e) {
    e.preventDefault();
    let x = document.querySelectorAll('input[type="radio"]:checked')[0];
    let y = document.getElementById('y');
    let r = document.getElementById('r');
    if (validate(x, y, r)) {
        send(x.value, y.value, r.value);
    }

});




function send(x, y, r) {
    $.ajax({
            type: "GET",
            url: "/ControllerServlet",
            async: false,
            data: { "x": x, "y": y, "r": r },
            success: function(data) {
                    window.location.replace("./result.jsp")
            },error: function (xhr, textStatus, err) {
                console.log("readyState: " + xhr.readyState + "\n"+
                    "responseText: " + xhr.responseText + "\n"+
                    "status: " + xhr.status + "\n"+
                    "text status: " + textStatus + "\n" +
                    "error: " + err);
            }
        }
    )
}

function showError(element,message) {
    const errorElement = document.createElement('div');
    errorElement.classList.add('error-message');
    errorElement.textContent = message;
    errorElement.style.color = 'red';
    errorElement.style.fontSize = '20px';
    errorElement.style.textAlign = 'left';
    element.parentNode.insertBefore(errorElement, element.nextSibling);
    setTimeout(function () {
        errorElement.remove();
    }, 2000);
}

function validate(x, y, r) {
    let replaceDot = val => val.replace(',', '.');
    let y1 = replaceDot(y.value);
    let r1 = replaceDot(r.value);
    if (x == null){
        showError(x,"Необходимо выбрать значение координаты X:(");
        return false;
    }

    if (y1 === "") {
        showError(y,"Необходимо указать значение координаты Y:(");
        return false;
    }

    if (isNaN(y1)) {
        showError(y,"Нет, так не надо. Надо вот так: Y - число");
        return false;
    }

    if (y1 < -5 || y1 > 5) {
        showError(y,"Y может быть любым числом из {-5;5}");
        return false;
    }

    if (r1 === "") {
        showError(y,"Необходимо указать значение радиуса:(");
        return false;
    }

    if (isNaN(r1)) {
        showError(r,"Нет, так не надо. Надо вот так: R - число");
        return false;
    }

    if (r1 < 1 || r1 > 4) {
        showError(r,"R может быть любым числом из {1;4}");
        return false;
    }
    return true;
}

function resetForm(){
    document.getElementById("valForm").reset();
}
function redirectToIndex() {
    window.location.href = "index.jsp";
}