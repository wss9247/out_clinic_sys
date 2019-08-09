$(function(){
  $.ajax({
    url:"out_charges.html",
    type:"get",
    success:function(result){
      $(`<link rel="stylesheet" href="out_charges.css">`).appendTo("head");
      
    }
  })
})