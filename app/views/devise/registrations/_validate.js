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
    }
  },
  messages: {
    "user[firstname]":{
      required: "Username is required.",
      maxlength: "Username can have less than 25 characters"
    },
    "user[lastname]":{
      required: "Username is required.",
      maxlength: "Username can have less than 25 characters"
    },
    "user[email]":{
      required: "Email is required",
      email: "Please enter a valid email address"
    },
    "user[password]": {
      required: "Password is required",
      minlength: "Password must have at least 6 characters"
    },
    "user[password_confirmation]": {
      required: "Password confirmation is required",
      equalTo: "Password and password confirmation must be same"
    }
  }
});


$("#edit-form").validate({
  errorPlacement: function (error, element) {
     error.insertAfter(element.parent());
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
      minlength: 6,
      maxlength: 64
    },
    "user[password_confirmation]": {
      equalTo: "#user_password"
    },
    "user[current_password]":{
      required: true,
      minlength: 6,
      maxlength: 64
    },
  },
  messages: {
    "user[firstname]": {
      required: "Username is required.",
      maxlength: "Username can have less than 25 characters"
    },
    "user[lastname]": {
      required: "Username is required.",
      maxlength: "Username can have less than 25 characters"
    },
    "user[email]": {
      required: "Email is required",
      email: "Please enter a valid email address"
    },
    "user[password]": {
      minlength: "Password must have at least 6 characters",
      maxlength: "Password must have less than 64 characters"
    },
    "user[password_confirmation]": {
      equalTo: "Password and password confirmation must be same"
    },
    "user[current_password]":{
      required: "Password is required",
      minlength: "Password must have at least 6 characters",
      maxlength: "Password must have less than 64 characters"
    },
  }
});
