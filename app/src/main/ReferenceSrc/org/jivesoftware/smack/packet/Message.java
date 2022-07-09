package org.jivesoftware.smack.packet;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Message.class */
public class Message extends Packet {
    private final Set<Body> bodies;
    private String language;
    private final Set<Subject> subjects;
    private String thread;
    private Type type;

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/Message$Body.class */
    public static class Body {
        private String language;
        private String message;

        private Body(String str, String str2) {
            if (str == null) {
                throw new NullPointerException("Language cannot be null.");
            }
            if (str2 == null) {
                throw new NullPointerException("Message cannot be null.");
            }
            this.language = str;
            this.message = str2;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this != obj) {
                if (obj == null) {
                    z = false;
                } else if (getClass() != obj.getClass()) {
                    z = false;
                } else {
                    Body body = (Body) obj;
                    if (!this.language.equals(body.language) || !this.message.equals(body.message)) {
                        z = false;
                    }
                }
            }
            return z;
        }

        public String getLanguage() {
            return this.language;
        }

        public String getMessage() {
            return this.message;
        }

        public int hashCode() {
            return ((this.language.hashCode() + 31) * 31) + this.message.hashCode();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/Message$Subject.class */
    public static class Subject {
        private String language;
        private String subject;

        private Subject(String str, String str2) {
            if (str == null) {
                throw new NullPointerException("Language cannot be null.");
            }
            if (str2 == null) {
                throw new NullPointerException("Subject cannot be null.");
            }
            this.language = str;
            this.subject = str2;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this != obj) {
                if (obj == null) {
                    z = false;
                } else if (getClass() != obj.getClass()) {
                    z = false;
                } else {
                    Subject subject = (Subject) obj;
                    if (!this.language.equals(subject.language) || !this.subject.equals(subject.subject)) {
                        z = false;
                    }
                }
            }
            return z;
        }

        public String getLanguage() {
            return this.language;
        }

        public String getSubject() {
            return this.subject;
        }

        public int hashCode() {
            return ((this.language.hashCode() + 31) * 31) + this.subject.hashCode();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/Message$Type.class */
    public enum Type {
        normal,
        chat,
        groupchat,
        headline,
        error;

        public static Type fromString(String str) {
            Type type;
            try {
                type = valueOf(str);
            } catch (Exception e) {
                type = normal;
            }
            return type;
        }
    }

    public Message() {
        this.type = Type.normal;
        this.thread = null;
        this.subjects = new HashSet();
        this.bodies = new HashSet();
    }

    public Message(String str) {
        this.type = Type.normal;
        this.thread = null;
        this.subjects = new HashSet();
        this.bodies = new HashSet();
        setTo(str);
    }

    public Message(String str, Type type) {
        this.type = Type.normal;
        this.thread = null;
        this.subjects = new HashSet();
        this.bodies = new HashSet();
        setTo(str);
        this.type = type;
    }

    private String determineLanguage(String str) {
        String str2;
        String str3 = str;
        if ("".equals(str)) {
            str3 = null;
        }
        if (str3 != null || this.language == null) {
            str2 = str3;
            if (str3 == null) {
                str2 = getDefaultLanguage();
            }
        } else {
            str2 = this.language;
        }
        return str2;
    }

    private Body getMessageBody(String str) {
        Body body;
        String determineLanguage = determineLanguage(str);
        Iterator<Body> it = this.bodies.iterator();
        while (true) {
            if (!it.hasNext()) {
                body = null;
                break;
            }
            body = it.next();
            if (determineLanguage.equals(body.language)) {
                break;
            }
        }
        return body;
    }

    private Subject getMessageSubject(String str) {
        Subject subject;
        String determineLanguage = determineLanguage(str);
        Iterator<Subject> it = this.subjects.iterator();
        while (true) {
            if (!it.hasNext()) {
                subject = null;
                break;
            }
            subject = it.next();
            if (determineLanguage.equals(subject.language)) {
                break;
            }
        }
        return subject;
    }

    public Body addBody(String str, String str2) {
        Body body = new Body(determineLanguage(str), str2);
        this.bodies.add(body);
        return body;
    }

    public Subject addSubject(String str, String str2) {
        Subject subject = new Subject(determineLanguage(str), str2);
        this.subjects.add(subject);
        return subject;
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0074, code lost:
        if (r3.language.equals(r0.language) != false) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00b7, code lost:
        if (r3.thread.equals(r0.thread) != false) goto L29;
     */
    @Override // org.jivesoftware.smack.packet.Packet
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z;
        if (this == obj) {
            z = true;
        } else {
            z = false;
            if (obj != null) {
                z = false;
                if (getClass() == obj.getClass()) {
                    Message message = (Message) obj;
                    z = false;
                    if (super.equals(message)) {
                        z = false;
                        if (this.bodies.size() == message.bodies.size()) {
                            z = false;
                            if (this.bodies.containsAll(message.bodies)) {
                                if (this.language != null) {
                                    z = false;
                                } else {
                                    if (message.language != null) {
                                        z = false;
                                    }
                                    z = false;
                                    if (this.subjects.size() == message.subjects.size()) {
                                        z = false;
                                        if (this.subjects.containsAll(message.subjects)) {
                                            if (this.thread != null) {
                                                z = false;
                                            } else {
                                                if (message.thread != null) {
                                                    z = false;
                                                }
                                                z = this.type == message.type;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    public Collection<Body> getBodies() {
        return Collections.unmodifiableCollection(this.bodies);
    }

    public String getBody() {
        return getBody(null);
    }

    public String getBody(String str) {
        Body messageBody = getMessageBody(str);
        return messageBody == null ? null : messageBody.message;
    }

    public Collection<String> getBodyLanguages() {
        Body messageBody = getMessageBody(null);
        ArrayList arrayList = new ArrayList();
        for (Body body : this.bodies) {
            if (!body.equals(messageBody)) {
                arrayList.add(body.language);
            }
        }
        return Collections.unmodifiableCollection(arrayList);
    }

    public String getLanguage() {
        return this.language;
    }

    public String getSubject() {
        return getSubject(null);
    }

    public String getSubject(String str) {
        Subject messageSubject = getMessageSubject(str);
        return messageSubject == null ? null : messageSubject.subject;
    }

    public Collection<String> getSubjectLanguages() {
        Subject messageSubject = getMessageSubject(null);
        ArrayList arrayList = new ArrayList();
        for (Subject subject : this.subjects) {
            if (!subject.equals(messageSubject)) {
                arrayList.add(subject.language);
            }
        }
        return Collections.unmodifiableCollection(arrayList);
    }

    public Collection<Subject> getSubjects() {
        return Collections.unmodifiableCollection(this.subjects);
    }

    public String getThread() {
        return this.thread;
    }

    public Type getType() {
        return this.type;
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public int hashCode() {
        int i = 0;
        int hashCode = this.type != null ? this.type.hashCode() : 0;
        int hashCode2 = this.subjects.hashCode();
        int hashCode3 = this.thread != null ? this.thread.hashCode() : 0;
        if (this.language != null) {
            i = this.language.hashCode();
        }
        return (((((((hashCode * 31) + hashCode2) * 31) + hashCode3) * 31) + i) * 31) + this.bodies.hashCode();
    }

    public boolean removeBody(String str) {
        boolean z;
        String determineLanguage = determineLanguage(str);
        Iterator<Body> it = this.bodies.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            }
            Body next = it.next();
            if (determineLanguage.equals(next.language)) {
                z = this.bodies.remove(next);
                break;
            }
        }
        return z;
    }

    public boolean removeBody(Body body) {
        return this.bodies.remove(body);
    }

    public boolean removeSubject(String str) {
        boolean z;
        String determineLanguage = determineLanguage(str);
        Iterator<Subject> it = this.subjects.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            }
            Subject next = it.next();
            if (determineLanguage.equals(next.language)) {
                z = this.subjects.remove(next);
                break;
            }
        }
        return z;
    }

    public boolean removeSubject(Subject subject) {
        return this.subjects.remove(subject);
    }

    public void setBody(String str) {
        if (str == null) {
            removeBody("");
        } else {
            addBody(null, str);
        }
    }

    public void setLanguage(String str) {
        this.language = str;
    }

    public void setSubject(String str) {
        if (str == null) {
            removeSubject("");
        } else {
            addSubject(null, str);
        }
    }

    public void setThread(String str) {
        this.thread = str;
    }

    public void setType(Type type) {
        if (type == null) {
            throw new IllegalArgumentException("Type cannot be null.");
        }
        this.type = type;
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public String toXML() {
        XMPPError error;
        StringBuilder sb = new StringBuilder();
        sb.append("<message");
        if (getXmlns() != null) {
            sb.append(" xmlns=\"").append(getXmlns()).append("\"");
        }
        if (this.language != null) {
            sb.append(" xml:lang=\"").append(getLanguage()).append("\"");
        }
        if (getPacketID() != null) {
            sb.append(" id=\"").append(getPacketID()).append("\"");
        }
        if (getTo() != null) {
            sb.append(" to=\"").append(StringUtils.escapeForXML(getTo())).append("\"");
        }
        if (getFrom() != null) {
            sb.append(" from=\"").append(StringUtils.escapeForXML(getFrom())).append("\"");
        }
        if (this.type != Type.normal) {
            sb.append(" type=\"").append(this.type).append("\"");
        }
        sb.append(">");
        Subject messageSubject = getMessageSubject(null);
        if (messageSubject != null) {
            sb.append("<subject>").append(StringUtils.escapeForXML(messageSubject.subject)).append("</subject>");
        }
        for (Subject subject : getSubjects()) {
            if (!subject.equals(messageSubject)) {
                sb.append("<subject xml:lang=\"").append(subject.language).append("\">");
                sb.append(StringUtils.escapeForXML(subject.subject));
                sb.append("</subject>");
            }
        }
        Body messageBody = getMessageBody(null);
        if (messageBody != null) {
            sb.append("<body>").append(StringUtils.escapeForXML(messageBody.message)).append("</body>");
        }
        for (Body body : getBodies()) {
            if (!body.equals(messageBody)) {
                sb.append("<body xml:lang=\"").append(body.getLanguage()).append("\">");
                sb.append(StringUtils.escapeForXML(body.getMessage()));
                sb.append("</body>");
            }
        }
        if (this.thread != null) {
            sb.append("<thread>").append(this.thread).append("</thread>");
        }
        if (this.type == Type.error && (error = getError()) != null) {
            sb.append(error.toXML());
        }
        sb.append(getExtensionsXML());
        sb.append("</message>");
        return sb.toString();
    }
}
