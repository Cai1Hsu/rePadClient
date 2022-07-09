.class public final Lorg/apache/tools/ant/util/JavaEnvUtils;
.super Ljava/lang/Object;
.source "JavaEnvUtils.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final IS_AIX:Z

.field private static final IS_DOS:Z

.field private static final IS_NETWARE:Z

.field public static final JAVA_1_0:Ljava/lang/String; = "1.0"

.field public static final JAVA_1_1:Ljava/lang/String; = "1.1"

.field public static final JAVA_1_2:Ljava/lang/String; = "1.2"

.field public static final JAVA_1_3:Ljava/lang/String; = "1.3"

.field public static final JAVA_1_4:Ljava/lang/String; = "1.4"

.field public static final JAVA_1_5:Ljava/lang/String; = "1.5"

.field public static final JAVA_1_6:Ljava/lang/String; = "1.6"

.field public static final JAVA_1_7:Ljava/lang/String; = "1.7"

.field public static final JAVA_1_8:Ljava/lang/String; = "1.8"

.field private static final JAVA_HOME:Ljava/lang/String;

.field public static final VERSION_1_0:I = 0xa

.field public static final VERSION_1_1:I = 0xb

.field public static final VERSION_1_2:I = 0xc

.field public static final VERSION_1_3:I = 0xd

.field public static final VERSION_1_4:I = 0xe

.field public static final VERSION_1_5:I = 0xf

.field public static final VERSION_1_6:I = 0x10

.field public static final VERSION_1_7:I = 0x11

.field public static final VERSION_1_8:I = 0x12

.field private static gijDetected:Z

.field private static harmonyDetected:Z

.field private static javaVersion:Ljava/lang/String;

.field private static javaVersionNumber:I

.field private static jrePackages:Ljava/util/Vector;

.field private static kaffeDetected:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 39
    const-string/jumbo v0, "dos"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_DOS:Z

    .line 41
    const-string/jumbo v0, "netware"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isName(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_NETWARE:Z

    .line 43
    const-string/jumbo v0, "aix"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isName(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_AIX:Z

    .line 46
    const-string/jumbo v0, "java.home"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->JAVA_HOME:Ljava/lang/String;

    .line 49
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 125
    :try_start_0
    const-string/jumbo v0, "1.0"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 126
    const/16 v0, 0xa

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 127
    const-string/jumbo v0, "java.lang.Void"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 128
    const-string/jumbo v0, "1.1"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 129
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 130
    const-string/jumbo v0, "java.lang.ThreadLocal"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 131
    const-string/jumbo v0, "1.2"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 132
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 133
    const-string/jumbo v0, "java.lang.StrictMath"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 134
    const-string/jumbo v0, "1.3"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 135
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 136
    const-string/jumbo v0, "java.lang.CharSequence"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 137
    const-string/jumbo v0, "1.4"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 138
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 139
    const-string/jumbo v0, "java.net.Proxy"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 140
    const-string/jumbo v0, "1.5"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 141
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 142
    const-string/jumbo v0, "java.net.CookieStore"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 143
    const-string/jumbo v0, "1.6"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 144
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 145
    const-string/jumbo v0, "java.nio.file.FileSystem"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 146
    const-string/jumbo v0, "1.7"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 147
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    .line 148
    const-string/jumbo v0, "java.lang.reflect.Executable"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 149
    const-string/jumbo v0, "1.8"

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    .line 150
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    .line 155
    :goto_0
    sput-boolean v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->kaffeDetected:Z

    .line 157
    :try_start_1
    const-string/jumbo v0, "kaffe.util.NotImplemented"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 158
    const/4 v0, 0x1

    sput-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->kaffeDetected:Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 162
    :goto_1
    sput-boolean v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->gijDetected:Z

    .line 164
    :try_start_2
    const-string/jumbo v0, "gnu.gcj.Core"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 165
    const/4 v0, 0x1

    sput-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->gijDetected:Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 169
    :goto_2
    sput-boolean v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->harmonyDetected:Z

    .line 171
    :try_start_3
    const-string/jumbo v0, "org.apache.harmony.luni.util.Base64"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 172
    const/4 v0, 0x1

    sput-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->harmonyDetected:Z
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    .line 176
    :goto_3
    return-void

    .line 173
    :catch_0
    move-exception v0

    goto :goto_3

    .line 166
    :catch_1
    move-exception v0

    goto :goto_2

    .line 159
    :catch_2
    move-exception v0

    goto :goto_1

    .line 151
    :catch_3
    move-exception v0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method private static addExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "command"    # Ljava/lang/String;

    .prologue
    .line 353
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_DOS:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, ".exe"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private static buildJrePackages()V
    .locals 2

    .prologue
    .line 379
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    .line 380
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    packed-switch v0, :pswitch_data_0

    .line 418
    :goto_0
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "sun"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 419
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "java"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 420
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "javax"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 423
    return-void

    .line 386
    :pswitch_0
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.org.apache"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 389
    :pswitch_1
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 390
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.apache.crimson"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 391
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.apache.xalan"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 392
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.apache.xml"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 393
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.apache.xpath"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 395
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.ietf.jgss"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 396
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.w3c.dom"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 397
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.xml.sax"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 400
    :pswitch_2
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "org.omg"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 401
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.corba"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 402
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.jndi"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 403
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.media"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 404
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.naming"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 405
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.org.omg"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 406
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.rmi"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 407
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "sunw.io"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 408
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "sunw.util"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 411
    :pswitch_3
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.java"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 412
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    const-string/jumbo v1, "com.sun.image"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 380
    nop

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static createVmsJavaOptionFile([Ljava/lang/String;)Ljava/io/File;
    .locals 10
    .param p0, "cmd"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 500
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v1, "ANT"

    const-string/jumbo v2, ".JAVA_OPTS"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v9

    .line 501
    .local v9, "script":Ljava/io/File;
    const/4 v7, 0x0

    .line 503
    .local v7, "out":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v8, Ljava/io/BufferedWriter;

    new-instance v0, Ljava/io/FileWriter;

    invoke-direct {v0, v9}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 504
    .end local v7    # "out":Ljava/io/BufferedWriter;
    .local v8, "out":Ljava/io/BufferedWriter;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    :try_start_1
    array-length v0, p0

    if-ge v6, v0, :cond_0

    .line 505
    aget-object v0, p0, v6

    invoke-virtual {v8, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 506
    invoke-virtual {v8}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 504
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 509
    :cond_0
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 511
    return-object v9

    .line 509
    .end local v6    # "i":I
    .end local v8    # "out":Ljava/io/BufferedWriter;
    .restart local v7    # "out":Ljava/io/BufferedWriter;
    :catchall_0
    move-exception v0

    :goto_1
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v0

    .end local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "i":I
    .restart local v8    # "out":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v0

    move-object v7, v8

    .end local v8    # "out":Ljava/io/BufferedWriter;
    .restart local v7    # "out":Ljava/io/BufferedWriter;
    goto :goto_1
.end method

.method private static findInDir(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p0, "dirName"    # Ljava/lang/String;
    .param p1, "commandName"    # Ljava/lang/String;

    .prologue
    .line 362
    sget-object v2, Lorg/apache/tools/ant/util/JavaEnvUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v2, p0}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 363
    .local v0, "dir":Ljava/io/File;
    const/4 v1, 0x0

    .line 364
    .local v1, "executable":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 365
    new-instance v1, Ljava/io/File;

    .end local v1    # "executable":Ljava/io/File;
    invoke-static {p1}, Lorg/apache/tools/ant/util/JavaEnvUtils;->addExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 366
    .restart local v1    # "executable":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 367
    const/4 v1, 0x0

    .line 370
    :cond_0
    return-object v1
.end method

.method public static getJavaHome()Ljava/lang/String;
    .locals 1

    .prologue
    .line 519
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->JAVA_HOME:Ljava/lang/String;

    return-object v0
.end method

.method public static getJavaVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 183
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    return-object v0
.end method

.method public static getJavaVersionNumber()I
    .locals 1

    .prologue
    .line 194
    sget v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    return v0
.end method

.method public static getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "command"    # Ljava/lang/String;

    .prologue
    .line 315
    sget-boolean v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_NETWARE:Z

    if-eqz v1, :cond_0

    .line 341
    .end local p0    # "command":Ljava/lang/String;
    .local v0, "jExecutable":Ljava/io/File;
    :goto_0
    return-object p0

    .line 323
    .end local v0    # "jExecutable":Ljava/io/File;
    .restart local p0    # "command":Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    .line 325
    .restart local v0    # "jExecutable":Ljava/io/File;
    sget-boolean v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_AIX:Z

    if-eqz v1, :cond_1

    .line 328
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/tools/ant/util/JavaEnvUtils;->JAVA_HOME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "/../sh"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->findInDir(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 331
    :cond_1
    if-nez v0, :cond_2

    .line 332
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/tools/ant/util/JavaEnvUtils;->JAVA_HOME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "/../bin"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->findInDir(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 335
    :cond_2
    if-eqz v0, :cond_3

    .line 336
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 341
    :cond_3
    invoke-static {p0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJreExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static getJreExecutable(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "command"    # Ljava/lang/String;

    .prologue
    .line 274
    sget-boolean v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_NETWARE:Z

    if-eqz v1, :cond_0

    .line 300
    .end local p0    # "command":Ljava/lang/String;
    .local v0, "jExecutable":Ljava/io/File;
    :goto_0
    return-object p0

    .line 282
    .end local v0    # "jExecutable":Ljava/io/File;
    .restart local p0    # "command":Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    .line 284
    .restart local v0    # "jExecutable":Ljava/io/File;
    sget-boolean v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->IS_AIX:Z

    if-eqz v1, :cond_1

    .line 287
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/tools/ant/util/JavaEnvUtils;->JAVA_HOME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "/sh"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->findInDir(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 290
    :cond_1
    if-nez v0, :cond_2

    .line 291
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/tools/ant/util/JavaEnvUtils;->JAVA_HOME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "/bin"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->findInDir(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 294
    :cond_2
    if-eqz v0, :cond_3

    .line 295
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 300
    :cond_3
    invoke-static {p0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->addExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static getJrePackageTestCases()Ljava/util/Vector;
    .locals 3

    .prologue
    .line 430
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 431
    .local v0, "tests":Ljava/util/Vector;
    const-string/jumbo v1, "java.lang.Object"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 432
    sget v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    packed-switch v1, :pswitch_data_0

    .line 470
    :goto_0
    const-string/jumbo v1, "sun.reflect.SerializationConstructorAccessorImpl"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 471
    const-string/jumbo v1, "sun.net.www.http.HttpClient"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 472
    const-string/jumbo v1, "sun.audio.AudioPlayer"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 475
    return-object v0

    .line 437
    :pswitch_0
    const-string/jumbo v1, "com.sun.org.apache.xerces.internal.jaxp.datatype.DatatypeFactoryImpl "

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 441
    :pswitch_1
    const-string/jumbo v1, "sun.audio.AudioPlayer"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 442
    sget v1, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersionNumber:I

    const/16 v2, 0xe

    if-ne v1, v2, :cond_0

    .line 443
    const-string/jumbo v1, "org.apache.crimson.parser.ContentModel"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 444
    const-string/jumbo v1, "org.apache.xalan.processor.ProcessorImport"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 445
    const-string/jumbo v1, "org.apache.xml.utils.URI"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 446
    const-string/jumbo v1, "org.apache.xpath.XPathFactory"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 448
    :cond_0
    const-string/jumbo v1, "org.ietf.jgss.Oid"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 449
    const-string/jumbo v1, "org.w3c.dom.Attr"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 450
    const-string/jumbo v1, "org.xml.sax.XMLReader"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 453
    :pswitch_2
    const-string/jumbo v1, "org.omg.CORBA.Any"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 454
    const-string/jumbo v1, "com.sun.corba.se.internal.corba.AnyImpl"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 455
    const-string/jumbo v1, "com.sun.jndi.ldap.LdapURL"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 456
    const-string/jumbo v1, "com.sun.media.sound.Printer"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 457
    const-string/jumbo v1, "com.sun.naming.internal.VersionHelper"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 458
    const-string/jumbo v1, "com.sun.org.omg.CORBA.Initializer"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 459
    const-string/jumbo v1, "sunw.io.Serializable"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 460
    const-string/jumbo v1, "sunw.util.EventListener"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 463
    :pswitch_3
    const-string/jumbo v1, "javax.accessibility.Accessible"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 464
    const-string/jumbo v1, "sun.misc.BASE64Encoder"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 465
    const-string/jumbo v1, "com.sun.image.codec.jpeg.JPEGCodec"

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 432
    nop

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getJrePackages()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 483
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 484
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->buildJrePackages()V

    .line 486
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->jrePackages:Ljava/util/Vector;

    return-object v0
.end method

.method public static isApacheHarmony()Z
    .locals 1

    .prologue
    .line 252
    sget-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->harmonyDetected:Z

    return v0
.end method

.method public static isAtLeastJavaVersion(Ljava/lang/String;)Z
    .locals 1
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 223
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isGij()Z
    .locals 1

    .prologue
    .line 243
    sget-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->gijDetected:Z

    return v0
.end method

.method public static isJavaVersion(Ljava/lang/String;)Z
    .locals 1
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 208
    sget-object v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->javaVersion:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isKaffe()Z
    .locals 1

    .prologue
    .line 233
    sget-boolean v0, Lorg/apache/tools/ant/util/JavaEnvUtils;->kaffeDetected:Z

    return v0
.end method
