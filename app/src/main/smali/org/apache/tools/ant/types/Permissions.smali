.class public Lorg/apache/tools/ant/types/Permissions;
.super Ljava/lang/Object;
.source "Permissions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/Permissions$1;,
        Lorg/apache/tools/ant/types/Permissions$Permission;,
        Lorg/apache/tools/ant/types/Permissions$MySM;
    }
.end annotation


# static fields
.field private static final PARAMS:[Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;


# instance fields
.field private active:Z

.field private delegateToOldSM:Z

.field private granted:Ljava/security/Permissions;

.field private grantedPermissions:Ljava/util/List;

.field private origSm:Ljava/lang/SecurityManager;

.field private revokedPermissions:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 56
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v0, Lorg/apache/tools/ant/types/Permissions;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/tools/ant/types/Permissions;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/Permissions;->class$java$lang$String:Ljava/lang/Class;

    :goto_0
    aput-object v0, v1, v2

    const/4 v2, 0x1

    sget-object v0, Lorg/apache/tools/ant/types/Permissions;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/tools/ant/types/Permissions;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/Permissions;->class$java$lang$String:Ljava/lang/Class;

    :goto_1
    aput-object v0, v1, v2

    sput-object v1, Lorg/apache/tools/ant/types/Permissions;->PARAMS:[Ljava/lang/Class;

    return-void

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/Permissions;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/types/Permissions;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/Permissions;-><init>(Z)V

    .line 64
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2
    .param p1, "delegateToOldSM"    # Z

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->grantedPermissions:Ljava/util/List;

    .line 49
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->revokedPermissions:Ljava/util/List;

    .line 50
    iput-object v1, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    .line 51
    iput-object v1, p0, Lorg/apache/tools/ant/types/Permissions;->origSm:Ljava/lang/SecurityManager;

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/Permissions;->active:Z

    .line 73
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/Permissions;->delegateToOldSM:Z

    .line 74
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/types/Permissions;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/Permissions;

    .prologue
    .line 46
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/Permissions;->active:Z

    return v0
.end method

.method static access$200(Lorg/apache/tools/ant/types/Permissions;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/Permissions;

    .prologue
    .line 46
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/Permissions;->delegateToOldSM:Z

    return v0
.end method

.method static access$300(Lorg/apache/tools/ant/types/Permissions;)Ljava/security/Permissions;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/Permissions;

    .prologue
    .line 46
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    return-object v0
.end method

.method static access$400(Lorg/apache/tools/ant/types/Permissions;)Ljava/lang/SecurityManager;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/Permissions;

    .prologue
    .line 46
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->origSm:Ljava/lang/SecurityManager;

    return-object v0
.end method

.method static access$500(Lorg/apache/tools/ant/types/Permissions;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/Permissions;

    .prologue
    .line 46
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->revokedPermissions:Ljava/util/List;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 56
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private createPermission(Lorg/apache/tools/ant/types/Permissions$Permission;)Ljava/security/Permission;
    .locals 10
    .param p1, "permission"    # Lorg/apache/tools/ant/types/Permissions$Permission;

    .prologue
    .line 156
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 157
    .local v1, "clazz":Ljava/lang/Class;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getName()Ljava/lang/String;

    move-result-object v4

    .line 158
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getActions()Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "actions":Ljava/lang/String;
    sget-object v5, Lorg/apache/tools/ant/types/Permissions;->PARAMS:[Ljava/lang/Class;

    invoke-virtual {v1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 160
    .local v2, "ctr":Ljava/lang/reflect/Constructor;
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    const/4 v6, 0x1

    aput-object v0, v5, v6

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/Permission;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    .end local v0    # "actions":Ljava/lang/String;
    .end local v1    # "clazz":Ljava/lang/Class;
    .end local v2    # "ctr":Ljava/lang/reflect/Constructor;
    .end local v4    # "name":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 162
    :catch_0
    move-exception v3

    .line 164
    .local v3, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/security/UnresolvedPermission;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getActions()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v5, v6, v7, v8, v9}, Ljava/security/UnresolvedPermission;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/security/cert/Certificate;)V

    goto :goto_0
.end method

.method private init()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v3, Ljava/security/Permissions;

    invoke-direct {v3}, Ljava/security/Permissions;-><init>()V

    iput-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    .line 111
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->revokedPermissions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 112
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Permissions$Permission;

    .line 113
    .local v1, "p":Lorg/apache/tools/ant/types/Permissions$Permission;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getClassName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 114
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Revoked permission "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " does not contain a class."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 117
    .end local v1    # "p":Lorg/apache/tools/ant/types/Permissions$Permission;
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->grantedPermissions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 118
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Permissions$Permission;

    .line 119
    .restart local v1    # "p":Lorg/apache/tools/ant/types/Permissions$Permission;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Permissions$Permission;->getClassName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    .line 120
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Granted permission "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " does not contain a class."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 123
    :cond_2
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/types/Permissions;->createPermission(Lorg/apache/tools/ant/types/Permissions$Permission;)Ljava/security/Permission;

    move-result-object v2

    .line 124
    .local v2, "perm":Ljava/security/Permission;
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    invoke-virtual {v3, v2}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    goto :goto_0

    .line 128
    .end local v1    # "p":Lorg/apache/tools/ant/types/Permissions$Permission;
    .end local v2    # "perm":Ljava/security/Permission;
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/net/SocketPermission;

    const-string/jumbo v5, "localhost:1024-"

    const-string/jumbo v6, "listen"

    invoke-direct {v4, v5, v6}, Ljava/net/SocketPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 129
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.version"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 130
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vendor"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 131
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vendor.url"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 132
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.class.version"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 133
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "os.name"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 134
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "os.version"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 135
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "os.arch"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 136
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "file.encoding"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 137
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "file.separator"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 138
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "path.separator"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 139
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "line.separator"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 140
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.specification.version"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 141
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.specification.vendor"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 142
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.specification.name"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 143
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vm.specification.version"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 144
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vm.specification.vendor"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 145
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vm.specification.name"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 146
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vm.version"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 147
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vm.vendor"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 148
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions;->granted:Ljava/security/Permissions;

    new-instance v4, Ljava/util/PropertyPermission;

    const-string/jumbo v5, "java.vm.name"

    const-string/jumbo v6, "read"

    invoke-direct {v4, v5, v6}, Ljava/util/PropertyPermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/security/Permissions;->add(Ljava/security/Permission;)V

    .line 149
    return-void
.end method


# virtual methods
.method public addConfiguredGrant(Lorg/apache/tools/ant/types/Permissions$Permission;)V
    .locals 1
    .param p1, "perm"    # Lorg/apache/tools/ant/types/Permissions$Permission;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->grantedPermissions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    return-void
.end method

.method public addConfiguredRevoke(Lorg/apache/tools/ant/types/Permissions$Permission;)V
    .locals 1
    .param p1, "perm"    # Lorg/apache/tools/ant/types/Permissions$Permission;

    .prologue
    .line 89
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->revokedPermissions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    return-void
.end method

.method public declared-synchronized restoreSecurityManager()V
    .locals 1

    .prologue
    .line 173
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/Permissions;->active:Z

    .line 174
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->origSm:Ljava/lang/SecurityManager;

    invoke-static {v0}, Ljava/lang/System;->setSecurityManager(Ljava/lang/SecurityManager;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    monitor-exit p0

    return-void

    .line 173
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSecurityManager()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 100
    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Permissions;->origSm:Ljava/lang/SecurityManager;

    .line 101
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Permissions;->init()V

    .line 102
    new-instance v0, Lorg/apache/tools/ant/types/Permissions$MySM;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/types/Permissions$MySM;-><init>(Lorg/apache/tools/ant/types/Permissions;Lorg/apache/tools/ant/types/Permissions$1;)V

    invoke-static {v0}, Ljava/lang/System;->setSecurityManager(Ljava/lang/SecurityManager;)V

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/Permissions;->active:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    monitor-exit p0

    return-void

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
