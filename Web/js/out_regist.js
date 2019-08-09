$(function(){
  $.ajax({
    url:"out_regist.html",
    type:"get",
    success:function(result){
      // console.log(result);
      $(`<link rel="stylesheet" href="out_regist.css">`).appendTo("head"); 
    }
  })
})