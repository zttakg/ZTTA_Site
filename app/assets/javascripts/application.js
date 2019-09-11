// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require phone_mask

function CartCount(){}
CartCount.updateCartCount = function() {
    $.ajax({
        url: " /details/update_cart_count",
        type: "get"});
}

function hide(target) {
  document.getElementById(target).style.display = 'none';
}

function sendToCart() {
  const notificationBoard = new App.Notification({ delay: 10000 });
  arr = [];

  $.each(formValues, function( key, value ) {
    if (value) {
        arr.push(key)
    };
  });

  delete(formValues);
  localStorage.clear();

  $.ajax({
    url: "/individual_items/send_to_cart",
    type: "get",
    success: function (data) {
      notificationBoard.show(data.message, {className: "notification_type_success"});
      CartCount.updateCartCount();
    },
    error: function(){
      notificationBoard.show(data.message, {className: "notification_type_warning"});
    },
    data: {ids : arr}
  });
}
