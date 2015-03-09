$(function() {
  $(".mark-complete").click(function(e) {
    e.preventDefault();

    var item = $(this);
    var url = "/lists/" + item.attr("data-list-id") + "/todos/" + item.attr("data-todo-id") + "/complete.json";

    $.ajax(url, {
      method: "POST",
      success: function(data) {
        alert(JSON.stringify(data));
      },
      error: function() { alert("Something went wrong!"); }
    });

  });
});