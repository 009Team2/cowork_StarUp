package _21_webSocketMessage.web_socket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;

@javax.websocket.server.ServerEndpoint("/serverEndpoint")
public class ServerEndpoint {
		@OnOpen
		public void handleOpen(@PathParam("userNickname") String userNickname, Session userSession) {
			System.out.println("client now is connected");
		}
		@OnMessage
		public String handleMessage(String message, Session session) {
			System.out.println("receive from client :" + message);
			String replyMessage = "echo "+ message;
			System.out.println("send to client :" + replyMessage);
			return replyMessage;
		}
		@OnClose
		public void handleClose() {
			System.out.println("client now is disconnected");
		}
		@OnError
		public void handleError(Throwable t) {
			t.printStackTrace();
		}
}


