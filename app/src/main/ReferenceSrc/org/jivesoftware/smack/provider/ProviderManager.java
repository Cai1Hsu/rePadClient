package org.jivesoftware.smack.provider;

import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PacketExtension;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smack/provider/ProviderManager.class */
public class ProviderManager {
    private static ProviderManager instance;
    private Map<String, Object> extensionProviders = new ConcurrentHashMap();
    private Map<String, Object> iqProviders = new ConcurrentHashMap();

    private ProviderManager() {
        initialize();
    }

    private ClassLoader[] getClassLoaders() {
        ClassLoader[] classLoaderArr = {ProviderManager.class.getClassLoader(), Thread.currentThread().getContextClassLoader()};
        ArrayList arrayList = new ArrayList();
        for (ClassLoader classLoader : classLoaderArr) {
            if (classLoader != null) {
                arrayList.add(classLoader);
            }
        }
        return (ClassLoader[]) arrayList.toArray(new ClassLoader[arrayList.size()]);
    }

    public static ProviderManager getInstance() {
        ProviderManager providerManager;
        synchronized (ProviderManager.class) {
            try {
                if (instance == null) {
                    instance = new ProviderManager();
                }
                providerManager = instance;
            } finally {
            }
        }
        return providerManager;
    }

    private String getProviderKey(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(str).append("/><").append(str2).append("/>");
        return sb.toString();
    }

    public static void setInstance(ProviderManager providerManager) {
        synchronized (ProviderManager.class) {
            try {
                if (instance != null) {
                    throw new IllegalStateException("ProviderManager singleton already set");
                }
                instance = providerManager;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void addExtensionProvider(String str, String str2, Object obj) {
        if ((obj instanceof PacketExtensionProvider) || (obj instanceof Class)) {
            this.extensionProviders.put(getProviderKey(str, str2), obj);
            return;
        }
        throw new IllegalArgumentException("Provider must be a PacketExtensionProvider or a Class instance.");
    }

    public void addIQProvider(String str, String str2, Object obj) {
        if ((obj instanceof IQProvider) || ((obj instanceof Class) && IQ.class.isAssignableFrom((Class) obj))) {
            this.iqProviders.put(getProviderKey(str, str2), obj);
            return;
        }
        throw new IllegalArgumentException("Provider must be an IQProvider or a Class instance.");
    }

    public Object getExtensionProvider(String str, String str2) {
        return this.extensionProviders.get(getProviderKey(str, str2));
    }

    public Collection<Object> getExtensionProviders() {
        return Collections.unmodifiableCollection(this.extensionProviders.values());
    }

    public Object getIQProvider(String str, String str2) {
        return this.iqProviders.get(getProviderKey(str, str2));
    }

    public Collection<Object> getIQProviders() {
        return Collections.unmodifiableCollection(this.iqProviders.values());
    }

    protected void initialize() {
        int next;
        try {
            for (ClassLoader classLoader : getClassLoaders()) {
                Enumeration<URL> resources = classLoader.getResources("META-INF/smack.providers");
                while (resources.hasMoreElements()) {
                    InputStream openStream = resources.nextElement().openStream();
                    MXParser mXParser = new MXParser();
                    mXParser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
                    mXParser.setInput(openStream, "UTF-8");
                    int eventType = mXParser.getEventType();
                    do {
                        if (eventType == 2) {
                            if (mXParser.getName().equals("iqProvider")) {
                                mXParser.next();
                                mXParser.next();
                                String nextText = mXParser.nextText();
                                mXParser.next();
                                mXParser.next();
                                String nextText2 = mXParser.nextText();
                                mXParser.next();
                                mXParser.next();
                                String nextText3 = mXParser.nextText();
                                String providerKey = getProviderKey(nextText, nextText2);
                                if (!this.iqProviders.containsKey(providerKey)) {
                                    try {
                                        Class<?> cls = Class.forName(nextText3);
                                        if (IQProvider.class.isAssignableFrom(cls)) {
                                            this.iqProviders.put(providerKey, cls.newInstance());
                                        } else if (IQ.class.isAssignableFrom(cls)) {
                                            this.iqProviders.put(providerKey, cls);
                                        }
                                    } catch (ClassNotFoundException e) {
                                        e.printStackTrace();
                                    }
                                }
                            } else if (mXParser.getName().equals("extensionProvider")) {
                                mXParser.next();
                                mXParser.next();
                                String nextText4 = mXParser.nextText();
                                mXParser.next();
                                mXParser.next();
                                String nextText5 = mXParser.nextText();
                                mXParser.next();
                                mXParser.next();
                                String nextText6 = mXParser.nextText();
                                String providerKey2 = getProviderKey(nextText4, nextText5);
                                if (!this.extensionProviders.containsKey(providerKey2)) {
                                    try {
                                        Class<?> cls2 = Class.forName(nextText6);
                                        if (PacketExtensionProvider.class.isAssignableFrom(cls2)) {
                                            this.extensionProviders.put(providerKey2, cls2.newInstance());
                                        } else if (PacketExtension.class.isAssignableFrom(cls2)) {
                                            this.extensionProviders.put(providerKey2, cls2);
                                        }
                                    } catch (ClassNotFoundException e2) {
                                        e2.printStackTrace();
                                    }
                                }
                            }
                        }
                        next = mXParser.next();
                        eventType = next;
                    } while (next != 1);
                    try {
                        openStream.close();
                    } catch (Exception e3) {
                    }
                }
            }
        } catch (Exception e4) {
            e4.printStackTrace();
        }
    }

    public void removeExtensionProvider(String str, String str2) {
        this.extensionProviders.remove(getProviderKey(str, str2));
    }

    public void removeIQProvider(String str, String str2) {
        this.iqProviders.remove(getProviderKey(str, str2));
    }
}
