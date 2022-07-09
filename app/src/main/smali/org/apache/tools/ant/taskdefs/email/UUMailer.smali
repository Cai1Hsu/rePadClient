.class Lorg/apache/tools/ant/taskdefs/email/UUMailer;
.super Lorg/apache/tools/ant/taskdefs/email/PlainMailer;
.source "UUMailer.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;-><init>()V

    return-void
.end method


# virtual methods
.method protected attach(Ljava/io/File;Ljava/io/PrintStream;)V
    .locals 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v3

    if-nez v3, :cond_1

    .line 37
    :cond_0
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "File \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" does not exist or is not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "readable."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 42
    :cond_1
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 45
    .local v1, "finstr":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 46
    .local v2, "in":Ljava/io/BufferedInputStream;
    new-instance v0, Lorg/apache/tools/ant/util/UUEncoder;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/apache/tools/ant/util/UUEncoder;-><init>(Ljava/lang/String;)V

    .line 48
    .local v0, "encoder":Lorg/apache/tools/ant/util/UUEncoder;
    invoke-virtual {v0, v2, p2}, Lorg/apache/tools/ant/util/UUEncoder;->encode(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 53
    return-void

    .line 51
    .end local v0    # "encoder":Lorg/apache/tools/ant/util/UUEncoder;
    .end local v2    # "in":Ljava/io/BufferedInputStream;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    throw v3
.end method
