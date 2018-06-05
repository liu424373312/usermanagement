package com.wei.socket;

import java.net.InetSocketAddress;
import java.net.UnknownHostException;

import org.java_websocket.WebSocket;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

public class ServerSocket extends WebSocketServer {

	private ServerManager _serverManager;

	public ServerSocket(ServerManager serverManager, int port)
			throws UnknownHostException {
		super(new InetSocketAddress(port));
		_serverManager = serverManager;
	}

	@Override
	public void onClose(WebSocket socket, int message, String reason,
			boolean remote) {
		_serverManager.UserLeave(socket);
	}

	@Override
	public void onError(WebSocket socket, Exception message) {
		System.out.println("Socket Exception:" + message.toString());
	}

	@Override
	public void onMessage(WebSocket socket, String message) {
		System.out.println("OnMessage:" + message.toString());
		String[] result = message.split("@");
		if (result[0].equals("user")) {
			_serverManager.UserLogin(result[1], socket);
		} else if (result[0].equals("all")) {
			_serverManager.SendMessageToAll(socket, result[1]);
		}
		if (result[0].equals("to")) {
			_serverManager.SendMessageToUser(socket, result[1], result[2]);
		}
	}

	@Override
	public void onOpen(WebSocket socket, ClientHandshake handshake) {
		System.out.println("Some one Connected...");
	}

}