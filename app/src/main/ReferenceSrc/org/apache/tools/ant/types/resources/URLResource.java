package org.apache.tools.ant.types.resources;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/URLResource.class */
public class URLResource extends Resource implements URLProvider {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final int NULL_URL = Resource.getMagicNumber("null URL".getBytes());
    private URL baseURL;
    private URLConnection conn;
    private String relPath;
    private URL url;

    public URLResource() {
    }

    public URLResource(File file) {
        setFile(file);
    }

    public URLResource(String str) {
        this(newURL(str));
    }

    public URLResource(URL url) {
        setURL(url);
    }

    public URLResource(URLProvider uRLProvider) {
        setURL(uRLProvider.getURL());
    }

    private void close() {
        synchronized (this) {
            FileUtils.close(this.conn);
            this.conn = null;
        }
    }

    private boolean isExists(boolean z) {
        boolean z2;
        synchronized (this) {
            if (getURL() == null) {
                z2 = false;
            } else {
                try {
                    connect(3);
                    z2 = true;
                    if (z) {
                        close();
                        z2 = true;
                    }
                } catch (IOException e) {
                    z2 = false;
                    if (z) {
                        close();
                        z2 = false;
                    }
                } catch (Throwable th) {
                    if (z) {
                        close();
                    }
                    throw th;
                }
            }
        }
        return z2;
    }

    private static URL newURL(String str) {
        try {
            return new URL(str);
        } catch (MalformedURLException e) {
            throw new BuildException(e);
        }
    }

    protected void connect() throws IOException {
        connect(0);
    }

    protected void connect(int i) throws IOException {
        synchronized (this) {
            URL url = getURL();
            if (url == null) {
                throw new BuildException("URL not set");
            }
            if (this.conn == null) {
                try {
                    this.conn = url.openConnection();
                    this.conn.connect();
                } catch (IOException e) {
                    log(e.toString(), i);
                    this.conn = null;
                    throw e;
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean equals(Object obj) {
        boolean z = true;
        synchronized (this) {
            if (this != obj) {
                if (isReference()) {
                    z = getCheckedRef().equals(obj);
                } else if (!obj.getClass().equals(getClass())) {
                    z = false;
                } else {
                    URLResource uRLResource = (URLResource) obj;
                    if (getURL() != null) {
                        z = getURL().equals(uRLResource.getURL());
                    } else if (uRLResource.getURL() != null) {
                        z = false;
                    }
                }
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        InputStream inputStream;
        synchronized (this) {
            if (isReference()) {
                inputStream = ((Resource) getCheckedRef()).getInputStream();
            } else {
                connect();
                inputStream = this.conn.getInputStream();
                this.conn = null;
            }
        }
        return inputStream;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getLastModified() {
        long lastModified;
        synchronized (this) {
            lastModified = isReference() ? ((Resource) getCheckedRef()).getLastModified() : !isExists(false) ? 0L : this.conn.getLastModified();
        }
        return lastModified;
    }

    @Override // org.apache.tools.ant.types.Resource
    public String getName() {
        String str;
        synchronized (this) {
            if (isReference()) {
                str = ((Resource) getCheckedRef()).getName();
            } else {
                String file = getURL().getFile();
                str = file;
                if (!"".equals(file)) {
                    str = file.substring(1);
                }
            }
        }
        return str;
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        OutputStream outputStream;
        synchronized (this) {
            if (isReference()) {
                outputStream = ((Resource) getCheckedRef()).getOutputStream();
            } else {
                connect();
                outputStream = this.conn.getOutputStream();
                this.conn = null;
            }
        }
        return outputStream;
    }

    @Override // org.apache.tools.ant.types.Resource
    public long getSize() {
        long j;
        synchronized (this) {
            if (isReference()) {
                j = ((Resource) getCheckedRef()).getSize();
            } else if (!isExists(false)) {
                j = 0;
            } else {
                try {
                    connect();
                    j = this.conn.getContentLength();
                    close();
                } catch (IOException e) {
                    j = -1;
                }
            }
        }
        return j;
    }

    @Override // org.apache.tools.ant.types.resources.URLProvider
    public URL getURL() {
        URL url;
        synchronized (this) {
            if (isReference()) {
                url = ((URLResource) getCheckedRef()).getURL();
            } else {
                if (this.url == null && this.baseURL != null) {
                    if (this.relPath == null) {
                        throw new BuildException("must provide relativePath attribute when using baseURL.");
                    }
                    try {
                        this.url = new URL(this.baseURL, this.relPath);
                    } catch (MalformedURLException e) {
                        throw new BuildException(e);
                    }
                }
                url = this.url;
            }
        }
        return url;
    }

    @Override // org.apache.tools.ant.types.Resource
    public int hashCode() {
        int hashCode;
        synchronized (this) {
            if (isReference()) {
                hashCode = getCheckedRef().hashCode();
            } else {
                hashCode = (getURL() == null ? NULL_URL : getURL().hashCode()) * MAGIC;
            }
        }
        return hashCode;
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isDirectory() {
        boolean isDirectory;
        synchronized (this) {
            isDirectory = isReference() ? ((Resource) getCheckedRef()).isDirectory() : getName().endsWith("/");
        }
        return isDirectory;
    }

    @Override // org.apache.tools.ant.types.Resource
    public boolean isExists() {
        boolean isExists;
        synchronized (this) {
            isExists = isReference() ? ((Resource) getCheckedRef()).isExists() : isExists(false);
        }
        return isExists;
    }

    public void setBaseURL(URL url) {
        synchronized (this) {
            checkAttributesAllowed();
            if (this.url != null) {
                throw new BuildException("can't define URL and baseURL attribute");
            }
            this.baseURL = url;
        }
    }

    public void setFile(File file) {
        synchronized (this) {
            try {
                setURL(FILE_UTILS.getFileURL(file));
            } catch (MalformedURLException e) {
                throw new BuildException(e);
            }
        }
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        synchronized (this) {
            if (this.url != null || this.baseURL != null || this.relPath != null) {
                throw tooManyAttributes();
            }
            super.setRefid(reference);
        }
    }

    public void setRelativePath(String str) {
        synchronized (this) {
            checkAttributesAllowed();
            if (this.url != null) {
                throw new BuildException("can't define URL and relativePath attribute");
            }
            this.relPath = str;
        }
    }

    public void setURL(URL url) {
        synchronized (this) {
            checkAttributesAllowed();
            this.url = url;
        }
    }

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public String toString() {
        String obj;
        synchronized (this) {
            obj = isReference() ? getCheckedRef().toString() : String.valueOf(getURL());
        }
        return obj;
    }
}
