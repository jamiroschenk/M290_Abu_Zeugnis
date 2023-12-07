// JavaScript, um das aktuelle Datum anzuzeigen
document.addEventListener('DOMContentLoaded', function () {
    const currentDateElement = document.getElementById('currentDate');
    const currentDate = new Date();
    currentDateElement.textContent = currentDate.toLocaleDateString();
});

