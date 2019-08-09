$(function(){
  $.ajax({
    url:"aside.html",
    type:"get",
    success:function(result){
      // console.log(result);
      // 用片段创建新的元素，替换现有<div id="asideMenu">元素
      $(result).replaceAll("#asideMenu");
      $(`<link rel="stylesheet" href="aside.css">`).appendTo("head"); 
      
      // 每个按钮的基础数据
      var menus=[
        {mid:"workspacing",mtitle:"工作台",imgUrl:"icons/header.png"},
        {mid:"out_regist",mtitle:"患者登记",imgUrl:"icons/header.png"},
        {mid:"consultation",mtitle:"今日就诊",imgUrl:"icons/header.png"},
        {mid:"out_charges",mtitle:"收费管理",imgUrl:"icons/header.png"},
        {mid:"out_dispensing",mtitle:"门诊发药",imgUrl:"icons/header.png"},
        {mid:"medical_warehousing",mtitle:"库房管理",imgUrl:"icons/header.png"},
        {mid:"out_pres_mng",mtitle:"门诊划价",imgUrl:"icons/header.png"},
        {mid:"booking_mng",mtitle:"预约管理",imgUrl:"icons/header.png"},
        {mid:"DD_maintenance",mtitle:"字典维护",imgUrl:"icons/header.png"},
        {mid:"statistical",mtitle:"统计报表",imgUrl:"icons/header.png"},
        {mid:"out_nurse_sta",mtitle:"门诊护士站",imgUrl:"icons/header.png"},
        {mid:"consilia_mng",mtitle:"医案管理",imgUrl:"icons/header.png"},
        {mid:"clinic_mng",mtitle:"诊所管理",imgUrl:"icons/header.png"},
        {mid:"patient_mng",mtitle:"患者管理",imgUrl:"icons/header.png"},
        {mid:"setting",mtitle:"基础设置",imgUrl:"icons/header.png"},
      ];      
      // 获取<aside>元素的最大高度
      var bHeight=window.innerHeight-56-37;
      // 计算可能最多能显示的li元素个数
      var counts=Math.floor(bHeight/100);
      var html="";
      for(var i=0;i<counts;i++){       
        html+=`
         <li class="nav-item ${i==0?'active':''}" mid="${menus[i].mid}">
            <a href="javascript:;" class="nav-link">
                <b></b><br>
                <span>${menus[i].mtitle}</span>
            </a>
          </li>
        `;   
        $("#asideMenu>ul.nav").html(html);      
      }
      // 折叠起来的导航菜单
      if(menus.length>counts){
        var html2="";
        for(var i=counts;i<menus.length;i++){
          html2+=`
            <li class="nav-item" mid="${menus[i].mid}">
              <a href="javascript:;" class="nav-link">
                  <b></b><br>
                  <span>${menus[i].mtitle}</span>
              </a>
            </li>
          `;
        }
        $("#asideMenu #moreCont>ul").html(html2);
      }
      $("#section").load(`workspacing.html`);
      // 侧边栏点击事件队列，在li上触发，并获得当前li的自定义属性mid的值
      // 点击菜单工作区显示对应的内容
      $("#asideMenu").on("click","li",function(){
        var liBtn=$(this);
        liBtn.addClass("active")
          .siblings().removeClass("active");
        var menuName=liBtn.attr("mid");
        $("#section").load(`${menuName}.html`);
      })


    }
  })
})