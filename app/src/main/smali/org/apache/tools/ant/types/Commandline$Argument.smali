.class public Lorg/apache/tools/ant/types/Commandline$Argument;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Commandline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Commandline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Argument"
.end annotation


# instance fields
.field private parts:[Ljava/lang/String;

.field private prefix:Ljava/lang/String;

.field private suffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 102
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 106
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->prefix:Ljava/lang/String;

    .line 107
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->suffix:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getParts()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 191
    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    array-length v2, v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->prefix:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->suffix:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 193
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    .line 199
    :cond_1
    return-object v0

    .line 195
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    array-length v2, v2

    new-array v0, v2, [Ljava/lang/String;

    .line 196
    .local v0, "fullParts":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 197
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->prefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->suffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public setFile(Ljava/io/File;)V
    .locals 3
    .param p1, "value"    # Ljava/io/File;

    .prologue
    .line 161
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    .line 162
    return-void
.end method

.method public setLine(Ljava/lang/String;)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 124
    if-nez p1, :cond_0

    .line 128
    :goto_0
    return-void

    .line 127
    :cond_0
    invoke-static {p1}, Lorg/apache/tools/ant/types/Commandline;->translateCommandline(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    goto :goto_0
.end method

.method public setPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 3
    .param p1, "value"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 138
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    .line 139
    return-void
.end method

.method public setPathref(Lorg/apache/tools/ant/types/Reference;)V
    .locals 4
    .param p1, "value"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 149
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Commandline$Argument;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 150
    .local v0, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 151
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    iput-object v1, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    .line 152
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 172
    if-eqz p1, :cond_0

    .end local p1    # "prefix":Ljava/lang/String;
    :goto_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->prefix:Ljava/lang/String;

    .line 173
    return-void

    .line 172
    .restart local p1    # "prefix":Ljava/lang/String;
    :cond_0
    const-string/jumbo p1, ""

    goto :goto_0
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 183
    if-eqz p1, :cond_0

    .end local p1    # "suffix":Ljava/lang/String;
    :goto_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->suffix:Ljava/lang/String;

    .line 184
    return-void

    .line 183
    .restart local p1    # "suffix":Ljava/lang/String;
    :cond_0
    const-string/jumbo p1, ""

    goto :goto_0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 115
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Argument;->parts:[Ljava/lang/String;

    .line 116
    return-void
.end method
