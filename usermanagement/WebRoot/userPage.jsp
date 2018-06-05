<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>My WebSocket</title>
		<link
			href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
			rel="stylesheet">
		<style type="text/css">
.text-container {
	margin: 0 0 10px 0;
	font-family: "Courier New";
	width: 100%;
	height: 400px;
	overflow: auto;
	border: 1px solid gray;
}

.text-wrapper {
	margin: 40px;
}

.btn {
	margin: 10px 10px 10px 0;
}

.container-fluid {
	margin: 80px 30px 30px 30px;
}

.message {
	margin: 15px 15px 15px 15px;
}
.add{ 
border:2px solid;
border-radius:1px;
background-color:#fff;
}
</style>
	</head>

	<body>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="col-md-2">
					<form class="form">
						<div class="form-group">
							<label class="control-label">
								用户名
							</label>
							<div>
								<p class="form-control-static">
									${userName}
								</p>
							</div>
							<label for="inputPassword" class="control-label">
								昵称
							</label>
							<div>
								<input type="text" class="form-control" id="txtName" value=""
									class="form-control">
							</div>
							<button class="btn btn-default" id='ToggleConnection'
								type="button" onclick=login();>
								登录
							</button>
							<button class="btn btn-danger" onclick=closeWebSocket();>
								关闭
							</button>
						</div>
					</form>
				</div>
				<div class="col-md-6">
					<div id='LogContainer' class='text-container'></div>
					<div id='SendDataContainer'>
						<input class="form-control send-text" id="text" type="text" />
						<button class="btn btn-default" onclick=send();>
							发送
						</button>
					</div>
				</div>
				<div class="col-md-4">
					<ul class="nav nav-list well">
						<li class="nav-header">
							聊天室
						</li>
						<li class="all text-primary">
							<a>大家好</a>
						</li>
						<li class="nav-header">
							在线用户
							<ul id="users" class="nav nav-list well">
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</body>
	<script src="jquery-min.js" type="text/javascript"></script>
	<script type="text/javascript">
	var websocket = null;
	var sendtitle = 'all@';
	$(".all").click(function(){
		sendtitle="all@";
		$(this).addClass("add");
		$(".user").siblings().removeClass("add");
	});
	//判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://localhost:8888");
	} else {
		alert('Not support websocket')
	}

	//连接发生错误的回调方法
	websocket.onerror = function() {
		setMyMessageInnerHTML("连接错误");
	};

	//连接成功建立的回调方法
	websocket.onopen = function(event) {
		setMyMessageInnerHTML("连接成功");
	}

	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		setMessageInnerHTML(event.data);
	}

	//连接关闭的回调方法
	websocket.onclose = function() {
		setMyMessageInnerHTML("连接关闭");
	}

	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		websocket.close();
	}

	//将消息显示在网页上
	function setMessageInnerHTML(innerHTML) {
			var s=innerHTML;
			var result=s.split('@');
			if(result[0]=='all'){
		    	var str = '<div class="text-left message">'+'[所有人]'+result[1]+':'+result[2]+'</div>';
    			$("#LogContainer").append(str); //添加元素
    		}else if(result[0]=='sys'){
    			var str = '<div class="text-left message">'+'[系统]:'+result[1]+'</div>';
    			$("#LogContainer").append(str); //添加元素
    		}else if(result[0]=='users'){
    			$("#users").empty();
    			var users=result[1].split(',');
    			for(var i=1;i<users.length;i++){
    			var str = '<li class="user text-primary" value="'+users[i]+'"><a>'+users[i]+'</a></li>';
    			$("#users").append(str); //添加元素
    			}
    			$(".user").click(function(){
					sendtitle="to@"+$(this).text()+"@";
					$(".all").removeClass("add");
					$(this).addClass("add").siblings().removeClass("add");
				});
    		}else if(result[0]=='from'){
    			var str = '<div class="text-left message">'+result[1]+':'+result[2]+'</div>';
    			$("#LogContainer").append(str); //添加元素
    		}else{
    			var str = '<div class="text-left message">'+innerHTML+'</div>';
    			$("#LogContainer").append(str); //添加元素
    		}
    		
	}
	
	function setMyMessageInnerHTML(innerHTML) {
		    var str = '<div class="text-right message">'+"我:"+innerHTML+'</div>';
    		$("#LogContainer").append(str); //添加元素
	}
	
	function showLogin(innerHTML) {
		    var s=innerHTML;
		    var users=s.split(',')
		    var str = '<div class="text-left message">'+users[1]+'</div>';
		    $("#LogContainer").append(str);
	}

	//关闭连接
	function closeWebSocket() {
		websocket.close();
	}

	//发送消息
	function send() {
		var message = sendtitle+document.getElementById('text').value;
		setMyMessageInnerHTML(document.getElementById('text').value);
		websocket.send(message);
	}

	function login() {
		var message = "user@" + document.getElementById('txtName').value;
		websocket.send(message);
	}
	
</script>
</html>