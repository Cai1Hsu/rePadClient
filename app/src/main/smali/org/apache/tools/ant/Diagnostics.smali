.class public final Lorg/apache/tools/ant/Diagnostics;
.super Ljava/lang/Object;
.source "Diagnostics.java"


# static fields
.field private static final BIG_DRIFT_LIMIT:I = 0x2710

.field protected static final ERROR_PROPERTY_ACCESS_BLOCKED:Ljava/lang/String; = "Access to this property blocked by a security manager"

.field private static final JAVA_1_5_NUMBER:I = 0xf

.field private static final KILOBYTE:I = 0x400

.field private static final MINUTES_PER_HOUR:I = 0x3c

.field private static final SECONDS_PER_MILLISECOND:I = 0x3e8

.field private static final SECONDS_PER_MINUTE:I = 0x3c

.field private static final TEST_FILE_SIZE:I = 0x20

.field static array$Ljava$lang$String:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Main:Ljava/lang/Class;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 307
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static doReport(Ljava/io/PrintStream;)V
    .locals 1
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 293
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->doReport(Ljava/io/PrintStream;I)V

    .line 294
    return-void
.end method

.method public static doReport(Ljava/io/PrintStream;I)V
    .locals 2
    .param p0, "out"    # Ljava/io/PrintStream;
    .param p1, "logLevel"    # I

    .prologue
    .line 303
    const-string/jumbo v0, "------- Ant diagnostics report -------"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 304
    invoke-static {}, Lorg/apache/tools/ant/Main;->getAntVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 305
    const-string/jumbo v0, "Implementation Version"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 307
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "core tasks     : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.Main"

    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    :goto_0
    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->getImplementationVersion(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.Main"

    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    :goto_1
    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->getClassLocation(Ljava/lang/Class;)Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 310
    const-string/jumbo v0, "ANT PROPERTIES"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 311
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportAntProperties(Ljava/io/PrintStream;)V

    .line 313
    const-string/jumbo v0, "ANT_HOME/lib jar listing"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 314
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportAntHomeLibraries(Ljava/io/PrintStream;)V

    .line 316
    const-string/jumbo v0, "USER_HOME/.ant/lib jar listing"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 317
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportUserHomeLibraries(Ljava/io/PrintStream;)V

    .line 319
    const-string/jumbo v0, "Tasks availability"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 320
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportTasksAvailability(Ljava/io/PrintStream;)V

    .line 322
    const-string/jumbo v0, "org.apache.env.Which diagnostics"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 323
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportWhich(Ljava/io/PrintStream;)V

    .line 325
    const-string/jumbo v0, "XML Parser information"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 326
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportParserInfo(Ljava/io/PrintStream;)V

    .line 328
    const-string/jumbo v0, "XSLT Processor information"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 329
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportXSLTProcessorInfo(Ljava/io/PrintStream;)V

    .line 331
    const-string/jumbo v0, "System properties"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 332
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportSystemProperties(Ljava/io/PrintStream;)V

    .line 334
    const-string/jumbo v0, "Temp dir"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 335
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportTempDir(Ljava/io/PrintStream;)V

    .line 337
    const-string/jumbo v0, "Locale information"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 338
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportLocale(Ljava/io/PrintStream;)V

    .line 340
    const-string/jumbo v0, "Proxy information"

    invoke-static {p0, v0}, Lorg/apache/tools/ant/Diagnostics;->header(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 341
    invoke-static {p0}, Lorg/apache/tools/ant/Diagnostics;->doReportProxy(Ljava/io/PrintStream;)V

    .line 343
    invoke-virtual {p0}, Ljava/io/PrintStream;->println()V

    .line 344
    return-void

    .line 307
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    goto/16 :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    goto :goto_1
.end method

.method private static doReportAntHomeLibraries(Ljava/io/PrintStream;)V
    .locals 3
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 417
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ant.home: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ant.home"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 418
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->listLibraries()[Ljava/io/File;

    move-result-object v0

    .line 419
    .local v0, "libs":[Ljava/io/File;
    invoke-static {v0, p0}, Lorg/apache/tools/ant/Diagnostics;->printLibraries([Ljava/io/File;Ljava/io/PrintStream;)V

    .line 420
    return-void
.end method

.method private static doReportAntProperties(Ljava/io/PrintStream;)V
    .locals 3
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 397
    new-instance v0, Lorg/apache/tools/ant/Project;

    invoke-direct {v0}, Lorg/apache/tools/ant/Project;-><init>()V

    .line 398
    .local v0, "p":Lorg/apache/tools/ant/Project;
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->initProperties()V

    .line 399
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ant.version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ant.version"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 400
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ant.java.version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ant.java.version"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 402
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Is this the Apache Harmony VM? "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isApacheHarmony()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "yes"

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 404
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Is this the Kaffe VM? "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isKaffe()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "yes"

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 406
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Is this gij/gcj? "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isGij()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v1, "yes"

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 408
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ant.core.lib: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ant.core.lib"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 409
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ant.home: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "ant.home"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 410
    return-void

    .line 402
    :cond_0
    const-string/jumbo v1, "no"

    goto/16 :goto_0

    .line 404
    :cond_1
    const-string/jumbo v1, "no"

    goto :goto_1

    .line 406
    :cond_2
    const-string/jumbo v1, "no"

    goto :goto_2
.end method

.method private static doReportLocale(Ljava/io/PrintStream;)V
    .locals 10
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 640
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 641
    .local v7, "cal":Ljava/util/Calendar;
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    .line 642
    .local v0, "tz":Ljava/util/TimeZone;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Timezone "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/TimeZone;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " offset="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v7, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {v7, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x5

    invoke-virtual {v7, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 v5, 0x7

    invoke-virtual {v7, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    const/16 v6, 0xb

    invoke-virtual {v7, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    mul-int/lit8 v6, v6, 0x3c

    const/16 v9, 0xc

    invoke-virtual {v7, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    add-int/2addr v6, v9

    mul-int/lit8 v6, v6, 0x3c

    const/16 v9, 0xd

    invoke-virtual {v7, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    add-int/2addr v6, v9

    mul-int/lit16 v6, v6, 0x3e8

    const/16 v9, 0xe

    invoke-virtual {v7, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    add-int/2addr v6, v9

    invoke-virtual/range {v0 .. v6}, Ljava/util/TimeZone;->getOffset(IIIIII)I

    move-result v1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 651
    return-void
.end method

.method private static doReportParserInfo(Ljava/io/PrintStream;)V
    .locals 5
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 527
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getXMLParserName()Ljava/lang/String;

    move-result-object v1

    .line 528
    .local v1, "parserName":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getXMLParserLocation()Ljava/lang/String;

    move-result-object v0

    .line 529
    .local v0, "parserLocation":Ljava/lang/String;
    const-string/jumbo v2, "XML Parser"

    invoke-static {p0, v2, v1, v0}, Lorg/apache/tools/ant/Diagnostics;->printParserInfo(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 530
    const-string/jumbo v2, "Namespace-aware parser"

    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getNamespaceParserName()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getNamespaceParserLocation()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v2, v3, v4}, Lorg/apache/tools/ant/Diagnostics;->printParserInfo(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    return-void
.end method

.method private static doReportProxy(Ljava/io/PrintStream;)V
    .locals 5
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 677
    const-string/jumbo v3, "http.proxyHost"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 678
    const-string/jumbo v3, "http.proxyPort"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 679
    const-string/jumbo v3, "http.proxyUser"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 680
    const-string/jumbo v3, "http.proxyPassword"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 681
    const-string/jumbo v3, "http.nonProxyHosts"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 682
    const-string/jumbo v3, "https.proxyHost"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 683
    const-string/jumbo v3, "https.proxyPort"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 684
    const-string/jumbo v3, "https.nonProxyHosts"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 685
    const-string/jumbo v3, "ftp.proxyHost"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 686
    const-string/jumbo v3, "ftp.proxyPort"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 687
    const-string/jumbo v3, "ftp.nonProxyHosts"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 688
    const-string/jumbo v3, "socksProxyHost"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 689
    const-string/jumbo v3, "socksProxyPort"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 690
    const-string/jumbo v3, "java.net.socks.username"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 691
    const-string/jumbo v3, "java.net.socks.password"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 693
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJavaVersionNumber()I

    move-result v3

    const/16 v4, 0xf

    if-ge v3, v4, :cond_0

    .line 712
    :goto_0
    return-void

    .line 696
    :cond_0
    const-string/jumbo v3, "java.net.useSystemProxies"

    invoke-static {p0, v3}, Lorg/apache/tools/ant/Diagnostics;->printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 697
    const-string/jumbo v2, "org.apache.tools.ant.util.java15.ProxyDiagnostics"

    .line 699
    .local v2, "proxyDiagClassname":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v3, "org.apache.tools.ant.util.java15.ProxyDiagnostics"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 700
    .local v1, "proxyDiagClass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    .line 701
    .local v0, "instance":Ljava/lang/Object;
    const-string/jumbo v3, "Java1.5+ proxy settings:"

    invoke-virtual {p0, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 702
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 703
    .end local v0    # "instance":Ljava/lang/Object;
    .end local v1    # "proxyDiagClass":Ljava/lang/Class;
    :catch_0
    move-exception v3

    goto :goto_0

    .line 709
    :catch_1
    move-exception v3

    goto :goto_0

    .line 707
    :catch_2
    move-exception v3

    goto :goto_0

    .line 705
    :catch_3
    move-exception v3

    goto :goto_0
.end method

.method private static doReportSystemProperties(Ljava/io/PrintStream;)V
    .locals 7
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 359
    const/4 v3, 0x0

    .line 361
    .local v3, "sysprops":Ljava/util/Properties;
    :try_start_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 367
    invoke-virtual {v3}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v2

    .line 368
    .local v2, "keys":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 369
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 370
    .local v1, "key":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/tools/ant/Diagnostics;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 371
    .local v4, "value":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 362
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "keys":Ljava/util/Enumeration;
    .end local v4    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 363
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->ignoreThrowable(Ljava/lang/Throwable;)V

    .line 364
    const-string/jumbo v5, "Access to System.getProperties() blocked by a security manager"

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 373
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_0
    return-void
.end method

.method private static doReportTasksAvailability(Ljava/io/PrintStream;)V
    .locals 10
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 486
    sget-object v7, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    if-nez v7, :cond_0

    const-string/jumbo v7, "org.apache.tools.ant.Main"

    invoke-static {v7}, Lorg/apache/tools/ant/Diagnostics;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    :goto_0
    const-string/jumbo v8, "/org/apache/tools/ant/taskdefs/defaults.properties"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 488
    .local v2, "is":Ljava/io/InputStream;
    if-nez v2, :cond_1

    .line 489
    const-string/jumbo v7, "None available"

    invoke-virtual {p0, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 520
    :goto_1
    return-void

    .line 486
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_0
    sget-object v7, Lorg/apache/tools/ant/Diagnostics;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    goto :goto_0

    .line 491
    .restart local v2    # "is":Ljava/io/InputStream;
    :cond_1
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    .line 493
    .local v6, "props":Ljava/util/Properties;
    :try_start_0
    invoke-virtual {v6, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 494
    invoke-virtual {v6}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v4

    .local v4, "keys":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 495
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 496
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v6, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 498
    .local v0, "classname":Ljava/lang/String;
    :try_start_1
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 499
    invoke-virtual {v6, v3}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    .line 500
    :catch_0
    move-exception v1

    .line 501
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    :try_start_2
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " : Not Available "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "(the implementation class is not present)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 516
    .end local v0    # "classname":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keys":Ljava/util/Enumeration;
    :catch_1
    move-exception v1

    .line 517
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 503
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "classname":Ljava/lang/String;
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v4    # "keys":Ljava/util/Enumeration;
    :catch_2
    move-exception v1

    .line 504
    .local v1, "e":Ljava/lang/NoClassDefFoundError;
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x2f

    const/16 v9, 0x2e

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    .line 505
    .local v5, "pkg":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " : Missing dependency "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 506
    .end local v1    # "e":Ljava/lang/NoClassDefFoundError;
    .end local v5    # "pkg":Ljava/lang/String;
    :catch_3
    move-exception v1

    .line 507
    .local v1, "e":Ljava/lang/LinkageError;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " : Initialization error"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 510
    .end local v0    # "classname":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/LinkageError;
    .end local v3    # "key":Ljava/lang/String;
    :cond_2
    invoke-virtual {v6}, Ljava/util/Properties;->size()I

    move-result v7

    if-nez v7, :cond_3

    .line 511
    const-string/jumbo v7, "All defined tasks are available"

    invoke-virtual {p0, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 513
    :cond_3
    const-string/jumbo v7, "A task being missing/unavailable should only matter if you are trying to use it"

    invoke-virtual {p0, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_1
.end method

.method private static doReportTempDir(Ljava/io/PrintStream;)V
    .locals 26
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 563
    const-string/jumbo v22, "java.io.tmpdir"

    invoke-static/range {v22 .. v22}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 564
    .local v20, "tempdir":Ljava/lang/String;
    if-nez v20, :cond_1

    .line 565
    const-string/jumbo v22, "Warning: java.io.tmpdir is undefined"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 632
    :cond_0
    :goto_0
    return-void

    .line 568
    :cond_1
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "Temp dir is "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 569
    new-instance v18, Ljava/io/File;

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 570
    .local v18, "tempDirectory":Ljava/io/File;
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z

    move-result v22

    if-nez v22, :cond_2

    .line 571
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "Warning, java.io.tmpdir directory does not exist: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 575
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 576
    .local v16, "now":J
    const/16 v19, 0x0

    .line 577
    .local v19, "tempFile":Ljava/io/File;
    const/4 v10, 0x0

    .line 578
    .local v10, "fileout":Ljava/io/FileOutputStream;
    const/4 v8, 0x0

    .line 580
    .local v8, "filein":Ljava/io/FileInputStream;
    :try_start_0
    const-string/jumbo v22, "diag"

    const-string/jumbo v23, "txt"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v19

    .line 582
    new-instance v11, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v11, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 583
    .end local v10    # "fileout":Ljava/io/FileOutputStream;
    .local v11, "fileout":Ljava/io/FileOutputStream;
    const/16 v22, 0x400

    :try_start_1
    move/from16 v0, v22

    new-array v4, v0, [B

    .line 584
    .local v4, "buffer":[B
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_1
    const/16 v22, 0x20

    move/from16 v0, v22

    if-ge v14, v0, :cond_3

    .line 585
    invoke-virtual {v11, v4}, Ljava/io/FileOutputStream;->write([B)V

    .line 584
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 587
    :cond_3
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 588
    const/4 v10, 0x0

    .line 591
    .end local v11    # "fileout":Ljava/io/FileOutputStream;
    .restart local v10    # "fileout":Ljava/io/FileOutputStream;
    const-wide/16 v22, 0x3e8

    :try_start_2
    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V

    .line 592
    new-instance v9, Ljava/io/FileInputStream;

    move-object/from16 v0, v19

    invoke-direct {v9, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 593
    .end local v8    # "filein":Ljava/io/FileInputStream;
    .local v9, "filein":Ljava/io/FileInputStream;
    const/16 v21, 0x0

    .line 594
    .local v21, "total":I
    const/4 v15, 0x0

    .line 595
    .local v15, "read":I
    :goto_2
    const/16 v22, 0x0

    const/16 v23, 0x400

    :try_start_3
    move/from16 v0, v22

    move/from16 v1, v23

    invoke-virtual {v9, v4, v0, v1}, Ljava/io/FileInputStream;->read([BII)I

    move-result v15

    if-lez v15, :cond_4

    .line 596
    add-int v21, v21, v15

    goto :goto_2

    .line 598
    :cond_4
    invoke-virtual {v9}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 599
    const/4 v8, 0x0

    .line 601
    .end local v9    # "filein":Ljava/io/FileInputStream;
    .restart local v8    # "filein":Ljava/io/FileInputStream;
    :try_start_4
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    .line 602
    .local v12, "filetime":J
    sub-long v6, v12, v16

    .line 603
    .local v6, "drift":J
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->delete()Z

    .line 605
    const-string/jumbo v22, "Temp dir is writeable"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 606
    const v22, 0x8000

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_6

    .line 607
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, ", but seems to be full.  Wrote 32768but could only read "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, " bytes."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 614
    :goto_3
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "Temp dir alignment with system clock is "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, " ms"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 615
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v22

    const-wide/16 v24, 0x2710

    cmp-long v22, v22, v24

    if-lez v22, :cond_5

    .line 616
    const-string/jumbo v22, "Warning: big clock drift -maybe a network filesystem"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 626
    :cond_5
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 627
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 628
    if-eqz v19, :cond_0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_0

    .line 629
    .end local v4    # "buffer":[B
    .end local v6    # "drift":J
    .end local v12    # "filetime":J
    .end local v14    # "i":I
    .end local v15    # "read":I
    .end local v21    # "total":I
    :goto_4
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->delete()Z

    goto/16 :goto_0

    .line 611
    .restart local v4    # "buffer":[B
    .restart local v6    # "drift":J
    .restart local v12    # "filetime":J
    .restart local v14    # "i":I
    .restart local v15    # "read":I
    .restart local v21    # "total":I
    :cond_6
    :try_start_5
    invoke-virtual/range {p0 .. p0}, Ljava/io/PrintStream;->println()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    .line 618
    .end local v4    # "buffer":[B
    .end local v6    # "drift":J
    .end local v12    # "filetime":J
    .end local v14    # "i":I
    .end local v15    # "read":I
    .end local v21    # "total":I
    :catch_0
    move-exception v5

    .line 619
    .local v5, "e":Ljava/io/IOException;
    :goto_5
    :try_start_6
    invoke-static {v5}, Lorg/apache/tools/ant/Diagnostics;->ignoreThrowable(Ljava/lang/Throwable;)V

    .line 620
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "Failed to create a temporary file in the temp dir "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 621
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "File  "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, " could not be created/written to"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 626
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 627
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 628
    if-eqz v19, :cond_0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_0

    goto :goto_4

    .line 622
    .end local v5    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v5

    .line 623
    .local v5, "e":Ljava/lang/InterruptedException;
    :goto_6
    :try_start_7
    invoke-static {v5}, Lorg/apache/tools/ant/Diagnostics;->ignoreThrowable(Ljava/lang/Throwable;)V

    .line 624
    const-string/jumbo v22, "Failed to check whether tempdir is writable"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 626
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 627
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 628
    if-eqz v19, :cond_0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_0

    goto :goto_4

    .line 626
    .end local v5    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v22

    :goto_7
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 627
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 628
    if-eqz v19, :cond_7

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v23

    if-eqz v23, :cond_7

    .line 629
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->delete()Z

    .line 626
    :cond_7
    throw v22

    .end local v10    # "fileout":Ljava/io/FileOutputStream;
    .restart local v11    # "fileout":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v22

    move-object v10, v11

    .end local v11    # "fileout":Ljava/io/FileOutputStream;
    .restart local v10    # "fileout":Ljava/io/FileOutputStream;
    goto :goto_7

    .end local v8    # "filein":Ljava/io/FileInputStream;
    .restart local v4    # "buffer":[B
    .restart local v9    # "filein":Ljava/io/FileInputStream;
    .restart local v14    # "i":I
    .restart local v15    # "read":I
    .restart local v21    # "total":I
    :catchall_2
    move-exception v22

    move-object v8, v9

    .end local v9    # "filein":Ljava/io/FileInputStream;
    .restart local v8    # "filein":Ljava/io/FileInputStream;
    goto :goto_7

    .line 622
    .end local v4    # "buffer":[B
    .end local v10    # "fileout":Ljava/io/FileOutputStream;
    .end local v14    # "i":I
    .end local v15    # "read":I
    .end local v21    # "total":I
    .restart local v11    # "fileout":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v5

    move-object v10, v11

    .end local v11    # "fileout":Ljava/io/FileOutputStream;
    .restart local v10    # "fileout":Ljava/io/FileOutputStream;
    goto :goto_6

    .end local v8    # "filein":Ljava/io/FileInputStream;
    .restart local v4    # "buffer":[B
    .restart local v9    # "filein":Ljava/io/FileInputStream;
    .restart local v14    # "i":I
    .restart local v15    # "read":I
    .restart local v21    # "total":I
    :catch_3
    move-exception v5

    move-object v8, v9

    .end local v9    # "filein":Ljava/io/FileInputStream;
    .restart local v8    # "filein":Ljava/io/FileInputStream;
    goto :goto_6

    .line 618
    .end local v4    # "buffer":[B
    .end local v10    # "fileout":Ljava/io/FileOutputStream;
    .end local v14    # "i":I
    .end local v15    # "read":I
    .end local v21    # "total":I
    .restart local v11    # "fileout":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v5

    move-object v10, v11

    .end local v11    # "fileout":Ljava/io/FileOutputStream;
    .restart local v10    # "fileout":Ljava/io/FileOutputStream;
    goto/16 :goto_5

    .end local v8    # "filein":Ljava/io/FileInputStream;
    .restart local v4    # "buffer":[B
    .restart local v9    # "filein":Ljava/io/FileInputStream;
    .restart local v14    # "i":I
    .restart local v15    # "read":I
    .restart local v21    # "total":I
    :catch_5
    move-exception v5

    move-object v8, v9

    .end local v9    # "filein":Ljava/io/FileInputStream;
    .restart local v8    # "filein":Ljava/io/FileInputStream;
    goto/16 :goto_5
.end method

.method private static doReportUserHomeLibraries(Ljava/io/PrintStream;)V
    .locals 5
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 428
    const-string/jumbo v3, "user.home"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 429
    .local v0, "home":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "user.home: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 430
    new-instance v1, Ljava/io/File;

    sget-object v3, Lorg/apache/tools/ant/launch/Launcher;->USER_LIBDIR:Ljava/lang/String;

    invoke-direct {v1, v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    .local v1, "libDir":Ljava/io/File;
    invoke-static {v1}, Lorg/apache/tools/ant/Diagnostics;->listJarFiles(Ljava/io/File;)[Ljava/io/File;

    move-result-object v2

    .line 432
    .local v2, "libs":[Ljava/io/File;
    invoke-static {v2, p0}, Lorg/apache/tools/ant/Diagnostics;->printLibraries([Ljava/io/File;Ljava/io/PrintStream;)V

    .line 433
    return-void
.end method

.method private static doReportWhich(Ljava/io/PrintStream;)V
    .locals 8
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 456
    const/4 v1, 0x0

    .line 458
    .local v1, "error":Ljava/lang/Throwable;
    :try_start_0
    const-string/jumbo v4, "org.apache.env.Which"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 459
    .local v3, "which":Ljava/lang/Class;
    const-string/jumbo v5, "main"

    const/4 v4, 0x1

    new-array v6, v4, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v4, Lorg/apache/tools/ant/Diagnostics;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v4, :cond_1

    const-string/jumbo v4, "[Ljava.lang.String;"

    invoke-static {v4}, Lorg/apache/tools/ant/Diagnostics;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/Diagnostics;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_0
    aput-object v4, v6, v7

    invoke-virtual {v3, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 461
    .local v2, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 471
    .end local v2    # "method":Ljava/lang/reflect/Method;
    .end local v3    # "which":Ljava/lang/Class;
    :goto_1
    if-eqz v1, :cond_0

    .line 472
    const-string/jumbo v4, "Error while running org.apache.env.Which"

    invoke-virtual {p0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 473
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 475
    :cond_0
    return-void

    .line 459
    .restart local v3    # "which":Ljava/lang/Class;
    :cond_1
    :try_start_1
    sget-object v4, Lorg/apache/tools/ant/Diagnostics;->array$Ljava$lang$String:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 462
    .end local v3    # "which":Ljava/lang/Class;
    :catch_0
    move-exception v0

    .line 463
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const-string/jumbo v4, "Not available."

    invoke-virtual {p0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 464
    const-string/jumbo v4, "Download it at http://xml.apache.org/commons/"

    invoke-virtual {p0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 465
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v0

    .line 466
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v4

    if-nez v4, :cond_2

    move-object v1, v0

    .line 469
    :goto_2
    goto :goto_1

    .line 466
    :cond_2
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v1

    goto :goto_2

    .line 467
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v0

    .line 468
    .local v0, "e":Ljava/lang/Throwable;
    move-object v1, v0

    goto :goto_1
.end method

.method private static doReportXSLTProcessorInfo(Ljava/io/PrintStream;)V
    .locals 3
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 539
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getXSLTProcessorName()Ljava/lang/String;

    move-result-object v1

    .line 540
    .local v1, "processorName":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getXSLTProcessorLocation()Ljava/lang/String;

    move-result-object v0

    .line 541
    .local v0, "processorLocation":Ljava/lang/String;
    const-string/jumbo v2, "XSLT Processor"

    invoke-static {p0, v2, v1, v0}, Lorg/apache/tools/ant/Diagnostics;->printParserInfo(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 542
    return-void
.end method

.method private static getClassLocation(Ljava/lang/Class;)Ljava/net/URL;
    .locals 1
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 158
    invoke-virtual {p0}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/ProtectionDomain;->getCodeSource()Ljava/security/CodeSource;

    move-result-object v0

    if-nez v0, :cond_0

    .line 159
    const/4 v0, 0x0

    .line 161
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/ProtectionDomain;->getCodeSource()Ljava/security/CodeSource;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/CodeSource;->getLocation()Ljava/net/URL;

    move-result-object v0

    goto :goto_0
.end method

.method private static getImplementationVersion(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 149
    invoke-virtual {p0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getImplementationVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getNamespaceParserLocation()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 256
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getNamespaceXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v2

    .line 257
    .local v2, "reader":Lorg/xml/sax/XMLReader;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/Diagnostics;->getClassLocation(Ljava/lang/Class;)Ljava/net/URL;

    move-result-object v1

    .line 258
    .local v1, "location":Ljava/net/URL;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 262
    .end local v1    # "location":Ljava/net/URL;
    :cond_0
    :goto_0
    return-object v3

    .line 259
    :catch_0
    move-exception v0

    .line 261
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->ignoreThrowable(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static getNamespaceParserName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 245
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getNamespaceXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    .line 246
    .local v1, "reader":Lorg/xml/sax/XMLReader;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 250
    :goto_0
    return-object v2

    .line 247
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->ignoreThrowable(Ljava/lang/Throwable;)V

    .line 250
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 385
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 389
    .local v1, "value":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 386
    .end local v1    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 387
    .local v0, "e":Ljava/lang/SecurityException;
    const-string/jumbo v1, "Access to this property blocked by a security manager"

    .restart local v1    # "value":Ljava/lang/String;
    goto :goto_0
.end method

.method private static getSAXParser()Ljavax/xml/parsers/SAXParser;
    .locals 3

    .prologue
    .line 197
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 198
    .local v2, "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    if-nez v2, :cond_0

    .line 199
    const/4 v1, 0x0

    .line 208
    :goto_0
    return-object v1

    .line 201
    :cond_0
    const/4 v1, 0x0

    .line 203
    .local v1, "saxParser":Ljavax/xml/parsers/SAXParser;
    :try_start_0
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 204
    :catch_0
    move-exception v0

    .line 206
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->ignoreThrowable(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static getXMLParserLocation()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 235
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 236
    .local v1, "saxParser":Ljavax/xml/parsers/SAXParser;
    if-nez v1, :cond_1

    .line 240
    :cond_0
    :goto_0
    return-object v2

    .line 239
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/tools/ant/Diagnostics;->getClassLocation(Ljava/lang/Class;)Ljava/net/URL;

    move-result-object v0

    .line 240
    .local v0, "location":Ljava/net/URL;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static getXMLParserName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 169
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    .line 170
    .local v0, "saxParser":Ljavax/xml/parsers/SAXParser;
    if-nez v0, :cond_0

    .line 171
    const-string/jumbo v1, "Could not create an XML Parser"

    .line 175
    :goto_0
    return-object v1

    .line 174
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "saxParserName":Ljava/lang/String;
    goto :goto_0
.end method

.method private static getXSLTProcessor()Ljavax/xml/transform/Transformer;
    .locals 3

    .prologue
    .line 216
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v2

    .line 217
    .local v2, "transformerFactory":Ljavax/xml/transform/TransformerFactory;
    if-nez v2, :cond_0

    .line 218
    const/4 v1, 0x0

    .line 227
    :goto_0
    return-object v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    .line 222
    .local v1, "transformer":Ljavax/xml/transform/Transformer;
    :try_start_0
    invoke-virtual {v2}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 223
    :catch_0
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->ignoreThrowable(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static getXSLTProcessorLocation()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 271
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getXSLTProcessor()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 272
    .local v1, "transformer":Ljavax/xml/transform/Transformer;
    if-nez v1, :cond_1

    .line 276
    :cond_0
    :goto_0
    return-object v2

    .line 275
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/tools/ant/Diagnostics;->getClassLocation(Ljava/lang/Class;)Ljava/net/URL;

    move-result-object v0

    .line 276
    .local v0, "location":Ljava/net/URL;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static getXSLTProcessorName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 183
    invoke-static {}, Lorg/apache/tools/ant/Diagnostics;->getXSLTProcessor()Ljavax/xml/transform/Transformer;

    move-result-object v1

    .line 184
    .local v1, "transformer":Ljavax/xml/transform/Transformer;
    if-nez v1, :cond_0

    .line 185
    const-string/jumbo v0, "Could not create an XSLT Processor"

    .line 189
    :goto_0
    return-object v0

    .line 188
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "processorName":Ljava/lang/String;
    goto :goto_0
.end method

.method private static header(Ljava/io/PrintStream;Ljava/lang/String;)V
    .locals 1
    .param p0, "out"    # Ljava/io/PrintStream;
    .param p1, "section"    # Ljava/lang/String;

    .prologue
    .line 347
    invoke-virtual {p0}, Ljava/io/PrintStream;->println()V

    .line 348
    const-string/jumbo v0, "-------------------------------------------"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 349
    const-string/jumbo v0, " "

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 350
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 351
    const-string/jumbo v0, "-------------------------------------------"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 352
    return-void
.end method

.method private static ignoreThrowable(Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "thrown"    # Ljava/lang/Throwable;

    .prologue
    .line 285
    return-void
.end method

.method public static isOptionalAvailable()Z
    .locals 1

    .prologue
    .line 93
    const/4 v0, 0x1

    return v0
.end method

.method private static listJarFiles(Ljava/io/File;)[Ljava/io/File;
    .locals 2
    .param p0, "libDir"    # Ljava/io/File;

    .prologue
    .line 125
    new-instance v1, Lorg/apache/tools/ant/Diagnostics$1;

    invoke-direct {v1}, Lorg/apache/tools/ant/Diagnostics$1;-><init>()V

    .line 130
    .local v1, "filter":Ljava/io/FilenameFilter;
    invoke-virtual {p0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    .line 131
    .local v0, "files":[Ljava/io/File;
    return-object v0
.end method

.method public static listLibraries()[Ljava/io/File;
    .locals 3

    .prologue
    .line 110
    const-string/jumbo v2, "ant.home"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "home":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 112
    const/4 v2, 0x0

    .line 115
    :goto_0
    return-object v2

    .line 114
    :cond_0
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "lib"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .local v1, "libDir":Ljava/io/File;
    invoke-static {v1}, Lorg/apache/tools/ant/Diagnostics;->listJarFiles(Ljava/io/File;)[Ljava/io/File;

    move-result-object v2

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 1
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 139
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v0}, Lorg/apache/tools/ant/Diagnostics;->doReport(Ljava/io/PrintStream;)V

    .line 140
    return-void
.end method

.method private static printLibraries([Ljava/io/File;Ljava/io/PrintStream;)V
    .locals 4
    .param p0, "libs"    # [Ljava/io/File;
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 441
    if-nez p0, :cond_1

    .line 442
    const-string/jumbo v1, "No such directory."

    invoke-virtual {p1, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 448
    :cond_0
    return-void

    .line 445
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 446
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " bytes)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 445
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static printParserInfo(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "out"    # Ljava/io/PrintStream;
    .param p1, "parserType"    # Ljava/lang/String;
    .param p2, "parserName"    # Ljava/lang/String;
    .param p3, "parserLocation"    # Ljava/lang/String;

    .prologue
    .line 546
    if-nez p2, :cond_0

    .line 547
    const-string/jumbo p2, "unknown"

    .line 549
    :cond_0
    if-nez p3, :cond_1

    .line 550
    const-string/jumbo p3, "unknown"

    .line 552
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 553
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " Location: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 554
    return-void
.end method

.method private static printProperty(Ljava/io/PrintStream;Ljava/lang/String;)V
    .locals 3
    .param p0, "out"    # Ljava/io/PrintStream;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x22

    .line 660
    invoke-static {p1}, Lorg/apache/tools/ant/Diagnostics;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 661
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 662
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 663
    const-string/jumbo v1, " = "

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 664
    invoke-virtual {p0, v2}, Ljava/io/PrintStream;->print(C)V

    .line 665
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 666
    invoke-virtual {p0, v2}, Ljava/io/PrintStream;->println(C)V

    .line 668
    :cond_0
    return-void
.end method

.method public static validateVersion()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 101
    return-void
.end method
