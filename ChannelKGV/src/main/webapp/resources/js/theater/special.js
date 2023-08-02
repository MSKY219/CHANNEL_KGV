$(document).ready(function () {
  $(".theater1").hover(
    function () {
      $(".theater1-1", this).css("bottom", "0");
    },
    function () {
      $(".theater1-1", this).css("bottom", "-100%");
    }
  );
});

$(document).ready(function () {
  $(".theater2").hover(
    function () {
      $(this).css("width", "50%");

      $(".theater2-1", this).css("left", "0");
    },
    function () {
      $(this).css("width", "30%");
      $(".theater2-1", this).css("left", "-100%");
    }
  );
});

$(document).ready(function () {
  $(".theater3").hover(
    function () {
      $(this).css("width", "100%");
      $(".theater3-1", this).css("right", "0");
      $(".theater2").css("width", "0%");
    },
    function () {
      $(this).css("width", "70%");
      $(".theater3-1", this).css("right", "-100%");
      $(".theater2").css("width", "30%");
    }
  );
});

$(document).ready(function () {
  $(".theater4").hover(
    function () {
      $(this).css("width", "100%");
      $(".theater4-1", this).css("left", "0");
      $(".theater5").css("display", "none");
    },
    function () {
      $(this).css("width", "70%");
      $(".theater4-1", this).css("left", "-100%");
      $(".theater5").css("display", "flex");
    }
  );
});

$(document).ready(function () {
  $(".theater5").hover(
    function () {
      $(this).css("width", "30%");
      $(".theater5-1", this).css("right", "0");
    },
    function () {
      $(this).css("width", "30%");
      $(".theater5-1", this).css("right", "-100%");
    }
  );
});
