.class public Lorg/apache/tools/ant/types/TarFileSet;
.super Lorg/apache/tools/ant/types/ArchiveFileSet;
.source "TarFileSet.java"


# instance fields
.field private gid:I

.field private groupIdSet:Z

.field private groupName:Ljava/lang/String;

.field private groupNameSet:Z

.field private uid:I

.field private userIdSet:Z

.field private userName:Ljava/lang/String;

.field private userNameSet:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;-><init>()V

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userName:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupName:Ljava/lang/String;

    .line 47
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userName:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupName:Ljava/lang/String;

    .line 55
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/TarFileSet;)V
    .locals 1
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/TarFileSet;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;-><init>(Lorg/apache/tools/ant/types/ArchiveFileSet;)V

    .line 39
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userName:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupName:Ljava/lang/String;

    .line 63
    return-void
.end method

.method private checkTarFileSetAttributesAllowed()V
    .locals 2

    .prologue
    .line 259
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lorg/apache/tools/ant/types/TarFileSet;

    if-eqz v0, :cond_1

    .line 264
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->checkAttributesAllowed()V

    .line 266
    :cond_1
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 245
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/TarFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/TarFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 248
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected configureFileSet(Lorg/apache/tools/ant/types/ArchiveFileSet;)V
    .locals 2
    .param p1, "zfs"    # Lorg/apache/tools/ant/types/ArchiveFileSet;

    .prologue
    .line 229
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->configureFileSet(Lorg/apache/tools/ant/types/ArchiveFileSet;)V

    .line 230
    instance-of v1, p1, Lorg/apache/tools/ant/types/TarFileSet;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 231
    check-cast v0, Lorg/apache/tools/ant/types/TarFileSet;

    .line 232
    .local v0, "tfs":Lorg/apache/tools/ant/types/TarFileSet;
    iget-object v1, p0, Lorg/apache/tools/ant/types/TarFileSet;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/TarFileSet;->setUserName(Ljava/lang/String;)V

    .line 233
    iget-object v1, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/TarFileSet;->setGroup(Ljava/lang/String;)V

    .line 234
    iget v1, p0, Lorg/apache/tools/ant/types/TarFileSet;->uid:I

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/TarFileSet;->setUid(I)V

    .line 235
    iget v1, p0, Lorg/apache/tools/ant/types/TarFileSet;->gid:I

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/TarFileSet;->setGid(I)V

    .line 237
    .end local v0    # "tfs":Lorg/apache/tools/ant/types/TarFileSet;
    :cond_0
    return-void
.end method

.method public getGid()I
    .locals 1

    .prologue
    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/TarFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getGid()I

    move-result v0

    .line 167
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->gid:I

    goto :goto_0
.end method

.method public getGroup()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/TarFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getGroup()Ljava/lang/String;

    move-result-object v0

    .line 139
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupName:Ljava/lang/String;

    goto :goto_0
.end method

.method protected getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;
    .locals 5
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 208
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/TarFileSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 209
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v1

    .line 210
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Lorg/apache/tools/ant/types/TarFileSet;

    if-eqz v3, :cond_0

    .line 211
    check-cast v1, Lorg/apache/tools/ant/types/AbstractFileSet;

    .line 215
    .end local v1    # "o":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 212
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v3, v1, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v3, :cond_1

    .line 213
    new-instance v2, Lorg/apache/tools/ant/types/TarFileSet;

    check-cast v1, Lorg/apache/tools/ant/types/FileSet;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-direct {v2, v1}, Lorg/apache/tools/ant/types/TarFileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 214
    .local v2, "zfs":Lorg/apache/tools/ant/types/TarFileSet;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/TarFileSet;->configureFileSet(Lorg/apache/tools/ant/types/ArchiveFileSet;)V

    move-object v1, v2

    .line 215
    goto :goto_0

    .line 217
    .end local v2    # "zfs":Lorg/apache/tools/ant/types/TarFileSet;
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " doesn\'t denote a tarfileset or a fileset"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getUid()I
    .locals 1

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/TarFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getUid()I

    move-result v0

    .line 111
    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->uid:I

    goto :goto_0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/TarFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getUserName()Ljava/lang/String;

    move-result-object v0

    .line 83
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userName:Ljava/lang/String;

    goto :goto_0
.end method

.method public hasGroupBeenSet()Z
    .locals 1

    .prologue
    .line 146
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupNameSet:Z

    return v0
.end method

.method public hasGroupIdBeenSet()Z
    .locals 1

    .prologue
    .line 174
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupIdSet:Z

    return v0
.end method

.method public hasUserIdBeenSet()Z
    .locals 1

    .prologue
    .line 118
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userIdSet:Z

    return v0
.end method

.method public hasUserNameBeenSet()Z
    .locals 1

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userNameSet:Z

    return v0
.end method

.method protected newArchiveScanner()Lorg/apache/tools/ant/types/ArchiveScanner;
    .locals 1

    .prologue
    .line 182
    new-instance v0, Lorg/apache/tools/ant/types/TarScanner;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/TarScanner;-><init>()V

    .line 183
    .local v0, "zs":Lorg/apache/tools/ant/types/TarScanner;
    return-object v0
.end method

.method public setGid(I)V
    .locals 1
    .param p1, "gid"    # I

    .prologue
    .line 155
    invoke-direct {p0}, Lorg/apache/tools/ant/types/TarFileSet;->checkTarFileSetAttributesAllowed()V

    .line 156
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupIdSet:Z

    .line 157
    iput p1, p0, Lorg/apache/tools/ant/types/TarFileSet;->gid:I

    .line 158
    return-void
.end method

.method public setGroup(Ljava/lang/String;)V
    .locals 1
    .param p1, "groupName"    # Ljava/lang/String;

    .prologue
    .line 127
    invoke-direct {p0}, Lorg/apache/tools/ant/types/TarFileSet;->checkTarFileSetAttributesAllowed()V

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupNameSet:Z

    .line 129
    iput-object p1, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupName:Ljava/lang/String;

    .line 130
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 195
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userNameSet:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userIdSet:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupNameSet:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->groupIdSet:Z

    if-eqz v0, :cond_1

    .line 196
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/TarFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 198
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 199
    return-void
.end method

.method public setUid(I)V
    .locals 1
    .param p1, "uid"    # I

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/apache/tools/ant/types/TarFileSet;->checkTarFileSetAttributesAllowed()V

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userIdSet:Z

    .line 101
    iput p1, p0, Lorg/apache/tools/ant/types/TarFileSet;->uid:I

    .line 102
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 1
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/apache/tools/ant/types/TarFileSet;->checkTarFileSetAttributesAllowed()V

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/TarFileSet;->userNameSet:Z

    .line 73
    iput-object p1, p0, Lorg/apache/tools/ant/types/TarFileSet;->userName:Ljava/lang/String;

    .line 74
    return-void
.end method
