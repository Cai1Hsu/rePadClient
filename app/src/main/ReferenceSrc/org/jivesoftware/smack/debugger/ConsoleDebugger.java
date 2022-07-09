package org.jivesoftware.smack.debugger;

import java.io.Reader;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.ObservableReader;
import org.jivesoftware.smack.util.ObservableWriter;
import org.jivesoftware.smack.util.ReaderListener;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.WriterListener;

/* loaded from: classes.jar:org/jivesoftware/smack/debugger/ConsoleDebugger.class */
public class ConsoleDebugger implements SmackDebugger {
    public static boolean printInterpreted = false;
    private Connection connection;
    private Reader reader;
    private ReaderListener readerListener;
    private Writer writer;
    private WriterListener writerListener;
    private SimpleDateFormat dateFormatter = new SimpleDateFormat("hh:mm:ss aaa");
    private PacketListener listener = null;
    private ConnectionListener connListener = null;

    public ConsoleDebugger(Connection connection, Writer writer, Reader reader) {
        this.connection = null;
        this.connection = connection;
        this.writer = writer;
        this.reader = reader;
        createDebug();
    }

    private void createDebug() {
        ObservableReader observableReader = new ObservableReader(this.reader);
        this.readerListener = new ReaderListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.1
            @Override // org.jivesoftware.smack.util.ReaderListener
            public void read(String str) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " RCV  (" + ConsoleDebugger.this.connection.hashCode() + "): " + str);
            }
        };
        observableReader.addReaderListener(this.readerListener);
        ObservableWriter observableWriter = new ObservableWriter(this.writer);
        this.writerListener = new WriterListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.2
            @Override // org.jivesoftware.smack.util.WriterListener
            public void write(String str) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " SENT (" + ConsoleDebugger.this.connection.hashCode() + "): " + str);
            }
        };
        observableWriter.addWriterListener(this.writerListener);
        this.reader = observableReader;
        this.writer = observableWriter;
        this.listener = new PacketListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                if (ConsoleDebugger.printInterpreted) {
                    System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " RCV PKT (" + ConsoleDebugger.this.connection.hashCode() + "): " + packet.toXML());
                }
            }
        };
        this.connListener = new ConnectionListener() { // from class: org.jivesoftware.smack.debugger.ConsoleDebugger.4
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection closed (" + ConsoleDebugger.this.connection.hashCode() + ")");
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception exc) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection closed due to an exception (" + ConsoleDebugger.this.connection.hashCode() + ")");
                exc.printStackTrace();
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectingIn(int i) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection (" + ConsoleDebugger.this.connection.hashCode() + ") will reconnect in " + i);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionFailed(Exception exc) {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Reconnection failed due to an exception (" + ConsoleDebugger.this.connection.hashCode() + ")");
                exc.printStackTrace();
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionSuccessful() {
                System.out.println(ConsoleDebugger.this.dateFormatter.format(new Date()) + " Connection reconnected (" + ConsoleDebugger.this.connection.hashCode() + ")");
            }
        };
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Reader getReader() {
        return this.reader;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public PacketListener getReaderListener() {
        return this.listener;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Writer getWriter() {
        return this.writer;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public PacketListener getWriterListener() {
        return null;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Reader newConnectionReader(Reader reader) {
        ((ObservableReader) this.reader).removeReaderListener(this.readerListener);
        ObservableReader observableReader = new ObservableReader(reader);
        observableReader.addReaderListener(this.readerListener);
        this.reader = observableReader;
        return this.reader;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Writer newConnectionWriter(Writer writer) {
        ((ObservableWriter) this.writer).removeWriterListener(this.writerListener);
        ObservableWriter observableWriter = new ObservableWriter(writer);
        observableWriter.addWriterListener(this.writerListener);
        this.writer = observableWriter;
        return this.writer;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public void userHasLogged(String str) {
        System.out.println(("User logged (" + this.connection.hashCode() + "): " + ("".equals(StringUtils.parseName(str)) ? "" : StringUtils.parseBareAddress(str)) + "@" + this.connection.getServiceName() + ":" + this.connection.getPort()) + "/" + StringUtils.parseResource(str));
        this.connection.addConnectionListener(this.connListener);
    }
}
