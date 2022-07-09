package org.apache.tools.ant.taskdefs.cvslib;

import java.io.ByteArrayOutputStream;
import java.util.StringTokenizer;
import org.apache.http.cookie.ClientCookie;
import org.apache.tools.ant.taskdefs.AbstractCvsTask;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/CvsVersion.class */
public class CvsVersion extends AbstractCvsTask {
    static final long MULTIPLY = 100;
    static final long VERSION_1_11_2 = 11102;
    private String clientVersion;
    private String clientVersionProperty;
    private String serverVersion;
    private String serverVersionProperty;

    @Override // org.apache.tools.ant.taskdefs.AbstractCvsTask, org.apache.tools.ant.Task
    public void execute() {
        boolean z;
        String str;
        boolean z2;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        setOutputStream(byteArrayOutputStream);
        setErrorStream(new ByteArrayOutputStream());
        setCommand(ClientCookie.VERSION_ATTR);
        super.execute();
        String byteArrayOutputStream2 = byteArrayOutputStream.toString();
        log(new StringBuffer().append("Received version response \"").append(byteArrayOutputStream2).append("\"").toString(), 4);
        StringTokenizer stringTokenizer = new StringTokenizer(byteArrayOutputStream2);
        boolean z3 = false;
        boolean z4 = false;
        String str2 = null;
        String str3 = null;
        boolean z5 = false;
        while (true) {
            if (!z5 && !stringTokenizer.hasMoreTokens()) {
                break;
            }
            String nextToken = z5 ? str3 : stringTokenizer.nextToken();
            if (nextToken.equals("Client:")) {
                z = true;
                z2 = z4;
                str = str2;
            } else if (nextToken.equals("Server:")) {
                z2 = true;
                z = z3;
                str = str2;
            } else {
                z = z3;
                str = str2;
                z2 = z4;
                if (nextToken.startsWith("(CVS")) {
                    z = z3;
                    str = str2;
                    z2 = z4;
                    if (nextToken.endsWith(")")) {
                        z = z3;
                        str = nextToken.length() == 5 ? "" : new StringBuffer().append(" ").append(nextToken).toString();
                        z2 = z4;
                    }
                }
            }
            if (!z && !z2 && str != null && str3 == null && stringTokenizer.hasMoreTokens()) {
                str3 = stringTokenizer.nextToken();
                z5 = true;
                z3 = z;
                str2 = str;
                z4 = z2;
            } else if (z && str != null) {
                if (stringTokenizer.hasMoreTokens()) {
                    this.clientVersion = new StringBuffer().append(stringTokenizer.nextToken()).append(str).toString();
                }
                z3 = false;
                str2 = null;
                z5 = false;
                z4 = z2;
            } else if (!z2 || str == null) {
                z3 = z;
                str2 = str;
                z5 = false;
                z4 = z2;
                if (nextToken.equals("(client/server)")) {
                    z3 = z;
                    str2 = str;
                    z5 = false;
                    z4 = z2;
                    if (str != null) {
                        z3 = z;
                        str2 = str;
                        z5 = false;
                        z4 = z2;
                        if (str3 != null) {
                            z3 = z;
                            str2 = str;
                            z5 = false;
                            z4 = z2;
                            if (!z) {
                                z3 = z;
                                str2 = str;
                                z5 = false;
                                z4 = z2;
                                if (!z2) {
                                    z4 = true;
                                    z3 = true;
                                    String stringBuffer = new StringBuffer().append(str3).append(str).toString();
                                    this.serverVersion = stringBuffer;
                                    this.clientVersion = stringBuffer;
                                    str2 = null;
                                    str3 = null;
                                    z5 = false;
                                }
                            }
                        }
                    }
                }
            } else {
                if (stringTokenizer.hasMoreTokens()) {
                    this.serverVersion = new StringBuffer().append(stringTokenizer.nextToken()).append(str).toString();
                }
                z4 = false;
                str2 = null;
                z3 = z;
                z5 = false;
            }
        }
        if (this.clientVersionProperty != null) {
            getProject().setNewProperty(this.clientVersionProperty, this.clientVersion);
        }
        if (this.serverVersionProperty != null) {
            getProject().setNewProperty(this.serverVersionProperty, this.serverVersion);
        }
    }

    public String getClientVersion() {
        return this.clientVersion;
    }

    public String getServerVersion() {
        return this.serverVersion;
    }

    public void setClientVersionProperty(String str) {
        this.clientVersionProperty = str;
    }

    public void setServerVersionProperty(String str) {
        this.serverVersionProperty = str;
    }

    public boolean supportsCvsLogWithSOption() {
        long j;
        boolean z = false;
        if (this.serverVersion != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(this.serverVersion, ".");
            long j2 = 10000;
            long j3 = 0;
            while (true) {
                j = j3;
                if (!stringTokenizer.hasMoreTokens()) {
                    break;
                }
                String nextToken = stringTokenizer.nextToken();
                int i = 0;
                while (i < nextToken.length() && Character.isDigit(nextToken.charAt(i))) {
                    i++;
                }
                j3 += Long.parseLong(nextToken.substring(0, i)) * j2;
                if (j2 == 1) {
                    j = j3;
                    break;
                }
                j2 /= MULTIPLY;
            }
            if (j >= VERSION_1_11_2) {
                z = true;
            }
        }
        return z;
    }
}
