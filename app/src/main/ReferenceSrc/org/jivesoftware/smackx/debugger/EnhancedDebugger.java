package org.jivesoftware.smackx.debugger;

import com.edutech.publicedu.log.LogHelp;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Insets;
import java.awt.Toolkit;
import java.awt.datatransfer.ClipboardOwner;
import java.awt.datatransfer.StringSelection;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.AbstractAction;
import javax.swing.BorderFactory;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFormattedTextField;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.SwingUtilities;
import javax.swing.border.Border;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.text.BadLocationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.http.HttpStatus;
import org.apache.tools.ant.taskdefs.Manifest;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.debugger.SmackDebugger;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.util.ObservableReader;
import org.jivesoftware.smack.util.ObservableWriter;
import org.jivesoftware.smack.util.ReaderListener;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.WriterListener;

/* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebugger.class */
public class EnhancedDebugger implements SmackDebugger {
    private static final String NEWLINE = "\n";
    private static ImageIcon iqPacketIcon;
    private static ImageIcon messagePacketIcon;
    private static ImageIcon packetReceivedIcon;
    private static ImageIcon packetSentIcon;
    private static ImageIcon presencePacketIcon;
    private static ImageIcon unknownPacketTypeIcon;
    private ConnectionListener connListener;
    private Connection connection;
    private Date creationTime;
    private JTextArea messageTextArea;
    private DefaultTableModel messagesTable;
    private PacketListener packetReaderListener;
    private PacketListener packetWriterListener;
    private Reader reader;
    private ReaderListener readerListener;
    private int receivedIQPackets;
    private int receivedMessagePackets;
    private int receivedOtherPackets;
    private int receivedPackets;
    private int receivedPresencePackets;
    private int sentIQPackets;
    private int sentMessagePackets;
    private int sentOtherPackets;
    private int sentPackets;
    private int sentPresencePackets;
    private DefaultTableModel statisticsTable;
    private JFormattedTextField statusField;
    JTabbedPane tabbedPane;
    private JFormattedTextField userField;
    private Writer writer;
    private WriterListener writerListener;

    /* renamed from: org.jivesoftware.smackx.debugger.EnhancedDebugger$1 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebugger$1.class */
    class AnonymousClass1 implements PacketListener {
        SimpleDateFormat dateFormatter = new SimpleDateFormat("hh:mm:ss:SS aaa");

        AnonymousClass1() {
            EnhancedDebugger.this = r6;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(final Packet packet) {
            SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.1.1
                @Override // java.lang.Runnable
                public void run() {
                    EnhancedDebugger.this.addReadPacketToTable(AnonymousClass1.this.dateFormatter, packet);
                }
            });
        }
    }

    /* renamed from: org.jivesoftware.smackx.debugger.EnhancedDebugger$2 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebugger$2.class */
    class AnonymousClass2 implements PacketListener {
        SimpleDateFormat dateFormatter = new SimpleDateFormat("hh:mm:ss:SS aaa");

        AnonymousClass2() {
            EnhancedDebugger.this = r6;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(final Packet packet) {
            SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.2.1
                @Override // java.lang.Runnable
                public void run() {
                    EnhancedDebugger.this.addSentPacketToTable(AnonymousClass2.this.dateFormatter, packet);
                }
            });
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket.class */
    private class AdHocPacket extends Packet {
        private String text;

        public AdHocPacket(String str) {
            EnhancedDebugger.this = r4;
            this.text = str;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            return this.text;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener.class */
    private class PopupListener extends MouseAdapter {
        JPopupMenu popup;

        PopupListener(JPopupMenu jPopupMenu) {
            EnhancedDebugger.this = r4;
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

    /* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener.class */
    private class SelectionListener implements ListSelectionListener {
        JTable table;

        SelectionListener(JTable jTable) {
            EnhancedDebugger.this = r4;
            this.table = jTable;
        }

        public void valueChanged(ListSelectionEvent listSelectionEvent) {
            if (this.table.getSelectedRow() == -1) {
                EnhancedDebugger.this.messageTextArea.setText((String) null);
                return;
            }
            EnhancedDebugger.this.messageTextArea.setText((String) this.table.getModel().getValueAt(this.table.getSelectedRow(), 0));
            EnhancedDebugger.this.messageTextArea.setCaretPosition(0);
        }
    }

    public EnhancedDebugger(Connection connection, Writer writer, Reader reader) {
        URL resource = Thread.currentThread().getContextClassLoader().getResource("images/nav_left_blue.png");
        if (resource != null) {
            packetReceivedIcon = new ImageIcon(resource);
        }
        URL resource2 = Thread.currentThread().getContextClassLoader().getResource("images/nav_right_red.png");
        if (resource2 != null) {
            packetSentIcon = new ImageIcon(resource2);
        }
        URL resource3 = Thread.currentThread().getContextClassLoader().getResource("images/photo_portrait.png");
        if (resource3 != null) {
            presencePacketIcon = new ImageIcon(resource3);
        }
        URL resource4 = Thread.currentThread().getContextClassLoader().getResource("images/question_and_answer.png");
        if (resource4 != null) {
            iqPacketIcon = new ImageIcon(resource4);
        }
        URL resource5 = Thread.currentThread().getContextClassLoader().getResource("images/message.png");
        if (resource5 != null) {
            messagePacketIcon = new ImageIcon(resource5);
        }
        URL resource6 = Thread.currentThread().getContextClassLoader().getResource("images/unknown.png");
        if (resource6 != null) {
            unknownPacketTypeIcon = new ImageIcon(resource6);
        }
        this.messagesTable = null;
        this.messageTextArea = null;
        this.userField = null;
        this.statusField = null;
        this.connection = null;
        this.packetReaderListener = null;
        this.packetWriterListener = null;
        this.connListener = null;
        this.creationTime = new Date();
        this.statisticsTable = null;
        this.sentPackets = 0;
        this.receivedPackets = 0;
        this.sentIQPackets = 0;
        this.receivedIQPackets = 0;
        this.sentMessagePackets = 0;
        this.receivedMessagePackets = 0;
        this.sentPresencePackets = 0;
        this.receivedPresencePackets = 0;
        this.sentOtherPackets = 0;
        this.receivedOtherPackets = 0;
        this.connection = connection;
        this.writer = writer;
        this.reader = reader;
        createDebug();
        EnhancedDebuggerWindow.addDebugger(this);
    }

    static /* synthetic */ int access$1008(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.receivedIQPackets;
        enhancedDebugger.receivedIQPackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$1208(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.receivedMessagePackets;
        enhancedDebugger.receivedMessagePackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$1408(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.receivedPresencePackets;
        enhancedDebugger.receivedPresencePackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$1608(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.receivedOtherPackets;
        enhancedDebugger.receivedOtherPackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$2008(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.sentPackets;
        enhancedDebugger.sentPackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$2108(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.sentIQPackets;
        enhancedDebugger.sentIQPackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$2208(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.sentMessagePackets;
        enhancedDebugger.sentMessagePackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$2308(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.sentPresencePackets;
        enhancedDebugger.sentPresencePackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$2408(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.sentOtherPackets;
        enhancedDebugger.sentOtherPackets = i + 1;
        return i;
    }

    static /* synthetic */ int access$808(EnhancedDebugger enhancedDebugger) {
        int i = enhancedDebugger.receivedPackets;
        enhancedDebugger.receivedPackets = i + 1;
        return i;
    }

    private void addAdhocPacketPanel() {
        final JTextArea jTextArea = new JTextArea();
        jTextArea.setEditable(true);
        jTextArea.setForeground(new Color(1, 94, 35));
        this.tabbedPane.add("Ad-hoc message", new JScrollPane(jTextArea));
        this.tabbedPane.setToolTipTextAt(3, "Panel that allows you to send adhoc packets");
        JPopupMenu jPopupMenu = new JPopupMenu();
        JMenuItem jMenuItem = new JMenuItem("Message");
        jMenuItem.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.13
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea.setText("<message to=\"\" id=\"" + StringUtils.randomString(5) + "-X\"><body></body></message>");
            }
        });
        jPopupMenu.add(jMenuItem);
        JMenuItem jMenuItem2 = new JMenuItem("IQ Get");
        jMenuItem2.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.14
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea.setText("<iq type=\"get\" to=\"\" id=\"" + StringUtils.randomString(5) + "-X\"><query xmlns=\"\"></query></iq>");
            }
        });
        jPopupMenu.add(jMenuItem2);
        JMenuItem jMenuItem3 = new JMenuItem("IQ Set");
        jMenuItem3.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.15
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea.setText("<iq type=\"set\" to=\"\" id=\"" + StringUtils.randomString(5) + "-X\"><query xmlns=\"\"></query></iq>");
            }
        });
        jPopupMenu.add(jMenuItem3);
        JMenuItem jMenuItem4 = new JMenuItem("Presence");
        jMenuItem4.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.16
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea.setText("<presence to=\"\" id=\"" + StringUtils.randomString(5) + "-X\"/>");
            }
        });
        jPopupMenu.add(jMenuItem4);
        jPopupMenu.addSeparator();
        JMenuItem jMenuItem5 = new JMenuItem("Send");
        jMenuItem5.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.17
            public void actionPerformed(ActionEvent actionEvent) {
                if (!"".equals(jTextArea.getText())) {
                    EnhancedDebugger.this.connection.sendPacket(new AdHocPacket(jTextArea.getText()));
                }
            }
        });
        jPopupMenu.add(jMenuItem5);
        JMenuItem jMenuItem6 = new JMenuItem("Clear");
        jMenuItem6.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.18
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea.setText((String) null);
            }
        });
        jPopupMenu.add(jMenuItem6);
        jTextArea.addMouseListener(new PopupListener(jPopupMenu));
    }

    private void addBasicPanels() {
        JSplitPane jSplitPane = new JSplitPane(0);
        jSplitPane.setOneTouchExpandable(true);
        this.messagesTable = new DefaultTableModel(new Object[]{"Hide", "Timestamp", "", "", "Message", "Id", "Type", "To", Manifest.ATTRIBUTE_FROM}, 0) { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.4
            private static final long serialVersionUID = 8136121224474217264L;

            public Class<?> getColumnClass(int i) {
                return (i == 2 || i == 3) ? Icon.class : super.getColumnClass(i);
            }

            public boolean isCellEditable(int i, int i2) {
                return false;
            }
        };
        JTable jTable = new JTable(this.messagesTable);
        jTable.setSelectionMode(0);
        jTable.getColumnModel().getColumn(0).setMaxWidth(0);
        jTable.getColumnModel().getColumn(0).setMinWidth(0);
        jTable.getTableHeader().getColumnModel().getColumn(0).setMaxWidth(0);
        jTable.getTableHeader().getColumnModel().getColumn(0).setMinWidth(0);
        jTable.getColumnModel().getColumn(1).setMaxWidth((int) HttpStatus.SC_MULTIPLE_CHOICES);
        jTable.getColumnModel().getColumn(1).setPreferredWidth(90);
        jTable.getColumnModel().getColumn(2).setMaxWidth(50);
        jTable.getColumnModel().getColumn(2).setPreferredWidth(30);
        jTable.getColumnModel().getColumn(3).setMaxWidth(50);
        jTable.getColumnModel().getColumn(3).setPreferredWidth(30);
        jTable.getColumnModel().getColumn(5).setMaxWidth(100);
        jTable.getColumnModel().getColumn(5).setPreferredWidth(55);
        jTable.getColumnModel().getColumn(6).setMaxWidth(200);
        jTable.getColumnModel().getColumn(6).setPreferredWidth(50);
        jTable.getColumnModel().getColumn(7).setMaxWidth((int) HttpStatus.SC_MULTIPLE_CHOICES);
        jTable.getColumnModel().getColumn(7).setPreferredWidth(90);
        jTable.getColumnModel().getColumn(8).setMaxWidth((int) HttpStatus.SC_MULTIPLE_CHOICES);
        jTable.getColumnModel().getColumn(8).setPreferredWidth(90);
        SelectionListener selectionListener = new SelectionListener(jTable);
        jTable.getSelectionModel().addListSelectionListener(selectionListener);
        jTable.getColumnModel().getSelectionModel().addListSelectionListener(selectionListener);
        jSplitPane.setTopComponent(new JScrollPane(jTable));
        this.messageTextArea = new JTextArea();
        this.messageTextArea.setEditable(false);
        JPopupMenu jPopupMenu = new JPopupMenu();
        JMenuItem jMenuItem = new JMenuItem("Copy");
        jMenuItem.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.5
            public void actionPerformed(ActionEvent actionEvent) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(EnhancedDebugger.this.messageTextArea.getText()), (ClipboardOwner) null);
            }
        });
        jPopupMenu.add(jMenuItem);
        this.messageTextArea.addMouseListener(new PopupListener(jPopupMenu));
        JPanel jPanel = new JPanel(new BorderLayout());
        jPanel.add(new JScrollPane(this.messageTextArea), "Center");
        JButton jButton = new JButton("Clear All Packets");
        jButton.addActionListener(new AbstractAction() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.6
            private static final long serialVersionUID = -8576045822764763613L;

            public void actionPerformed(ActionEvent actionEvent) {
                EnhancedDebugger.this.messagesTable.setRowCount(0);
            }
        });
        jPanel.add(jButton, "North");
        jSplitPane.setBottomComponent(jPanel);
        jSplitPane.setDividerLocation((int) FTPReply.FILE_STATUS_OK);
        this.tabbedPane.add("All Packets", jSplitPane);
        this.tabbedPane.setToolTipTextAt(0, "Sent and received packets processed by Smack");
        final JTextArea jTextArea = new JTextArea();
        jTextArea.setWrapStyleWord(true);
        jTextArea.setLineWrap(true);
        jTextArea.setEditable(false);
        jTextArea.setForeground(new Color(112, 3, 3));
        this.tabbedPane.add("Raw Sent Packets", new JScrollPane(jTextArea));
        this.tabbedPane.setToolTipTextAt(1, "Raw text of the sent packets");
        JPopupMenu jPopupMenu2 = new JPopupMenu();
        JMenuItem jMenuItem2 = new JMenuItem("Copy");
        jMenuItem2.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.7
            public void actionPerformed(ActionEvent actionEvent) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(jTextArea.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem jMenuItem3 = new JMenuItem("Clear");
        jMenuItem3.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.8
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea.setText("");
            }
        });
        jTextArea.addMouseListener(new PopupListener(jPopupMenu2));
        jPopupMenu2.add(jMenuItem2);
        jPopupMenu2.add(jMenuItem3);
        final JTextArea jTextArea2 = new JTextArea();
        jTextArea2.setWrapStyleWord(true);
        jTextArea2.setLineWrap(true);
        jTextArea2.setEditable(false);
        jTextArea2.setForeground(new Color(6, 76, 133));
        this.tabbedPane.add("Raw Received Packets", new JScrollPane(jTextArea2));
        this.tabbedPane.setToolTipTextAt(2, "Raw text of the received packets before Smack process them");
        JPopupMenu jPopupMenu3 = new JPopupMenu();
        JMenuItem jMenuItem4 = new JMenuItem("Copy");
        jMenuItem4.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.9
            public void actionPerformed(ActionEvent actionEvent) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(new StringSelection(jTextArea2.getText()), (ClipboardOwner) null);
            }
        });
        JMenuItem jMenuItem5 = new JMenuItem("Clear");
        jMenuItem5.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.10
            public void actionPerformed(ActionEvent actionEvent) {
                jTextArea2.setText("");
            }
        });
        jTextArea2.addMouseListener(new PopupListener(jPopupMenu3));
        jPopupMenu3.add(jMenuItem4);
        jPopupMenu3.add(jMenuItem5);
        ObservableReader observableReader = new ObservableReader(this.reader);
        this.readerListener = new ReaderListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.11
            @Override // org.jivesoftware.smack.util.ReaderListener
            public void read(final String str) {
                SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.11.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (!EnhancedDebuggerWindow.PERSISTED_DEBUGGER || EnhancedDebuggerWindow.getInstance().isVisible()) {
                            int lastIndexOf = str.lastIndexOf(">");
                            if (lastIndexOf == -1) {
                                jTextArea2.append(str);
                                return;
                            }
                            if (jTextArea2.getLineCount() >= EnhancedDebuggerWindow.MAX_TABLE_ROWS) {
                                try {
                                    jTextArea2.replaceRange("", 0, jTextArea2.getLineEndOffset(0));
                                } catch (BadLocationException e) {
                                    e.printStackTrace();
                                }
                            }
                            jTextArea2.append(str.substring(0, lastIndexOf + 1));
                            jTextArea2.append("\n");
                            if (str.length() <= lastIndexOf) {
                                return;
                            }
                            jTextArea2.append(str.substring(lastIndexOf + 1));
                        }
                    }
                });
            }
        };
        observableReader.addReaderListener(this.readerListener);
        ObservableWriter observableWriter = new ObservableWriter(this.writer);
        this.writerListener = new WriterListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.12
            @Override // org.jivesoftware.smack.util.WriterListener
            public void write(final String str) {
                SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.12.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (!EnhancedDebuggerWindow.PERSISTED_DEBUGGER || EnhancedDebuggerWindow.getInstance().isVisible()) {
                            if (jTextArea.getLineCount() >= EnhancedDebuggerWindow.MAX_TABLE_ROWS) {
                                try {
                                    jTextArea.replaceRange("", 0, jTextArea.getLineEndOffset(0));
                                } catch (BadLocationException e) {
                                    e.printStackTrace();
                                }
                            }
                            jTextArea.append(str);
                            if (!str.endsWith(">")) {
                                return;
                            }
                            jTextArea.append("\n");
                        }
                    }
                });
            }
        };
        observableWriter.addWriterListener(this.writerListener);
        this.reader = observableReader;
        this.writer = observableWriter;
    }

    /* JADX WARN: Type inference failed for: r4v33, types: [java.lang.Object[], java.lang.Object[][]] */
    private void addInformationPanel() {
        JPanel jPanel = new JPanel();
        jPanel.setLayout(new BorderLayout());
        JPanel jPanel2 = new JPanel();
        jPanel2.setLayout(new GridBagLayout());
        jPanel2.setBorder(BorderFactory.createTitledBorder("Connection information"));
        JLabel jLabel = new JLabel("Host: ");
        jLabel.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jLabel.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jPanel2.add(jLabel, new GridBagConstraints(0, 0, 1, 1, 0.0d, 0.0d, 21, 0, new Insets(0, 0, 0, 0), 0, 0));
        JFormattedTextField jFormattedTextField = new JFormattedTextField(this.connection.getServiceName());
        jFormattedTextField.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        jFormattedTextField.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        jFormattedTextField.setEditable(false);
        jFormattedTextField.setBorder((Border) null);
        jPanel2.add(jFormattedTextField, new GridBagConstraints(1, 0, 1, 1, 1.0d, 0.0d, 10, 2, new Insets(0, 0, 0, 0), 0, 0));
        JLabel jLabel2 = new JLabel("Port: ");
        jLabel2.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jLabel2.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jPanel2.add(jLabel2, new GridBagConstraints(0, 1, 1, 1, 0.0d, 0.0d, 21, 0, new Insets(0, 0, 0, 0), 0, 0));
        JFormattedTextField jFormattedTextField2 = new JFormattedTextField(Integer.valueOf(this.connection.getPort()));
        jFormattedTextField2.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        jFormattedTextField2.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        jFormattedTextField2.setEditable(false);
        jFormattedTextField2.setBorder((Border) null);
        jPanel2.add(jFormattedTextField2, new GridBagConstraints(1, 1, 1, 1, 0.0d, 0.0d, 10, 2, new Insets(0, 0, 0, 0), 0, 0));
        JLabel jLabel3 = new JLabel("User: ");
        jLabel3.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jLabel3.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jPanel2.add(jLabel3, new GridBagConstraints(0, 2, 1, 1, 0.0d, 0.0d, 21, 0, new Insets(0, 0, 0, 0), 0, 0));
        this.userField = new JFormattedTextField();
        this.userField.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        this.userField.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        this.userField.setEditable(false);
        this.userField.setBorder((Border) null);
        jPanel2.add(this.userField, new GridBagConstraints(1, 2, 1, 1, 0.0d, 0.0d, 10, 2, new Insets(0, 0, 0, 0), 0, 0));
        JLabel jLabel4 = new JLabel("Creation time: ");
        jLabel4.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jLabel4.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jPanel2.add(jLabel4, new GridBagConstraints(0, 3, 1, 1, 0.0d, 0.0d, 21, 0, new Insets(0, 0, 0, 0), 0, 0));
        JFormattedTextField jFormattedTextField3 = new JFormattedTextField(new SimpleDateFormat("yyyy.MM.dd hh:mm:ss:SS aaa"));
        jFormattedTextField3.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        jFormattedTextField3.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        jFormattedTextField3.setValue(this.creationTime);
        jFormattedTextField3.setEditable(false);
        jFormattedTextField3.setBorder((Border) null);
        jPanel2.add(jFormattedTextField3, new GridBagConstraints(1, 3, 1, 1, 0.0d, 0.0d, 10, 2, new Insets(0, 0, 0, 0), 0, 0));
        JLabel jLabel5 = new JLabel("Status: ");
        jLabel5.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jLabel5.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 14));
        jPanel2.add(jLabel5, new GridBagConstraints(0, 4, 1, 1, 0.0d, 0.0d, 21, 0, new Insets(0, 0, 0, 0), 0, 0));
        this.statusField = new JFormattedTextField();
        this.statusField.setMinimumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        this.statusField.setMaximumSize(new Dimension((int) FTPReply.FILE_STATUS_OK, 20));
        this.statusField.setValue("Active");
        this.statusField.setEditable(false);
        this.statusField.setBorder((Border) null);
        jPanel2.add(this.statusField, new GridBagConstraints(1, 4, 1, 1, 0.0d, 0.0d, 10, 2, new Insets(0, 0, 0, 0), 0, 0));
        jPanel.add(jPanel2, "North");
        JPanel jPanel3 = new JPanel();
        jPanel3.setLayout(new GridLayout(1, 1));
        jPanel3.setBorder(BorderFactory.createTitledBorder("Transmitted Packets"));
        this.statisticsTable = new DefaultTableModel(new Object[]{new Object[]{"IQ", 0, 0}, new Object[]{"Message", 0, 0}, new Object[]{"Presence", 0, 0}, new Object[]{"Other", 0, 0}, new Object[]{"Total", 0, 0}}, new Object[]{"Type", "Received", "Sent"}) { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.19
            private static final long serialVersionUID = -6793886085109589269L;

            public boolean isCellEditable(int i, int i2) {
                return false;
            }
        };
        JTable jTable = new JTable(this.statisticsTable);
        jTable.setSelectionMode(0);
        jPanel3.add(new JScrollPane(jTable));
        jPanel.add(jPanel3, "Center");
        this.tabbedPane.add("Information", new JScrollPane(jPanel));
        this.tabbedPane.setToolTipTextAt(4, "Information and statistics about the debugged connection");
    }

    public void addReadPacketToTable(final SimpleDateFormat simpleDateFormat, final Packet packet) {
        SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.21
            @Override // java.lang.Runnable
            public void run() {
                ImageIcon imageIcon;
                String str;
                String from = packet.getFrom();
                String str2 = "";
                EnhancedDebugger.access$808(EnhancedDebugger.this);
                if (packet instanceof IQ) {
                    imageIcon = EnhancedDebugger.iqPacketIcon;
                    str = "IQ Received (class=" + packet.getClass().getName() + ")";
                    str2 = ((IQ) packet).getType().toString();
                    EnhancedDebugger.access$1008(EnhancedDebugger.this);
                } else if (packet instanceof Message) {
                    imageIcon = EnhancedDebugger.messagePacketIcon;
                    str = "Message Received";
                    str2 = ((Message) packet).getType().toString();
                    EnhancedDebugger.access$1208(EnhancedDebugger.this);
                } else if (packet instanceof Presence) {
                    imageIcon = EnhancedDebugger.presencePacketIcon;
                    str = "Presence Received";
                    str2 = ((Presence) packet).getType().toString();
                    EnhancedDebugger.access$1408(EnhancedDebugger.this);
                } else {
                    imageIcon = EnhancedDebugger.unknownPacketTypeIcon;
                    str = packet.getClass().getName() + " Received";
                    EnhancedDebugger.access$1608(EnhancedDebugger.this);
                }
                if (EnhancedDebuggerWindow.MAX_TABLE_ROWS > 0 && EnhancedDebugger.this.messagesTable.getRowCount() >= EnhancedDebuggerWindow.MAX_TABLE_ROWS) {
                    EnhancedDebugger.this.messagesTable.removeRow(0);
                }
                EnhancedDebugger.this.messagesTable.addRow(new Object[]{EnhancedDebugger.this.formatXML(packet.toXML()), simpleDateFormat.format(new Date()), EnhancedDebugger.packetReceivedIcon, imageIcon, str, packet.getPacketID(), str2, "", from});
                EnhancedDebugger.this.updateStatistics();
            }
        });
    }

    public void addSentPacketToTable(final SimpleDateFormat simpleDateFormat, final Packet packet) {
        SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.22
            @Override // java.lang.Runnable
            public void run() {
                ImageIcon imageIcon;
                String str;
                String to = packet.getTo();
                String str2 = "";
                EnhancedDebugger.access$2008(EnhancedDebugger.this);
                if (packet instanceof IQ) {
                    imageIcon = EnhancedDebugger.iqPacketIcon;
                    str = "IQ Sent (class=" + packet.getClass().getName() + ")";
                    str2 = ((IQ) packet).getType().toString();
                    EnhancedDebugger.access$2108(EnhancedDebugger.this);
                } else if (packet instanceof Message) {
                    imageIcon = EnhancedDebugger.messagePacketIcon;
                    str = "Message Sent";
                    str2 = ((Message) packet).getType().toString();
                    EnhancedDebugger.access$2208(EnhancedDebugger.this);
                } else if (packet instanceof Presence) {
                    imageIcon = EnhancedDebugger.presencePacketIcon;
                    str = "Presence Sent";
                    str2 = ((Presence) packet).getType().toString();
                    EnhancedDebugger.access$2308(EnhancedDebugger.this);
                } else {
                    imageIcon = EnhancedDebugger.unknownPacketTypeIcon;
                    str = packet.getClass().getName() + " Sent";
                    EnhancedDebugger.access$2408(EnhancedDebugger.this);
                }
                if (EnhancedDebuggerWindow.MAX_TABLE_ROWS > 0 && EnhancedDebugger.this.messagesTable.getRowCount() >= EnhancedDebuggerWindow.MAX_TABLE_ROWS) {
                    EnhancedDebugger.this.messagesTable.removeRow(0);
                }
                EnhancedDebugger.this.messagesTable.addRow(new Object[]{EnhancedDebugger.this.formatXML(packet.toXML()), simpleDateFormat.format(new Date()), EnhancedDebugger.packetSentIcon, imageIcon, str, packet.getPacketID(), str2, to, ""});
                EnhancedDebugger.this.updateStatistics();
            }
        });
    }

    private void createDebug() {
        this.tabbedPane = new JTabbedPane();
        addBasicPanels();
        addAdhocPacketPanel();
        addInformationPanel();
        this.packetReaderListener = new AnonymousClass1();
        this.packetWriterListener = new AnonymousClass2();
        this.connListener = new ConnectionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.3
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        EnhancedDebugger.this.statusField.setValue("Closed");
                        EnhancedDebuggerWindow.connectionClosed(EnhancedDebugger.this);
                    }
                });
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(final Exception exc) {
                SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.3.2
                    @Override // java.lang.Runnable
                    public void run() {
                        EnhancedDebugger.this.statusField.setValue("Closed due to an exception");
                        EnhancedDebuggerWindow.connectionClosedOnError(EnhancedDebugger.this, exc);
                    }
                });
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectingIn(final int i) {
                SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.3.3
                    @Override // java.lang.Runnable
                    public void run() {
                        EnhancedDebugger.this.statusField.setValue("Attempt to reconnect in " + i + " seconds");
                    }
                });
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionFailed(Exception exc) {
                SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.3.5
                    @Override // java.lang.Runnable
                    public void run() {
                        EnhancedDebugger.this.statusField.setValue("Reconnection failed");
                    }
                });
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionSuccessful() {
                SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.3.4
                    @Override // java.lang.Runnable
                    public void run() {
                        EnhancedDebugger.this.statusField.setValue("Reconnection stablished");
                        EnhancedDebuggerWindow.connectionEstablished(EnhancedDebugger.this);
                    }
                });
            }
        };
    }

    public String formatXML(String str) {
        try {
            TransformerFactory newInstance = TransformerFactory.newInstance();
            try {
                newInstance.setAttribute("indent-number", 2);
            } catch (IllegalArgumentException e) {
            }
            Transformer newTransformer = newInstance.newTransformer();
            newTransformer.setOutputProperty("omit-xml-declaration", "yes");
            newTransformer.setOutputProperty("indent", "yes");
            newTransformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", LogHelp.TYPE_MYWORK);
            StreamSource streamSource = new StreamSource(new StringReader(str));
            StringWriter stringWriter = new StringWriter();
            newTransformer.transform(streamSource, new StreamResult(stringWriter));
            str = stringWriter.toString();
        } catch (TransformerConfigurationException e2) {
            System.out.println("\n** Transformer Factory error");
            System.out.println("   " + e2.getMessage());
            Throwable th = e2;
            if (e2.getException() != null) {
                th = e2.getException();
            }
            th.printStackTrace();
        } catch (TransformerException e3) {
            System.out.println("\n** Transformation error");
            System.out.println("   " + e3.getMessage());
            Throwable th2 = e3;
            if (e3.getException() != null) {
                th2 = e3.getException();
            }
            th2.printStackTrace();
        }
        return str;
    }

    public void updateStatistics() {
        this.statisticsTable.setValueAt(Integer.valueOf(this.receivedIQPackets), 0, 1);
        this.statisticsTable.setValueAt(Integer.valueOf(this.sentIQPackets), 0, 2);
        this.statisticsTable.setValueAt(Integer.valueOf(this.receivedMessagePackets), 1, 1);
        this.statisticsTable.setValueAt(Integer.valueOf(this.sentMessagePackets), 1, 2);
        this.statisticsTable.setValueAt(Integer.valueOf(this.receivedPresencePackets), 2, 1);
        this.statisticsTable.setValueAt(Integer.valueOf(this.sentPresencePackets), 2, 2);
        this.statisticsTable.setValueAt(Integer.valueOf(this.receivedOtherPackets), 3, 1);
        this.statisticsTable.setValueAt(Integer.valueOf(this.sentOtherPackets), 3, 2);
        this.statisticsTable.setValueAt(Integer.valueOf(this.receivedPackets), 4, 1);
        this.statisticsTable.setValueAt(Integer.valueOf(this.sentPackets), 4, 2);
    }

    void cancel() {
        this.connection.removeConnectionListener(this.connListener);
        this.connection.removePacketListener(this.packetReaderListener);
        this.connection.removePacketSendingListener(this.packetWriterListener);
        ((ObservableReader) this.reader).removeReaderListener(this.readerListener);
        ((ObservableWriter) this.writer).removeWriterListener(this.writerListener);
        this.messagesTable = null;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Reader getReader() {
        return this.reader;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public PacketListener getReaderListener() {
        return this.packetReaderListener;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public Writer getWriter() {
        return this.writer;
    }

    @Override // org.jivesoftware.smack.debugger.SmackDebugger
    public PacketListener getWriterListener() {
        return this.packetWriterListener;
    }

    boolean isConnectionActive() {
        return this.connection.isConnected();
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
    public void userHasLogged(final String str) {
        SwingUtilities.invokeLater(new Runnable() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebugger.20
            @Override // java.lang.Runnable
            public void run() {
                EnhancedDebugger.this.userField.setText(str);
                EnhancedDebuggerWindow.userHasLogged(this, str);
                EnhancedDebugger.this.connection.addConnectionListener(EnhancedDebugger.this.connListener);
            }
        });
    }
}
