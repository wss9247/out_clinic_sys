<template>
  <div class="pro">
    <h3>商品列表页</h3>
    <div class="product-app">
      <!-- "select lid,price,lname,details from xz_laptop limit ?,?" -->
      <div class="goods-item" v-for="(list,i) of lists" :key="i">
        <img :src="list.md" >
        <h4>{{list.lname}}</h4>
        <div class="price">{{list.price}}</div>
        <mt-button size="large" @click="addcart" :data-lid="list.lid" :data-price="list.price" :data-lname="list.lname">加入购物车</mt-button>
      </div>
    </div>
    <div class="pageBtn">
      <!-- <mt-field label="页码：" v-model="pno"></mt-field>
      <mt-field label="条数：" v-model="pagesize"></mt-field> -->
      <mt-button size="large" @click="showDetails">查看更多>></mt-button>
    </div>
    <mt-button @click="buy">去结算</mt-button>
  </div>
</template>
<script>
export default {
  data(){return {
    pno:1,
    pagesize:3,
    lists:[]  //用于保存从后台获取到的数据
  }},
  methods:{
    showDetails(){
      var pno=this.pno++;
      var pagesize=this.pagesize;
      // 发送ajax请求
      var url="product";
      var obj={pno,pagesize};
      this.axios.get(url,{params:obj}).then(res=>{
        // this.lists=res.data.data;  //将从服务器端获取到的数据提取出来，保存到lists变量中 
        var rows=this.lists.concat(res.data.data) //将每次得到的数据合并为一个大数组，用于翻页      
        this.lists=rows;
        console.log(this.lists);
      }).catch(err=>{console.log("出错啦")});
    },
    addcart(e){
      // 将上一个时间中得到的商品信息，通过自定义属性添加到事件按钮上，便于获得
      var lid=e.target.dataset.lid;
      var lname=e.target.dataset.lname;
      var price=e.target.dataset.price;
      // 发送ajax请求
      var url="addcart";
      var obj={lid,lname,price};
      this.axios.get(url,{params:obj}).then(res=>{        
        // console.log(res);
        if(res.data.code==-1){
            this.$messagebox("消息","请先登录！").then(res=>{
            this.$router.push("/login");
            return;
          });
        }else{
          this.$toast("添加成功！");          
        }
      }).catch(err=>{console.log("添加购物车出错啦！")})
    },
    buy(){
      this.axios.get('cart').then(res=>{
        this.$router.push("/cart");
      })
    }
  }
}
</script>
<style>
.product-app{
  display:flex;
  flex-wrap:wrap; /* 指定子元素换行 */
  justify-content: space-between; /* 两端对齐 */
  padding:4px;
}
.goods-item{
  width:49%;
  border:1px solid #ccc;
  border-radius:5px;
  margin:2px 0;
  padding:2px;
  box-sizing:border-box;
}
.goods-item img{width:100%;}

.goods-item input[type='text']{
  height:33px !important;
  width:33px !important;
}
</style>

