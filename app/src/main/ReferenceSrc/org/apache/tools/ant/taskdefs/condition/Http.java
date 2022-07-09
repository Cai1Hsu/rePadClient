package org.apache.tools.ant.taskdefs.condition;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Locale;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/Http.class */
public class Http extends ProjectComponent implements Condition {
    private static final String DEFAULT_REQUEST_METHOD = "GET";
    private static final int ERROR_BEGINS = 400;
    private String spec = null;
    private String requestMethod = "GET";
    private int errorsBeginAt = 400;

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean z;
        if (this.spec == null) {
            throw new BuildException("No url specified in http condition");
        }
        log(new StringBuffer().append("Checking for ").append(this.spec).toString(), 3);
        try {
            try {
                URLConnection openConnection = new URL(this.spec).openConnection();
                z = true;
                if (openConnection instanceof HttpURLConnection) {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) openConnection;
                    httpURLConnection.setRequestMethod(this.requestMethod);
                    int responseCode = httpURLConnection.getResponseCode();
                    log(new StringBuffer().append("Result code for ").append(this.spec).append(" was ").append(responseCode).toString(), 3);
                    if (responseCode > 0) {
                        if (responseCode < this.errorsBeginAt) {
                            z = true;
                        }
                    }
                    z = false;
                }
            } catch (ProtocolException e) {
                throw new BuildException(new StringBuffer().append("Invalid HTTP protocol: ").append(this.requestMethod).toString(), e);
            } catch (IOException e2) {
                z = false;
            }
            return z;
        } catch (MalformedURLException e3) {
            throw new BuildException(new StringBuffer().append("Badly formed URL: ").append(this.spec).toString(), e3);
        }
    }

    public void setErrorsBeginAt(int i) {
        this.errorsBeginAt = i;
    }

    public void setRequestMethod(String str) {
        this.requestMethod = str == null ? "GET" : str.toUpperCase(Locale.ENGLISH);
    }

    public void setUrl(String str) {
        this.spec = str;
    }
}
