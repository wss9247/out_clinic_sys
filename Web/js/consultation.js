$(function(){
  $.ajax({
    url:"consultation.html",
    type:"get",
    success:function(result){
      $(`<link rel="stylesheet" href="consultation.css">`).appendTo("head");      
    }
  })
  
})