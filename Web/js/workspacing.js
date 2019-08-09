$(function(){
  $.ajax({
      url:"workspacing.html",
      type:"get",
      success:function(result){
          // console.log(result);
          $(`<link rel="stylesheet" href="workspacing.css">`).appendTo("head");            
      }
  })
})