$(function(){
  $.ajax({
      url:"aside.html",
      type:"get",
      success:function(result){
          // console.log(result);
          // 用片段创建新的<aside>元素，替换现有<aside id="aside">元素
          $(result).replaceAll("#aside");
          $(`<link rel="stylesheet" href="aside.css">`).appendTo("head");            
      }
  })
})