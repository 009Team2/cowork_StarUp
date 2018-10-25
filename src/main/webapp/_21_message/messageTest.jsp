<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WebSocket Message</title>
	</head>
	<body>
		<form  action="">
			<input id="textMessage" type="text">
			<input onclick="sendMessage();" value="Send Message" type="button">
		</form>
		<br><textarea rows="10" cols="50" id="messageTextArea"></textarea>
		<script type="text/javascript">
				var webSocket = new WebSocket("ws://localhost:8080/StarUp/serverEndpoint");
				var messageTextArea = document.getElementById("messageTextArea");
				webSocket.onopen = function(message){processOpen(message);};
				webSocket.onmessage = function(message){processMessage(message);};
				webSocket.onclose = function(message){processClose(message);};
				webSocket.onerror = function(message){processError(message);};
				function processOpen(message){
					messageTextArea.value += "Server Connect..."+"\n";
				}
				function processMessage(message){
					messageTextArea.value += "Receive From Server : "+message.data+"\n";
				}
				function sendMessage(){
					if(textMessage.value != "close"){
						webSocket.send(textMessage.value);
						messageTextArea.value += "Send to Server :"+ textMessage.value+"\n";				
						textMessage.value="";						
					}else webSocket.close();
				}
				function processClose(message){
					webSocket.send("Client disconnected")
					messageTextArea.value += "Server Disonnect..."+"\n";
				}
				function processError(message){
					webSocket.send("Client disconnected")
					messageTextArea.value += "error..."+"\n";
				}
		</script>
	</body>
</html>