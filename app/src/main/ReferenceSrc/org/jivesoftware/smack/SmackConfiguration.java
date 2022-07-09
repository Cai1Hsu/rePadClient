package org.jivesoftware.smack;

import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;
import org.apache.commons.net.tftp.TFTP;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smack/SmackConfiguration.class */
public final class SmackConfiguration {
    private static final String SMACK_VERSION = "3.3.0";
    private static boolean autoEnableEntityCaps;
    private static Vector<String> defaultMechs = new Vector<>();
    private static int keepAliveInterval;
    private static boolean localSocks5ProxyEnabled;
    private static int localSocks5ProxyPort;
    private static int packetCollectorSize;
    private static int packetReplyTimeout;

    static {
        int next;
        packetReplyTimeout = TFTP.DEFAULT_TIMEOUT;
        keepAliveInterval = 30000;
        localSocks5ProxyEnabled = true;
        localSocks5ProxyPort = 7777;
        packetCollectorSize = TFTP.DEFAULT_TIMEOUT;
        autoEnableEntityCaps = false;
        try {
            for (ClassLoader classLoader : getClassLoaders()) {
                Enumeration<URL> resources = classLoader.getResources("META-INF/smack-config.xml");
                while (resources.hasMoreElements()) {
                    URL nextElement = resources.nextElement();
                    InputStream inputStream = null;
                    try {
                        InputStream openStream = nextElement.openStream();
                        MXParser mXParser = new MXParser();
                        mXParser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
                        mXParser.setInput(openStream, "UTF-8");
                        int eventType = mXParser.getEventType();
                        do {
                            if (eventType == 2) {
                                if (mXParser.getName().equals("className")) {
                                    parseClassToLoad(mXParser);
                                } else if (mXParser.getName().equals("packetReplyTimeout")) {
                                    packetReplyTimeout = parseIntProperty(mXParser, packetReplyTimeout);
                                } else if (mXParser.getName().equals("keepAliveInterval")) {
                                    keepAliveInterval = parseIntProperty(mXParser, keepAliveInterval);
                                } else if (mXParser.getName().equals("mechName")) {
                                    defaultMechs.add(mXParser.nextText());
                                } else if (mXParser.getName().equals("localSocks5ProxyEnabled")) {
                                    localSocks5ProxyEnabled = Boolean.parseBoolean(mXParser.nextText());
                                } else if (mXParser.getName().equals("localSocks5ProxyPort")) {
                                    localSocks5ProxyPort = parseIntProperty(mXParser, localSocks5ProxyPort);
                                } else if (mXParser.getName().equals("packetCollectorSize")) {
                                    packetCollectorSize = parseIntProperty(mXParser, packetCollectorSize);
                                } else if (mXParser.getName().equals("autoEnableEntityCaps")) {
                                    autoEnableEntityCaps = Boolean.parseBoolean(mXParser.nextText());
                                }
                            }
                            next = mXParser.next();
                            eventType = next;
                        } while (next != 1);
                        try {
                            openStream.close();
                        } catch (Exception e) {
                        }
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        try {
                            inputStream.close();
                        } catch (Exception e3) {
                        }
                    }
                }
            }
        } catch (Exception e4) {
            e4.printStackTrace();
        }
    }

    private SmackConfiguration() {
    }

    public static void addSaslMech(String str) {
        if (!defaultMechs.contains(str)) {
            defaultMechs.add(str);
        }
    }

    public static void addSaslMechs(Collection<String> collection) {
        for (String str : collection) {
            addSaslMech(str);
        }
    }

    public static boolean autoEnableEntityCaps() {
        return autoEnableEntityCaps;
    }

    private static ClassLoader[] getClassLoaders() {
        ClassLoader[] classLoaderArr = {SmackConfiguration.class.getClassLoader(), Thread.currentThread().getContextClassLoader()};
        ArrayList arrayList = new ArrayList();
        for (ClassLoader classLoader : classLoaderArr) {
            if (classLoader != null) {
                arrayList.add(classLoader);
            }
        }
        return (ClassLoader[]) arrayList.toArray(new ClassLoader[arrayList.size()]);
    }

    public static int getKeepAliveInterval() {
        return keepAliveInterval;
    }

    public static int getLocalSocks5ProxyPort() {
        return localSocks5ProxyPort;
    }

    public static int getPacketCollectorSize() {
        return packetCollectorSize;
    }

    public static int getPacketReplyTimeout() {
        if (packetReplyTimeout <= 0) {
            packetReplyTimeout = TFTP.DEFAULT_TIMEOUT;
        }
        return packetReplyTimeout;
    }

    public static List<String> getSaslMechs() {
        return defaultMechs;
    }

    public static String getVersion() {
        return SMACK_VERSION;
    }

    public static boolean isLocalSocks5ProxyEnabled() {
        return localSocks5ProxyEnabled;
    }

    private static void parseClassToLoad(XmlPullParser xmlPullParser) throws Exception {
        String nextText = xmlPullParser.nextText();
        try {
            Class.forName(nextText);
        } catch (ClassNotFoundException e) {
            System.err.println("Error! A startup class specified in smack-config.xml could not be loaded: " + nextText);
        }
    }

    private static int parseIntProperty(XmlPullParser xmlPullParser, int i) throws Exception {
        try {
            i = Integer.parseInt(xmlPullParser.nextText());
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return i;
    }

    public static void removeSaslMech(String str) {
        if (defaultMechs.contains(str)) {
            defaultMechs.remove(str);
        }
    }

    public static void removeSaslMechs(Collection<String> collection) {
        for (String str : collection) {
            removeSaslMech(str);
        }
    }

    public static void setAutoEnableEntityCaps(boolean z) {
        autoEnableEntityCaps = z;
    }

    public static void setKeepAliveInterval(int i) {
        keepAliveInterval = i;
    }

    public static void setLocalSocks5ProxyEnabled(boolean z) {
        localSocks5ProxyEnabled = z;
    }

    public static void setLocalSocks5ProxyPort(int i) {
        localSocks5ProxyPort = i;
    }

    public static void setPacketCollectorSize(int i) {
        packetCollectorSize = i;
    }

    public static void setPacketReplyTimeout(int i) {
        if (i <= 0) {
            throw new IllegalArgumentException();
        }
        packetReplyTimeout = i;
    }
}
