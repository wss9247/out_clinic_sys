<template>
  <div class="cart">
    <label><input type="checkbox" @change="selectAll" v-model="hh">全选</label>
    <div class="cart_item" v-for="(item,i) of list" :key="i">
      <div class="left">
        <input type="checkbox" :data-id="item.id" v-model="item.cb">
        <img :src="item.sm">
        <div class="name">{{item.lname}}</div>        
        <!-- 增删按钮 -->
        <button @click="add" :data-count="item.count">-</button>
          {{item.count}}
        <button :data-count="item.count" @click="add">+</button>
      </div>
      <div class="price">{{item.price}}</div>
      <mt-button @click="delItem" :data-id="item.id">删除</mt-button>
    </div>
    <div>     
       <!-- 将main.js中的store对象中的数据读取出来 -->
      购物车中商品个数：{{$store.getters.getCartCount}}<br>
      数量小计：<span></span>
      <mt-button @click="delMore" >删除选中商品</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  data(){return {
    list:[],  
    hh:false,
  }},
  computed:{},
  methods:{
    add(e){
      var count=e.target.dataset.count;
      console.log(count);
    },
    selectAll(e){
      this.hh=e.target.checked
      for(var item of this.list){
        item.cb=this.hh;
      }
    },
    loadMore(){//购物车列表
      this.axios.get('cart').then(res=>{
        console.log(res);
        if(res.data.code==-1){
            this.$messagebox("消息","请先登录！").then(res=>{
            this.$router.push("/login");
            return;
          })
        }else{
          this.list=res.data.data;
          // 遍历前，用store对象中的clear()函数初始数量
          this.$store.commit("clear");
          // 创建循环，遍历数组，为每个元素添加cb属性，来标注复选框的状态          
          for(var item of this.list){
            item.cb=false;
            // 循环过程中使用store对象中的increment()函数，计算总数量
            this.$store.commit("increment");
          }
        }
      }).catch(err=>{console.log("程序出错了！")})
    },
    delItem(e){  //{params:obj}
      var id=e.target.dataset.id;
      var obj={id};      
      this.$messagebox.confirm("是否删除指定商品").then(res=>{
        this.axios.get("del",{params:obj}).then(res=>{
          if(res.data.code==1){ //删除成功后， 重新加载购物车列表
            // console.log("删除成功");
            this.loadMore();
          }
        })
      }).catch(err=>{
        // console.log("取消删除");
      })   
    },
    delMore(e){
      var str="";
      for(var item of this.list){
        if(item.cb){
          str+=`${item.id},`;
        } 
      }
      str=str.substring(0,str.length-1);
      var ids={str}; 
      this.$messagebox.confirm("是否删除选中的商品").then(res=>{
        this.axios.get('delMore',{params:ids}).then(res=>{
          if(res.data.code==1){
            this.loadMore();
            this.$toast("删除成功");
          }
        })
      }).catch(err=>{this.loadMore()});      
    },
  },created(){//程序运行时自动加载
    this.loadMore();
  }
}
</script>
<style>

.cart .cart_item .left{
  display:flex;
  justify-content: space-between;

}

.cart .cart_item{
  display:flex;
  justify-content: space-between;
  border-bottom:1px solid #ddd;
  padding:10px;
}
.cart .cart_item .left .name,
.cart .cart_item .left .price{
  height:54px;line-height:54px;
}
.cart .cart_item .left .price{color:#f00;}
</style>

