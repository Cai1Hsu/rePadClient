package org.apache.tools.ant.listener;

import com.edutech.idauthentication.AppEnvironment;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.protocol.HTTP;
import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DefaultLogger;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.email.EmailAddress;
import org.apache.tools.ant.taskdefs.email.Mailer;
import org.apache.tools.ant.taskdefs.email.Message;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.ant.util.DateUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;
import org.apache.tools.mail.MailMessage;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smackx.packet.MultipleAddresses;
import org.jivesoftware.smackx.workgroup.packet.UserID;

/* loaded from: classes.jar:org/apache/tools/ant/listener/MailLogger.class */
public class MailLogger extends DefaultLogger {
    private static final String DEFAULT_MIME_TYPE = "text/plain";
    static Class class$org$apache$tools$ant$listener$MailLogger;
    static Class class$org$apache$tools$ant$taskdefs$email$Mailer;
    private StringBuffer buffer = new StringBuffer();

    /* renamed from: org.apache.tools.ant.listener.MailLogger$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/listener/MailLogger$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/listener/MailLogger$Values.class */
    private static class Values {
        private String body;
        private String charset;
        private String from;
        private String mailhost;
        private String mimeType;
        private String password;
        private int port;
        private String replytoList;
        private boolean ssl;
        private boolean starttls;
        private String subject;
        private String toList;
        private String user;

        private Values() {
        }

        Values(AnonymousClass1 anonymousClass1) {
            this();
        }

        public String body() {
            return this.body;
        }

        public Values body(String str) {
            this.body = str;
            return this;
        }

        public String charset() {
            return this.charset;
        }

        public Values charset(String str) {
            this.charset = str;
            return this;
        }

        public String from() {
            return this.from;
        }

        public Values from(String str) {
            this.from = str;
            return this;
        }

        public String mailhost() {
            return this.mailhost;
        }

        public Values mailhost(String str) {
            this.mailhost = str;
            return this;
        }

        public String mimeType() {
            return this.mimeType;
        }

        public Values mimeType(String str) {
            this.mimeType = str;
            return this;
        }

        public String password() {
            return this.password;
        }

        public Values password(String str) {
            this.password = str;
            return this;
        }

        public int port() {
            return this.port;
        }

        public Values port(int i) {
            this.port = i;
            return this;
        }

        public String replytoList() {
            return this.replytoList;
        }

        public Values replytoList(String str) {
            this.replytoList = str;
            return this;
        }

        public Values ssl(boolean z) {
            this.ssl = z;
            return this;
        }

        public boolean ssl() {
            return this.ssl;
        }

        public Values starttls(boolean z) {
            this.starttls = z;
            return this;
        }

        public boolean starttls() {
            return this.starttls;
        }

        public String subject() {
            return this.subject;
        }

        public Values subject(String str) {
            this.subject = str;
            return this;
        }

        public String toList() {
            return this.toList;
        }

        public Values toList(String str) {
            this.toList = str;
            return this;
        }

        public String user() {
            return this.user;
        }

        public Values user(String str) {
            this.user = str;
            return this;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private String getValue(Hashtable hashtable, String str, String str2) throws Exception {
        String stringBuffer = new StringBuffer().append("MailLogger.").append(str).toString();
        String str3 = (String) hashtable.get(stringBuffer);
        String str4 = str3;
        if (str3 == null) {
            str4 = str2;
        }
        if (str4 == null) {
            throw new Exception(new StringBuffer().append("Missing required parameter: ").append(stringBuffer).toString());
        }
        return str4;
    }

    private void sendMail(Values values, String str) throws IOException {
        MailMessage mailMessage = new MailMessage(values.mailhost(), values.port());
        mailMessage.setHeader(HTTP.DATE_HEADER, DateUtils.getDateForHeader());
        mailMessage.from(values.from());
        if (!values.replytoList().equals("")) {
            StringTokenizer stringTokenizer = new StringTokenizer(values.replytoList(), ", ", false);
            while (stringTokenizer.hasMoreTokens()) {
                mailMessage.replyto(stringTokenizer.nextToken());
            }
        }
        StringTokenizer stringTokenizer2 = new StringTokenizer(values.toList(), ", ", false);
        while (stringTokenizer2.hasMoreTokens()) {
            mailMessage.to(stringTokenizer2.nextToken());
        }
        mailMessage.setSubject(values.subject());
        if (values.charset().length() > 0) {
            mailMessage.setHeader("Content-Type", new StringBuffer().append(values.mimeType()).append("; charset=\"").append(values.charset()).append("\"").toString());
        } else {
            mailMessage.setHeader("Content-Type", values.mimeType());
        }
        PrintStream printStream = mailMessage.getPrintStream();
        if (values.body().length() > 0) {
            str = values.body();
        }
        printStream.println(str);
        mailMessage.sendAndClose();
    }

    private void sendMimeMail(Project project, Values values, String str) {
        Class cls;
        Class cls2;
        try {
            if (class$org$apache$tools$ant$listener$MailLogger == null) {
                cls = class$("org.apache.tools.ant.listener.MailLogger");
                class$org$apache$tools$ant$listener$MailLogger = cls;
            } else {
                cls = class$org$apache$tools$ant$listener$MailLogger;
            }
            ClassLoader classLoader = cls.getClassLoader();
            if (class$org$apache$tools$ant$taskdefs$email$Mailer == null) {
                cls2 = class$("org.apache.tools.ant.taskdefs.email.Mailer");
                class$org$apache$tools$ant$taskdefs$email$Mailer = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$taskdefs$email$Mailer;
            }
            Mailer mailer = (Mailer) ClasspathUtils.newInstance("org.apache.tools.ant.taskdefs.email.MimeMailer", classLoader, cls2);
            Vector vectorizeEmailAddresses = vectorizeEmailAddresses(values.replytoList());
            mailer.setHost(values.mailhost());
            mailer.setPort(values.port());
            mailer.setUser(values.user());
            mailer.setPassword(values.password());
            mailer.setSSL(values.ssl());
            mailer.setEnableStartTLS(values.starttls());
            if (values.body().length() > 0) {
                str = values.body();
            }
            Message message = new Message(str);
            message.setProject(project);
            message.setMimeType(values.mimeType());
            if (values.charset().length() > 0) {
                message.setCharset(values.charset());
            }
            mailer.setMessage(message);
            mailer.setFrom(new EmailAddress(values.from()));
            mailer.setReplyToList(vectorizeEmailAddresses);
            mailer.setToList(vectorizeEmailAddresses(values.toList()));
            mailer.setCcList(new Vector());
            mailer.setBccList(new Vector());
            mailer.setFiles(new Vector());
            mailer.setSubject(values.subject());
            mailer.setHeaders(new Vector());
            mailer.send();
        } catch (BuildException e) {
            e = e;
            if (e.getCause() != null) {
                e = e.getCause();
            }
            log(new StringBuffer().append("Failed to initialise MIME mail: ").append(e.getMessage()).toString());
        }
    }

    private Vector vectorizeEmailAddresses(String str) {
        Vector vector = new Vector();
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        while (stringTokenizer.hasMoreTokens()) {
            vector.addElement(new EmailAddress(stringTokenizer.nextToken()));
        }
        return vector;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0058 A[LOOP:0: B:10:0x004e->B:12:0x0058, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00d3 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00e2 A[Catch: Exception -> 0x0241, TRY_ENTER, TRY_LEAVE, TryCatch #4 {Exception -> 0x0241, blocks: (B:26:0x00a7, B:31:0x00e2, B:34:0x01f6, B:36:0x0213, B:38:0x0220, B:40:0x0228, B:42:0x0230, B:46:0x025d), top: B:49:0x00a7 }] */
    @Override // org.apache.tools.ant.DefaultLogger, org.apache.tools.ant.BuildListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void buildFinished(BuildEvent buildEvent) {
        Enumeration keys;
        String str;
        FileInputStream fileInputStream;
        Throwable th;
        super.buildFinished(buildEvent);
        Project project = buildEvent.getProject();
        Hashtable properties = project.getProperties();
        Properties properties2 = new Properties();
        String str2 = (String) properties.get("MailLogger.properties.file");
        if (str2 != null) {
            try {
                fileInputStream = new FileInputStream(str2);
            } catch (IOException e) {
                fileInputStream = null;
            } catch (Throwable th2) {
                th = th2;
                fileInputStream = null;
            }
            try {
                properties2.load(fileInputStream);
                FileUtils.close(fileInputStream);
            } catch (IOException e2) {
                FileUtils.close(fileInputStream);
                keys = properties2.keys();
                while (keys.hasMoreElements()) {
                }
                if (buildEvent.getException() != null) {
                }
                if (!r15) {
                }
                if (Project.toBoolean(getValue(properties, new StringBuffer().append(str).append(".notify").toString(), "on"))) {
                }
            } catch (Throwable th3) {
                th = th3;
                FileUtils.close(fileInputStream);
                throw th;
            }
        }
        keys = properties2.keys();
        while (keys.hasMoreElements()) {
            String str3 = (String) keys.nextElement();
            properties.put(str3, project.replaceProperties(properties2.getProperty(str3)));
        }
        boolean z = buildEvent.getException() != null;
        str = !z ? "success" : "failure";
        try {
            if (Project.toBoolean(getValue(properties, new StringBuffer().append(str).append(".notify").toString(), "on"))) {
                return;
            }
            Values subject = new Values(null).mailhost(getValue(properties, "mailhost", MailMessage.DEFAULT_HOST)).port(Integer.parseInt(getValue(properties, ClientCookie.PORT_ATTR, String.valueOf(25)))).user(getValue(properties, UserID.ELEMENT_NAME, "")).password(getValue(properties, AppEnvironment.PASSWORD, "")).ssl(Project.toBoolean(getValue(properties, "ssl", "off"))).starttls(Project.toBoolean(getValue(properties, "starttls.enable", "off"))).from(getValue(properties, PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM, null)).replytoList(getValue(properties, MultipleAddresses.REPLY_TO, "")).toList(getValue(properties, new StringBuffer().append(str).append(".to").toString(), null)).mimeType(getValue(properties, "mimeType", "text/plain")).charset(getValue(properties, "charset", "")).body(getValue(properties, new StringBuffer().append(str).append(".body").toString(), "")).subject(getValue(properties, new StringBuffer().append(str).append(".subject").toString(), z ? "Build Success" : "Build Failure"));
            if (!subject.user().equals("") || !subject.password().equals("") || subject.ssl() || subject.starttls()) {
                sendMimeMail(buildEvent.getProject(), subject, this.buffer.substring(0));
            } else {
                sendMail(subject, this.buffer.substring(0));
            }
        } catch (Exception e3) {
            System.out.println("MailLogger failed to send e-mail!");
            e3.printStackTrace(System.err);
        }
    }

    @Override // org.apache.tools.ant.DefaultLogger
    protected void log(String str) {
        this.buffer.append(str).append(StringUtils.LINE_SEP);
    }
}
