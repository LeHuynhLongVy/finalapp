$("#new_photo_form").validate({
  errorPlacement: function (error, element) {
    error.insertAfter(element.parent());
  },
  rules: {
    "photo[title]": {
      required: true,
      maxlength: 140
    },
    "photo[description]": {
      required: true,
      maxlength: 300
    },
    "photo[image]":{
      extension: "png|jpeg|gif"
    }
  },
  messages: {
    "photo[title]":{
      required: "Title is required",
      maxlength: "Title can have maximum 140 characters"
    },
    "photo[description]": {
      required: "Description is required",
      maxlength: "Description can have maximum 300 characters"
    },
    "photo[image]":{
      extension: "Only accepts png,jpeg,gif"
    }
  },
});
