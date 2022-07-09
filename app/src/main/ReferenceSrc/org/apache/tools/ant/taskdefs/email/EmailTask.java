package org.apache.tools.ant.taskdefs.email;

import java.io.File;
import java.util.Iterator;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.mail.MailMessage;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/email/EmailTask.class */
public class EmailTask extends Task {
    public static final String AUTO = "auto";
    public static final String MIME = "mime";
    public static final String PLAIN = "plain";
    private static final int SMTP_PORT = 25;
    public static final String UU = "uu";
    static Class class$org$apache$tools$ant$taskdefs$email$EmailTask;
    static Class class$org$apache$tools$ant$taskdefs$email$Mailer;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private String encoding = AUTO;
    private String host = MailMessage.DEFAULT_HOST;
    private Integer port = null;
    private String subject = null;
    private Message message = null;
    private boolean failOnError = true;
    private boolean includeFileNames = false;
    private String messageMimeType = null;
    private EmailAddress from = null;
    private Vector replyToList = new Vector();
    private Vector toList = new Vector();
    private Vector ccList = new Vector();
    private Vector bccList = new Vector();
    private Vector headers = new Vector();
    private Path attachments = null;
    private String charset = null;
    private String user = null;
    private String password = null;
    private boolean ssl = false;
    private boolean starttls = false;
    private boolean ignoreInvalidRecipients = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/email/EmailTask$Encoding.class */
    public static class Encoding extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{EmailTask.AUTO, EmailTask.MIME, EmailTask.UU, EmailTask.PLAIN};
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void logBuildException(String str, BuildException buildException) {
        if (buildException.getCause() != null) {
            buildException = buildException.getCause();
        }
        log(new StringBuffer().append(str).append(buildException.getMessage()).toString(), 1);
    }

    public void addBcc(EmailAddress emailAddress) {
        this.bccList.addElement(emailAddress);
    }

    public void addCc(EmailAddress emailAddress) {
        this.ccList.addElement(emailAddress);
    }

    public void addFileset(FileSet fileSet) {
        createAttachments().add(fileSet);
    }

    public void addFrom(EmailAddress emailAddress) {
        if (this.from != null) {
            throw new BuildException("Emails can only be from one address");
        }
        this.from = emailAddress;
    }

    public void addMessage(Message message) throws BuildException {
        if (this.message != null) {
            throw new BuildException("Only one message can be sent in an email");
        }
        this.message = message;
    }

    public void addReplyTo(EmailAddress emailAddress) {
        this.replyToList.add(emailAddress);
    }

    public void addTo(EmailAddress emailAddress) {
        this.toList.addElement(emailAddress);
    }

    public Path createAttachments() {
        if (this.attachments == null) {
            this.attachments = new Path(getProject());
        }
        return this.attachments.createPath();
    }

    public Header createHeader() {
        Header header = new Header();
        this.headers.add(header);
        return header;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(48:2|210|(2:209|3)|(9:(5:5|6|(1:8)|39|(2:72|(27:86|87|(10:89|90|(1:92)|139|140|215|119|(3:125|126|127)|128|(2:130|131)(5:141|(1:143)|144|145|(3:149|150|151)(3:152|153|(18:161|162|(2:164|(2:166|167)(2:168|169))|170|171|(2:173|(2:175|176)(2:177|178))|179|180|(3:182|(6:186|(1:188)(1:191)|189|190|183|184)|217)|192|(1:194)(1:203)|195|196|197|(1:199)(1:204)|200|201|202)(2:159|160))))|94|211|95|(5:97|98|99|100|101)(3:132|133|134)|102|103|104|105|106|(5:108|109|110|111|112)(2:135|136)|113|114|115|116|117|118|215|119|(2:121|123)|125|126|127|128|(0)(0))(3:83|84|85))(3:50|51|52))|215|119|(0)|125|126|127|128|(0)(0))|10|213|11|12|13|14|15|(5:17|18|19|20|21)(2:61|62)|22|23|24|25|26|(5:28|29|30|31|32)(2:63|64)|33|34|35|36|37|38|39|(2:41|43)|72|(2:74|76)|86|87|(0)|94|211|95|(0)(0)|102|103|104|105|106|(0)(0)|113|114|115|116|117|118|(1:(0))) */
    /* JADX WARN: Can't wrap try/catch for region: R(49:2|210|209|3|(9:(5:5|6|(1:8)|39|(2:72|(27:86|87|(10:89|90|(1:92)|139|140|215|119|(3:125|126|127)|128|(2:130|131)(5:141|(1:143)|144|145|(3:149|150|151)(3:152|153|(18:161|162|(2:164|(2:166|167)(2:168|169))|170|171|(2:173|(2:175|176)(2:177|178))|179|180|(3:182|(6:186|(1:188)(1:191)|189|190|183|184)|217)|192|(1:194)(1:203)|195|196|197|(1:199)(1:204)|200|201|202)(2:159|160))))|94|211|95|(5:97|98|99|100|101)(3:132|133|134)|102|103|104|105|106|(5:108|109|110|111|112)(2:135|136)|113|114|115|116|117|118|215|119|(2:121|123)|125|126|127|128|(0)(0))(3:83|84|85))(3:50|51|52))|215|119|(0)|125|126|127|128|(0)(0))|10|213|11|12|13|14|15|(5:17|18|19|20|21)(2:61|62)|22|23|24|25|26|(5:28|29|30|31|32)(2:63|64)|33|34|35|36|37|38|39|(2:41|43)|72|(2:74|76)|86|87|(0)|94|211|95|(0)(0)|102|103|104|105|106|(0)(0)|113|114|115|116|117|118|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x02e9, code lost:
        r12 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x02eb, code lost:
        logBuildException("Failed to initialise UU mail: ", r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x014c, code lost:
        r7 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x014d, code lost:
        logBuildException("Failed to initialise MIME mail: ", r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01f0, code lost:
        if (r11 == false) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x003a, code lost:
        if (0 == 0) goto L10;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0232  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x027f A[Catch: all -> 0x0126, Exception -> 0x05eb, BuildException -> 0x05f0, TryCatch #3 {all -> 0x0126, blocks: (B:3:0x000f, B:5:0x001b, B:11:0x0044, B:13:0x0051, B:15:0x005e, B:19:0x006b, B:21:0x0078, B:24:0x0083, B:26:0x0090, B:30:0x009d, B:32:0x00aa, B:35:0x00b5, B:37:0x00ca, B:41:0x00dd, B:43:0x00e4, B:46:0x00ec, B:48:0x00f7, B:50:0x0103, B:50:0x0103, B:51:0x0106, B:52:0x0111, B:54:0x0114, B:57:0x0125, B:62:0x0137, B:64:0x0145, B:66:0x014d, B:68:0x0159, B:70:0x017e, B:71:0x0189, B:74:0x018f, B:76:0x0196, B:79:0x019e, B:81:0x01a9, B:83:0x01b5, B:83:0x01b5, B:84:0x01b8, B:85:0x01c3, B:87:0x01c5, B:89:0x01d0, B:95:0x01fa, B:99:0x0207, B:101:0x0214, B:104:0x021f, B:106:0x022c, B:110:0x0239, B:112:0x0246, B:115:0x0251, B:117:0x0267, B:119:0x0273, B:121:0x027f, B:125:0x0290, B:127:0x029b, B:130:0x02a7, B:131:0x02cc, B:134:0x02d4, B:136:0x02e2, B:138:0x02eb, B:141:0x02fa, B:143:0x0301, B:145:0x031a, B:147:0x0320, B:149:0x032a, B:149:0x032a, B:150:0x032d, B:151:0x0339, B:153:0x033b, B:155:0x0344, B:157:0x034e, B:159:0x0358, B:160:0x0367, B:162:0x0369, B:164:0x036f, B:166:0x0379, B:167:0x0388, B:169:0x038a, B:171:0x0395, B:173:0x039b, B:175:0x03a5, B:176:0x03b4, B:178:0x03b6, B:179:0x03c0, B:179:0x03c0, B:180:0x03c3, B:182:0x03cf, B:184:0x03da, B:186:0x03e2, B:188:0x03f4, B:190:0x0400, B:191:0x0414, B:192:0x041b, B:194:0x04df, B:196:0x04f3, B:200:0x05af, B:203:0x05c3), top: B:210:0x000f }] */
    /* JADX WARN: Removed duplicated region for block: B:130:0x02a7 A[Catch: BuildException -> 0x0112, all -> 0x0126, Exception -> 0x0157, TRY_ENTER, TryCatch #0 {BuildException -> 0x0112, blocks: (B:3:0x000f, B:5:0x001b, B:41:0x00dd, B:43:0x00e4, B:46:0x00ec, B:48:0x00f7, B:50:0x0103, B:50:0x0103, B:51:0x0106, B:52:0x0111, B:66:0x014d, B:74:0x018f, B:76:0x0196, B:79:0x019e, B:81:0x01a9, B:83:0x01b5, B:83:0x01b5, B:84:0x01b8, B:85:0x01c3, B:87:0x01c5, B:89:0x01d0, B:127:0x029b, B:130:0x02a7, B:131:0x02cc, B:138:0x02eb, B:141:0x02fa, B:143:0x0301, B:145:0x031a, B:147:0x0320, B:149:0x032a, B:149:0x032a, B:150:0x032d, B:151:0x0339, B:153:0x033b, B:155:0x0344, B:157:0x034e, B:159:0x0358, B:160:0x0367, B:162:0x0369, B:164:0x036f, B:166:0x0379, B:167:0x0388, B:169:0x038a, B:171:0x0395, B:173:0x039b, B:175:0x03a5, B:176:0x03b4, B:178:0x03b6, B:179:0x03c0, B:179:0x03c0, B:180:0x03c3, B:182:0x03cf, B:184:0x03da, B:186:0x03e2, B:188:0x03f4, B:190:0x0400, B:191:0x0414, B:192:0x041b, B:194:0x04df, B:196:0x04f3, B:200:0x05af, B:203:0x05c3), top: B:209:0x000f }] */
    /* JADX WARN: Removed duplicated region for block: B:132:0x02cd  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02db  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x02fa A[Catch: BuildException -> 0x0112, all -> 0x0126, Exception -> 0x0157, TRY_ENTER, TryCatch #0 {BuildException -> 0x0112, blocks: (B:3:0x000f, B:5:0x001b, B:41:0x00dd, B:43:0x00e4, B:46:0x00ec, B:48:0x00f7, B:50:0x0103, B:50:0x0103, B:51:0x0106, B:52:0x0111, B:66:0x014d, B:74:0x018f, B:76:0x0196, B:79:0x019e, B:81:0x01a9, B:83:0x01b5, B:83:0x01b5, B:84:0x01b8, B:85:0x01c3, B:87:0x01c5, B:89:0x01d0, B:127:0x029b, B:130:0x02a7, B:131:0x02cc, B:138:0x02eb, B:141:0x02fa, B:143:0x0301, B:145:0x031a, B:147:0x0320, B:149:0x032a, B:149:0x032a, B:150:0x032d, B:151:0x0339, B:153:0x033b, B:155:0x0344, B:157:0x034e, B:159:0x0358, B:160:0x0367, B:162:0x0369, B:164:0x036f, B:166:0x0379, B:167:0x0388, B:169:0x038a, B:171:0x0395, B:173:0x039b, B:175:0x03a5, B:176:0x03b4, B:178:0x03b6, B:179:0x03c0, B:179:0x03c0, B:180:0x03c3, B:182:0x03cf, B:184:0x03da, B:186:0x03e2, B:188:0x03f4, B:190:0x0400, B:191:0x0414, B:192:0x041b, B:194:0x04df, B:196:0x04f3, B:200:0x05af, B:203:0x05c3), top: B:209:0x000f }] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01d0 A[Catch: BuildException -> 0x0112, all -> 0x0126, Exception -> 0x0157, TRY_LEAVE, TryCatch #0 {BuildException -> 0x0112, blocks: (B:3:0x000f, B:5:0x001b, B:41:0x00dd, B:43:0x00e4, B:46:0x00ec, B:48:0x00f7, B:50:0x0103, B:50:0x0103, B:51:0x0106, B:52:0x0111, B:66:0x014d, B:74:0x018f, B:76:0x0196, B:79:0x019e, B:81:0x01a9, B:83:0x01b5, B:83:0x01b5, B:84:0x01b8, B:85:0x01c3, B:87:0x01c5, B:89:0x01d0, B:127:0x029b, B:130:0x02a7, B:131:0x02cc, B:138:0x02eb, B:141:0x02fa, B:143:0x0301, B:145:0x031a, B:147:0x0320, B:149:0x032a, B:149:0x032a, B:150:0x032d, B:151:0x0339, B:153:0x033b, B:155:0x0344, B:157:0x034e, B:159:0x0358, B:160:0x0367, B:162:0x0369, B:164:0x036f, B:166:0x0379, B:167:0x0388, B:169:0x038a, B:171:0x0395, B:173:0x039b, B:175:0x03a5, B:176:0x03b4, B:178:0x03b6, B:179:0x03c0, B:179:0x03c0, B:180:0x03c3, B:182:0x03cf, B:184:0x03da, B:186:0x03e2, B:188:0x03f4, B:190:0x0400, B:191:0x0414, B:192:0x041b, B:194:0x04df, B:196:0x04f3, B:200:0x05af, B:203:0x05c3), top: B:209:0x000f }] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0200  */
    /* JADX WARN: Type inference failed for: r0v186, types: [org.apache.tools.ant.taskdefs.email.Mailer] */
    /* JADX WARN: Type inference failed for: r0v270, types: [org.apache.tools.ant.taskdefs.email.Mailer] */
    @Override // org.apache.tools.ant.Task
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void execute() {
        Exception e;
        BuildException e2;
        PlainMailer plainMailer;
        boolean z;
        PlainMailer plainMailer2;
        boolean z2;
        Class cls;
        PlainMailer plainMailer3;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Message message = this.message;
        try {
            try {
                try {
                } catch (BuildException e3) {
                    e2 = e3;
                }
            } catch (Exception e4) {
                e = e4;
            }
            try {
                if (!this.encoding.equals(MIME)) {
                    z = false;
                    plainMailer = null;
                    if (this.encoding.equals(AUTO)) {
                        z = false;
                        plainMailer = null;
                    }
                    if (z && ((this.user != null || this.password != null) && (this.encoding.equals(UU) || this.encoding.equals(PLAIN)))) {
                        throw new BuildException("SMTP auth only possible with MIME mail");
                    }
                    if (z && ((this.ssl || this.starttls) && (this.encoding.equals(UU) || this.encoding.equals(PLAIN)))) {
                        throw new BuildException("SSL and STARTTLS only possible with MIME mail");
                    }
                    if (!this.encoding.equals(UU)) {
                        z2 = z;
                        plainMailer3 = plainMailer;
                        if (this.encoding.equals(AUTO)) {
                            z2 = z;
                            plainMailer3 = plainMailer;
                        }
                        plainMailer2 = plainMailer3;
                        if (!this.encoding.equals(PLAIN) || (this.encoding.equals(AUTO) && !z2)) {
                            plainMailer2 = new PlainMailer();
                            log("Using plain mail", 3);
                        }
                        if (plainMailer2 == null) {
                            throw new BuildException(new StringBuffer().append("Failed to initialise encoding: ").append(this.encoding).toString());
                        }
                        if (this.message == null) {
                            this.message = new Message();
                            this.message.setProject(getProject());
                        }
                        if (this.from == null || this.from.getAddress() == null) {
                            throw new BuildException("A from element is required");
                        }
                        if (this.toList.isEmpty() && this.ccList.isEmpty() && this.bccList.isEmpty()) {
                            throw new BuildException("At least one of to, cc or bcc must be supplied");
                        }
                        if (this.messageMimeType != null) {
                            if (this.message.isMimeTypeSpecified()) {
                                throw new BuildException("The mime type can only be specified in one location");
                            }
                            this.message.setMimeType(this.messageMimeType);
                        }
                        if (this.charset != null) {
                            if (this.message.getCharset() != null) {
                                throw new BuildException("The charset can only be specified in one location");
                            }
                            this.message.setCharset(this.charset);
                        }
                        Vector vector = new Vector();
                        if (this.attachments != null) {
                            Iterator it = this.attachments.iterator();
                            while (it.hasNext()) {
                                Resource resource = (Resource) it.next();
                                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                                } else {
                                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                                }
                                vector.addElement(((FileProvider) resource.as(cls)).getFile());
                            }
                        }
                        log(new StringBuffer().append("Sending email: ").append(this.subject).toString(), 2);
                        log(new StringBuffer().append("From ").append(this.from).toString(), 3);
                        log(new StringBuffer().append("ReplyTo ").append(this.replyToList).toString(), 3);
                        log(new StringBuffer().append("To ").append(this.toList).toString(), 3);
                        log(new StringBuffer().append("Cc ").append(this.ccList).toString(), 3);
                        log(new StringBuffer().append("Bcc ").append(this.bccList).toString(), 3);
                        plainMailer2.setHost(this.host);
                        if (this.port != null) {
                            plainMailer2.setPort(this.port.intValue());
                            plainMailer2.setPortExplicitlySpecified(true);
                        } else {
                            plainMailer2.setPort(25);
                            plainMailer2.setPortExplicitlySpecified(false);
                        }
                        plainMailer2.setUser(this.user);
                        plainMailer2.setPassword(this.password);
                        plainMailer2.setSSL(this.ssl);
                        plainMailer2.setEnableStartTLS(this.starttls);
                        plainMailer2.setMessage(this.message);
                        plainMailer2.setFrom(this.from);
                        plainMailer2.setReplyToList(this.replyToList);
                        plainMailer2.setToList(this.toList);
                        plainMailer2.setCcList(this.ccList);
                        plainMailer2.setBccList(this.bccList);
                        plainMailer2.setFiles(vector);
                        plainMailer2.setSubject(this.subject);
                        plainMailer2.setTask(this);
                        plainMailer2.setIncludeFileNames(this.includeFileNames);
                        plainMailer2.setHeaders(this.headers);
                        plainMailer2.setIgnoreInvalidRecipients(this.ignoreInvalidRecipients);
                        plainMailer2.send();
                        int size = vector.size();
                        log(new StringBuffer().append("Sent email with ").append(size).append(" attachment").append(size == 1 ? "" : "s").toString(), 2);
                        return;
                    }
                    z2 = z;
                    plainMailer3 = plainMailer;
                    if (class$org$apache$tools$ant$taskdefs$email$EmailTask != null) {
                        boolean z3 = z;
                        cls2 = class$("org.apache.tools.ant.taskdefs.email.EmailTask");
                        boolean z4 = z;
                        class$org$apache$tools$ant$taskdefs$email$EmailTask = cls2;
                    } else {
                        boolean z5 = z;
                        cls2 = class$org$apache$tools$ant$taskdefs$email$EmailTask;
                    }
                    boolean z6 = z;
                    ClassLoader classLoader = cls2.getClassLoader();
                    boolean z7 = z;
                    if (class$org$apache$tools$ant$taskdefs$email$Mailer != null) {
                        boolean z8 = z;
                        cls3 = class$("org.apache.tools.ant.taskdefs.email.Mailer");
                        boolean z9 = z;
                        class$org$apache$tools$ant$taskdefs$email$Mailer = cls3;
                    } else {
                        cls3 = class$org$apache$tools$ant$taskdefs$email$Mailer;
                    }
                    boolean z10 = z;
                    plainMailer2 = (Mailer) ClasspathUtils.newInstance("org.apache.tools.ant.taskdefs.email.UUMailer", classLoader, cls3);
                    z2 = true;
                    plainMailer3 = plainMailer2;
                    log("Using UU mail", 3);
                    z2 = true;
                    if (!this.encoding.equals(PLAIN)) {
                    }
                    plainMailer2 = new PlainMailer();
                    log("Using plain mail", 3);
                    if (plainMailer2 == null) {
                    }
                }
                if (!this.encoding.equals(PLAIN)) {
                }
                plainMailer2 = new PlainMailer();
                log("Using plain mail", 3);
                if (plainMailer2 == null) {
                }
            } catch (BuildException e5) {
                e2 = e5;
                logBuildException("Failed to send email: ", e2);
                if (!this.failOnError) {
                    return;
                }
                throw e2;
            } catch (Exception e6) {
                e = e6;
                log(new StringBuffer().append("Failed to send email: ").append(e.getMessage()).toString(), 1);
                if (!this.failOnError) {
                    return;
                }
                throw new BuildException(e);
            }
            z = false;
            plainMailer = null;
            Class.forName("javax.activation.DataHandler");
            Class.forName("javax.mail.internet.MimeMessage");
            if (class$org$apache$tools$ant$taskdefs$email$EmailTask == null) {
                cls4 = class$("org.apache.tools.ant.taskdefs.email.EmailTask");
                class$org$apache$tools$ant$taskdefs$email$EmailTask = cls4;
            } else {
                cls4 = class$org$apache$tools$ant$taskdefs$email$EmailTask;
            }
            ClassLoader classLoader2 = cls4.getClassLoader();
            if (class$org$apache$tools$ant$taskdefs$email$Mailer == null) {
                cls5 = class$("org.apache.tools.ant.taskdefs.email.Mailer");
                class$org$apache$tools$ant$taskdefs$email$Mailer = cls5;
            } else {
                cls5 = class$org$apache$tools$ant$taskdefs$email$Mailer;
            }
            ?? r0 = (Mailer) ClasspathUtils.newInstance("org.apache.tools.ant.taskdefs.email.MimeMailer", classLoader2, cls5);
            z = true;
            plainMailer = r0;
            log("Using MIME mail", 3);
            plainMailer = r0;
            z = true;
            if (z) {
            }
            if (z) {
            }
            if (!this.encoding.equals(UU)) {
            }
            z2 = z;
            plainMailer3 = plainMailer;
            if (class$org$apache$tools$ant$taskdefs$email$EmailTask != null) {
            }
            boolean z62 = z;
            ClassLoader classLoader3 = cls2.getClassLoader();
            boolean z72 = z;
            if (class$org$apache$tools$ant$taskdefs$email$Mailer != null) {
            }
            boolean z102 = z;
            plainMailer2 = (Mailer) ClasspathUtils.newInstance("org.apache.tools.ant.taskdefs.email.UUMailer", classLoader3, cls3);
            z2 = true;
            plainMailer3 = plainMailer2;
            log("Using UU mail", 3);
            z2 = true;
        } finally {
            this.message = message;
        }
    }

    public String getCharset() {
        return this.charset;
    }

    public boolean getIncludeFileNames() {
        return this.includeFileNames;
    }

    public void setBccList(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        while (stringTokenizer.hasMoreTokens()) {
            this.bccList.addElement(new EmailAddress(stringTokenizer.nextToken()));
        }
    }

    public void setCcList(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        while (stringTokenizer.hasMoreTokens()) {
            this.ccList.addElement(new EmailAddress(stringTokenizer.nextToken()));
        }
    }

    public void setCharset(String str) {
        this.charset = str;
    }

    public void setEnableStartTLS(boolean z) {
        this.starttls = z;
    }

    public void setEncoding(Encoding encoding) {
        this.encoding = encoding.getValue();
    }

    public void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    public void setFiles(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ", ");
        while (stringTokenizer.hasMoreTokens()) {
            createAttachments().add(new FileResource(getProject().resolveFile(stringTokenizer.nextToken())));
        }
    }

    public void setFrom(String str) {
        if (this.from != null) {
            throw new BuildException("Emails can only be from one address");
        }
        this.from = new EmailAddress(str);
    }

    public void setIgnoreInvalidRecipients(boolean z) {
        this.ignoreInvalidRecipients = z;
    }

    public void setIncludefilenames(boolean z) {
        this.includeFileNames = z;
    }

    public void setMailhost(String str) {
        this.host = str;
    }

    public void setMailport(int i) {
        this.port = new Integer(i);
    }

    public void setMessage(String str) {
        if (this.message != null) {
            throw new BuildException("Only one message can be sent in an email");
        }
        this.message = new Message(str);
        this.message.setProject(getProject());
    }

    public void setMessageFile(File file) {
        if (this.message != null) {
            throw new BuildException("Only one message can be sent in an email");
        }
        this.message = new Message(file);
        this.message.setProject(getProject());
    }

    public void setMessageMimeType(String str) {
        this.messageMimeType = str;
    }

    public void setPassword(String str) {
        this.password = str;
    }

    public void setReplyTo(String str) {
        this.replyToList.add(new EmailAddress(str));
    }

    public void setSSL(boolean z) {
        this.ssl = z;
    }

    public void setSubject(String str) {
        this.subject = str;
    }

    public void setToList(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        while (stringTokenizer.hasMoreTokens()) {
            this.toList.addElement(new EmailAddress(stringTokenizer.nextToken()));
        }
    }

    public void setUser(String str) {
        this.user = str;
    }
}
