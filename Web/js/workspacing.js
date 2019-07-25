$(function(){
  $.ajax({
      url:"workspacing.html",
      type:"get",
      success:function(result){
          // console.log(result);
         
          // 用片段创建新的<section>元素，替换现有<section id="section">元素
          $(result).replaceAll("#section");
          $(`<link rel="stylesheet" href="workspacing.css">`).appendTo("head");            
      }
  })
})