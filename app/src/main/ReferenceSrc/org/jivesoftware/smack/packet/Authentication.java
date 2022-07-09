package org.jivesoftware.smack.packet;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Authentication.class */
public class Authentication extends IQ {
    private String username = null;
    private String password = null;
    private String digest = null;
    private String resource = null;

    public Authentication() {
        setType(IQ.Type.SET);
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"jabber:iq:auth\">");
        if (this.username != null) {
            if (this.username.equals("")) {
                sb.append("<username/>");
            } else {
                sb.append("<username>").append(this.username).append("</username>");
            }
        }
        if (this.digest != null) {
            if (this.digest.equals("")) {
                sb.append("<digest/>");
            } else {
                sb.append("<digest>").append(this.digest).append("</digest>");
            }
        }
        if (this.password != null && this.digest == null) {
            if (this.password.equals("")) {
                sb.append("<password/>");
            } else {
                sb.append("<password>").append(StringUtils.escapeForXML(this.password)).append("</password>");
            }
        }
        if (this.resource != null) {
            if (this.resource.equals("")) {
                sb.append("<resource/>");
            } else {
                sb.append("<resource>").append(this.resource).append("</resource>");
            }
        }
        sb.append("</query>");
        return sb.toString();
    }

    public String getDigest() {
        return this.digest;
    }

    public String getPassword() {
        return this.password;
    }

    public String getResource() {
        return this.resource;
    }

    public String getUsername() {
        return this.username;
    }

    public void setDigest(String str) {
        this.digest = str;
    }

    public void setDigest(String str, String str2) {
        this.digest = StringUtils.hash(str + str2);
    }

    public void setPassword(String str) {
        this.password = str;
    }

    public void setResource(String str) {
        this.resource = str;
    }

    public void setUsername(String str) {
        this.username = str;
    }
}
