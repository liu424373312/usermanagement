<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<title>首页</title>
		<link
			href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
			rel="stylesheet">
	</head>
	<body>
		<div class="row">
			<div class="col-xs-3"></div>
			<div class="col-xs-6">
				<h2 class="text-center">
					欢迎
				</h2>
				<form name="form1" action="login" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">
							用户名
						</label>
						<input name="userName"  class="form-control" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">
							密码
						</label>
						<input name="password" type="password" class="form-control" />
					</div>
					<input class="btn btn-default  btn-lg" type="submit" value="登录" />
					<input class="btn btn-default  btn-lg" type="reset" value="取消" />
				</form>
				<a class="btn btn-primary btn-block btn-lg" href="register.jsp"
					role="button">注册</a>
			</div>
			<div class="col-xs-3"></div>
		</div>
	</body>
</html>