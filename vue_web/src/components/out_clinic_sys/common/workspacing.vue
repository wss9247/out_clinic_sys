<template>
<!-- 工作台 -->
<div id="workspacing">
  <!-- 搜索和日期栏 -->
  <div class="top searchBox">
    <div class="left">
      <input type="date" name="date"><button>今天</button></div>
    <div class="right">
      <input type="text" placeholder="患者姓名/首字母/手机号">
    </div>
  </div>
  <!-- 快捷导航栏 -->
  <div class="menu">        
    <div class="box">
      <a href="javascript:;"><span>0 | 0</span><br> 初诊 | 复诊</a>
    </div>
    <div class="box">
      <a href="javascript:;"><span>0</span><br> 新增预约</a>
    </div>
    <div class="box">
      <a href="javascript:;"><span>0</span><br> 实收金额</a>
    </div>
    <div class="box">
      <a href="javascript:;"><span>0</span><br> 完成随访</a>
    </div>      
    <ul class="nav">
      <li class="nav-item">
          <a href="javascript:;" class="nav-link p1"><span>患者登记</span></a>
      </li>
      <li class="nav-item">
          <a href="javascript:;" class="nav-link p2"><span>预约管理</span></a>
      </li>
      <li class="nav-item">
          <a href="javascript:;" class="nav-link p3"><span>患者管理</span></a>
      </li>
      <li class="nav-item">
          <a href="javascript:;" class="nav-link p4"><span>欠费管理</span></a>
      </li>
    </ul>
  </div>
  <!-- 主体选项卡区域 -->
  <div class="contain">
    <ul class="nav nav-tabs menu-tab">
      <li class="nav-item"><a href="javascript:;" class="nav-link active" data-toggle="tab1">今日就诊 <span>counts</span></a></li>
      <li class="nav-item"><a href="javascript:;" class="nav-link " data-toggle="tab2">预约未到 <span>counts</span></a></li>
      <li class="nav-item"><a href="javascript:;" class="nav-link " data-toggle="tab3">待收费 <span>counts</span></a></li>
      <li class="nav-item"><a href="javascript:;" class="nav-link " data-toggle="tab4">已收费 <span>counts</span></a></li>
    </ul>
    <div class="tab-content">
      <!-- 今日就诊 -->
      <div class="tab-pane active" id="tab1">
        <table>
          <thead>
            <tr>
              <th>序号</th>
              <th>姓名</th>
              <th>登记时间</th>
              <th>就诊类型</th>
              <th>医生</th>
              <th>状态</th>
              <th>就诊情况</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(w,i) of watings" :key="i">
              <td>{{w.pid}}</td>
              <td>{{w.pname}}</td>
              <td>{{w.data}}</td>
              <td>{{w.cfz}}</td>
              <td>{{w.ename}}</td>
              <td>{{w.status==0?"待诊":w.status==1?"已接诊":"完成就诊"}}</td>
              <td>{{w.txt}}</td>
              <td v-html='w.status==0?"<button>作废</button><button>接诊</button>":w.status==1?"<button>完成就诊</button>":"<button>返回就诊</button>"'></td>
            </tr>
          </tbody>
        </table>
        <div class="pageNav">
          <div class="pagination">
            <button class="page-item disabled">上一页</button>
            <button class="page-item active">1</button>
            <button class="page-item">2</button>
            <button class="page-item">3</button>
            <button class="page-item">下一页</button>
          </div>
        </div>
      </div>
      <!-- 预约未到 -->
      <div class="tab-pane" id="tab2">
        <table>
          <thead>
            <tr>
              <th>序号</th>
              <th>姓名</th>
              <th>手机号</th>
              <th>预约时间</th>
              <th>就诊类型</th>
              <th>医生</th>
              <th>挂号科室</th>
              <th>症状描述</th>
              <th>预约备注</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(w,i) of yypats" :key="i">
              <td>{{w.pid}}</td>
              <td>{{w.pname}}</td>
              <td>{{w.tel}}</td>
              <td>{{w.data}}</td>
              <td>{{w.cfz}}</td>
              <td>{{w.ename}}</td>
              <td>{{w.dname}}</td>
              <td>{{w.details}}</td>
              <td>{{w.txt}}</td>
              <td><button>查看</button></td>
            </tr>
          </tbody>
        </table>
        <div class="pageNav">>
          <div class="pagination">
            <button class="page-item disabled">上一页</button>
            <button class="page-item active">1</button>
            <button class="page-item">2</button>
            <button class="page-item">3</button>
            <button class="page-item">下一页</button>
          </div>
        </div>
      </div>
      <!-- 待收费 -->
      <!-- 已收费 -->
    </div>
  </div>
</div>

</template>
<script>
export default {
  data(){return {
    watings:[
      {pid:1,pname:"张明",data:"2019-07-06 14:23:59",cfz:"初诊",ename:"张医生",status:"0",txt:"gg"},
      {pid:2,pname:"张明",data:"2019-07-06 14:23:59",cfz:"初诊",ename:"张医生",status:"1",txt:"dd"},
      {pid:3,pname:"张明",data:"2019-07-06 14:23:59",cfz:"初诊",ename:"张医生",status:"2",txt:"就"}
    ],
    yypats:[
      {pid:1,pname:"张明",tel:13500000001,data:"2019-07-06 14:23:59",cfz:"初诊",ename:"张医生",dname:"门诊科室",details:"",txt:"gg"},
      {pid:2,pname:"张明",tel:13500000001,data:"2019-07-06 14:23:59",cfz:"初诊",ename:"张医生",dname:"门诊科室",details:"",txt:"gg"},
      {pid:3,pname:"张明",tel:13500000001,data:"2019-07-06 14:23:59",cfz:"初诊",ename:"张医生",dname:"门诊科室",details:"",txt:"gg"},
    ],
  }},
  methods:{
    
  },
  mounted(){
   $("#workspacing ul.menu-tab").on("click",".nav-link",function(){
      var abtn=$(this);
      var toggleId=abtn[0].dataset.toggle;
      abtn.addClass("active")
        .parent().siblings().children().removeClass("active");
      $(`#workspacing #${toggleId}`).addClass("active")
        .siblings().removeClass("active");
    })    
  }
}

</script>
<style scoped>
@import "../css/workspacing.css" ;
</style>
