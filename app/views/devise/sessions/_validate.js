$("#login_form").validate({
  errorPlacement: function (error, element) {
    error.insertAfter(element);
  },
  rules: {
    "user[email]": {
      required: true,
      email: true,
      maxlength: 255
    },
    "user[password]": {
      required: true,
      minlength: 6,
      maxlength: 64
    },
  },
  messages: {
    "user[email]":{
      required: "Email is required",
      email: "Please enter a valid email address",
      maxlength: "Email can have maximum 255 characters"
    },
    "user[password]": {
      required: "Password is required",
      minlength: "Password must have at least 6 characters",
      maxlength: "Password can have maximum 64 characters"
    },
  }
});
