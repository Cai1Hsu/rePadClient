package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.jingle.JingleActionEnum;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/Jingle.class */
public class Jingle extends IQ {
    public static final String NAMESPACE = "urn:xmpp:tmp:jingle";
    public static final String NODENAME = "jingle";
    private JingleActionEnum action;
    private JingleContentInfo contentInfo;
    private final List<JingleContent> contents;
    private String initiator;
    private String responder;
    private String sid;

    public Jingle() {
        this.contents = new ArrayList();
    }

    public Jingle(String str) {
        this(null, null, str);
    }

    public Jingle(List<JingleContent> list, JingleContentInfo jingleContentInfo, String str) {
        this.contents = new ArrayList();
        if (list != null) {
            list.addAll(list);
        }
        setContentInfo(jingleContentInfo);
        setSid(str);
        this.initiator = null;
        this.responder = null;
        this.action = null;
    }

    public Jingle(JingleActionEnum jingleActionEnum) {
        this(null, null, null);
        this.action = jingleActionEnum;
        setType(IQ.Type.SET);
    }

    public Jingle(JingleContent jingleContent) {
        this.contents = new ArrayList();
        addContent(jingleContent);
        this.initiator = null;
        this.responder = null;
        this.action = JingleActionEnum.UNKNOWN;
        setType(IQ.Type.SET);
    }

    public Jingle(JingleContentInfo jingleContentInfo) {
        this.contents = new ArrayList();
        setContentInfo(jingleContentInfo);
        this.initiator = null;
        this.responder = null;
        this.action = JingleActionEnum.UNKNOWN;
        setType(IQ.Type.SET);
    }

    public static String getElementName() {
        return NODENAME;
    }

    public static String getNamespace() {
        return NAMESPACE;
    }

    public static int getSessionHash(String str, String str2) {
        int i = 0;
        int hashCode = str2 == null ? 0 : str2.hashCode();
        if (str != null) {
            i = str.hashCode();
        }
        return ((hashCode + 31) * 31) + i;
    }

    public void addContent(JingleContent jingleContent) {
        if (jingleContent != null) {
            synchronized (this.contents) {
                this.contents.add(jingleContent);
            }
        }
    }

    public void addContents(List<JingleContent> list) {
        if (list != null) {
            synchronized (this.contents) {
                this.contents.addAll(list);
            }
        }
    }

    public JingleActionEnum getAction() {
        return this.action;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName());
        sb.append(" xmlns=\"").append(getNamespace()).append("\"");
        if (getInitiator() != null) {
            sb.append(" initiator=\"").append(getInitiator()).append("\"");
        }
        if (getResponder() != null) {
            sb.append(" responder=\"").append(getResponder()).append("\"");
        }
        if (getAction() != null) {
            sb.append(" action=\"").append(getAction()).append("\"");
        }
        if (getSid() != null) {
            sb.append(" sid=\"").append(getSid()).append("\"");
        }
        sb.append(">");
        synchronized (this.contents) {
            for (JingleContent jingleContent : this.contents) {
                sb.append(jingleContent.toXML());
            }
        }
        if (this.contentInfo != null) {
            sb.append(this.contentInfo.toXML());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }

    public JingleContentInfo getContentInfo() {
        return this.contentInfo;
    }

    public Iterator<JingleContent> getContents() {
        Iterator<JingleContent> it;
        synchronized (this.contents) {
            it = Collections.unmodifiableList(new ArrayList(this.contents)).iterator();
        }
        return it;
    }

    public List<JingleContent> getContentsList() {
        ArrayList arrayList;
        synchronized (this.contents) {
            arrayList = new ArrayList(this.contents);
        }
        return arrayList;
    }

    public String getInitiator() {
        return this.initiator;
    }

    public String getResponder() {
        return this.responder;
    }

    public String getSid() {
        return this.sid;
    }

    public void setAction(JingleActionEnum jingleActionEnum) {
        this.action = jingleActionEnum;
    }

    public void setContentInfo(JingleContentInfo jingleContentInfo) {
        this.contentInfo = jingleContentInfo;
    }

    public void setInitiator(String str) {
        this.initiator = str;
    }

    public void setResponder(String str) {
        this.responder = str;
    }

    public final void setSid(String str) {
        this.sid = str;
    }
}
