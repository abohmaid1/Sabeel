document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('myForm');
    const acceptTerms = document.getElementById('acceptTerms');
    const submitButton = document.getElementById('submitButton');

    acceptTerms.addEventListener('change', function() {
      submitButton.disabled = !acceptTerms.checked;
    });

    form.addEventListener('submit', function(event) {
      if (!acceptTerms.checked) {
        event.preventDefault();
        acceptTerms.classList.add("error");
        alert('يرجى الموافقة على الأحكام والشروط');
      }
    });
  });