//回车登录
function keyLogin(){
	if (event.keyCode==13)
		document.getElementById("btnLogin").click(); 
}
//更换验证码
function reloadCode() {
	var img = document.getElementById('imgCode');
	img.src = "checkCode?" + Math.random();
}
//提交登录表单
function frmSubmit(){
	var result = check();
	if(!result)
		return false;
	
	var checked = document.getElementById("student").checked;
	var loginForm = document.getElementById("loginForm");
	if(checked)
		loginForm.action = "studentLogin.gdou";
	else
		loginForm.action = "adminLogin.gdou";
	
	loginForm.submit();
}
//提交表单前检查参数合法性
function check() {
	var username = document.getElementById("username");
	if (isBlank(username.value)) {
		username.value = "";
		username.focus();
		alert("请填写帐号！");
		return false;
	}
	
	var password = document.getElementById("password");
	if (isBlank(password.value)) {
		password.value = "";
		password.focus();
		alert("请填写密码！");
		return false;
	}
	
	var checkCode = document.getElementById("checkCode");
	if (isBlank(checkCode.value)) {
		checkCode.value = "";
		checkCode.focus();
		alert("请填写验证码！");
		return false;
	}
	
	return true;
}