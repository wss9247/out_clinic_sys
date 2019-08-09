<template>
  <div id="app">
    <!-- 引入顶部子组件 -->
    <webheader></webheader>  
		<!-- 引入侧边栏子组件：子组件向父组件传递数据 -->
    <webAside @loadAside="loadContainer"></webAside>   
		<!-- 在主体区域内，将从侧边栏得到数据当做子组件标签名引入 -->
		<section id="section" :style="`width:${secWidth}px;height:${secHeight}px`">
			<keep-alive>  <!--动态加载子组件-->
				<component :is="val"></component>
			</keep-alive>
		</section> 
  </div>
</template>
<script>
import webheader from './common/Header.vue';
import webAside from './common/Aside.vue';
import workspacing from './common/workspacing.vue';
import out_regist from './common/out_regist.vue';
export default {
  data(){return {
		val:"workspacing",
		secWidth:window.innerWidth-100,
		secHeight:window.innerHeight-55,
  }},
  components:{webheader,webAside,workspacing,out_regist},
  methods:{
		loadContainer(val){  //触发webAside子组件中的事件，并接收传递过来的数据menuId	
			this.val=val;		
		}
	},
	computed:{
		
	},
}
 
</script>
<style>

</style>
