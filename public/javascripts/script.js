$(function() {

  $('.but').click(function(){
    var $row = $(this).closest("tr"),       // Finds the closest row <tr>
         $tds = $row.find("td");
         $cel = $tds.eq(6);
         $id = $cel.attr("data-product")       // Finds all children <td> elements
         $quantity = $cel.children("input").val()

    if($quantity < 100)
    {
      $.ajax({
      method: "GET",
        url: "basket/put",
        data: {
          product_id: $id,
          product_quantity: $quantity
        },
        dataType: "html"
      })
    }

    $.ajax({
    method: "GET",
      url: "/basket/basket_details",
      dataType: "html"
    })
      .success(function(msg) {
        $("#basket_details").html(msg);
      });

      $.ajax({
    method: "GET",
      url: "/basket/basket_modal",
      dataType: "html"
    })
      .success(function(msg) {
        $("#modal_basket").html(msg);
      });


   })

  $('#add_to_basket').click(function(){
         $id = $("#product-quantity").attr("data-product")       // Finds all children <td> elements
         $quantity = $("#product-quantity").val()

    $.ajax({
    method: "GET",
      url: "/basket/put_resume",
      data: {
        product_id: $id,
        product_quantity: $quantity
      },
      dataType: "html"
    })
      .success(function(msg) {
        $("#basket_details").html(msg);
      });

   })

$('#reset_basket').click(function(){

    $.ajax({
    method: "GET",
    url: "/basket/reset",
    data: {
      },
      dataType: "html"
    })
      .success(function(msg) {
        $("#basket_details").html(msg);
         })
    })

  $('#reset_basket_modal').click(function(){

   $.ajax({
    method: "GET",
    url: "/basket/reset",
    data: {
      },
      dataType: "html"
    })
      .success(function(msg) {
        $("#basket_details").html(msg);
         })

      $.ajax({
    method: "GET",
      url: "/basket/basket_modal",
      dataType: "html"
    })
      .success(function(msg) {
        $("#modal_basket").html(msg);
      });

    })

  $( "#form_search" ).submit(function( event ) {

    event.preventDefault();

    $product = $("#search_product").val()

    $.ajax({
      method: "GET",
        url: "/search_product",
        data: {
        search: $product,
      },
        dataType: "html"
      })
        .success(function(msg) {
          $("#container").html(msg);
        });
  })


});
