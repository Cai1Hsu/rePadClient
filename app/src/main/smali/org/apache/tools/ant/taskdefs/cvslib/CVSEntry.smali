.class public Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
.super Ljava/lang/Object;
.source "CVSEntry.java"


# instance fields
.field private author:Ljava/lang/String;

.field private final comment:Ljava/lang/String;

.field private date:Ljava/util/Date;

.field private final files:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "author"    # Ljava/lang/String;
    .param p3, "comment"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->files:Ljava/util/Vector;

    .line 40
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->date:Ljava/util/Date;

    .line 41
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->author:Ljava/lang/String;

    .line 42
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->comment:Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method public addFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "revision"    # Ljava/lang/String;

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->files:Ljava/util/Vector;

    new-instance v1, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;

    invoke-direct {v1, p1, p2}, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 52
    return-void
.end method

.method public addFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "revision"    # Ljava/lang/String;
    .param p3, "previousRevision"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->files:Ljava/util/Vector;

    new-instance v1, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;

    invoke-direct {v1, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/cvslib/RCSFile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 62
    return-void
.end method

.method public getAuthor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getFiles()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->files:Ljava/util/Vector;

    return-object v0
.end method

.method public setAuthor(Ljava/lang/String;)V
    .locals 0
    .param p1, "author"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->author:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 109
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getAuthor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getFiles()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
