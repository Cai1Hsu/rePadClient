.class public Lorg/apache/tools/ant/taskdefs/Redirector;
.super Ljava/lang/Object;
.source "Redirector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;
    }
.end annotation


# static fields
.field private static final DEFAULT_ENCODING:Ljava/lang/String;

.field private static final STREAMPUMPER_WAIT_INTERVAL:I = 0x3e8


# instance fields
.field private alwaysLogErr:Z

.field private alwaysLogOut:Z

.field private appendErr:Z

.field private appendOut:Z

.field private appendProperties:Z

.field private baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

.field private createEmptyFilesErr:Z

.field private createEmptyFilesOut:Z

.field private errMutex:Ljava/lang/Object;

.field private error:[Ljava/io/File;

.field private errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

.field private errorEncoding:Ljava/lang/String;

.field private errorFilterChains:Ljava/util/Vector;

.field private errorPrintStream:Ljava/io/PrintStream;

.field private errorProperty:Ljava/lang/String;

.field private errorStream:Ljava/io/OutputStream;

.field private inMutex:Ljava/lang/Object;

.field private input:[Ljava/io/File;

.field private inputEncoding:Ljava/lang/String;

.field private inputFilterChains:Ljava/util/Vector;

.field private inputStream:Ljava/io/InputStream;

.field private inputString:Ljava/lang/String;

.field private logError:Z

.field private logInputString:Z

.field private managingTask:Lorg/apache/tools/ant/ProjectComponent;

.field private out:[Ljava/io/File;

.field private outMutex:Ljava/lang/Object;

.field private outPrintStream:Ljava/io/PrintStream;

.field private outputEncoding:Ljava/lang/String;

.field private outputFilterChains:Ljava/util/Vector;

.field private outputProperty:Ljava/lang/String;

.field private outputStream:Ljava/io/OutputStream;

.field private final threadGroup:Ljava/lang/ThreadGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const-string/jumbo v0, "file.encoding"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Redirector;->DEFAULT_ENCODING:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 3
    .param p1, "managingTask"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->logError:Z

    .line 110
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    .line 115
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    .line 127
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendOut:Z

    .line 129
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendErr:Z

    .line 132
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->alwaysLogOut:Z

    .line 134
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->alwaysLogErr:Z

    .line 137
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->createEmptyFilesOut:Z

    .line 139
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->createEmptyFilesErr:Z

    .line 145
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 148
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    .line 151
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    .line 154
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    .line 157
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    .line 169
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Redirector;->DEFAULT_ENCODING:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputEncoding:Ljava/lang/String;

    .line 172
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Redirector;->DEFAULT_ENCODING:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorEncoding:Ljava/lang/String;

    .line 175
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Redirector;->DEFAULT_ENCODING:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    .line 178
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendProperties:Z

    .line 181
    new-instance v0, Ljava/lang/ThreadGroup;

    const-string/jumbo v1, "redirector"

    invoke-direct {v0, v1}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    .line 184
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->logInputString:Z

    .line 187
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    .line 190
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    .line 193
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    .line 213
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    .line 214
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "managingTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 202
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;-><init>(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 203
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Redirector;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Redirector;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Redirector;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Redirector;

    .prologue
    .line 57
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendOut:Z

    return v0
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/Redirector;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Redirector;

    .prologue
    .line 57
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendProperties:Z

    return v0
.end method

.method static access$300(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Redirector;
    .param p1, "x1"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "x2"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Redirector;->setPropertyFromBAOS(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V

    return-void
.end method

.method private errorStreams()V
    .locals 11

    .prologue
    const/4 v3, 0x3

    .line 714
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->error:[Ljava/io/File;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->error:[Ljava/io/File;

    array-length v0, v0

    if-lez v0, :cond_4

    .line 715
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v0, "Error "

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendErr:Z

    if-eqz v0, :cond_3

    const-string/jumbo v0, "appended"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 718
    .local v2, "logHead":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->error:[Ljava/io/File;

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendErr:Z

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->createEmptyFilesErr:Z

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Redirector;->foldFiles([Ljava/io/File;Ljava/lang/String;IZZ)Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    .line 732
    .end local v2    # "logHead":Ljava/lang/String;
    :cond_0
    :goto_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorProperty:Ljava/lang/String;

    if-eqz v0, :cond_6

    .line 733
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    if-nez v0, :cond_1

    .line 734
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorProperty:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;-><init>(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    .line 735
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Error redirected to property: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorProperty:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 739
    :cond_1
    new-instance v10, Lorg/apache/tools/ant/util/KeepAliveOutputStream;

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    invoke-direct {v10, v0}, Lorg/apache/tools/ant/util/KeepAliveOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 740
    .local v10, "keepAliveError":Ljava/io/OutputStream;
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->error:[Ljava/io/File;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->error:[Ljava/io/File;

    array-length v0, v0

    if-nez v0, :cond_5

    .end local v10    # "keepAliveError":Ljava/io/OutputStream;
    :cond_2
    :goto_2
    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    .line 745
    :goto_3
    return-void

    .line 715
    :cond_3
    const-string/jumbo v0, "redirected"

    goto :goto_0

    .line 720
    :cond_4
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->logError:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorProperty:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 721
    const-wide/16 v8, 0x0

    .line 722
    .local v8, "funnelTimeout":J
    new-instance v7, Lorg/apache/tools/ant/util/OutputStreamFunneler;

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    invoke-direct {v7, v0, v8, v9}, Lorg/apache/tools/ant/util/OutputStreamFunneler;-><init>(Ljava/io/OutputStream;J)V

    .line 725
    .local v7, "funneler":Lorg/apache/tools/ant/util/OutputStreamFunneler;
    :try_start_0
    new-instance v0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;

    invoke-virtual {v7}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->getFunnelInstance()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 726
    new-instance v0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;

    invoke-virtual {v7}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->getFunnelInstance()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 727
    :catch_0
    move-exception v6

    .line 728
    .local v6, "eyeOhEx":Ljava/io/IOException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "error splitting output/error streams"

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 740
    .end local v6    # "eyeOhEx":Ljava/io/IOException;
    .end local v7    # "funneler":Lorg/apache/tools/ant/util/OutputStreamFunneler;
    .end local v8    # "funnelTimeout":J
    .restart local v10    # "keepAliveError":Ljava/io/OutputStream;
    :cond_5
    new-instance v0, Lorg/apache/tools/ant/util/TeeOutputStream;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    invoke-direct {v0, v1, v10}, Lorg/apache/tools/ant/util/TeeOutputStream;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    move-object v10, v0

    goto :goto_2

    .line 743
    .end local v10    # "keepAliveError":Ljava/io/OutputStream;
    :cond_6
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    goto :goto_3
.end method

.method private foldFiles([Ljava/io/File;Ljava/lang/String;IZZ)Ljava/io/OutputStream;
    .locals 8
    .param p1, "file"    # [Ljava/io/File;
    .param p2, "logHead"    # Ljava/lang/String;
    .param p3, "loglevel"    # I
    .param p4, "append"    # Z
    .param p5, "createEmptyFiles"    # Z

    .prologue
    const/4 v6, 0x0

    .line 987
    new-instance v3, Lorg/apache/tools/ant/util/LazyFileOutputStream;

    aget-object v4, p1, v6

    invoke-direct {v3, v4, p4, p5}, Lorg/apache/tools/ant/util/LazyFileOutputStream;-><init>(Ljava/io/File;ZZ)V

    .line 990
    .local v3, "result":Ljava/io/OutputStream;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    aget-object v6, p1, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, p3}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 991
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    new-array v0, v4, [C

    .line 992
    .local v0, "c":[C
    const/16 v4, 0x20

    invoke-static {v0, v4}, Ljava/util/Arrays;->fill([CC)V

    .line 993
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    .line 995
    .local v2, "indent":Ljava/lang/String;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v4, p1

    if-ge v1, v4, :cond_0

    .line 996
    new-instance v4, Lorg/apache/tools/ant/util/TeeOutputStream;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    new-instance v6, Lorg/apache/tools/ant/util/LazyFileOutputStream;

    aget-object v7, p1, v1

    invoke-direct {v6, v7, p4, p5}, Lorg/apache/tools/ant/util/LazyFileOutputStream;-><init>(Ljava/io/File;ZZ)V

    invoke-direct {v4, v5, v6}, Lorg/apache/tools/ant/util/TeeOutputStream;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 998
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    aget-object v6, p1, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, p3}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 995
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1000
    :cond_0
    return-object v3
.end method

.method private outStreams()V
    .locals 7

    .prologue
    const/4 v3, 0x3

    .line 691
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->out:[Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->out:[Ljava/io/File;

    array-length v0, v0

    if-lez v0, :cond_0

    .line 692
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v0, "Output "

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendOut:Z

    if-eqz v0, :cond_2

    const-string/jumbo v0, "appended"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 695
    .local v2, "logHead":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->out:[Ljava/io/File;

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendOut:Z

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->createEmptyFilesOut:Z

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Redirector;->foldFiles([Ljava/io/File;Ljava/lang/String;IZZ)Ljava/io/OutputStream;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 698
    .end local v2    # "logHead":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputProperty:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 699
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    if-nez v0, :cond_1

    .line 700
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputProperty:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;-><init>(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    .line 701
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Output redirected to property: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputProperty:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 705
    :cond_1
    new-instance v6, Lorg/apache/tools/ant/util/KeepAliveOutputStream;

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    invoke-direct {v6, v0}, Lorg/apache/tools/ant/util/KeepAliveOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 706
    .local v6, "keepAliveOutput":Ljava/io/OutputStream;
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    if-nez v0, :cond_3

    .end local v6    # "keepAliveOutput":Ljava/io/OutputStream;
    :goto_1
    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 711
    :goto_2
    return-void

    .line 692
    :cond_2
    const-string/jumbo v0, "redirected"

    goto :goto_0

    .line 706
    .restart local v6    # "keepAliveOutput":Ljava/io/OutputStream;
    :cond_3
    new-instance v0, Lorg/apache/tools/ant/util/TeeOutputStream;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/util/TeeOutputStream;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    move-object v6, v0

    goto :goto_1

    .line 709
    .end local v6    # "keepAliveOutput":Ljava/io/OutputStream;
    :cond_4
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    goto :goto_2
.end method

.method private setPropertyFromBAOS(Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V
    .locals 5
    .param p1, "baos"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 540
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/StringReader;

    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/Execute;->toString(Ljava/io/ByteArrayOutputStream;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 542
    .local v0, "in":Ljava/io/BufferedReader;
    const/4 v1, 0x0

    .line 543
    .local v1, "line":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 544
    .local v2, "val":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 545
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-eqz v3, :cond_0

    .line 546
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 548
    :cond_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 550
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v3}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p2, v4}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    return-void
.end method


# virtual methods
.method public complete()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 899
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/io/PrintStream;->flush()V

    .line 900
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/io/PrintStream;->flush()V

    .line 902
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 903
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    if-eqz v3, :cond_0

    .line 904
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 906
    :cond_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 908
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 909
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 910
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 911
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 913
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 914
    :try_start_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 915
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 916
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 919
    monitor-enter p0

    .line 920
    :cond_1
    :goto_0
    :try_start_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    invoke-virtual {v3}, Ljava/lang/ThreadGroup;->activeCount()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-result v3

    if-lez v3, :cond_3

    .line 922
    :try_start_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "waiting for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    invoke-virtual {v5}, Ljava/lang/ThreadGroup;->activeCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " Threads:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 924
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    invoke-virtual {v3}, Ljava/lang/ThreadGroup;->activeCount()I

    move-result v3

    new-array v2, v3, [Ljava/lang/Thread;

    .line 925
    .local v2, "thread":[Ljava/lang/Thread;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    invoke-virtual {v3, v2}, Ljava/lang/ThreadGroup;->enumerate([Ljava/lang/Thread;)I

    .line 926
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, v2

    if-ge v1, v3, :cond_2

    aget-object v3, v2, v1
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    if-eqz v3, :cond_2

    .line 928
    :try_start_5
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/Thread;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 926
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 906
    .end local v1    # "i":I
    .end local v2    # "thread":[Ljava/lang/Thread;
    :catchall_0
    move-exception v3

    :try_start_6
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v3

    .line 911
    :catchall_1
    move-exception v3

    :try_start_7
    monitor-exit v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v3

    .line 916
    :catchall_2
    move-exception v3

    :try_start_8
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    throw v3

    .line 934
    .restart local v1    # "i":I
    .restart local v2    # "thread":[Ljava/lang/Thread;
    :cond_2
    const-wide/16 v4, 0x3e8

    :try_start_9
    invoke-virtual {p0, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_0

    .line 935
    .end local v1    # "i":I
    .end local v2    # "thread":[Ljava/lang/Thread;
    :catch_0
    move-exception v0

    .line 936
    .local v0, "eyeEx":Ljava/lang/InterruptedException;
    :try_start_a
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    invoke-virtual {v3}, Ljava/lang/ThreadGroup;->activeCount()I

    move-result v3

    new-array v2, v3, [Ljava/lang/Thread;

    .line 937
    .restart local v2    # "thread":[Ljava/lang/Thread;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    invoke-virtual {v3, v2}, Ljava/lang/ThreadGroup;->enumerate([Ljava/lang/Thread;)I

    .line 938
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    array-length v3, v2

    if-ge v1, v3, :cond_1

    aget-object v3, v2, v1

    if-eqz v3, :cond_1

    .line 939
    aget-object v3, v2, v1

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 938
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 943
    .end local v0    # "eyeEx":Ljava/lang/InterruptedException;
    .end local v1    # "i":I
    .end local v2    # "thread":[Ljava/lang/Thread;
    :cond_3
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 945
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Redirector;->setProperties()V

    .line 947
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 948
    const/4 v3, 0x0

    :try_start_b
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    .line 949
    monitor-exit v4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 950
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 951
    const/4 v3, 0x0

    :try_start_c
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 952
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    .line 953
    monitor-exit v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 954
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v4

    .line 955
    const/4 v3, 0x0

    :try_start_d
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    .line 956
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    .line 957
    monitor-exit v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    .line 958
    return-void

    .line 943
    :catchall_3
    move-exception v3

    :try_start_e
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    throw v3

    .line 949
    :catchall_4
    move-exception v3

    :try_start_f
    monitor-exit v4
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    throw v3

    .line 953
    :catchall_5
    move-exception v3

    :try_start_10
    monitor-exit v4
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    throw v3

    .line 957
    :catchall_6
    move-exception v3

    :try_start_11
    monitor-exit v4
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    throw v3

    .line 930
    .restart local v1    # "i":I
    .restart local v2    # "thread":[Ljava/lang/Thread;
    :catch_1
    move-exception v3

    goto :goto_2
.end method

.method public createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 757
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Redirector;->createStreams()V

    .line 758
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->input:[Ljava/io/File;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputString:Ljava/lang/String;

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 759
    .local v0, "nonBlockingRead":Z
    :goto_0
    new-instance v1, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Redirector;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Redirector;->getErrorStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Redirector;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;Ljava/io/InputStream;Z)V

    return-object v1

    .line 758
    .end local v0    # "nonBlockingRead":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public createStreams()V
    .locals 15

    .prologue
    .line 559
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v11

    .line 560
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Redirector;->outStreams()V

    .line 561
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->alwaysLogOut:Z

    if-nez v10, :cond_0

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    if-nez v10, :cond_1

    .line 562
    :cond_0
    new-instance v6, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    const/4 v12, 0x2

    invoke-direct {v6, v10, v12}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    .line 564
    .local v6, "outputLog":Ljava/io/OutputStream;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    if-nez v10, :cond_e

    .end local v6    # "outputLog":Ljava/io/OutputStream;
    :goto_0
    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 568
    :cond_1
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputFilterChains:Ljava/util/Vector;

    if-eqz v10, :cond_2

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputFilterChains:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-gtz v10, :cond_3

    :cond_2
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputEncoding:Ljava/lang/String;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v10

    if-nez v10, :cond_5

    .line 571
    :cond_3
    :try_start_1
    new-instance v8, Lorg/apache/tools/ant/util/LeadPipeInputStream;

    invoke-direct {v8}, Lorg/apache/tools/ant/util/LeadPipeInputStream;-><init>()V

    .line 572
    .local v8, "snk":Lorg/apache/tools/ant/util/LeadPipeInputStream;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v8, v10}, Lorg/apache/tools/ant/util/LeadPipeInputStream;->setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 574
    move-object v5, v8

    .line 576
    .local v5, "outPumpIn":Ljava/io/InputStream;
    new-instance v7, Ljava/io/InputStreamReader;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    invoke-direct {v7, v5, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 579
    .local v7, "reader":Ljava/io/Reader;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputFilterChains:Ljava/util/Vector;

    if-eqz v10, :cond_4

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputFilterChains:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-lez v10, :cond_4

    .line 581
    new-instance v4, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v4}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 582
    .local v4, "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v10}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v4, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 583
    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 584
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputFilterChains:Ljava/util/Vector;

    invoke-virtual {v4, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 585
    invoke-virtual {v4}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v7

    .line 587
    .end local v4    # "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    :cond_4
    new-instance v5, Lorg/apache/tools/ant/util/ReaderInputStream;

    .end local v5    # "outPumpIn":Ljava/io/InputStream;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputEncoding:Ljava/lang/String;

    invoke-direct {v5, v7, v10}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/lang/String;)V

    .line 589
    .restart local v5    # "outPumpIn":Ljava/io/InputStream;
    new-instance v9, Ljava/lang/Thread;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    new-instance v12, Lorg/apache/tools/ant/taskdefs/StreamPumper;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    const/4 v14, 0x1

    invoke-direct {v12, v5, v13, v14}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Z)V

    const-string/jumbo v13, "output pumper"

    invoke-direct {v9, v10, v12, v13}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 591
    .local v9, "t":Ljava/lang/Thread;
    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/Thread;->setPriority(I)V

    .line 592
    new-instance v10, Ljava/io/PipedOutputStream;

    invoke-direct {v10, v8}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    .line 593
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 599
    .end local v5    # "outPumpIn":Ljava/io/InputStream;
    .end local v7    # "reader":Ljava/io/Reader;
    .end local v8    # "snk":Lorg/apache/tools/ant/util/LeadPipeInputStream;
    .end local v9    # "t":Ljava/lang/Thread;
    :cond_5
    :try_start_2
    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 601
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v11

    .line 602
    :try_start_3
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStreams()V

    .line 603
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->alwaysLogErr:Z

    if-nez v10, :cond_6

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    if-nez v10, :cond_7

    .line 604
    :cond_6
    new-instance v2, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    const/4 v12, 0x1

    invoke-direct {v2, v10, v12}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    .line 606
    .local v2, "errorLog":Ljava/io/OutputStream;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    if-nez v10, :cond_f

    .end local v2    # "errorLog":Ljava/io/OutputStream;
    :goto_1
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    .line 610
    :cond_7
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorFilterChains:Ljava/util/Vector;

    if-eqz v10, :cond_8

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorFilterChains:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-gtz v10, :cond_9

    :cond_8
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorEncoding:Ljava/lang/String;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v10

    if-nez v10, :cond_b

    .line 613
    :cond_9
    :try_start_4
    new-instance v8, Lorg/apache/tools/ant/util/LeadPipeInputStream;

    invoke-direct {v8}, Lorg/apache/tools/ant/util/LeadPipeInputStream;-><init>()V

    .line 614
    .restart local v8    # "snk":Lorg/apache/tools/ant/util/LeadPipeInputStream;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v8, v10}, Lorg/apache/tools/ant/util/LeadPipeInputStream;->setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 616
    move-object v1, v8

    .line 618
    .local v1, "errPumpIn":Ljava/io/InputStream;
    new-instance v7, Ljava/io/InputStreamReader;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    invoke-direct {v7, v1, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 621
    .restart local v7    # "reader":Ljava/io/Reader;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorFilterChains:Ljava/util/Vector;

    if-eqz v10, :cond_a

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorFilterChains:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-lez v10, :cond_a

    .line 623
    new-instance v4, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v4}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 624
    .restart local v4    # "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v10}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v4, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 625
    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 626
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorFilterChains:Ljava/util/Vector;

    invoke-virtual {v4, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 627
    invoke-virtual {v4}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v7

    .line 629
    .end local v4    # "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    :cond_a
    new-instance v1, Lorg/apache/tools/ant/util/ReaderInputStream;

    .end local v1    # "errPumpIn":Ljava/io/InputStream;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorEncoding:Ljava/lang/String;

    invoke-direct {v1, v7, v10}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/lang/String;)V

    .line 631
    .restart local v1    # "errPumpIn":Ljava/io/InputStream;
    new-instance v9, Ljava/lang/Thread;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->threadGroup:Ljava/lang/ThreadGroup;

    new-instance v12, Lorg/apache/tools/ant/taskdefs/StreamPumper;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    const/4 v14, 0x1

    invoke-direct {v12, v1, v13, v14}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;Z)V

    const-string/jumbo v13, "error pumper"

    invoke-direct {v9, v10, v12, v13}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 633
    .restart local v9    # "t":Ljava/lang/Thread;
    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/Thread;->setPriority(I)V

    .line 634
    new-instance v10, Ljava/io/PipedOutputStream;

    invoke-direct {v10, v8}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    .line 635
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 641
    .end local v1    # "errPumpIn":Ljava/io/InputStream;
    .end local v7    # "reader":Ljava/io/Reader;
    .end local v8    # "snk":Lorg/apache/tools/ant/util/LeadPipeInputStream;
    .end local v9    # "t":Ljava/lang/Thread;
    :cond_b
    :try_start_5
    monitor-exit v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 643
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v11

    .line 648
    :try_start_6
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->input:[Ljava/io/File;

    if-eqz v10, :cond_11

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->input:[Ljava/io/File;

    array-length v10, v10

    if-lez v10, :cond_11

    .line 649
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Redirecting input from file"

    invoke-virtual {v10, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->input:[Ljava/io/File;

    array-length v10, v10

    const/4 v14, 0x1

    if-ne v10, v14, :cond_10

    const-string/jumbo v10, ""

    :goto_2
    invoke-virtual {v13, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v13, 0x3

    invoke-virtual {v12, v10, v13}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 654
    :try_start_7
    new-instance v10, Lorg/apache/tools/ant/util/ConcatFileInputStream;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->input:[Ljava/io/File;

    invoke-direct {v10, v12}, Lorg/apache/tools/ant/util/ConcatFileInputStream;-><init>([Ljava/io/File;)V

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 658
    :try_start_8
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    check-cast v10, Lorg/apache/tools/ant/util/ConcatFileInputStream;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v10, v12}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 671
    :cond_c
    :goto_3
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    if-eqz v10, :cond_d

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputFilterChains:Ljava/util/Vector;

    if-eqz v10, :cond_d

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputFilterChains:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-lez v10, :cond_d

    .line 673
    new-instance v4, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v4}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 674
    .restart local v4    # "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v10}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v4, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 676
    :try_start_9
    new-instance v10, Ljava/io/InputStreamReader;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    invoke-direct {v10, v12, v13}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-virtual {v4, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 682
    :try_start_a
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputFilterChains:Ljava/util/Vector;

    invoke-virtual {v4, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 683
    new-instance v10, Lorg/apache/tools/ant/util/ReaderInputStream;

    invoke-virtual {v4}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    invoke-direct {v10, v12, v13}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;Ljava/lang/String;)V

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    .line 686
    .end local v4    # "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    :cond_d
    monitor-exit v11
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 687
    return-void

    .line 564
    .restart local v6    # "outputLog":Ljava/io/OutputStream;
    :cond_e
    :try_start_b
    new-instance v10, Lorg/apache/tools/ant/util/TeeOutputStream;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    invoke-direct {v10, v6, v12}, Lorg/apache/tools/ant/util/TeeOutputStream;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    move-object v6, v10

    goto/16 :goto_0

    .line 594
    .end local v6    # "outputLog":Ljava/io/OutputStream;
    :catch_0
    move-exception v3

    .line 595
    .local v3, "eyeOhEx":Ljava/io/IOException;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "error setting up output stream"

    invoke-direct {v10, v12, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 599
    .end local v3    # "eyeOhEx":Ljava/io/IOException;
    :catchall_0
    move-exception v10

    monitor-exit v11
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    throw v10

    .line 606
    .restart local v2    # "errorLog":Ljava/io/OutputStream;
    :cond_f
    :try_start_c
    new-instance v10, Lorg/apache/tools/ant/util/TeeOutputStream;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    invoke-direct {v10, v2, v12}, Lorg/apache/tools/ant/util/TeeOutputStream;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    move-object v2, v10

    goto/16 :goto_1

    .line 636
    .end local v2    # "errorLog":Ljava/io/OutputStream;
    :catch_1
    move-exception v3

    .line 637
    .restart local v3    # "eyeOhEx":Ljava/io/IOException;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "error setting up error stream"

    invoke-direct {v10, v12, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 641
    .end local v3    # "eyeOhEx":Ljava/io/IOException;
    :catchall_1
    move-exception v10

    monitor-exit v11
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    throw v10

    .line 649
    :cond_10
    :try_start_d
    const-string/jumbo v10, "s"

    goto/16 :goto_2

    .line 655
    :catch_2
    move-exception v3

    .line 656
    .restart local v3    # "eyeOhEx":Ljava/io/IOException;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v10, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 686
    .end local v3    # "eyeOhEx":Ljava/io/IOException;
    :catchall_2
    move-exception v10

    monitor-exit v11
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    throw v10

    .line 660
    :cond_11
    :try_start_e
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputString:Ljava/lang/String;

    if-eqz v10, :cond_c

    .line 661
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v10, "Using input "

    invoke-direct {v0, v10}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 662
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->logInputString:Z

    if-eqz v10, :cond_12

    .line 663
    const/16 v10, 0x22

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputString:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const/16 v12, 0x22

    invoke-virtual {v10, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 667
    :goto_4
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {v10, v12, v13}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 668
    new-instance v10, Ljava/io/ByteArrayInputStream;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputString:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    invoke-direct {v10, v12}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    goto/16 :goto_3

    .line 665
    :cond_12
    const-string/jumbo v10, "string"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 678
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v4    # "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    :catch_3
    move-exception v3

    .line 679
    .restart local v3    # "eyeOhEx":Ljava/io/IOException;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "error setting up input stream"

    invoke-direct {v10, v12, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2
.end method

.method public getErrorStream()Ljava/io/OutputStream;
    .locals 2

    .prologue
    .line 871
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 872
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    monitor-exit v1

    return-object v0

    .line 873
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2

    .prologue
    .line 883
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 884
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    monitor-exit v1

    return-object v0

    .line 885
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2

    .prologue
    .line 859
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 860
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    monitor-exit v1

    return-object v0

    .line 861
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected handleErrorFlush(Ljava/lang/String;)V
    .locals 3
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 843
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 844
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    .line 845
    new-instance v0, Ljava/io/PrintStream;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    invoke-direct {v0, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    .line 847
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 848
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 849
    monitor-exit v1

    .line 850
    return-void

    .line 849
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected handleErrorOutput(Ljava/lang/String;)V
    .locals 3
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 828
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 829
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    .line 830
    new-instance v0, Ljava/io/PrintStream;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorStream:Ljava/io/OutputStream;

    invoke-direct {v0, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    .line 832
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorPrintStream:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 833
    monitor-exit v1

    .line 834
    return-void

    .line 833
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected handleFlush(Ljava/lang/String;)V
    .locals 3
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 812
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 813
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    .line 814
    new-instance v0, Ljava/io/PrintStream;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    invoke-direct {v0, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    .line 816
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 817
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 818
    monitor-exit v1

    .line 819
    return-void

    .line 818
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected handleInput([BII)I
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 795
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 796
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 797
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->managingTask:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/Project;->defaultInput([BII)I

    move-result v0

    monitor-exit v1

    .line 800
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    monitor-exit v1

    goto :goto_0

    .line 802
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected handleOutput(Ljava/lang/String;)V
    .locals 3
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 770
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 771
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    if-nez v0, :cond_0

    .line 772
    new-instance v0, Ljava/io/PrintStream;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputStream:Ljava/io/OutputStream;

    invoke-direct {v0, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    .line 774
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outPrintStream:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 775
    monitor-exit v1

    .line 776
    return-void

    .line 775
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setAlwaysLog(Z)V
    .locals 2
    .param p1, "alwaysLog"    # Z

    .prologue
    .line 450
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 451
    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->alwaysLogOut:Z

    .line 452
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 454
    :try_start_1
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->alwaysLogErr:Z

    .line 455
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 456
    return-void

    .line 452
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 455
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public setAppend(Z)V
    .locals 2
    .param p1, "append"    # Z

    .prologue
    .line 432
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 433
    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendOut:Z

    .line 434
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 435
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 436
    :try_start_1
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendErr:Z

    .line 437
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 438
    return-void

    .line 434
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 437
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public setAppendProperties(Z)V
    .locals 2
    .param p1, "appendProperties"    # Z

    .prologue
    .line 376
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 377
    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->appendProperties:Z

    .line 378
    monitor-exit v1

    .line 379
    return-void

    .line 378
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setCreateEmptyFiles(Z)V
    .locals 2
    .param p1, "createEmptyFiles"    # Z

    .prologue
    .line 466
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 467
    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->createEmptyFilesOut:Z

    .line 468
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 469
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 470
    :try_start_1
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->createEmptyFilesErr:Z

    .line 471
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 472
    return-void

    .line 468
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 471
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method public setError(Ljava/io/File;)V
    .locals 2
    .param p1, "error"    # Ljava/io/File;

    .prologue
    .line 388
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->setError([Ljava/io/File;)V

    .line 389
    return-void

    .line 388
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/File;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    goto :goto_0
.end method

.method public setError([Ljava/io/File;)V
    .locals 2
    .param p1, "error"    # [Ljava/io/File;

    .prologue
    .line 398
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 399
    if-nez p1, :cond_0

    .line 400
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->error:[Ljava/io/File;

    .line 404
    :goto_0
    monitor-exit v1

    .line 405
    return-void

    .line 402
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/io/File;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->error:[Ljava/io/File;

    goto :goto_0

    .line 404
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setErrorEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "errorEncoding"    # Ljava/lang/String;

    .prologue
    .line 330
    if-nez p1, :cond_0

    .line 331
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "errorEncoding must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 333
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 334
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorEncoding:Ljava/lang/String;

    .line 335
    monitor-exit v1

    .line 336
    return-void

    .line 335
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setErrorFilterChains(Ljava/util/Vector;)V
    .locals 2
    .param p1, "errorFilterChains"    # Ljava/util/Vector;

    .prologue
    .line 521
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 522
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorFilterChains:Ljava/util/Vector;

    .line 523
    monitor-exit v1

    .line 524
    return-void

    .line 523
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setErrorProperty(Ljava/lang/String;)V
    .locals 2
    .param p1, "errorProperty"    # Ljava/lang/String;

    .prologue
    .line 481
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 482
    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorProperty:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 484
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorProperty:Ljava/lang/String;

    .line 485
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    .line 487
    :cond_1
    monitor-exit v1

    .line 488
    return-void

    .line 487
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setInput(Ljava/io/File;)V
    .locals 2
    .param p1, "input"    # Ljava/io/File;

    .prologue
    .line 223
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInput([Ljava/io/File;)V

    .line 224
    return-void

    .line 223
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/File;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    goto :goto_0
.end method

.method public setInput([Ljava/io/File;)V
    .locals 2
    .param p1, "input"    # [Ljava/io/File;

    .prologue
    .line 233
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 234
    if-nez p1, :cond_0

    .line 235
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->input:[Ljava/io/File;

    .line 239
    :goto_0
    monitor-exit v1

    .line 240
    return-void

    .line 237
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/io/File;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->input:[Ljava/io/File;

    goto :goto_0

    .line 239
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setInputEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "inputEncoding"    # Ljava/lang/String;

    .prologue
    .line 345
    if-nez p1, :cond_0

    .line 346
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "inputEncoding must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 348
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 349
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputEncoding:Ljava/lang/String;

    .line 350
    monitor-exit v1

    .line 351
    return-void

    .line 350
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setInputFilterChains(Ljava/util/Vector;)V
    .locals 2
    .param p1, "inputFilterChains"    # Ljava/util/Vector;

    .prologue
    .line 497
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 498
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputFilterChains:Ljava/util/Vector;

    .line 499
    monitor-exit v1

    .line 500
    return-void

    .line 499
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method setInputStream(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 274
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 275
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputStream:Ljava/io/InputStream;

    .line 276
    monitor-exit v1

    .line 277
    return-void

    .line 276
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setInputString(Ljava/lang/String;)V
    .locals 2
    .param p1, "inputString"    # Ljava/lang/String;

    .prologue
    .line 249
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 250
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->inputString:Ljava/lang/String;

    .line 251
    monitor-exit v1

    .line 252
    return-void

    .line 251
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setLogError(Z)V
    .locals 2
    .param p1, "logError"    # Z

    .prologue
    .line 362
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 363
    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->logError:Z

    .line 364
    monitor-exit v1

    .line 365
    return-void

    .line 364
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setLogInputString(Z)V
    .locals 0
    .param p1, "logInputString"    # Z

    .prologue
    .line 263
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->logInputString:Z

    .line 264
    return-void
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 2
    .param p1, "out"    # Ljava/io/File;

    .prologue
    .line 287
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutput([Ljava/io/File;)V

    .line 288
    return-void

    .line 287
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/io/File;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    goto :goto_0
.end method

.method public setOutput([Ljava/io/File;)V
    .locals 2
    .param p1, "out"    # [Ljava/io/File;

    .prologue
    .line 298
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 299
    if-nez p1, :cond_0

    .line 300
    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->out:[Ljava/io/File;

    .line 304
    :goto_0
    monitor-exit v1

    .line 305
    return-void

    .line 302
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/io/File;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->out:[Ljava/io/File;

    goto :goto_0

    .line 304
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setOutputEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "outputEncoding"    # Ljava/lang/String;

    .prologue
    .line 314
    if-nez p1, :cond_0

    .line 315
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "outputEncoding must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 318
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 319
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputEncoding:Ljava/lang/String;

    .line 320
    monitor-exit v1

    .line 321
    return-void

    .line 320
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setOutputFilterChains(Ljava/util/Vector;)V
    .locals 2
    .param p1, "outputFilterChains"    # Ljava/util/Vector;

    .prologue
    .line 509
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 510
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputFilterChains:Ljava/util/Vector;

    .line 511
    monitor-exit v1

    .line 512
    return-void

    .line 511
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setOutputProperty(Ljava/lang/String;)V
    .locals 2
    .param p1, "outputProperty"    # Ljava/lang/String;

    .prologue
    .line 414
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputProperty:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 416
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 417
    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outputProperty:Ljava/lang/String;

    .line 418
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    .line 419
    monitor-exit v1

    .line 421
    :cond_1
    return-void

    .line 419
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setProperties()V
    .locals 2

    .prologue
    .line 965
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->outMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 966
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 968
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->baos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 973
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 974
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 975
    :try_start_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_1

    .line 977
    :try_start_4
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector;->errorBaos:Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 982
    :cond_1
    :goto_1
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 983
    return-void

    .line 973
    :catchall_0
    move-exception v0

    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw v0

    .line 982
    :catchall_1
    move-exception v0

    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v0

    .line 978
    :catch_0
    move-exception v0

    goto :goto_1

    .line 969
    :catch_1
    move-exception v0

    goto :goto_0
.end method
