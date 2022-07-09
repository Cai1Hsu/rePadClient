package org.apache.tools.ant.types.resources;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.tar.TarEntry;
import org.apache.tools.tar.TarInputStream;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/TarResource.class */
public class TarResource extends ArchiveResource {
    private int gid;
    private int uid;
    private String userName = "";
    private String groupName = "";

    public TarResource() {
    }

    public TarResource(File file, TarEntry tarEntry) {
        super(file, true);
        setEntry(tarEntry);
    }

    public TarResource(Resource resource, TarEntry tarEntry) {
        super(resource, true);
        setEntry(tarEntry);
    }

    private void setEntry(TarEntry tarEntry) {
        if (tarEntry == null) {
            setExists(false);
            return;
        }
        setName(tarEntry.getName());
        setExists(true);
        setLastModified(tarEntry.getModTime().getTime());
        setDirectory(tarEntry.isDirectory());
        setSize(tarEntry.getSize());
        setMode(tarEntry.getMode());
        this.userName = tarEntry.getUserName();
        this.groupName = tarEntry.getGroupName();
        this.uid = tarEntry.getUserId();
        this.gid = tarEntry.getGroupId();
    }

    @Override // org.apache.tools.ant.types.resources.ArchiveResource
    protected void fetchEntry() {
        Throwable th;
        TarInputStream tarInputStream;
        TarInputStream tarInputStream2;
        IOException e;
        TarEntry nextEntry;
        try {
            try {
                tarInputStream2 = new TarInputStream(getArchive().getInputStream());
                do {
                    try {
                        nextEntry = tarInputStream2.getNextEntry();
                        if (nextEntry == null) {
                            if (tarInputStream2 != null) {
                                FileUtils.close(tarInputStream2);
                            }
                            setEntry(null);
                            return;
                        }
                    } catch (IOException e2) {
                        e = e2;
                        log(e.getMessage(), 4);
                        TarInputStream tarInputStream3 = tarInputStream2;
                        TarInputStream tarInputStream4 = tarInputStream2;
                        TarInputStream tarInputStream5 = tarInputStream2;
                        throw new BuildException(e);
                    } catch (Throwable th2) {
                        tarInputStream = tarInputStream2;
                        th = th2;
                        if (tarInputStream != null) {
                            FileUtils.close(tarInputStream);
                        }
                        throw th;
                    }
                } while (!nextEntry.getName().equals(getName()));
                setEntry(nextEntry);
                if (tarInputStream2 == null) {
                    return;
                }
                FileUtils.close(tarInputStream2);
            } catch (Throwable th3) {
                th = th3;
                tarInputStream = null;
            }
        } catch (IOException e3) {
            e = e3;
            tarInputStream2 = null;
        }
    }

    public int getGid() {
        int i;
        if (isReference()) {
            i = ((TarResource) getCheckedRef()).getGid();
        } else {
            checkEntry();
            i = this.gid;
        }
        return i;
    }

    public String getGroup() {
        String str;
        if (isReference()) {
            str = ((TarResource) getCheckedRef()).getGroup();
        } else {
            checkEntry();
            str = this.groupName;
        }
        return str;
    }

    @Override // org.apache.tools.ant.types.Resource
    public InputStream getInputStream() throws IOException {
        TarInputStream tarInputStream;
        TarEntry nextEntry;
        if (isReference()) {
            tarInputStream = ((Resource) getCheckedRef()).getInputStream();
        } else {
            tarInputStream = new TarInputStream(getArchive().getInputStream());
            do {
                nextEntry = tarInputStream.getNextEntry();
                if (nextEntry == null) {
                    FileUtils.close(tarInputStream);
                    throw new BuildException(new StringBuffer().append("no entry ").append(getName()).append(" in ").append(getArchive()).toString());
                }
            } while (!nextEntry.getName().equals(getName()));
        }
        return tarInputStream;
    }

    @Override // org.apache.tools.ant.types.Resource
    public OutputStream getOutputStream() throws IOException {
        if (isReference()) {
            return ((Resource) getCheckedRef()).getOutputStream();
        }
        throw new UnsupportedOperationException("Use the tar task for tar output.");
    }

    public int getUid() {
        int i;
        if (isReference()) {
            i = ((TarResource) getCheckedRef()).getUid();
        } else {
            checkEntry();
            i = this.uid;
        }
        return i;
    }

    public String getUserName() {
        String str;
        if (isReference()) {
            str = ((TarResource) getCheckedRef()).getUserName();
        } else {
            checkEntry();
            str = this.userName;
        }
        return str;
    }
}
