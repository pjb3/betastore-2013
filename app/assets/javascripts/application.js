// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
$(document).ready(function(){

  var updateCartDisplay = function($cart) {
    $.get('/cart', function(html) {
      $cart.html(html).show();
    });
  }

  $('a.cart').click(function() {
    var $cart = $('#cart');
    if($cart.is(':visible')) {
      $cart.hide();
    } else {
      updateCartDisplay($cart);
    }
    return false;
  });

  $('.add_to_cart').click(function(){
    try {
      var action = $(this).parents('form').attr('action');
      $.ajax({
        type: "POST",
        url: action,
        dataType: 'json',
        success: function(json) {
          $('#cart_item_count').text(json.item_count);

          var $cart = $('#cart');
          if($cart.is(':visible')) {
            updateCartDisplay($cart);
          }
        }
      });
    } catch(e) {
      console.log(e);
    } finally {
      return false;
    }
  });
});
