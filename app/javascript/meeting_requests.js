// Selecting form and input elements
const form = document.querySelector("form");

const showError = (field, errorText) => {
    field.classList.add("error");
    const errorElement = document.createElement("small");
    errorElement.classList.add("error-text");
    errorElement.innerText = errorText;
    field.closest(".form-group").appendChild(errorElement);
}

console.log(document.getElementById("creating_meeting_place_request_city_name").value === "")

// Function to handle form submission
const handleFormData = (e) => {
    e.preventDefault();

    // Retrieving input elements
    const emailInput = document.getElementById("creating_meeting_place_request_email");
    const storeNameInput = document.getElementById("creating_meeting_place_request_stor_name");
    const ownerNameInput = document.getElementById("creating_meeting_place_request_owner_name");
    const contractImageInput = document.getElementById("creating_meeting_place_request_contract");
    const cityInput = document.getElementById("creating_meeting_place_request_city_name");
    const locationDetailInput = document.getElementById("creating_meeting_place_request_location_details");
    

    // Getting trimmed values from input fields
    const onwername = ownerNameInput.value.trim();
    const email = emailInput.value.trim();
    const storeName = storeNameInput.value;
    const city = cityInput.value.trim();
    const locationDetails = locationDetailInput.value.trim();

    const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    // Clearing previous error messages
    document.querySelectorAll(".form-group .error").forEach(field => field.classList.remove("error"));
    document.querySelectorAll(".error-text").forEach(errorText => errorText.remove());

    // Performing validation checks
    if (onwername === "") {
        showError(ownerNameInput, "ادخل اسم المالك");
    }
    if (!emailPattern.test(email)) {
        showError(emailInput, "ادخل البريد الالكتروني");
    }
    if (storeName === "") {
        showError(storeNameInput, "ادخل اسم المحل التجاري");
    }
    if (contractImageInput.files.length == 0) {
        showError(contractImageInput, "يرجى رفع صورة اثبات وجود المحل التجاري");
    }
    if (city === "") {
        showError(cityInput, "ادخل اسم المدينة");
    }
    if (locationDetails === "") {
        showError(locationDetailInput, "ادخل بعض التفاصيل لموقع المحل");
    }
    // Checking for any remaining errors before form submission3
    const errorInputs = document.querySelectorAll(".form-group .error");
    if (errorInputs.length > 0) return;

    // Submitting the form
    form.submit();
}


// Handling form submission event
form.addEventListener("submit", handleFormData);