$(function(){
  $("#item-price").on('keyup', function(){
    var price = $("#item-price").val();
    if( 300 <= price && price <= 9999999) {
    var fee = Math.floor(price * 0.1);
    var profit = (price - fee);
    $("#add-tax-price").text(fee.toLocaleString());
    $("#profit").text(profit.toLocaleString());
    }else{
    $("#add-tax-price").text('');
    $("#profit").text('');
    }
  })
});