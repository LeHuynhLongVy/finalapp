$("#resend_form").validate({
  errorPlacement: function (error, element) {
    error.insertAfter(element);
  },
  rules: {
    "user[email]": {
      required: true,
      email: true,
      maxlength: 255
    },
  },
  messages: {
    email:{
      required: "Email is required",
      email: "Please enter a valid email address",
      maxlength: "Email can have maximum 255 characters"
    },
  }
});
