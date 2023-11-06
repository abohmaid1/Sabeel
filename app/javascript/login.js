
const loogedPass = document.getElementById("user_password");
const passwordToggleBtn = document.getElementById("pass-toggle-btn");

passwordToggleBtn.addEventListener('click', () => {
    passwordToggleBtn.className = loogedPass.type === "password" ? "fa-solid fa-eye-slash" : "fa-solid fa-eye";
    loogedPass.type = loogedPass.type === "password" ? "text" : "password";
});