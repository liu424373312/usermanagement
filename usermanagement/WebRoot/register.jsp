<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" import="java.util.*"%>
<html>
	<script language="javaScript">
	function validateform() {
		var reason = "";
		reason += validateUsername(document.userForm.userName);
		reason += validateAge(document.userForm.age);
		if (reason != "") {
			alert("输入有误:\n" + reason);
			return false;
		} else {
			return true;
		}
	}
	function validateUsername(fld) {
		var error = "";
		if (fld.value == null || fld.value == "") {
			error = "用户名不能为空!\n";
		}
		return error;
	}
	function validateAge(fld) {
		var error = "";
		if (isNaN(fld.value)) {
			error = "年龄必须为数!\n";
		} else if (parseInt(fld.value) < 1 || parseInt(fld.value) > 100) {
			error = "年龄必须为1~100之间的数!\n";
		}
		return error;
	}
</script>
	<head>
		<title>注册</title>
		<link
			href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
			rel="stylesheet">
		<style type="text/css">
</style>
	</head>
	<body>
		<div class="row">
			<div class="col-xs-4"></div>
			<div class="col-xs-4">
				<h2 class="text-center">
					注册
				</h2>
				<form  onsubmit="return validateform();"
					name="userForm" action="register" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="control-label">
							用户名
						</label>
						<div >
							<input name="userName" type="text" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="control-label">
							密码
						</label>
						<div >
							<input name="password" type="password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class=" control-label">
							Email
						</label>
						<div >
							<input type="text" name="email" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="control-label">
							年龄
						</label>
						<div >
							<input name="age" type="text" size="8" value="0"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class=" control-label">
							性别
						</label>
						<div >
							<label class="radio-inline">
								<input type="radio" id="inlineRadio3" name="gender" value="man"
									checked>
								男
							</label>
							<label class="radio-inline">
								<input type="radio" id="inlineRadio3" name="gender"
									value="woman">
								女
							</label>
						</div>
					</div>
					<div class="text-center">
						<input class="btn btn-default  btn-lg" type="submit" value="提交" />
						<input class="btn btn-default  btn-lg" type="reset" value="重置" />
					</div>
				</form>
			</div>
			<div class="col-xs-4"></div>
		</div>
	</body>
</html>