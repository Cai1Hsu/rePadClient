package org.apache.tools.ant.taskdefs;

import android.support.v4.os.EnvironmentCompat;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.filters.util.ChainReaderHelper;
import org.apache.tools.ant.types.FilterChain;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/LoadResource.class */
public class LoadResource extends Task {
    private Resource src;
    private boolean failOnError = true;
    private boolean quiet = false;
    private String encoding = null;
    private String property = null;
    private final Vector filterChains = new Vector();

    public void addConfigured(ResourceCollection resourceCollection) {
        if (resourceCollection.size() != 1) {
            throw new BuildException("only single argument resource collections are supported");
        }
        this.src = (Resource) resourceCollection.iterator().next();
    }

    public final void addFilterChain(FilterChain filterChain) {
        this.filterChains.addElement(filterChain);
    }

    @Override // org.apache.tools.ant.Task
    public final void execute() throws BuildException {
        InputStream inputStream;
        BuildException e;
        Throwable th;
        long size;
        int i;
        BufferedInputStream bufferedInputStream;
        String str;
        if (this.src == null) {
            throw new BuildException("source resource not defined");
        }
        if (this.property == null) {
            throw new BuildException("output property not defined");
        }
        if (this.quiet && this.failOnError) {
            throw new BuildException("quiet and failonerror cannot both be set to true");
        }
        if (!this.src.isExists()) {
            String stringBuffer = new StringBuffer().append(this.src).append(" doesn't exist").toString();
            if (this.failOnError) {
                throw new BuildException(stringBuffer);
            }
            log(stringBuffer, this.quiet ? 1 : 0);
            return;
        }
        log(new StringBuffer().append("loading ").append(this.src).append(" into property ").append(this.property).toString(), 3);
        InputStream inputStream2 = null;
        InputStream inputStream3 = null;
        try {
            try {
                size = this.src.getSize();
                log(new StringBuffer().append("resource size = ").append(size != -1 ? String.valueOf(size) : EnvironmentCompat.MEDIA_UNKNOWN).toString(), 4);
                i = (int) size;
                inputStream = this.src.getInputStream();
                inputStream2 = inputStream;
                inputStream3 = inputStream;
                bufferedInputStream = new BufferedInputStream(inputStream);
            } catch (Throwable th2) {
                th = th2;
                inputStream = null;
            }
        } catch (IOException e2) {
            e = e2;
            inputStream = inputStream3;
        } catch (BuildException e3) {
            e = e3;
            inputStream = inputStream2;
        }
        try {
            InputStreamReader inputStreamReader = this.encoding == null ? new InputStreamReader(bufferedInputStream) : new InputStreamReader(bufferedInputStream, this.encoding);
            if (i != 0) {
                ChainReaderHelper chainReaderHelper = new ChainReaderHelper();
                if (size != -1) {
                    chainReaderHelper.setBufferSize(i);
                }
                chainReaderHelper.setPrimaryReader(inputStreamReader);
                chainReaderHelper.setFilterChains(this.filterChains);
                chainReaderHelper.setProject(getProject());
                str = chainReaderHelper.readFully(chainReaderHelper.getAssembledReader());
            } else {
                log(new StringBuffer().append("Do not set property ").append(this.property).append(" as its length is 0.").toString(), this.quiet ? 3 : 2);
                str = "";
            }
            if (str != null && str.length() > 0) {
                getProject().setNewProperty(this.property, str);
                log(new StringBuffer().append("loaded ").append(str.length()).append(" characters").toString(), 3);
                log(new StringBuffer().append(this.property).append(" := ").append(str).toString(), 4);
            }
            FileUtils.close(inputStream);
        } catch (IOException e4) {
            e = e4;
            InputStream inputStream4 = inputStream;
            InputStream inputStream5 = inputStream;
            String stringBuffer2 = new StringBuffer().append("Unable to load resource: ").append(e.toString()).toString();
            InputStream inputStream6 = inputStream;
            if (!this.failOnError) {
                log(stringBuffer2, this.quiet ? 3 : 0);
                FileUtils.close(inputStream);
                return;
            }
            InputStream inputStream7 = inputStream;
            InputStream inputStream8 = inputStream;
            BuildException buildException = new BuildException(stringBuffer2, e, getLocation());
            InputStream inputStream9 = inputStream;
            throw buildException;
        } catch (BuildException e5) {
            e = e5;
            if (this.failOnError) {
                InputStream inputStream10 = inputStream;
                throw e;
            }
            InputStream inputStream11 = inputStream;
            InputStream inputStream12 = inputStream;
            log(e.getMessage(), this.quiet ? 3 : 0);
            FileUtils.close(inputStream);
        } catch (Throwable th3) {
            th = th3;
            FileUtils.close(inputStream);
            throw th;
        }
    }

    public final void setEncoding(String str) {
        this.encoding = str;
    }

    public final void setFailonerror(boolean z) {
        this.failOnError = z;
    }

    public final void setProperty(String str) {
        this.property = str;
    }

    public void setQuiet(boolean z) {
        this.quiet = z;
        if (z) {
            this.failOnError = false;
        }
    }
}
