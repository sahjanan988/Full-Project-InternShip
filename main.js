// Initialize tooltips (if needed)
$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });
  
  // Optional: Form validation (using a library like jQuery Validate)
  $('#loginForm').validate({
    rules: {
      username: {
        required: true
      },
      password: {
        required: true
      }
    },
    messages: {
      username: "Please enter your username",
      password: "Please enter your password",
    },
    submitHandler: function(form) {
      form.submit(); // Submit the form after validation
    }
  });
  
  // Optional: Password visibility toggle
  $('.password-toggle').click(function() {
    $(this).toggleClass('fa-eye fa-eye-slash');
    $(this).siblings('input').attr('type', $(this).hasClass('fa-eye') ? 'text' : 'password');
  });