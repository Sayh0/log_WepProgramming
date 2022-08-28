<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!-- BootStrap -->

<!-- Font -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>
<!-- Font -->

<!-- disabled 투명도 설정 -->
<!-- 
<style> [disabled="true"] { border: 1px solid #f00; }</style>
 -->
<!-- disabled 투명도 설정 -->

<style>
  textarea {
    resize: none;
  }
</style>

<%
	String ID=(String)session.getAttribute("id");
%>
</head>

<body>
<h1>채팅방입니다. </h1>

	<form>
		<input id="user" type="text" value="<%=ID%>" disabled>
		<!-- 송신 메시지를 작성하는 텍스트 박스 -->
		<input id="textMessage" type="text">
		<!-- 메세지를 송신하는 버튼 -->
		<input onclick="sendMessage()" value="Send" type="button">

		<!-- WebSocket 접속 종료하는 버튼. 지금은 굳이 필요성 못 느껴서 제거. -->
		<!-- <input onclick="disconnect()" value="Disconnect" type="button">-->
	</form>  
	<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
	<div class="">
	<br />
		<span>서버 상태 : </span><span id=serverConnection></span>
		<p>  </p>
	</div>
	<span>
		<textarea id="messageTextArea" rows="10" cols="70" disabled></textarea>
	</span>
	
	<!-- 
	<span>
		<textarea id="messageTextArea2" rows="10" cols="50" disabled></textarea>
	</span>
	 -->
	 
	<!-- JAVASCRIPT -->
	
	<script type="text/javascript">  
	// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
	// 학원 컴퓨터 주소 : ws://192.168.0.59:8888/Step04-02_MyProject/broadsocket
	var webSocket = new WebSocket("ws://localhost:8888/Step04-02_MyProject/broadsocket");
	// 콘솔 텍스트 에리어 오브젝트
	var messageTextArea = document.getElementById("messageTextArea");
	//var messageTextArea2 = document.getElementById("messageTextArea2");

	webSocket.onopen = function(message) {
		document.querySelector("#serverConnection").innerText="접속 완료...";
		//messageTextArea.value += "Server connect success!...\n";    
	};
	webSocket.onclose = function(message) {
		document.querySelector("#serverConnection").innerText="접속 끊김...";
		//messageTextArea.value += "접속 끊김...\n";    
	};
	webSocket.onerror = function(message) {
		document.querySelector("#serverConnection").innerText="에러 발생...";
		//messageTextArea.value += "error...\n";    
	};
	
	// Send 버튼을 누르면 호출되는 함수
	function sendMessage() {
		var user = document.getElementById("user"); 	// 유저명 텍스트 박스 오브젝트를 취득
		var message = document.getElementById("textMessage"); 	// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
	// 콘솔 텍스트에 메시지를 출력한다.
		//messageTextArea.value += user.value + "(me) : " + "\n";
		messageTextArea.value += user.value + "(me) : " + message.value + "\n";
	// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
		webSocket.send("{{" + user.value + "}}" + message.value);
	// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
		message.value = "";
	}
	// function disconnect() { webSocket.close(); } 디스커넥트 버튼 비활성중
	</script>
	
</body>
</html>
