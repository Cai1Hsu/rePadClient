package org.jivesoftware.smack.debugger;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Toolkit;
import java.awt.datatransfer.ClipboardOwner;
import java.awt.datatransfer.StringSelection;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.Reader;
import java.io.Writer;
import javax.swing.JFrame;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.ObservableReader;
import org.jivesoftware.smack.util.ObservableWriter;
import org.jivesoftware.smack.util.ReaderListener;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.WriterListener;

/* loaded from: classes.jar:org/jivesoftware/smack/debugger/LiteDebugger.class */
public class LiteDebugger implements SmackDebugger {
    private static final String NEWLINE = "\n";
    private Connection connection;
    private JFrame frame = null;
    private PacketListener listener = null;
    private Reader reader;
    private ReaderListener readerListener;
    private Writer writer;
    private WriterListener writerListener;

    /* loaded from: classes.jar:org/jivesoftware/smack/debugger/LiteDebugger$PopupListener.class */
    private class PopupListener extends MouseAdapter {
        JPopupMenu popup;

        PopupListener(JPopupMenu jPopupMenu) {
            LiteDebugger.this = r4;
            this.popup = jPopupMenu;
        }

        private void maybeShowPopup(MouseEvent mouseEvent) {
            if (mouseEvent.isPopupTrigger()) {
                this.popup.show(mouseEvent.getComponent(), mouseEvent.getX(), mouseEvent.getY());
            }
        }

        public void mousePressed(MouseEvent mouseEvent) {
            maybeShowPopup(mouseEvent);
        }

        public void mouseReleased(MouseEvent mouseEvent) {
            maybeShowPopup(mouseEvent);
        }
    }

    public LiteDebugger(Connection connection, Writer writer, Reader reader) {
        this.connection = null;
        this.connection = connection;
        this.writer = writer;
        this.reader = reader;
        createDebug();
    }

    private void createDebug() {
        this.frame = new JFrame("Smack Debug Window -- " + this.connection.getServiceName() + ":" + this.connection.getPort());
        this.frame.addWindowListener(new WindowAdapter() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.1
            public void windowClosing(WindowEvent windowEvent) {
                LiteDebugger.this.rootWindowClosing(windowEvent);
            }
        });
        JTabbedPane jTabbedPane = new JTabbedPane();
        JPanel jPanel = new JPanel();
        jPanel.setLayout(new GridLayout(3, 1));
        jTabbedPane.add("All", jPanel);
        final JTextArea jTextArea = new JTextArea();
        final JTextArea jTextArea2 = new JTextArea();
        jTextArea.setEditable(false);
        jTextArea2.setEditable(false);
        jTextArea.setForeground(new Color(112, 3, 3));
        jTextArea2.setForeground(new Color(112, 3, 3));
        jPanel.add(new JScrollPane(jTextArea));
        jTabbedPane.add("Sent", new JScrollPane(jTextArea2));
        JPopupMenu jPopupMenu = new JPopupMenu();
        JMenuItem jMenuItem = new JMenuItem("Copy");
        jMenuItem.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.2
            public void actionPerformed(ActionEvent actionEvent) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(jTextArea.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem jMenuItem2 = new JMenuItem("Clear");
        jMenuItem2.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.3
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea.setText("");
                jTextArea2.setText("");
            }
        });
        PopupListener popupListener = new PopupListener(jPopupMenu);
        jTextArea.addMouseListener(popupListener);
        jTextArea2.addMouseListener(popupListener);
        jPopupMenu.add(jMenuItem);
        jPopupMenu.add(jMenuItem2);
        final JTextArea jTextArea3 = new JTextArea();
        final JTextArea jTextArea4 = new JTextArea();
        jTextArea3.setEditable(false);
        jTextArea4.setEditable(false);
        jTextArea3.setForeground(new Color(6, 76, 133));
        jTextArea4.setForeground(new Color(6, 76, 133));
        jPanel.add(new JScrollPane(jTextArea3));
        jTabbedPane.add("Received", new JScrollPane(jTextArea4));
        JPopupMenu jPopupMenu2 = new JPopupMenu();
        JMenuItem jMenuItem3 = new JMenuItem("Copy");
        jMenuItem3.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.4
            public void actionPerformed(ActionEvent actionEvent) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(jTextArea3.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem jMenuItem4 = new JMenuItem("Clear");
        jMenuItem4.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.5
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea3.setText("");
                jTextArea4.setText("");
            }
        });
        PopupListener popupListener2 = new PopupListener(jPopupMenu2);
        jTextArea3.addMouseListener(popupListener2);
        jTextArea4.addMouseListener(popupListener2);
        jPopupMenu2.add(jMenuItem3);
        jPopupMenu2.add(jMenuItem4);
        final JTextArea jTextArea5 = new JTextArea();
        final JTextArea jTextArea6 = new JTextArea();
        jTextArea5.setEditable(false);
        jTextArea6.setEditable(false);
        jTextArea5.setForeground(new Color(1, 94, 35));
        jTextArea6.setForeground(new Color(1, 94, 35));
        jPanel.add(new JScrollPane(jTextArea5));
        jTabbedPane.add("Interpreted", new JScrollPane(jTextArea6));
        JPopupMenu jPopupMenu3 = new JPopupMenu();
        JMenuItem jMenuItem5 = new JMenuItem("Copy");
        jMenuItem5.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.6
            public void actionPerformed(ActionEvent actionEvent) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(jTextArea5.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem jMenuItem6 = new JMenuItem("Clear");
        jMenuItem6.addActionListener(new ActionListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.7
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea5.setText("");
                jTextArea6.setText("");
            }
        });
        PopupListener popupListener3 = new PopupListener(jPopupMenu3);
        jTextArea5.addMouseListener(popupListener3);
        jTextArea6.addMouseListener(popupListener3);
        jPopupMenu3.add(jMenuItem5);
        jPopupMenu3.add(jMenuItem6);
        this.frame.getContentPane().add(jTabbedPane);
        this.frame.setSize(550, 400);
        this.frame.setVisible(true);
        ObservableReader observableReader = new ObservableReader(this.reader);
        this.readerListener = new ReaderListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.8
            @Override // org.jivesoftware.smack.util.ReaderListener
            public void read(String str) {
                int lastIndexOf = str.lastIndexOf(">");
                if (lastIndexOf == -1) {
                    jTextArea3.append(str);
                    jTextArea4.append(str);
                    return;
                }
                jTextArea3.append(str.substring(0, lastIndexOf + 1));
                jTextArea4.append(str.substring(0, lastIndexOf + 1));
                jTextArea3.append("\n");
                jTextArea4.append("\n");
                if (str.length() <= lastIndexOf) {
                    return;
                }
                jTextArea3.append(str.substring(lastIndexOf + 1));
                jTextArea4.append(str.substring(lastIndexOf + 1));
            }
        };
        observableReader.addReaderListener(this.readerListener);
        ObservableWriter observableWriter = new ObservableWriter(this.writer);
        this.writerListener = new WriterListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.9
            @Override // org.jivesoftware.smack.util.WriterListener
            public void write(String str) {
                jTextArea.append(str);
                jTextArea2.append(str);
                if (str.endsWith(">")) {
                    jTextArea.append("\n");
                    jTextArea2.append("\n");
                }
            }
        };
        observableWriter.addWriterListener(this.writerListener);
        this.reader = observableReader;
        this.writer = observableWriter;
        this.listener = new PacketListener() { // from class: org.jivesoftware.smack.debugger.LiteDebugger.10
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                jTextArea5.append(packet.toXML());
                jTextArea6.append(packet.toXML());
                jTextArea5.append("\n");
                jTextArea6.append("\n");
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

    public void rootWindowClosing(WindowEvent windowEvent) {
        this.connection.removePacketListener(this.listener);
        ((ObservableReader) this.reader).removeReaderListener(this.readerListener);
        ((ObservableWriter) this.writer).removeWriterListener(this.writerListener);
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public void userHasLogged(String str) {
        this.frame.setTitle(("Smack Debug Window -- " + ("".equals(StringUtils.parseName(str)) ? "" : StringUtils.parseBareAddress(str)) + "@" + this.connection.getServiceName() + ":" + this.connection.getPort()) + "/" + StringUtils.parseResource(str));
    }
}
