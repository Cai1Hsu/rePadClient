package org.jivesoftware.smackx.jingle.mediaimpl.demo;

import java.awt.event.ActionEvent;
import java.util.ArrayList;
import javax.swing.AbstractAction;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleManager;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.JingleSessionRequest;
import org.jivesoftware.smackx.jingle.listeners.JingleSessionRequestListener;
import org.jivesoftware.smackx.jingle.mediaimpl.jspeex.SpeexMediaManager;
import org.jivesoftware.smackx.jingle.mediaimpl.sshare.ScreenShareMediaManager;
import org.jivesoftware.smackx.jingle.nat.ICETransportManager;
import org.jivesoftware.smackx.jingle.nat.JingleTransportManager;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/demo/Demo.class */
public class Demo extends JFrame {
    private static final long serialVersionUID = -6584021277434403855L;
    private JTextField jid;
    private String pass;
    private String server;
    private String user;
    private Connection xmppConnection;
    private JingleTransportManager transportManager = null;
    private JingleManager jm = null;
    private JingleSession incoming = null;
    private JingleSession outgoing = null;

    public Demo(String str, String str2, String str3) {
        this.xmppConnection = null;
        this.server = null;
        this.user = null;
        this.pass = null;
        this.server = str;
        this.user = str2;
        this.pass = str3;
        if (str2.equals("jeffw")) {
            this.jid = new JTextField("eowyn@" + str + "/Smack");
        } else {
            this.jid = new JTextField("jeffw@" + str + "/Smack");
        }
        this.xmppConnection = new XMPPConnection(str);
        try {
            this.xmppConnection.connect();
            this.xmppConnection.login(str2, str3);
            initialize();
        } catch (XMPPException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] strArr) {
        if (strArr.length > 2) {
            Demo demo = new Demo(strArr[0], strArr[1], strArr[2]);
            demo.pack();
            demo.setVisible(true);
            demo.setDefaultCloseOperation(3);
        }
    }

    public void createGUI() {
        JPanel jPanel = new JPanel();
        jPanel.add(this.jid);
        jPanel.add(new JButton(new AbstractAction("Call") { // from class: org.jivesoftware.smackx.jingle.mediaimpl.demo.Demo.2
            private static final long serialVersionUID = 4308448034795312815L;

            public void actionPerformed(ActionEvent actionEvent) {
                if (Demo.this.outgoing != null) {
                    return;
                }
                try {
                    Demo.this.outgoing = Demo.this.jm.createOutgoingJingleSession(Demo.this.jid.getText());
                    Demo.this.outgoing.startOutgoing();
                } catch (XMPPException e) {
                    e.printStackTrace();
                }
            }
        }));
        jPanel.add(new JButton(new AbstractAction("Hangup") { // from class: org.jivesoftware.smackx.jingle.mediaimpl.demo.Demo.3
            private static final long serialVersionUID = -4508007389146723587L;

            public void actionPerformed(ActionEvent actionEvent) {
                if (Demo.this.outgoing != null) {
                    try {
                        Demo.this.outgoing.terminate();
                    } catch (XMPPException e) {
                        e.printStackTrace();
                    } finally {
                        Demo.this.outgoing = null;
                    }
                }
                try {
                } catch (XMPPException e2) {
                    e2.printStackTrace();
                } finally {
                    Demo.this.incoming = null;
                }
                if (Demo.this.incoming != null) {
                    Demo.this.incoming.terminate();
                }
            }
        }));
        add(jPanel);
    }

    public void initialize() {
        ICETransportManager iCETransportManager = new ICETransportManager(this.xmppConnection, "10.47.47.53", 3478);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new SpeexMediaManager(iCETransportManager));
        arrayList.add(new ScreenShareMediaManager(iCETransportManager));
        this.jm = new JingleManager(this.xmppConnection, arrayList);
        this.jm.addCreationListener(iCETransportManager);
        this.jm.addJingleSessionRequestListener(new JingleSessionRequestListener() { // from class: org.jivesoftware.smackx.jingle.mediaimpl.demo.Demo.1
            @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionRequestListener
            public void sessionRequested(JingleSessionRequest jingleSessionRequest) {
                try {
                    Demo.this.incoming = jingleSessionRequest.accept();
                    Demo.this.incoming.startIncoming();
                } catch (XMPPException e) {
                    e.printStackTrace();
                }
            }
        });
        createGUI();
    }
}
