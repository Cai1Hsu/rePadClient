.class public Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;
.super Lorg/apache/tools/ant/types/FileSet;
.source "LibFileSet.java"


# instance fields
.field private includeImpl:Z

.field private includeURL:Z

.field private urlBase:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    return-void
.end method


# virtual methods
.method getUrlBase()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->urlBase:Ljava/lang/String;

    return-object v0
.end method

.method isIncludeImpl()Z
    .locals 1

    .prologue
    .line 106
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->includeImpl:Z

    return v0
.end method

.method isIncludeURL()Z
    .locals 1

    .prologue
    .line 97
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->includeURL:Z

    return v0
.end method

.method public setIncludeImpl(Z)V
    .locals 0
    .param p1, "includeImpl"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->includeImpl:Z

    .line 80
    return-void
.end method

.method public setIncludeUrl(Z)V
    .locals 0
    .param p1, "includeURL"    # Z

    .prologue
    .line 68
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->includeURL:Z

    .line 69
    return-void
.end method

.method public setUrlBase(Ljava/lang/String;)V
    .locals 0
    .param p1, "urlBase"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->urlBase:Ljava/lang/String;

    .line 89
    return-void
.end method
