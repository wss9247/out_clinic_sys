<template>
  <div>
    <mt-field  label="用户名：" v-model="uname"></mt-field >
    <mt-field  label="密码：" v-model="upwd" type="password"></mt-field >
    <mt-button size="large" @click="login">登录</mt-button>
  </div>
</template>
<script>
export default {
  data(){return {
    uname:"",
    upwd:""
  }},
  methods:{
    login(){
      var uname=this.uname,upwd=this.upwd;
      var reg=/^[0-9a-z]{3,12}$/i;  // 用户名和密码均为3~12位的字母或数字
      // 验证失败后停止执行，不再向服务器端发送消息
      if(!reg.test(uname)){
        this.$toast("用户名格式错误");
        return ;
      }
      if(!reg.test(upwd)){
        this.$toast("密码格式错误");
        return ;
      }
      // 发送ajax请求
      var url="login";  //请求的地址
      var obj={uname:uname,upwd:upwd}; //请求传递的数据
      this.axios.get(url,{params:obj}).then(res=>{
        // 获取服务器返回结果
        // console.log("登录成功");
        // console.log(res);
        if(res.data.code==-1){
          this.$toast("登录失败")
        }else{
          // 登录成功后跳转到商品页面
          this.$router.push("/product");
        }
      }).catch(()=>{console.log('错误')})

    },
  }
}
</script>
