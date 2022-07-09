package org.apache.tools.ant.types;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/types/TarFileSet.class */
public class TarFileSet extends ArchiveFileSet {
    private int gid;
    private boolean groupIdSet;
    private boolean groupNameSet;
    private int uid;
    private boolean userIdSet;
    private boolean userNameSet;
    private String userName = "";
    private String groupName = "";

    public TarFileSet() {
    }

    protected TarFileSet(FileSet fileSet) {
        super(fileSet);
    }

    protected TarFileSet(TarFileSet tarFileSet) {
        super((ArchiveFileSet) tarFileSet);
    }

    private void checkTarFileSetAttributesAllowed() {
        if (getProject() == null || (isReference() && (getRefid().getReferencedObject(getProject()) instanceof TarFileSet))) {
            checkAttributesAllowed();
        }
    }

    @Override // org.apache.tools.ant.types.ArchiveFileSet, org.apache.tools.ant.types.FileSet, org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        return isReference() ? ((TarFileSet) getRef(getProject())).clone() : super.clone();
    }

    @Override // org.apache.tools.ant.types.ArchiveFileSet
    protected void configureFileSet(ArchiveFileSet archiveFileSet) {
        super.configureFileSet(archiveFileSet);
        if (archiveFileSet instanceof TarFileSet) {
            TarFileSet tarFileSet = (TarFileSet) archiveFileSet;
            tarFileSet.setUserName(this.userName);
            tarFileSet.setGroup(this.groupName);
            tarFileSet.setUid(this.uid);
            tarFileSet.setGid(this.gid);
        }
    }

    public int getGid() {
        return isReference() ? ((TarFileSet) getCheckedRef()).getGid() : this.gid;
    }

    public String getGroup() {
        return isReference() ? ((TarFileSet) getCheckedRef()).getGroup() : this.groupName;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [org.apache.tools.ant.types.AbstractFileSet] */
    @Override // org.apache.tools.ant.types.AbstractFileSet
    protected AbstractFileSet getRef(Project project) {
        TarFileSet tarFileSet;
        dieOnCircularReference(project);
        Object referencedObject = getRefid().getReferencedObject(project);
        if (referencedObject instanceof TarFileSet) {
            tarFileSet = (AbstractFileSet) referencedObject;
        } else if (!(referencedObject instanceof FileSet)) {
            throw new BuildException(new StringBuffer().append(getRefid().getRefId()).append(" doesn't denote a tarfileset or a fileset").toString());
        } else {
            tarFileSet = new TarFileSet((FileSet) referencedObject);
            configureFileSet(tarFileSet);
        }
        return tarFileSet;
    }

    public int getUid() {
        return isReference() ? ((TarFileSet) getCheckedRef()).getUid() : this.uid;
    }

    public String getUserName() {
        return isReference() ? ((TarFileSet) getCheckedRef()).getUserName() : this.userName;
    }

    public boolean hasGroupBeenSet() {
        return this.groupNameSet;
    }

    public boolean hasGroupIdBeenSet() {
        return this.groupIdSet;
    }

    public boolean hasUserIdBeenSet() {
        return this.userIdSet;
    }

    public boolean hasUserNameBeenSet() {
        return this.userNameSet;
    }

    @Override // org.apache.tools.ant.types.ArchiveFileSet
    protected ArchiveScanner newArchiveScanner() {
        return new TarScanner();
    }

    public void setGid(int i) {
        checkTarFileSetAttributesAllowed();
        this.groupIdSet = true;
        this.gid = i;
    }

    public void setGroup(String str) {
        checkTarFileSetAttributesAllowed();
        this.groupNameSet = true;
        this.groupName = str;
    }

    @Override // org.apache.tools.ant.types.AbstractFileSet, org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.userNameSet || this.userIdSet || this.groupNameSet || this.groupIdSet) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    public void setUid(int i) {
        checkTarFileSetAttributesAllowed();
        this.userIdSet = true;
        this.uid = i;
    }

    public void setUserName(String str) {
        checkTarFileSetAttributesAllowed();
        this.userNameSet = true;
        this.userName = str;
    }
}
