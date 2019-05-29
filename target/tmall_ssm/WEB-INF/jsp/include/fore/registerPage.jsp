<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>


<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility","visible");
        </c:if>

        $(".registerForm").submit(function(){
            if(0==$("#name").val().length){
                $("span.errorMessage").html("请输入用户名");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#password").val().length){
                $("span.errorMessage").html("请输入密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if(0==$("#repeatpassword").val().length){
                $("span.errorMessage").html("请输入重复密码");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }
            if($("#password").val() !=$("#repeatpassword").val()){
                $("span.errorMessage").html("重复密码不一致");
                $("div.registerErrorMessageDiv").css("visibility","visible");
                return false;
            }

            return true;
        });
    })
</script>
<style>
	.transition {
		transition:all 3s;
	}
</style>


<form method="post" action="foreregister" class="registerForm">





		<table class="registerTable" align="center">
			<tr>
				<td  class="registerTip registerTableLeftTD">设置会员名</td>
				<td></td>
			</tr>
			<tr>
				<td class="registerTableLeftTD">登陆名</td>
				<td  class="registerTableRightTD"><input id="name" name="name" placeholder="会员名一旦设置成功，无法修改" > </td>
			</tr>
			<tr>
				<td  class="registerTip registerTableLeftTD">设置登陆密码</td>
				<td  class="registerTableRightTD">登陆时验证，保护账号信息</td>
			</tr>
			<tr>
				<td class="registerTableLeftTD">登陆密码</td>
				<td class="registerTableRightTD"><input id="password" name="password" type="password"  placeholder="设置你的登陆密码" > </td>
			</tr>
			<tr>
				<td class="registerTableLeftTD">密码确认</td>
				<td class="registerTableRightTD"><input id="repeatpassword" type="password"   placeholder="请再次输入你的密码" > </td>
			</tr>

			<tr>
				<td colspan="2" class="registerButtonTD">
					<a href="registerSuccess.jsp" id="submitBtn"><button>提   交</button></a>
				</td>
			</tr>
		</table>

	<div class="registerDiv ">
		<div class="registerErrorMessageDiv ">
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close " data-dismiss="alert" aria-label="Close"></button>
				<span class="errorMessage "></span>
			</div>
		</div>
	</div>
</form>

<script>
	const name=document.getElementById("name");
	const password=document.getElementById("password");
	const repeatpassword=document.getElementById("repeatpassword");

	const registerErrorMessageDiv=document.querySelector(".registerErrorMessageDiv");
	const errorMessage=document.querySelector(".errorMessage");

	const submitBtn=document.getElementById("submitBtn");
	let pattern=null,
			testName=false,
			testPwd=false,
			testPwdagain=false;

	name.onblur = function () {

		pattern = /^[a-z0-9_]{1}[\w]{5,29}$/i;
		if(!this.value){
			registerErrorMessageDiv.style.visibility="visible";
			errorMessage.innerHTML = '用户名不能为空';
		}
		else if (!pattern.exec(name.value)) {
			registerErrorMessageDiv.style.visibility="visible";
			errorMessage.innerHTML = '6-30位字母、数字或“_”，字母开头';
			errorMessage.style.color = 'red';
		} else {
			registerErrorMessageDiv.style.visibility="hidden";
			errorMessage.innerHTML = '';
			testName = true;
		}
	}
	password.onblur = function () {
		// pattern=/^[\w|~|!|@|#|$|%|^|\|+|=|-|\.|[\]]{6,20}$/i;
		pattern = /\S{6,20}/;
		if (!pattern.test(this.value)) {
			registerErrorMessageDiv.style.visibility="visible";
			errorMessage.innerHTML = '请输入6-20位字母、数字或符号';
			errorMessage.style.color = 'red';
		} else {
			registerErrorMessageDiv.style.visibility="hidden";
			errorMessage.innerHTML = '';
			testPwd=true;
		}
		if(!this.value) {
			registerErrorMessageDiv.style.visibility="visible";
			errorMessage.innerHTML = '登陆密码不能为空';
		}
	}
	repeatpassword.onblur = function () {
		if (repeatpassword.value != password.value) {
			errorMessage.innerHTML = '两次密码设置不一致';
			registerErrorMessageDiv.style.visibility="visible";
		} else if(this.value!=""){
			errorMessage.innerHTML = '';
			registerErrorMessageDiv.style.visibility="hidden";
			testPwdagain = true;
		}
	}
	submitBtn.onclick=function (e) {
		if(!(testName||testPwd||testPwdagain)) {
			return false;
		}
	}
</script>