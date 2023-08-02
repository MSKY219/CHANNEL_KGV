$(".star_rating a").click(function () {
  $(this).parent().children("a").removeClass("on");
  $(this).addClass("on").prevAll("a").addClass("on");

  var numberOfOnClasses = $(this).parent().children("a.on").length;

  return false;
});

function addReview() {
  const starRating = document.querySelectorAll(".star_rating .on").length;

  const reviewText = document.querySelector(".replywrite textarea").value;

  const li = document.createElement("li");

  li.innerHTML = `
      <span><img src="" alt=""></span>
      <div>
        <span>${mTmWriter}</span></span>
        <span>${mTmRegDate}</span>
      </div>
      <div>${reviewText}</div>
    `;

  const replyList = document.querySelector(".replyList ul");
  replyList.prepend(li);

  document.querySelector(".replywrite textarea").value = "";
}

const replyBtn = document.querySelector(".replyBtn");
replyBtn.addEventListener("click", addReview);
$(document).ready(function () {
  var itemsToShow = 5;

  $(".review").slice(0, itemsToShow).show();

  $(".morePage").on("click", function () {
    itemsToShow++;
    $(".review").slice(0, itemsToShow).slideDown();
  });
});
