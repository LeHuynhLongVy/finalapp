$(document).ready(function() {
  var btnPhoto = $("#btn-photo");
  var btnAlbum = $("#btn-album");
  btnPhoto.on({
    "click": function() {
      if (!btnPhoto.hasClass("chosen")){
        btnPhoto.addClass("chosen")
        btnAlbum.removeClass("chosen")
      }
    }
  });

  btnAlbum.on({
    "click": function() {
      if (!btnAlbum.hasClass("chosen")){
        btnAlbum.addClass("chosen")
        btnPhoto.removeClass("chosen")
      }
    }
  });

  // $(".hback").on("click", function(e){
  //   e.preventDefault();
  //   window.history.back();
  // });

  $("a[name='like']").on({
   "click": function() {
     var count = $(this).next();

     if ($(this).children().hasClass("text-primary1-color")) {
       $(this).children().removeClass("text-primary1-color");
       $(this).children().addClass("text-secondary");
       count.text(parseInt(count.text())-1);
     }
     else {
       $(this).children().removeClass("text-secondary");
       $(this).children().addClass("text-primary1-color");
       count.text(parseInt(count.text())+1);
     }
   }
 })

  $("img").on("click", function() {
    var title = $(this).parent().parent().find("div[name='title-post']").html();
    var source = $(this).attr("src");
    var description = $(this).parent().parent().find("div[name='description-post']").html()
    if ($("#btn-photo").hasClass("chosen")) {
      $("#modal-photo-title").html(title);
      $("#modal-photo-body").attr("src", source);
      $("#modal-photo-description").html(description);
    }
    else {
      $("#modal-album-title").html(title);
      $("#modal-album-description").html(description);
      // this is for source of picture in album
      $("#modal-album").toggle();
    }
  });

  $("[name='follow']").on({
    "click": function() {
      if ($(this).hasClass("following-button")) {
        $(this).removeClass("following-button")
        $(this).addClass("follow-button")
        $(this).html("follow")
      }
      else {
        $(this).removeClass("follow-button")
        $(this).addClass("following-button")
        $(this).html("following")
      }
    }
  });

  $(".tab").on({
    "click": function() {
      var others = $(".tab").not(this);
      setAllTabOff();
      $(this).removeClass("text-secondary");
      $(this).addClass("text-primary1-color");
      var tabName = $(this).attr("name") + "-tab"
      $("div[name="+tabName+"]").removeClass("d-none")
      // $("div[name=tabName]").addClass("d-block")
      others.map(function() {
        $(this).removeClass("text-primary1-color");
        $(this).addClass("text-secondary");
      })
    }
  });

  function setAllTabOff() {
    $("div[name='photos-tab']").addClass("d-none");
    $("div[name='albums-tab']").addClass("d-none");
    $("div[name='followings-tab']").addClass("d-none");
    $("div[name='followers-tab']").addClass("d-none")
  }

})
