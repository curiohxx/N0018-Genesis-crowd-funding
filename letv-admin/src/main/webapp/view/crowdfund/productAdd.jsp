<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="security" uri="http://www.springframework.org/security/tags" %>
<%
String path = request.getContextPath();
%>
<script type="text/javascript">
	var path = "<%=path%>";
</script>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/common/webuploader/webuploader.css"/>
<script type="text/javascript" src="<%=path%>/js/common/webuploader/webuploader.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/common/webuploader/demo.css"/>
<script type="text/javascript" charset="utf-8" src="<%=path %>/js/common/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=path %>/js/common/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="<%=path%>/js/common/webuploader/webuploader.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/common/ueditor/ueditorDo.js"></script>
<script type="text/javascript" src="<%=path%>/js/crowdfund/productAdd.js"></script>
<script type="text/javascript" src="<%=path%>/js/crowdfund/loanCommon.js"></script>
<style>
#add{width:auto !important;}
</style>	
<div id="add" style="display: block; overflow: auto; padding: 0;">
		<div id="baseInfo" style="padding-top:20px;padding-bottom:20px;border:1px solid #00b7ee;">  
			<form id="baseForm" method="post">
	        <!--   <div class="x-form-item">
						<label class="x-form-item-label">项目类型:</label>
						<div class="x-form-element">
							<select id=loanType name="loanType"  style="width:260px"></select>
						</div>
					</div> -->
					<input type="hidden" name="loanType" value="product">
		        	<div class="x-form-item">
						<label class="x-form-item-label">项目名称:</label>
						<div class="x-form-element">
							<input type="text" name="loanName" />
						</div>
					</div>
					
					<div class="x-form-item">
						<label class="x-form-item-label">发起人:</label>
						<div class="x-form-element">
							<input type="hidden" id="loanUser" name="loanUser" />
							<input type="text" id="loanUserText" name="loanUserName" readOnly="true"/>
							<a id="getLoanUserBtn" style="width: 80px; height:28px; margin-left: -2px; margin-top:-3px; border-left: 0;" class="easyui-linkbutton">选择</a>
						</div>
					</div>
					<!-- <div class="x-form-item">
						<label class="x-form-item-label">合同模版:</label>
						<div class="x-form-element">
							<input type="hidden" id="contractTplNo" name="contractTplNo" />
							<input type="text" id="contractTplNoText" name="contractTplNoText" readonly="readonly"/>
							<a id="getContractTplBtn" style="width: 80px; height:28px; margin-left: -2px; margin-top:-3px; border-left: 0;" class="easyui-linkbutton">选择</a>
						</div>
					</div>	 -->
					<div class="x-form-item">
						<label class="x-form-item-label">筹资金额:</label>
						<div class="x-form-element">
							<input type="text" name="fundAmt" id="fundAmt" precision="2"/>
						</div>
					</div>
					 <div class="x-form-item">
						<label class="x-form-item-label">是否超募:</label>
						<div class="x-form-element">
							<select id="can_over" name="canOver">
								<option value="">请选择</option>
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</div>
					</div>
					<div class="x-form-item" id="overFundAmtDiv"  style="display: none">
						<label class="x-form-item-label">超募上限:</label>
						<div class="x-form-element">
							<input type="text" name="overFundAmt" id="overFundAmt"/>令
						</div>
					</div>	
<!-- 					<div class="x-form-item"> -->
<!-- 						<label class="x-form-item-label">筹资天数:</label> -->
<!-- 						<div class="x-form-element"> -->
<!-- 							<input type="text" name=fundDays/> -->
<!-- 						</div> -->
<!-- 					</div>	 -->
					<div class="x-form-item">
						<label class="x-form-item-label">筹资天数:</label>
						<div class="x-form-element">
							<input type="text" name="fundDays" precision="2"/>
						</div>
					</div>
					
<!-- 					<div class="x-form-item"> -->
<!-- 						<label class="x-form-item-label">锁定天数:</label> -->
<!-- 						<div class="x-form-element"> -->
<!-- 							<input type="text" name="lockDay"/> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="x-form-item">
						<label class="x-form-item-label">抽奖名额:</label>
						<div class="x-form-element">
							<input type="text" name="prizeNum"/>
						</div>
					</div> -->
					
<!-- 					<div class="x-form-item"> -->
<!-- 						<label class="x-form-item-label">预计每日收益:</label> -->
<!-- 						<div class="x-form-element"> -->
<!-- 							<input type="text" name="dailyEarningsForecast"/> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="x-form-item">
						<label class="x-form-item-label">行业类别:</label>
						<div class="x-form-element">
							 <select id=super_industry name="superIndustry" style="width:260px"></select>
						</div>
					</div>					
					<div class="x-form-item">
						<label class="x-form-item-label">收取服务费比例:</label>
						<div class="x-form-element">
							<input type="text" name="chargeFee" id="chargeFee"/>
							<span style="color:red">(提示:如果比例为1%，请输入0.01)</span>
						</div>
					</div>
				    <div class="x-form-item">
						<label class="x-form-item-label">项目等级:</label>
						<div class="x-form-element">
							 <select id="loanLevel" name="loanLevel" style="width:100px">
								 <option value="1">1</option>
							 	 <option value="2">2</option>
							 	 <option value="3">3</option>
							     <option value="4">4</option>
							     <option value="5">5</option>
							 </select>
						</div>
					</div> 
					
					<div class="x-form-item">
						<label class="x-form-item-label">项目所在地:</label>
						<div class="x-form-element">
						    <select id="pro_provice" name="province" style="width:100px"><option></option></select>
						    <select id="pro_city" name="city" style="width:100px"><option></option></select>
						    <select id="pro_county" name="county" style="width:100px"><option></option></select>
						</div>
					</div>
					<div class="x-form-item">
					    <label class="x-form-item-label">一句话描述项目:</label>
					    <div class="x-form-element">
					        <textarea rows="3" name="loanIntroduction" style="width: 500px;"></textarea>
					    </div>
					</div>						
<!-- 					<div class="x-form-item">
					    <label class="x-form-item-label">项目简介:</label>
					    <div class="x-form-element">
					        <textarea rows="8" name="loanDes" style="width: 500px;"></textarea>
					    </div>
					</div> -->
					
					<label>项目封面：</label>
						<input type="hidden" name="loanLogo"/>
						<div class="x-form-element">
							<div id="logoDiv" style="margin-left: 10px;">
							    <!--用来存放item-->
							    <div class="filelist" id="logoValidateID"></div>
							    <div id="logoBtn" style="margin-left: 16px;">选择图片</div>
							</div>
						</div>
						
					   <label>项目头图：</label>
						<input type="hidden" name="loanPhoto"/>
						<div class="x-form-element">
							<div id="photoDiv" style="margin-left: 10px;">
							    <!--用来存放item-->
							    <div class="filelist"  id="photoValidateID"></div>
							    <div id="photoBtn" style="margin-left: 16px;">选择图片</div>
							</div>
						</div>								
				
			</form>    	
			<div style="text-align:center;width:360px;">
					<a  class="easyui-linkbutton c7" style="width:120px;margin-top:5px;" id="basicBtn">保存</a>
			</div>
		</div>
		
		
		<div id="sponsorDiv" style="padding-top:20px;border-left:1px solid #00b7ee;border-right:1px solid #00b7ee;">
				<form id="sponsorForm">
					
					<div class="x-form-item">
						<label class="x-form-item-label">真实姓名:</label>
						<div class="x-form-element">
							<input type="text" name="founder" id="founder"/>
						</div>
					</div>
					
					<div class="x-form-item">
						<label class="x-form-item-label">所在地:</label>
						<div class="x-form-element">
						    <select id="user_provice" name="userProvince" style="width:100px"><option></option></select>
						    <select id="user_city" name="userCity" style="width:100px"><option></option></select>
						</div>
					</div>
					<div class="x-form-item">
						<label class="x-form-item-label">联系电话:</label>
						<div class="x-form-element">
							<input type="text" name="userMobile" id="userMobile"/>
						</div>
					</div>
					
					<div class="x-form-item">
						<label class="x-form-item-label">公司名称:</label>
						<div class="x-form-element">
							<input type="text" name="company" id="company"/>
						</div>
					</div>
					
					<div class="x-form-item">
						<label class="x-form-item-label">证件上传:</label>
						<div class="x-form-element">
							<div id="businessLicenseDiv" style="margin-left: 10px;">
							    <!--用来存放item-->
							    <div class="filelist"></div>
							    <div id="businessLicenseBtn" style="margin-left: 16px;">选择图片</div>
							</div>
						</div>
					</div>
					
					
				</form>
				<div style="text-align:center;width:360px;">
					<a  class="easyui-linkbutton c7" style="width:120px;margin-top:5px;" id="sponsorSaveBtn">保存</a>
				</div>
		 	</div>
		
		<div id="detailInfo" style="padding-top:20px;padding-bottom:20px;border:1px solid #00b7ee;">
				<form id="detailForm" method="post">
					<div class="x-form-item">
					    <label class="x-form-item-label">项目详情:</label>
				    	 <div name="ueditor" style="margin-left:25px">
						    <script id="loan_detail" type="text/plain" style="width:800px;height:500px;margin-left:90px;"></script>
						 </div>
				    </div>
				</form>
				<div style="text-align:center;width:360px;">
					<a  class="easyui-linkbutton c7" style="width:120px;margin-top:5px;" id="detailSaveBtn">保存</a>
				</div>
			</div>
			
			<div id="loanVideo1" style="padding-top:20px;border-left:1px solid #00b7ee;border-right:1px solid #00b7ee;">
				<form id="videoForm">
					<div class="x-form-item">
					    <label class="x-form-item-label">项目视频:</label>
					    <div class="x-form-element">
					     <textarea rows="3" name="loanVideo" id="loan_video" style="width:500px"></textarea>
					    </div>
					</div>
					<div class="x-form-item">
					    <label class="x-form-item-label">手机项目视频:</label>
					    <div class="x-form-element">
					     <textarea rows="3" name="mobileVideo" id="mobile_video" style="width:500px"></textarea>
					    </div>
					</div>					
					<div class="x-form-item">
					    <label class="x-form-item-label">视频简介:</label>
					    <div class="x-form-element">
					    	<textarea rows="8" name="videoDes" id="video_des" style="width: 500px;"></textarea>
					    </div>
					</div>
					<div id="loanVideoDisplay"></div>
				</form>
				<div style="text-align:center;width:360px;">
					<a  class="easyui-linkbutton c7" style="width:120px;margin-top:5px;" id="videoSaveBtn">保存</a>
				</div>
		 	</div>
		</div>