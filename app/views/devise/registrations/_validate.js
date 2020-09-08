$("#signup_form").validate({
  errorPlacement: function (error, element) {
    error.insertAfter(element);
  },
  rules: {
    "user[firstname]": {
      required: true,
      maxlength: 25
    },
    "user[lastname]": {
      required: true,
      maxlength: 25
    },
    "user[email]": {
      required: true,
      email: true
    },
    "user[password]": {
      required: true,
      minlength: 6
    },
    "user[password_confirmation]": {
      required: true,
      equalTo: "#user_password"
    },
  },
  messages: {
    firstname:{
      required: "Username is required.",
      maxlength: "Username can have less than 25 characters"
    },
    lastname:{
      required: "Username is required.",
      maxlength: "Username can have less than 25 characters"
    },
    email:{
      required: "Email is required",
      email: "Please enter a valid email address"
    },
    password: {
      required: "Password is required",
      minlength: "Password must have at least 6 characters"
    },
    password_confirmation: {
      required: "Password confirmation is required",
      equalTo: "Password and password confirmation must be same"
    }
  }
});
