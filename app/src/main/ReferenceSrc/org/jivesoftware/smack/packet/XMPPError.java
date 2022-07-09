package org.jivesoftware.smack.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/XMPPError.class */
public class XMPPError {
    private List<PacketExtension> applicationExtensions;
    private int code;
    private String condition;
    private String message;
    private Type type;

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/XMPPError$Condition.class */
    public static class Condition {
        private String value;
        public static final Condition interna_server_error = new Condition("internal-server-error");
        public static final Condition forbidden = new Condition("forbidden");
        public static final Condition bad_request = new Condition("bad-request");
        public static final Condition conflict = new Condition("conflict");
        public static final Condition feature_not_implemented = new Condition("feature-not-implemented");
        public static final Condition gone = new Condition("gone");
        public static final Condition item_not_found = new Condition("item-not-found");
        public static final Condition jid_malformed = new Condition("jid-malformed");
        public static final Condition no_acceptable = new Condition("not-acceptable");
        public static final Condition not_allowed = new Condition("not-allowed");
        public static final Condition not_authorized = new Condition("not-authorized");
        public static final Condition payment_required = new Condition("payment-required");
        public static final Condition recipient_unavailable = new Condition("recipient-unavailable");
        public static final Condition redirect = new Condition("redirect");
        public static final Condition registration_required = new Condition("registration-required");
        public static final Condition remote_server_error = new Condition("remote-server-error");
        public static final Condition remote_server_not_found = new Condition("remote-server-not-found");
        public static final Condition remote_server_timeout = new Condition("remote-server-timeout");
        public static final Condition resource_constraint = new Condition("resource-constraint");
        public static final Condition service_unavailable = new Condition("service-unavailable");
        public static final Condition subscription_required = new Condition("subscription-required");
        public static final Condition undefined_condition = new Condition("undefined-condition");
        public static final Condition unexpected_request = new Condition("unexpected-request");
        public static final Condition request_timeout = new Condition("request-timeout");

        public Condition(String str) {
            this.value = str;
        }

        public String toString() {
            return this.value;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/XMPPError$ErrorSpecification.class */
    private static class ErrorSpecification {
        private static Map<Condition, ErrorSpecification> instances = errorSpecifications();
        private int code;
        private Condition condition;
        private Type type;

        private ErrorSpecification(Condition condition, Type type, int i) {
            this.code = i;
            this.type = type;
            this.condition = condition;
        }

        private static Map<Condition, ErrorSpecification> errorSpecifications() {
            HashMap hashMap = new HashMap(22);
            hashMap.put(Condition.interna_server_error, new ErrorSpecification(Condition.interna_server_error, Type.WAIT, 500));
            hashMap.put(Condition.forbidden, new ErrorSpecification(Condition.forbidden, Type.AUTH, HttpStatus.SC_FORBIDDEN));
            hashMap.put(Condition.bad_request, new ErrorSpecification(Condition.bad_request, Type.MODIFY, 400));
            hashMap.put(Condition.item_not_found, new ErrorSpecification(Condition.item_not_found, Type.CANCEL, HttpStatus.SC_NOT_FOUND));
            hashMap.put(Condition.conflict, new ErrorSpecification(Condition.conflict, Type.CANCEL, HttpStatus.SC_CONFLICT));
            hashMap.put(Condition.feature_not_implemented, new ErrorSpecification(Condition.feature_not_implemented, Type.CANCEL, 501));
            hashMap.put(Condition.gone, new ErrorSpecification(Condition.gone, Type.MODIFY, HttpStatus.SC_MOVED_TEMPORARILY));
            hashMap.put(Condition.jid_malformed, new ErrorSpecification(Condition.jid_malformed, Type.MODIFY, 400));
            hashMap.put(Condition.no_acceptable, new ErrorSpecification(Condition.no_acceptable, Type.MODIFY, HttpStatus.SC_NOT_ACCEPTABLE));
            hashMap.put(Condition.not_allowed, new ErrorSpecification(Condition.not_allowed, Type.CANCEL, HttpStatus.SC_METHOD_NOT_ALLOWED));
            hashMap.put(Condition.not_authorized, new ErrorSpecification(Condition.not_authorized, Type.AUTH, HttpStatus.SC_UNAUTHORIZED));
            hashMap.put(Condition.payment_required, new ErrorSpecification(Condition.payment_required, Type.AUTH, HttpStatus.SC_PAYMENT_REQUIRED));
            hashMap.put(Condition.recipient_unavailable, new ErrorSpecification(Condition.recipient_unavailable, Type.WAIT, HttpStatus.SC_NOT_FOUND));
            hashMap.put(Condition.redirect, new ErrorSpecification(Condition.redirect, Type.MODIFY, HttpStatus.SC_MOVED_TEMPORARILY));
            hashMap.put(Condition.registration_required, new ErrorSpecification(Condition.registration_required, Type.AUTH, HttpStatus.SC_PROXY_AUTHENTICATION_REQUIRED));
            hashMap.put(Condition.remote_server_not_found, new ErrorSpecification(Condition.remote_server_not_found, Type.CANCEL, HttpStatus.SC_NOT_FOUND));
            hashMap.put(Condition.remote_server_timeout, new ErrorSpecification(Condition.remote_server_timeout, Type.WAIT, 504));
            hashMap.put(Condition.remote_server_error, new ErrorSpecification(Condition.remote_server_error, Type.CANCEL, 502));
            hashMap.put(Condition.resource_constraint, new ErrorSpecification(Condition.resource_constraint, Type.WAIT, 500));
            hashMap.put(Condition.service_unavailable, new ErrorSpecification(Condition.service_unavailable, Type.CANCEL, 503));
            hashMap.put(Condition.subscription_required, new ErrorSpecification(Condition.subscription_required, Type.AUTH, HttpStatus.SC_PROXY_AUTHENTICATION_REQUIRED));
            hashMap.put(Condition.undefined_condition, new ErrorSpecification(Condition.undefined_condition, Type.WAIT, 500));
            hashMap.put(Condition.unexpected_request, new ErrorSpecification(Condition.unexpected_request, Type.WAIT, 400));
            hashMap.put(Condition.request_timeout, new ErrorSpecification(Condition.request_timeout, Type.CANCEL, HttpStatus.SC_REQUEST_TIMEOUT));
            return hashMap;
        }

        protected static ErrorSpecification specFor(Condition condition) {
            return instances.get(condition);
        }

        protected int getCode() {
            return this.code;
        }

        protected Condition getCondition() {
            return this.condition;
        }

        protected Type getType() {
            return this.type;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/XMPPError$Type.class */
    public enum Type {
        WAIT,
        CANCEL,
        MODIFY,
        AUTH,
        CONTINUE
    }

    public XMPPError(int i) {
        this.applicationExtensions = null;
        this.code = i;
        this.message = null;
    }

    public XMPPError(int i, String str) {
        this.applicationExtensions = null;
        this.code = i;
        this.message = str;
    }

    public XMPPError(int i, Type type, String str, String str2, List<PacketExtension> list) {
        this.applicationExtensions = null;
        this.code = i;
        this.type = type;
        this.condition = str;
        this.message = str2;
        this.applicationExtensions = list;
    }

    public XMPPError(Condition condition) {
        this.applicationExtensions = null;
        init(condition);
        this.message = null;
    }

    public XMPPError(Condition condition, String str) {
        this.applicationExtensions = null;
        init(condition);
        this.message = str;
    }

    private void init(Condition condition) {
        ErrorSpecification specFor = ErrorSpecification.specFor(condition);
        this.condition = condition.value;
        if (specFor != null) {
            this.type = specFor.getType();
            this.code = specFor.getCode();
        }
    }

    public void addExtension(PacketExtension packetExtension) {
        synchronized (this) {
            if (this.applicationExtensions == null) {
                this.applicationExtensions = new ArrayList();
            }
            this.applicationExtensions.add(packetExtension);
        }
    }

    public int getCode() {
        return this.code;
    }

    public String getCondition() {
        return this.condition;
    }

    public PacketExtension getExtension(String str, String str2) {
        PacketExtension packetExtension;
        synchronized (this) {
            if (this.applicationExtensions != null && str != null && str2 != null) {
                Iterator<PacketExtension> it = this.applicationExtensions.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        packetExtension = null;
                        break;
                    }
                    PacketExtension next = it.next();
                    if (str.equals(next.getElementName()) && str2.equals(next.getNamespace())) {
                        packetExtension = next;
                        break;
                    }
                }
            } else {
                packetExtension = null;
            }
        }
        return packetExtension;
    }

    public List<PacketExtension> getExtensions() {
        List<PacketExtension> emptyList;
        synchronized (this) {
            emptyList = this.applicationExtensions == null ? Collections.emptyList() : Collections.unmodifiableList(this.applicationExtensions);
        }
        return emptyList;
    }

    public String getMessage() {
        return this.message;
    }

    public Type getType() {
        return this.type;
    }

    public void setExtension(List<PacketExtension> list) {
        synchronized (this) {
            this.applicationExtensions = list;
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (this.condition != null) {
            sb.append(this.condition);
        }
        sb.append("(").append(this.code).append(")");
        if (this.message != null) {
            sb.append(" ").append(this.message);
        }
        return sb.toString();
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<error code=\"").append(this.code).append("\"");
        if (this.type != null) {
            sb.append(" type=\"");
            sb.append(this.type.name());
            sb.append("\"");
        }
        sb.append(">");
        if (this.condition != null) {
            sb.append("<").append(this.condition);
            sb.append(" xmlns=\"urn:ietf:params:xml:ns:xmpp-stanzas\"/>");
        }
        if (this.message != null) {
            sb.append("<text xml:lang=\"en\" xmlns=\"urn:ietf:params:xml:ns:xmpp-stanzas\">");
            sb.append(this.message);
            sb.append("</text>");
        }
        for (PacketExtension packetExtension : getExtensions()) {
            sb.append(packetExtension.toXML());
        }
        sb.append("</error>");
        return sb.toString();
    }
}
