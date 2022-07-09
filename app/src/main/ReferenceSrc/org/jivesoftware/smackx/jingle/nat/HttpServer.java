package org.jivesoftware.smackx.jingle.nat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.StringTokenizer;
import org.apache.http.client.methods.HttpGet;
import org.jivesoftware.smackx.jingle.SmackLogger;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/HttpServer.class */
public class HttpServer {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(HttpServer.class);

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/HttpServer$HttpRequestHandler.class */
    class HttpRequestHandler implements Runnable {
        static final String CRLF = "\r\n";
        BufferedReader br;
        InputStream input;
        OutputStream output;
        Socket socket;

        public HttpRequestHandler(Socket socket) throws Exception {
            HttpServer.this = r8;
            this.socket = socket;
            this.input = socket.getInputStream();
            this.output = socket.getOutputStream();
            this.br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        }

        private void processRequest() throws Exception {
            while (true) {
                String readLine = this.br.readLine();
                HttpServer.LOGGER.debug(readLine);
                if (readLine.equals("\r\n") || readLine.equals("")) {
                    try {
                        this.output.close();
                        this.br.close();
                        this.socket.close();
                        return;
                    } catch (Exception e) {
                        e.printStackTrace();
                        return;
                    }
                } else if (new StringTokenizer(readLine).nextToken().equals(HttpGet.METHOD_NAME)) {
                    this.output.write("HTTP/1.0 200 OK\r\n".getBytes());
                    this.output.write("Server: Simple httpServer".getBytes());
                    this.output.write("text/html".getBytes());
                    this.output.write(("Content-Length: " + new Integer("".length()).toString() + "\r\n").getBytes());
                    this.output.write("\r\n".getBytes());
                    this.output.write("".getBytes());
                }
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                processRequest();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public HttpServer(int i) {
        try {
            ServerSocket serverSocket = new ServerSocket(i);
            LOGGER.debug("httpServer running on port " + serverSocket.getLocalPort());
            while (true) {
                Socket accept = serverSocket.accept();
                LOGGER.debug("New connection accepted " + accept.getInetAddress() + ":" + accept.getPort());
                try {
                    new Thread(new HttpRequestHandler(accept)).start();
                } catch (Exception e) {
                    LOGGER.debug("", e);
                }
            }
        } catch (IOException e2) {
            LOGGER.debug("", e2);
        }
    }

    public static void main(String[] strArr) {
        new HttpServer(Integer.parseInt(strArr[0]));
    }
}
