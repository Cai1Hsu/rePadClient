package org.jivesoftware.smackx.debugger;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import javax.swing.BorderFactory;
import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.border.Border;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.http.protocol.HTTP;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.provider.ProviderManager;

/* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebuggerWindow.class */
public class EnhancedDebuggerWindow {
    private static ImageIcon connectionActiveIcon;
    private static ImageIcon connectionClosedIcon;
    private static ImageIcon connectionClosedOnErrorIcon;
    private static ImageIcon connectionCreatedIcon;
    private static EnhancedDebuggerWindow instance;
    private List<EnhancedDebugger> debuggers;
    private JFrame frame;
    private JTabbedPane tabbedPane;
    public static boolean PERSISTED_DEBUGGER = false;
    public static int MAX_TABLE_ROWS = FTPReply.FILE_STATUS_OK;

    /* loaded from: classes.jar:org/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$PopupListener.class */
    private class PopupListener extends MouseAdapter {
        JPopupMenu popup;

        PopupListener(JPopupMenu jPopupMenu) {
            EnhancedDebuggerWindow.this = r4;
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

    private EnhancedDebuggerWindow() {
        URL resource = Thread.currentThread().getContextClassLoader().getResource("images/trafficlight_off.png");
        if (resource != null) {
            connectionCreatedIcon = new ImageIcon(resource);
        }
        URL resource2 = Thread.currentThread().getContextClassLoader().getResource("images/trafficlight_green.png");
        if (resource2 != null) {
            connectionActiveIcon = new ImageIcon(resource2);
        }
        URL resource3 = Thread.currentThread().getContextClassLoader().getResource("images/trafficlight_red.png");
        if (resource3 != null) {
            connectionClosedIcon = new ImageIcon(resource3);
        }
        URL resource4 = Thread.currentThread().getContextClassLoader().getResource("images/warning.png");
        if (resource4 != null) {
            connectionClosedOnErrorIcon = new ImageIcon(resource4);
        }
        this.frame = null;
        this.tabbedPane = null;
        this.debuggers = new ArrayList();
    }

    static void addDebugger(EnhancedDebugger enhancedDebugger) {
        synchronized (EnhancedDebuggerWindow.class) {
            try {
                getInstance().showNewDebugger(enhancedDebugger);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    static void connectionClosed(EnhancedDebugger enhancedDebugger) {
        synchronized (EnhancedDebuggerWindow.class) {
            try {
                getInstance().tabbedPane.setIconAt(getInstance().tabbedPane.indexOfComponent(enhancedDebugger.tabbedPane), connectionClosedIcon);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    static void connectionClosedOnError(EnhancedDebugger enhancedDebugger, Exception exc) {
        synchronized (EnhancedDebuggerWindow.class) {
            try {
                int indexOfComponent = getInstance().tabbedPane.indexOfComponent(enhancedDebugger.tabbedPane);
                getInstance().tabbedPane.setToolTipTextAt(indexOfComponent, "Connection closed due to the exception: " + exc.getMessage());
                getInstance().tabbedPane.setIconAt(indexOfComponent, connectionClosedOnErrorIcon);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    static void connectionEstablished(EnhancedDebugger enhancedDebugger) {
        synchronized (EnhancedDebuggerWindow.class) {
            try {
                getInstance().tabbedPane.setIconAt(getInstance().tabbedPane.indexOfComponent(enhancedDebugger.tabbedPane), connectionActiveIcon);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    private void createDebug() {
        this.frame = new JFrame("Smack Debug Window");
        if (!PERSISTED_DEBUGGER) {
            this.frame.addWindowListener(new WindowAdapter() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebuggerWindow.1
                public void windowClosing(WindowEvent windowEvent) {
                    EnhancedDebuggerWindow.this.rootWindowClosing(windowEvent);
                }
            });
        }
        this.tabbedPane = new JTabbedPane();
        JPanel jPanel = new JPanel();
        jPanel.setLayout(new BoxLayout(jPanel, 1));
        JPanel jPanel2 = new JPanel();
        jPanel2.setLayout(new BoxLayout(jPanel2, 0));
        jPanel2.setMaximumSize(new Dimension(2000, 31));
        jPanel2.add(new JLabel(" Smack version: "));
        JFormattedTextField jFormattedTextField = new JFormattedTextField(SmackConfiguration.getVersion());
        jFormattedTextField.setEditable(false);
        jFormattedTextField.setBorder((Border) null);
        jPanel2.add(jFormattedTextField);
        jPanel.add(jPanel2);
        JPanel jPanel3 = new JPanel();
        jPanel3.setLayout(new GridLayout(1, 1));
        jPanel3.setBorder(BorderFactory.createTitledBorder("Installed IQ Providers"));
        Vector vector = new Vector();
        for (Object obj : ProviderManager.getInstance().getIQProviders()) {
            if (obj.getClass() == Class.class) {
                vector.add(((Class) obj).getName());
            } else {
                vector.add(obj.getClass().getName());
            }
        }
        Collections.sort(vector);
        jPanel3.add(new JScrollPane(new JList(vector)));
        jPanel.add(jPanel3);
        JPanel jPanel4 = new JPanel();
        jPanel4.setLayout(new GridLayout(1, 1));
        jPanel4.setBorder(BorderFactory.createTitledBorder("Installed Extension Providers"));
        Vector vector2 = new Vector();
        for (Object obj2 : ProviderManager.getInstance().getExtensionProviders()) {
            if (obj2.getClass() == Class.class) {
                vector2.add(((Class) obj2).getName());
            } else {
                vector2.add(obj2.getClass().getName());
            }
        }
        Collections.sort(vector2);
        jPanel4.add(new JScrollPane(new JList(vector2)));
        jPanel.add(jPanel4);
        this.tabbedPane.add("Smack Info", jPanel);
        JPopupMenu jPopupMenu = new JPopupMenu();
        JMenuItem jMenuItem = new JMenuItem(HTTP.CONN_CLOSE);
        jMenuItem.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebuggerWindow.2
            public void actionPerformed(ActionEvent actionEvent) {
                if (EnhancedDebuggerWindow.this.tabbedPane.getSelectedIndex() < EnhancedDebuggerWindow.this.tabbedPane.getComponentCount() - 1) {
                    EnhancedDebugger enhancedDebugger = (EnhancedDebugger) EnhancedDebuggerWindow.this.debuggers.get(EnhancedDebuggerWindow.this.tabbedPane.getSelectedIndex());
                    enhancedDebugger.cancel();
                    EnhancedDebuggerWindow.this.tabbedPane.remove(enhancedDebugger.tabbedPane);
                    EnhancedDebuggerWindow.this.debuggers.remove(enhancedDebugger);
                    EnhancedDebuggerWindow.this.frame.setTitle("Smack Debug Window -- Total connections: " + (EnhancedDebuggerWindow.this.tabbedPane.getComponentCount() - 1));
                }
            }
        });
        jPopupMenu.add(jMenuItem);
        JMenuItem jMenuItem2 = new JMenuItem("Close All Not Active");
        jMenuItem2.addActionListener(new ActionListener() { // from class: org.jivesoftware.smackx.debugger.EnhancedDebuggerWindow.3
            public void actionPerformed(ActionEvent actionEvent) {
                ArrayList arrayList = new ArrayList();
                for (int i = 0; i < EnhancedDebuggerWindow.this.tabbedPane.getComponentCount() - 1; i++) {
                    EnhancedDebugger enhancedDebugger = (EnhancedDebugger) EnhancedDebuggerWindow.this.debuggers.get(i);
                    if (!enhancedDebugger.isConnectionActive()) {
                        enhancedDebugger.cancel();
                        arrayList.add(enhancedDebugger);
                    }
                }
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    EnhancedDebugger enhancedDebugger2 = (EnhancedDebugger) it.next();
                    EnhancedDebuggerWindow.this.tabbedPane.remove(enhancedDebugger2.tabbedPane);
                    EnhancedDebuggerWindow.this.debuggers.remove(enhancedDebugger2);
                }
                EnhancedDebuggerWindow.this.frame.setTitle("Smack Debug Window -- Total connections: " + (EnhancedDebuggerWindow.this.tabbedPane.getComponentCount() - 1));
            }
        });
        jPopupMenu.add(jMenuItem2);
        this.tabbedPane.addMouseListener(new PopupListener(jPopupMenu));
        this.frame.getContentPane().add(this.tabbedPane);
        this.frame.setSize(650, 400);
        if (!PERSISTED_DEBUGGER) {
            this.frame.setVisible(true);
        }
    }

    public static EnhancedDebuggerWindow getInstance() {
        if (instance == null) {
            instance = new EnhancedDebuggerWindow();
        }
        return instance;
    }

    private void showNewDebugger(EnhancedDebugger enhancedDebugger) {
        if (this.frame == null) {
            createDebug();
        }
        enhancedDebugger.tabbedPane.setName("Connection_" + this.tabbedPane.getComponentCount());
        this.tabbedPane.add(enhancedDebugger.tabbedPane, this.tabbedPane.getComponentCount() - 1);
        this.tabbedPane.setIconAt(this.tabbedPane.indexOfComponent(enhancedDebugger.tabbedPane), connectionCreatedIcon);
        this.frame.setTitle("Smack Debug Window -- Total connections: " + (this.tabbedPane.getComponentCount() - 1));
        this.debuggers.add(enhancedDebugger);
    }

    static void userHasLogged(EnhancedDebugger enhancedDebugger, String str) {
        synchronized (EnhancedDebuggerWindow.class) {
            try {
                int indexOfComponent = getInstance().tabbedPane.indexOfComponent(enhancedDebugger.tabbedPane);
                getInstance().tabbedPane.setTitleAt(indexOfComponent, str);
                getInstance().tabbedPane.setIconAt(indexOfComponent, connectionActiveIcon);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public boolean isVisible() {
        return this.frame != null && this.frame.isVisible();
    }

    public void rootWindowClosing(WindowEvent windowEvent) {
        for (EnhancedDebugger enhancedDebugger : this.debuggers) {
            enhancedDebugger.cancel();
        }
        this.debuggers.removeAll(this.debuggers);
        instance = null;
    }

    public void setVisible(boolean z) {
        if (this.frame != null) {
            this.frame.setVisible(z);
        }
    }
}
