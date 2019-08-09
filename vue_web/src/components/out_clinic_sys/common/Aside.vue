<template>
  <!-- 侧边栏 -->
  <aside  id="asideMenu">
    <ul class="nav">
      <li @click.self="activeMenu" v-for="(menu,i) of menuList1" :key="i" class="nav-item" :class="{active:i==current}" :data-mid="menu.mid" :data-index="i">
        <a href="javascript:;" class="nav-link">
          <b></b><br>
          <span>{{menu.mtitle}}</span>
        </a>
      </li>
    </ul>
    <div class="navbar">
      <a @click="more" v-if="showA" class="moreBtn">更多</a>
      <div v-if="show" class="moreCont">
        <ul class="navbar-nav">
          <li @click.self="activeMenu" v-for="(menu,i) of menuList2" :key="i" class="nav-item" :class="menu.liClass" :data-mid="menu.mid">
            <a href="javascript:;" class="nav-link">
              <b></b><br>
              <span>{{menu.mtitle}}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </aside>
</template>
  <script>
  // 获取<aside>元素的最大高度
  var bHeight=window.innerHeight-56-37;
  // 计算可能最多能显示的li元素个数
  var counts=Math.floor(bHeight/100);
  export default {
    data(){return { 
      current:0, 
      menus:[// 每个菜单的基础数据
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
      ],
      show:false,   // 超出的部分默认隐藏
      showA:true,  // 更多按钮显示隐藏
    }},
    props:{  //接收父组件传递数据
       
    },
    methods:{
      more(){ // 更多折叠按钮
        this.show=!this.show;
      },
      activeMenu(e){ // 单击菜单栏，获取菜单mid
        var menuId=e.target.dataset.mid;
        this.current=e.target.dataset.index;//选中时添加样式class="active"
        console.log(menuId);
        this.$emit('loadAside',menuId);//点击后，自动触发父组件中的loadAside事件，并传递数据menuId
      }, 
    },
    computed:{
      menuList1(){
        return this.menus.slice(0,counts);
      },
      menuList2(){
        if(this.menus.length>counts){
          return this.menus.slice(counts);
        }else{
          this.showA=!this.showA
        }
      },
    },
    mounted () {
      
    }
  }
  </script>
  <style scoped> /*添加属性scoped防止样式冲突*/
  @import "../css/aside.css";
  
  </style>