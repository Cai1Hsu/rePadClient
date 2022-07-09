.class public Lorg/apache/tools/ant/types/Permissions$Permission;
.super Ljava/lang/Object;
.source "Permissions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Permissions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Permission"
.end annotation


# instance fields
.field private actionString:Ljava/lang/String;

.field private actions:Ljava/util/Set;

.field private className:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseActions(Ljava/lang/String;)Ljava/util/Set;
    .locals 4
    .param p1, "actions"    # Ljava/lang/String;

    .prologue
    .line 338
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 339
    .local v1, "result":Ljava/util/Set;
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ","

    invoke-direct {v2, p1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    .local v2, "tk":Ljava/util/StringTokenizer;
    :cond_0
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 341
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, "item":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 343
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 346
    .end local v0    # "item":Ljava/lang/String;
    :cond_1
    return-object v1
.end method


# virtual methods
.method public getActions()Ljava/lang/String;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->actionString:Ljava/lang/String;

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 264
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    return-object v0
.end method

.method matches(Ljava/security/Permission;)Z
    .locals 6
    .param p1, "perm"    # Ljava/security/Permission;

    .prologue
    const/4 v2, 0x0

    .line 307
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->className:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 330
    :cond_0
    :goto_0
    return v2

    .line 310
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 311
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    const-string/jumbo v4, "*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 312
    invoke-virtual {p1}, Ljava/security/Permission;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 321
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->actions:Ljava/util/Set;

    if-eqz v3, :cond_3

    .line 322
    invoke-virtual {p1}, Ljava/security/Permission;->getActions()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/types/Permissions$Permission;->parseActions(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    .line 323
    .local v0, "as":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    .line 324
    .local v1, "size":I
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->actions:Ljava/util/Set;

    invoke-interface {v0, v3}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 325
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v3

    if-eq v3, v1, :cond_0

    .line 330
    .end local v0    # "as":Ljava/util/Set;
    .end local v1    # "size":I
    :cond_3
    const/4 v2, 0x1

    goto :goto_0

    .line 316
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/security/Permission;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0
.end method

.method public setActions(Ljava/lang/String;)V
    .locals 1
    .param p1, "actions"    # Ljava/lang/String;

    .prologue
    .line 288
    iput-object p1, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->actionString:Ljava/lang/String;

    .line 289
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 290
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/Permissions$Permission;->parseActions(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->actions:Ljava/util/Set;

    .line 292
    :cond_0
    return-void
.end method

.method public setClass(Ljava/lang/String;)V
    .locals 1
    .param p1, "aClass"    # Ljava/lang/String;

    .prologue
    .line 256
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->className:Ljava/lang/String;

    .line 257
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "aName"    # Ljava/lang/String;

    .prologue
    .line 272
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    .line 273
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 354
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Permission: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->className:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " (\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\", \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/Permissions$Permission;->actions:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
