.class public Lorg/apache/tools/ant/taskdefs/Length;
.super Lorg/apache/tools/ant/Task;
.source "Length.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Length$AllHandler;,
        Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;,
        Lorg/apache/tools/ant/taskdefs/Length$EachHandler;,
        Lorg/apache/tools/ant/taskdefs/Length$Handler;,
        Lorg/apache/tools/ant/taskdefs/Length$When;,
        Lorg/apache/tools/ant/taskdefs/Length$FileMode;
    }
.end annotation


# static fields
.field private static final ALL:Ljava/lang/String; = "all"

.field private static final EACH:Ljava/lang/String; = "each"

.field private static final LENGTH_REQUIRED:Ljava/lang/String; = "Use of the Length condition requires that the length attribute be set."

.field private static final STRING:Ljava/lang/String; = "string"


# instance fields
.field private length:Ljava/lang/Long;

.field private mode:Ljava/lang/String;

.field private property:Ljava/lang/String;

.field private resources:Lorg/apache/tools/ant/types/resources/Resources;

.field private string:Ljava/lang/String;

.field private trim:Ljava/lang/Boolean;

.field private when:Lorg/apache/tools/ant/types/Comparison;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 57
    const-string/jumbo v0, "all"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    .line 58
    sget-object v0, Lorg/apache/tools/ant/types/Comparison;->EQUAL:Lorg/apache/tools/ant/types/Comparison;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->when:Lorg/apache/tools/ant/types/Comparison;

    .line 327
    return-void
.end method

.method private static getLength(Ljava/lang/String;Z)J
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "t"    # Z

    .prologue
    .line 247
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .end local p0    # "s":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method private handleResources(Lorg/apache/tools/ant/taskdefs/Length$Handler;)V
    .locals 5
    .param p1, "h"    # Lorg/apache/tools/ant/taskdefs/Length$Handler;

    .prologue
    const/4 v4, 0x1

    .line 233
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Resources;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 234
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 235
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 236
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " does not exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/Length;->log(Ljava/lang/String;I)V

    .line 238
    :cond_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 239
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is a directory; length may not be meaningful"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/Length;->log(Ljava/lang/String;I)V

    .line 241
    :cond_1
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/taskdefs/Length$Handler;->handle(Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0

    .line 243
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Length$Handler;->complete()V

    .line 244
    return-void
.end method

.method private validate()V
    .locals 3

    .prologue
    .line 208
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->string:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 209
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    if-eqz v0, :cond_0

    .line 210
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "the string length function is incompatible with the file/resource length function"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_0
    const-string/jumbo v0, "string"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 214
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "the mode attribute is for use with the file/resource length function"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 217
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    if-eqz v0, :cond_3

    .line 218
    const-string/jumbo v0, "each"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "all"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 219
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "invalid mode setting for file/resource length function: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->trim:Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    .line 222
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "the trim attribute is for use with the string length function only"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 226
    :cond_3
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "you must set either the string attribute or specify one or more files using the file attribute or nested resource collections"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_4
    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Length;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    monitor-exit p0

    return-void

    .line 91
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 100
    monitor-enter p0

    if-nez p1, :cond_0

    .line 105
    :goto_0
    monitor-exit p0

    return-void

    .line 103
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v0, :cond_1

    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Resources;-><init>()V

    :goto_1
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 103
    :cond_1
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->resources:Lorg/apache/tools/ant/types/resources/Resources;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public eval()Z
    .locals 4

    .prologue
    .line 192
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Length;->validate()V

    .line 193
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->length:Ljava/lang/Long;

    if-nez v2, :cond_0

    .line 194
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Use of the Length condition requires that the length attribute be set."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 197
    :cond_0
    const-string/jumbo v2, "string"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 198
    new-instance v0, Ljava/lang/Long;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->string:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length;->getTrim()Z

    move-result v3

    invoke-static {v2, v3}, Lorg/apache/tools/ant/taskdefs/Length;->getLength(Ljava/lang/String;Z)J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    .line 204
    .local v0, "ell":Ljava/lang/Long;
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->when:Lorg/apache/tools/ant/types/Comparison;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Length;->length:Ljava/lang/Long;

    invoke-virtual {v0, v3}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Comparison;->evaluate(I)Z

    move-result v2

    return v2

    .line 200
    .end local v0    # "ell":Ljava/lang/Long;
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;-><init>(Lorg/apache/tools/ant/taskdefs/Length;)V

    .line 201
    .local v1, "h":Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Length;->handleResources(Lorg/apache/tools/ant/taskdefs/Length$Handler;)V

    .line 202
    new-instance v0, Ljava/lang/Long;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->getAccum()J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    .restart local v0    # "ell":Ljava/lang/Long;
    goto :goto_0
.end method

.method public execute()V
    .locals 4

    .prologue
    .line 171
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Length;->validate()V

    .line 172
    new-instance v0, Ljava/io/PrintStream;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Length;->property:Ljava/lang/String;

    if-eqz v1, :cond_1

    new-instance v1, Lorg/apache/tools/ant/util/PropertyOutputStream;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Length;->property:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/util/PropertyOutputStream;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    :goto_0
    invoke-direct {v0, v1}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    .line 176
    .local v0, "ps":Ljava/io/PrintStream;
    const-string/jumbo v1, "string"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 177
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Length;->string:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Length;->getTrim()Z

    move-result v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/taskdefs/Length;->getLength(Ljava/lang/String;Z)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/io/PrintStream;->print(J)V

    .line 178
    invoke-virtual {v0}, Ljava/io/PrintStream;->close()V

    .line 184
    :cond_0
    :goto_1
    return-void

    .line 172
    .end local v0    # "ps":Ljava/io/PrintStream;
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    goto :goto_0

    .line 179
    .restart local v0    # "ps":Ljava/io/PrintStream;
    :cond_2
    const-string/jumbo v1, "each"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 180
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Length$EachHandler;

    invoke-direct {v1, p0, v0}, Lorg/apache/tools/ant/taskdefs/Length$EachHandler;-><init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Length;->handleResources(Lorg/apache/tools/ant/taskdefs/Length$Handler;)V

    goto :goto_1

    .line 181
    :cond_3
    const-string/jumbo v1, "all"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 182
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Length$AllHandler;

    invoke-direct {v1, p0, v0}, Lorg/apache/tools/ant/taskdefs/Length$AllHandler;-><init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Length;->handleResources(Lorg/apache/tools/ant/taskdefs/Length$Handler;)V

    goto :goto_1
.end method

.method public getTrim()Z
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->trim:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->trim:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 83
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Length;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    monitor-exit p0

    return-void

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLength(J)V
    .locals 1
    .param p1, "ell"    # J

    .prologue
    .line 112
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->length:Ljava/lang/Long;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    monitor-exit p0

    return-void

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMode(Lorg/apache/tools/ant/taskdefs/Length$FileMode;)V
    .locals 1
    .param p1, "m"    # Lorg/apache/tools/ant/taskdefs/Length$FileMode;

    .prologue
    .line 139
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Length$FileMode;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    monitor-exit p0

    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length;->property:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    monitor-exit p0

    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 1
    .param p1, "resource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 75
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Length;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    monitor-exit p0

    return-void

    .line 75
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setString(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 147
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length;->string:Ljava/lang/String;

    .line 148
    const-string/jumbo v0, "string"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->mode:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    monitor-exit p0

    return-void

    .line 147
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTrim(Z)V
    .locals 1
    .param p1, "trim"    # Z

    .prologue
    .line 156
    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Length;->trim:Ljava/lang/Boolean;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    monitor-exit p0

    return-void

    .line 156
    :cond_0
    :try_start_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setWhen(Lorg/apache/tools/ant/taskdefs/Length$When;)V
    .locals 1
    .param p1, "w"    # Lorg/apache/tools/ant/taskdefs/Length$When;

    .prologue
    .line 121
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Length;->setWhen(Lorg/apache/tools/ant/types/Comparison;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    monitor-exit p0

    return-void

    .line 121
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setWhen(Lorg/apache/tools/ant/types/Comparison;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/Comparison;

    .prologue
    .line 131
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length;->when:Lorg/apache/tools/ant/types/Comparison;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    monitor-exit p0

    return-void

    .line 131
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
