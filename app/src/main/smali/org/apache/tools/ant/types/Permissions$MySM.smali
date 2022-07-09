.class Lorg/apache/tools/ant/types/Permissions$MySM;
.super Ljava/lang/SecurityManager;
.source "Permissions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Permissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MySM"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/Permissions;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/types/Permissions;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/Permissions;

    .prologue
    .line 181
    iput-object p1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-direct {p0}, Ljava/lang/SecurityManager;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/types/Permissions;Lorg/apache/tools/ant/types/Permissions$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/types/Permissions;
    .param p2, "x1"    # Lorg/apache/tools/ant/types/Permissions$1;

    .prologue
    .line 181
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/Permissions$MySM;-><init>(Lorg/apache/tools/ant/types/Permissions;)V

    return-void
.end method

.method private checkRevoked(Ljava/security/Permission;)V
    .locals 4
    .param p1, "perm"    # Ljava/security/Permission;

    .prologue
    .line 235
    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-static {v1}, Lorg/apache/tools/ant/types/Permissions;->access$500(Lorg/apache/tools/ant/types/Permissions;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 236
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Permissions$Permission;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->matches(Ljava/security/Permission;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 237
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Permission "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " was revoked."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    :cond_1
    return-void
.end method


# virtual methods
.method public checkExit(I)V
    .locals 4
    .param p1, "status"    # I

    .prologue
    .line 192
    new-instance v1, Ljava/lang/RuntimePermission;

    const-string/jumbo v2, "exitVM"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/lang/RuntimePermission;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .local v1, "perm":Ljava/security/Permission;
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/Permissions$MySM;->checkPermission(Ljava/security/Permission;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    return-void

    .line 195
    :catch_0
    move-exception v0

    .line 196
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v2, Lorg/apache/tools/ant/ExitException;

    invoke-virtual {v0}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Lorg/apache/tools/ant/ExitException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public checkPermission(Ljava/security/Permission;)V
    .locals 4
    .param p1, "perm"    # Ljava/security/Permission;

    .prologue
    .line 207
    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-static {v1}, Lorg/apache/tools/ant/types/Permissions;->access$100(Lorg/apache/tools/ant/types/Permissions;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 208
    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-static {v1}, Lorg/apache/tools/ant/types/Permissions;->access$200(Lorg/apache/tools/ant/types/Permissions;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Ljava/security/Permission;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "exitVM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 209
    const/4 v0, 0x0

    .line 210
    .local v0, "permOK":Z
    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-static {v1}, Lorg/apache/tools/ant/types/Permissions;->access$300(Lorg/apache/tools/ant/types/Permissions;)Ljava/security/Permissions;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/security/Permissions;->implies(Ljava/security/Permission;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 211
    const/4 v0, 0x1

    .line 213
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/Permissions$MySM;->checkRevoked(Ljava/security/Permission;)V

    .line 218
    if-nez v0, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-static {v1}, Lorg/apache/tools/ant/types/Permissions;->access$400(Lorg/apache/tools/ant/types/Permissions;)Ljava/lang/SecurityManager;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 219
    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-static {v1}, Lorg/apache/tools/ant/types/Permissions;->access$400(Lorg/apache/tools/ant/types/Permissions;)Ljava/lang/SecurityManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 228
    .end local v0    # "permOK":Z
    :cond_1
    :goto_0
    return-void

    .line 222
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$MySM;->this$0:Lorg/apache/tools/ant/types/Permissions;

    invoke-static {v1}, Lorg/apache/tools/ant/types/Permissions;->access$300(Lorg/apache/tools/ant/types/Permissions;)Ljava/security/Permissions;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/security/Permissions;->implies(Ljava/security/Permission;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 223
    new-instance v1, Ljava/lang/SecurityException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Permission "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " was not granted."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 225
    :cond_3
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/Permissions$MySM;->checkRevoked(Ljava/security/Permission;)V

    goto :goto_0
.end method
