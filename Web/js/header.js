$(function(){
    $.ajax({
        url:"header.html",
        type:"get",
        success:function(result){
            console.log(result);
            var count=0;
            var spans=$("#header li.breadcrumb-item a>span");
            for(var sp of spans){
                console.log(sp);
                $(sp).css("background-position",`-${count*16}px top`);
                count++;
            }
            // 用片段创建新的<header>元素，替换现有<header id="header">元素
            $(result).replaceAll("#header");
            $(`<link rel="stylesheet" href="header.css">`).appendTo("head");            
        }
    })
})