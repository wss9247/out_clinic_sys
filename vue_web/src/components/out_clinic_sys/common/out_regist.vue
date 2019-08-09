<template>
<div id="out_regist">
	<!-- 主体选项卡区域 -->
	<div class="contain">
		<ul class="nav nav-tabs menu-tab">
			<li class="nav-item"><a class="nav-link active" data-toggle="tab1">患者登记</a></li>
			<li class="nav-item"><a class="nav-link " data-toggle="tab2">登记列表</a></li>
		</ul>
		<div class="tab-content">
			<!-- 患者登记 -->
			<div class="tab-pane active" id="tab1">
				<ul>
						<!-- 患者信息 -->
					<li>
						<h5>患者信息</h5>
						<div class="form-inline">
							<!-- 第一行 -->
							<div class="col-4">
								患者姓名： <input type="text"><a class="search" href="javascript:;">搜索</a>
							</div>
							<div class="col-4">
								患者性别： <input id="sex1" checked type="radio" name="sex" value="0"><label for="sex1">男</label>
								<input id="sex2" type="radio" name="sex" value="1"><label for="sex2">女</label>
							</div>
							<div class="col-4">
								患者年龄： <input type="date"> <input type="text">岁
							</div>
							<!-- 第二行 -->                            
							<div class="col-4">
								手机号码： <input type="text">
							</div>
							<div class="col-4">
								挂号类别： <input id="regType1" checked type="radio" name="regType" value="0"><label for="regType1">直接挂号</label>
								<input id="regType2" type="radio" name="regType" value="1"><label for="regType2">预约挂号</label>
							</div>
							<div class="col-4">
								病历号码： <input type="text">
							</div>
						</div>
					</li>
					<!-- 诊前信息 -->
					<li>
						<h5>诊前信息</h5>
						<div class="form-inline">
								<!-- 第一行 -->
							<div class="col-6">
									过敏史： 
									<input id="allergies1" checked type="radio" name="allergies" value="0"><label for="allergies1">无</label>
									<input id="allergies2" type="radio" name="allergies" value="1"><label for="allergies2">有</label>
									<input disabled type="text" style="width:400px;">
							</div>
							<div class="col-6">
								既往史： 
								<input id="disHistory1" checked type="radio" name="disease_history" value="0"><label for="disHistory1">无</label>
								<input id="disHistory2" type="radio" name="disease_history" value="1"><label for="disHistory2">有</label>
								<input disabled type="text" style="width:400px;">
							</div>
						</div>
					</li>
					<!-- 就诊信息 -->
					<li>
						<h5>就诊信息</h5>
						<div class="form-inline">
							<!-- 第一行 -->                            
							<div class="col-4">
								就诊类型：
								<input id="isFirst1" checked type="radio" name="isFirst" value="0"><label for="isFirst1">初诊</label>
								<input id="isFirst2" type="radio" name="isFirst" value="1"><label for="regType2">复诊</label>
							</div>
							<div class="col-4">
								就诊科室： 
								<select name="dept_id" id="">
									<option value="">门诊</option>
									<option value="">西医科</option>
								</select>
							</div>
							<div class="col-4">
								就诊医生： 
								<select name="emp_id" id="">
									<option value="">王医生</option>
									<option value="">李医生</option>
								</select>
							</div>
						</div>
					</li>
					<li><a href="javascript:;" class="reset">清空</a></li>
				</ul>
				<a class="submit" href="javascript:;">完成登记</a>
			</div>
			<!-- 登记列表 -->
			<div class="tab-pane" id="tab2">
					<!-- 搜索栏 -->
					<div class="searchBox">
							<div class="form-inline">
								<div class="col-3">
									登记日期： <input type="date"> - <input type="date">
								</div>                   
								<div class="col-3">
									就诊类型：
									<select name="isFirst" id="">
										<option value="0">初诊</option>
										<option value="1">复诊</option>
									</select>
								</div>
								<div class="col-3">
									就诊科室： 
									<select name="dept_id" id="">
										<option value="">门诊</option>
										<option value="">西医科</option>
									</select>
								</div>
								<div class="col-3">
									就诊医生： 
									<select name="emp_id" id="">
										<option value="">王医生</option>
										<option value="">李医生</option>
									</select>
								</div>
								<div class="col-3">
									就诊状态： 
									<select name="staus" id="">
										<option value="0">待诊</option>
										<option value="1">已接诊</option>
										<option value="2">结束就诊</option>
										<option value="3">已作废</option>
									</select>
								</div>
								<div class="col-3">
									挂号类别：
									<select name="regType" id="">
										<option value="0">直接挂号</option>
										<option value="1">预约挂号</option>
									</select>
								</div>
								<div class="col-3">
									<input type="text"><a class="search" href="javascript:;">搜索</a>
								</div>
							</div>
					</div>
					<!-- 列表栏 -->
					<div class="regLists">
						<table>
							<thead></thead>
							<tbody></tbody>
						</table>
					</div>
					<div class="pages"></div>
			</div>                
		</div>
	</div>
</div>
</template>
<script>

export default {
  data(){return {

  }},
  mounted(){
   $("#out_regist ul.menu-tab").on("click",".nav-link",function(){
      var abtn=$(this);
      var toggleId=abtn[0].dataset.toggle;
      abtn.addClass("active")
        .parent().siblings().children().removeClass("active");
      $(`#out_regist #${toggleId}`).addClass("active")
        .siblings().removeClass("active");
    })
  }
}
</script>
<style scoped>
@import "../css/out_regist.css" ;
</style>