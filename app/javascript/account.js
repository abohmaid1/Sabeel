// Selecting form and input elements
const form = document.querySelector("form");
const passwordInput = document.getElementById("user_password");
const passToggleBtn = document.getElementById("pass-toggle-btn");

// Function to display error messages
const showError = (field, errorText) => {
    field.classList.add("error");
    const errorElement = document.createElement("small");
    errorElement.classList.add("error-text");
    errorElement.innerText = errorText;
    field.closest(".form-group").appendChild(errorElement);
}

// Function to handle form submission
const handleFormData = (e) => {
    // e.preventDefault();

    // // Retrieving input elements
    // const fullnameInput = document.getElementById("fullname");
    // const emailInput = document.getElementById("email");
    // const dateInput = document.getElementById("date");
    // const cityInput = document.getElementById("city");

    // // Getting trimmed values from input fields
    // const fullname = fullnameInput.value.trim();
    // const email = emailInput.value.trim();
    // const password = passwordInput.value.trim();
    // const date = dateInput.value;
    // const city = cityInput.value;

    // // Regular expression pattern for email validation
    // const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    // // Clearing previous error messages
    // document.querySelectorAll(".form-group .error").forEach(field => field.classList.remove("error"));
    // document.querySelectorAll(".error-text").forEach(errorText => errorText.remove());

    // // Performing validation checks
    // if (fullname === "") {
    //     showError(fullnameInput, "ادخل اسمك");
    // }
    // if (!emailPattern.test(email)) {
    //     showError(emailInput, "ادخل بريدك الالكتروني");
    // }
    // if (password === "") {
    //     showError(passwordInput, "ادخل كلمة المرور الخاصة بك");
    // }
    // if (date === "") {
    //     showError(dateInput, "حدد تاريخ ميلادك");
    // }
    // if (city === "") {
    //     showError(cityInput, "حدد محافظتك");
    // }

    // // Checking for any remaining errors before form submission
    // const errorInputs = document.querySelectorAll(".form-group .error");
    // if (errorInputs.length > 0) return;

    // // Submitting the form
    form.submit();
}

// Toggling password visibility
passToggleBtn.addEventListener('click', () => {
    passToggleBtn.className = passwordInput.type === "password" ? "fa-solid fa-eye-slash" : "fa-solid fa-eye";
    passwordInput.type = passwordInput.type === "password" ? "text" : "password";
});

// Handling form submission event
form.addEventListener("submit", handleFormData);