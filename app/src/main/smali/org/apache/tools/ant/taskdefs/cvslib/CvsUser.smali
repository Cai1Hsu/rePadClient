.class public Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;
.super Ljava/lang/Object;
.source "CvsUser.java"


# instance fields
.field private displayName:Ljava/lang/String;

.field private userID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDisplayname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->userID:Ljava/lang/String;

    return-object v0
.end method

.method public setDisplayname(Ljava/lang/String;)V
    .locals 0
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->displayName:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setUserid(Ljava/lang/String;)V
    .locals 0
    .param p1, "userID"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->userID:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->userID:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 81
    const-string/jumbo v0, "Username attribute must be set."

    .line 83
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Username attribute must be set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 85
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->displayName:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 86
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Displayname attribute must be set for userID "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->userID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 89
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 91
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    return-void
.end method
