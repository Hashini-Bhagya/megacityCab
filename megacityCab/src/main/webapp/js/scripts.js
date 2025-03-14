// scripts.js - Show vehicle fields for Riders
document.addEventListener("DOMContentLoaded", function () {
    const riderRadio = document.getElementById("rider");
    const userRadio = document.getElementById("user");
    const vehicleFields = document.getElementById("vehicleFields");

    function toggleVehicleFields() {
        vehicleFields.style.display = riderRadio.checked ? "block" : "none";
    }

    riderRadio.addEventListener("change", toggleVehicleFields);
    userRadio.addEventListener("change", toggleVehicleFields);

    // Ensure correct display on page load
    toggleVehicleFields();
});


