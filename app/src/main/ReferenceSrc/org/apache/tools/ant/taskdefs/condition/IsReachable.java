package org.apache.tools.ant.taskdefs.condition;

import java.lang.reflect.InvocationTargetException;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/IsReachable.class */
public class IsReachable extends ProjectComponent implements Condition {
    public static final int DEFAULT_TIMEOUT = 30;
    public static final String ERROR_BAD_TIMEOUT = "Invalid timeout value";
    public static final String ERROR_BAD_URL = "Bad URL ";
    public static final String ERROR_BOTH_TARGETS = "Both url and host have been specified";
    public static final String ERROR_NO_HOSTNAME = "No hostname defined";
    public static final String ERROR_NO_HOST_IN_URL = "No hostname in URL ";
    public static final String ERROR_ON_NETWORK = "network error to ";
    public static final String METHOD_NAME = "isReachable";
    public static final String MSG_NO_REACHABLE_TEST = "cannot do a proper reachability test on this Java version";
    private static final int SECOND = 1000;
    private static final String WARN_UNKNOWN_HOST = "Unknown host: ";
    static Class class$java$net$InetAddress;
    private static Class[] parameterTypes = {Integer.TYPE};
    private String host;
    private int timeout = 30;
    private String url;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private boolean empty(String str) {
        return str == null || str.length() == 0;
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:60:0x00ef */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:62:? */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v10, types: [java.lang.reflect.Method] */
    /* JADX WARN: Type inference failed for: r10v12, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r10v13 */
    /* JADX WARN: Type inference failed for: r10v14 */
    /* JADX WARN: Type inference failed for: r10v15 */
    /* JADX WARN: Type inference failed for: r10v4 */
    /* JADX WARN: Type inference failed for: r10v5 */
    /* JADX WARN: Type inference failed for: r10v6 */
    /* JADX WARN: Type inference failed for: r7v0, types: [org.apache.tools.ant.taskdefs.condition.IsReachable] */
    /* JADX WARN: Type inference failed for: r9v3, types: [java.lang.NoSuchMethodException] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:51:0x019f -> B:37:0x0131). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x01df -> B:37:0x0131). Please submit an issue!!! */
    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        ?? r10;
        Class cls;
        boolean z = false;
        if (!empty(this.host) || !empty(this.url)) {
            if (this.timeout < 0) {
                throw new BuildException(ERROR_BAD_TIMEOUT);
            }
            String str = this.host;
            if (!empty(this.url)) {
                if (!empty(this.host)) {
                    throw new BuildException(ERROR_BOTH_TARGETS);
                }
                try {
                    r10 = new URL(this.url).getHost();
                    str = r10;
                    if (empty(r10)) {
                        throw new BuildException(new StringBuffer().append(ERROR_NO_HOST_IN_URL).append(this.url).toString());
                    }
                } catch (MalformedURLException e) {
                    throw new BuildException(new StringBuffer().append(ERROR_BAD_URL).append(this.url).toString(), e);
                }
            }
            log(new StringBuffer().append("Probing host ").append(str).toString(), 3);
            try {
                InetAddress byName = InetAddress.getByName(str);
                log(new StringBuffer().append("Host address = ").append(byName.getHostAddress()).toString(), 3);
                try {
                    if (class$java$net$InetAddress == null) {
                        cls = class$("java.net.InetAddress");
                        class$java$net$InetAddress = cls;
                    } else {
                        cls = class$java$net$InetAddress;
                    }
                    r10 = cls.getMethod(METHOD_NAME, parameterTypes);
                    try {
                        z = ((Boolean) r10.invoke(byName, new Integer(this.timeout * 1000))).booleanValue();
                        str = str;
                        r10 = r10;
                    } catch (IllegalAccessException e2) {
                        throw new BuildException(new StringBuffer().append("When calling ").append((Object) r10).toString());
                    } catch (InvocationTargetException e3) {
                        Throwable targetException = e3.getTargetException();
                        StringBuffer stringBuffer = new StringBuffer();
                        log(stringBuffer.append(ERROR_ON_NETWORK).append(str).append(": ").append(targetException.toString()).toString());
                        z = false;
                        str = str;
                        r10 = stringBuffer;
                    }
                } catch (NoSuchMethodException e4) {
                    log("Not found: InetAddress.isReachable", 3);
                    log(MSG_NO_REACHABLE_TEST);
                    z = true;
                    str = e4;
                    r10 = r10;
                }
                log(new StringBuffer().append("host is").append(z ? "" : " not").append(" reachable").toString(), 3);
            } catch (UnknownHostException e5) {
                log(new StringBuffer().append(WARN_UNKNOWN_HOST).append(str).toString());
            }
            return z;
        }
        throw new BuildException(ERROR_NO_HOSTNAME);
    }

    public void setHost(String str) {
        this.host = str;
    }

    public void setTimeout(int i) {
        this.timeout = i;
    }

    public void setUrl(String str) {
        this.url = str;
    }
}
