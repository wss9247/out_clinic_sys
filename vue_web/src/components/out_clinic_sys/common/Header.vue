<template>
<!-- 页头 -->
<header id="header">
	<div class="navbar">
		<a href="javascript:;" class="navbar-brand">云诊所平台</a>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="javascript:;" class="breadcrumb-link">积分：0</a>
			</li>
			<li class="breadcrumb-item">
				<a href="javascript:;" class="breadcrumb-link"><span></span> 有效期 </a>
			</li>
			<li class="breadcrumb-item">
				<a href="javascript:;" class="breadcrumb-link"><span></span> 消息 </a>
			</li>
			<li class="breadcrumb-item"> <!-- 下拉 -->
				<a @click.self="pupdow" href="javascript:;" class="breadcrumb-link">
					<span></span> 185000000000               
				</a>
			</li>
			<li class="breadcrumb-item">
				<a href="javascript:;" class="breadcrumb-link"><span></span> 帮助</a>
			</li>
		</ul>		
		<div v-if="show" class="collapse navbar-collapse">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="javascript:;" class="nav-link"><span></span> 修改密码</a></li>
				<li class="nav-item"><a href="javascript:;" class="nav-link"><span></span> 授权协议</a></li>
				<li class="nav-item"><a href="javascript:;" class="nav-link"><span></span> 快速配置</a></li>
				<li class="nav-item"><a href="javascript:;" class="nav-link"><span></span> 退出</a></li>
			</ul>
		</div>
	</div>
</header>
</template>
<script>
export default {
  data(){return {
		show:false
	}},
  props:{  //接收父组件传递数据
     
  },
  methods:{
		pupdow(){
			this.show=!this.show;
		}
  }
}
// 
</script>
<style scoped> /*添加属性scoped防止样式冲突*/
/* @import "../css/bootstrap.css" ; */
@import "../css/header.css" ;

</style>