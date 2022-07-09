.class public Lorg/apache/tools/ant/types/XMLCatalog;
.super Lorg/apache/tools/ant/types/DataType;
.source "XMLCatalog.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lorg/xml/sax/EntityResolver;
.implements Ljavax/xml/transform/URIResolver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;,
        Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;,
        Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;
    }
.end annotation


# static fields
.field public static final APACHE_RESOLVER:Ljava/lang/String; = "org.apache.tools.ant.types.resolver.ApacheCatalogResolver"

.field public static final CATALOG_RESOLVER:Ljava/lang/String; = "org.apache.xml.resolver.tools.CatalogResolver"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$XMLCatalog:Ljava/lang/Class;


# instance fields
.field private catalogPath:Lorg/apache/tools/ant/types/Path;

.field private catalogResolver:Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private elements:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 124
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/XMLCatalog;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 160
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 129
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->elements:Ljava/util/Vector;

    .line 486
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogResolver:Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;

    .line 161
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 162
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/types/XMLCatalog;Ljava/lang/String;)Lorg/apache/tools/ant/types/ResourceLocation;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/XMLCatalog;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->findMatchingEntry(Ljava/lang/String;)Lorg/apache/tools/ant/types/ResourceLocation;

    move-result-object v0

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/XMLCatalog;
    .param p1, "x1"    # Lorg/apache/tools/ant/types/ResourceLocation;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->filesystemLookup(Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v0

    return-object v0
.end method

.method static access$200(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/XMLCatalog;
    .param p1, "x1"    # Lorg/apache/tools/ant/types/ResourceLocation;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->classpathLookup(Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v0

    return-object v0
.end method

.method static access$300(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/XMLCatalog;
    .param p1, "x1"    # Lorg/apache/tools/ant/types/ResourceLocation;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->urlLookup(Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v0

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 480
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

.method private classpathLookup(Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;
    .locals 8
    .param p1, "matchingEntry"    # Lorg/apache/tools/ant/types/ResourceLocation;

    .prologue
    .line 712
    const/4 v4, 0x0

    .line 714
    .local v4, "source":Lorg/xml/sax/InputSource;
    const/4 v3, 0x0

    .line 715
    .local v3, "loader":Lorg/apache/tools/ant/AntClassLoader;
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 716
    .local v0, "cp":Lorg/apache/tools/ant/types/Path;
    if-eqz v0, :cond_1

    .line 717
    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v7, "ignore"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 721
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6, v0}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v3

    .line 726
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/AntClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 729
    .local v2, "is":Ljava/io/InputStream;
    if-eqz v2, :cond_0

    .line 730
    new-instance v4, Lorg/xml/sax/InputSource;

    .end local v4    # "source":Lorg/xml/sax/InputSource;
    invoke-direct {v4, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 731
    .restart local v4    # "source":Lorg/xml/sax/InputSource;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/AntClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 732
    .local v1, "entryURL":Ljava/net/URL;
    invoke-virtual {v1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v5

    .line 733
    .local v5, "sysid":Ljava/lang/String;
    invoke-virtual {v4, v5}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 734
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "catalog entry matched a resource in the classpath: \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 738
    .end local v1    # "entryURL":Ljava/net/URL;
    .end local v5    # "sysid":Ljava/lang/String;
    :cond_0
    return-object v4

    .line 719
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_1
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    const-string/jumbo v7, "last"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    goto :goto_0
.end method

.method private filesystemLookup(Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;
    .locals 15
    .param p1, "matchingEntry"    # Lorg/apache/tools/ant/types/ResourceLocation;

    .prologue
    .line 638
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v9

    .line 640
    .local v9, "uri":Ljava/lang/String;
    sget-char v12, Ljava/io/File;->separatorChar:C

    const/16 v13, 0x2f

    invoke-virtual {v9, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v9

    .line 641
    const/4 v0, 0x0

    .line 648
    .local v0, "baseURL":Ljava/net/URL;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getBase()Ljava/net/URL;

    move-result-object v12

    if-eqz v12, :cond_1

    .line 649
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getBase()Ljava/net/URL;

    move-result-object v0

    .line 658
    :goto_0
    const/4 v5, 0x0

    .line 659
    .local v5, "source":Lorg/xml/sax/InputSource;
    const/4 v10, 0x0

    .line 661
    .local v10, "url":Ljava/net/URL;
    :try_start_0
    new-instance v11, Ljava/net/URL;

    invoke-direct {v11, v0, v9}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    .end local v10    # "url":Ljava/net/URL;
    .local v11, "url":Ljava/net/URL;
    move-object v10, v11

    .line 683
    .end local v11    # "url":Ljava/net/URL;
    .restart local v10    # "url":Ljava/net/URL;
    :goto_1
    if-eqz v10, :cond_0

    invoke-virtual {v10}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v12

    const-string/jumbo v13, "file"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 684
    sget-object v12, Lorg/apache/tools/ant/types/XMLCatalog;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v10}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 685
    .local v3, "fileName":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 686
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "fileName "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x4

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 687
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 688
    .local v4, "resFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->canRead()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 690
    :try_start_1
    new-instance v6, Lorg/xml/sax/InputSource;

    new-instance v12, Ljava/io/FileInputStream;

    invoke-direct {v12, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v12}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 691
    .end local v5    # "source":Lorg/xml/sax/InputSource;
    .local v6, "source":Lorg/xml/sax/InputSource;
    :try_start_2
    invoke-static {v4}, Lorg/apache/tools/ant/util/JAXPUtils;->getSystemId(Ljava/io/File;)Ljava/lang/String;

    move-result-object v7

    .line 692
    .local v7, "sysid":Ljava/lang/String;
    invoke-virtual {v6, v7}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 693
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "catalog entry matched a readable file: \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "\'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x4

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    move-object v5, v6

    .line 701
    .end local v3    # "fileName":Ljava/lang/String;
    .end local v4    # "resFile":Ljava/io/File;
    .end local v6    # "source":Lorg/xml/sax/InputSource;
    .end local v7    # "sysid":Ljava/lang/String;
    .restart local v5    # "source":Lorg/xml/sax/InputSource;
    :cond_0
    :goto_2
    return-object v5

    .line 652
    .end local v5    # "source":Lorg/xml/sax/InputSource;
    .end local v10    # "url":Ljava/net/URL;
    :cond_1
    :try_start_3
    sget-object v12, Lorg/apache/tools/ant/types/XMLCatalog;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    invoke-virtual {v13}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v0

    goto/16 :goto_0

    .line 653
    :catch_0
    move-exception v1

    .line 654
    .local v1, "ex":Ljava/net/MalformedURLException;
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "Project basedir cannot be converted to a URL"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 662
    .end local v1    # "ex":Ljava/net/MalformedURLException;
    .restart local v5    # "source":Lorg/xml/sax/InputSource;
    .restart local v10    # "url":Ljava/net/URL;
    :catch_1
    move-exception v1

    .line 666
    .restart local v1    # "ex":Ljava/net/MalformedURLException;
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 667
    .local v8, "testFile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-virtual {v8}, Ljava/io/File;->canRead()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 668
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "uri : \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "\' matches a readable file"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x4

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 671
    :try_start_4
    sget-object v12, Lorg/apache/tools/ant/types/XMLCatalog;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v12, v8}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;
    :try_end_4
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v10

    goto/16 :goto_1

    .line 672
    :catch_2
    move-exception v2

    .line 673
    .local v2, "ex1":Ljava/net/MalformedURLException;
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "could not find an URL for :"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 677
    .end local v2    # "ex1":Ljava/net/MalformedURLException;
    :cond_2
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "uri : \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "\' does not match a readable file"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x4

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 695
    .end local v1    # "ex":Ljava/net/MalformedURLException;
    .end local v8    # "testFile":Ljava/io/File;
    .restart local v3    # "fileName":Ljava/lang/String;
    .restart local v4    # "resFile":Ljava/io/File;
    :catch_3
    move-exception v12

    goto/16 :goto_2

    .end local v5    # "source":Lorg/xml/sax/InputSource;
    .restart local v6    # "source":Lorg/xml/sax/InputSource;
    :catch_4
    move-exception v12

    move-object v5, v6

    .end local v6    # "source":Lorg/xml/sax/InputSource;
    .restart local v5    # "source":Lorg/xml/sax/InputSource;
    goto/16 :goto_2
.end method

.method private findMatchingEntry(Ljava/lang/String;)Lorg/apache/tools/ant/types/ResourceLocation;
    .locals 4
    .param p1, "publicId"    # Ljava/lang/String;

    .prologue
    .line 597
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getElements()Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 598
    .local v0, "e":Ljava/util/Enumeration;
    const/4 v1, 0x0

    .line 599
    .local v1, "element":Lorg/apache/tools/ant/types/ResourceLocation;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 600
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .line 601
    .local v2, "o":Ljava/lang/Object;
    instance-of v3, v2, Lorg/apache/tools/ant/types/ResourceLocation;

    if-eqz v3, :cond_0

    move-object v1, v2

    .line 602
    check-cast v1, Lorg/apache/tools/ant/types/ResourceLocation;

    .line 603
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/ResourceLocation;->getPublicId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v3, v1

    .line 608
    .end local v2    # "o":Ljava/lang/Object;
    :goto_0
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private getCatalogResolver()Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 500
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogResolver:Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;

    if-nez v7, :cond_0

    .line 502
    const/4 v5, 0x0

    .line 504
    .local v5, "loader":Lorg/apache/tools/ant/AntClassLoader;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    sget-object v8, Lorg/apache/tools/ant/types/Path;->systemClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v5

    .line 507
    :try_start_0
    const-string/jumbo v7, "org.apache.tools.ant.types.resolver.ApacheCatalogResolver"

    const/4 v8, 0x1

    invoke-static {v7, v8, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    .line 512
    .local v3, "clazz":Ljava/lang/Class;
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 515
    .local v0, "apacheResolverLoader":Ljava/lang/ClassLoader;
    const-string/jumbo v7, "org.apache.xml.resolver.tools.CatalogResolver"

    const/4 v8, 0x1

    invoke-static {v7, v8, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 519
    .local v1, "baseResolverClass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 526
    .local v2, "baseResolverLoader":Ljava/lang/ClassLoader;
    const-string/jumbo v7, "org.apache.tools.ant.types.resolver.ApacheCatalogResolver"

    const/4 v8, 0x1

    invoke-static {v7, v8, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    .line 528
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    .line 533
    .local v6, "obj":Ljava/lang/Object;
    new-instance v7, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;

    invoke-direct {v7, p0, v3, v6}, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;-><init>(Lorg/apache/tools/ant/types/XMLCatalog;Ljava/lang/Class;Ljava/lang/Object;)V

    iput-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogResolver:Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 548
    .end local v0    # "apacheResolverLoader":Ljava/lang/ClassLoader;
    .end local v1    # "baseResolverClass":Ljava/lang/Class;
    .end local v2    # "baseResolverLoader":Ljava/lang/ClassLoader;
    .end local v3    # "clazz":Ljava/lang/Class;
    .end local v5    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    .end local v6    # "obj":Ljava/lang/Object;
    :cond_0
    :goto_0
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogResolver:Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;

    return-object v7

    .line 534
    .restart local v5    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    :catch_0
    move-exception v4

    .line 539
    .local v4, "ex":Ljava/lang/Throwable;
    new-instance v7, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;

    invoke-direct {v7, p0}, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;-><init>(Lorg/apache/tools/ant/types/XMLCatalog;)V

    iput-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogResolver:Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;

    .line 540
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v7

    if-eqz v7, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v7

    array-length v7, v7

    if-eqz v7, :cond_1

    .line 542
    const-string/jumbo v7, "Warning: XML resolver not found; external catalogs will be ignored"

    invoke-virtual {p0, v7, v9}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 545
    :cond_1
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Failed to load Apache resolver: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x4

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 179
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getRef()Lorg/apache/tools/ant/types/XMLCatalog;

    move-result-object v0

    iget-object v0, v0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method private getElements()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 170
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getRef()Lorg/apache/tools/ant/types/XMLCatalog;

    move-result-object v0

    iget-object v0, v0, Lorg/apache/tools/ant/types/XMLCatalog;->elements:Ljava/util/Vector;

    return-object v0
.end method

.method private getRef()Lorg/apache/tools/ant/types/XMLCatalog;
    .locals 2

    .prologue
    .line 477
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-nez v0, :cond_0

    .line 480
    .end local p0    # "this":Lorg/apache/tools/ant/types/XMLCatalog;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lorg/apache/tools/ant/types/XMLCatalog;
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/XMLCatalog;->class$org$apache$tools$ant$types$XMLCatalog:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.types.XMLCatalog"

    invoke-static {v0}, Lorg/apache/tools/ant/types/XMLCatalog;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/XMLCatalog;->class$org$apache$tools$ant$types$XMLCatalog:Ljava/lang/Class;

    :goto_1
    const-string/jumbo v1, "xmlcatalog"

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/XMLCatalog;

    move-object p0, v0

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/types/XMLCatalog;->class$org$apache$tools$ant$types$XMLCatalog:Ljava/lang/Class;

    goto :goto_1
.end method

.method private removeFragment(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 622
    move-object v1, p1

    .line 623
    .local v1, "result":Ljava/lang/String;
    const-string/jumbo v2, "#"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 624
    .local v0, "hashPos":I
    if-ltz v0, :cond_0

    .line 625
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 627
    :cond_0
    return-object v1
.end method

.method private setEntityResolver(Ljavax/xml/transform/sax/SAXSource;)V
    .locals 4
    .param p1, "source"    # Ljavax/xml/transform/sax/SAXSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 572
    invoke-virtual {p1}, Ljavax/xml/transform/sax/SAXSource;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    .line 573
    .local v1, "reader":Lorg/xml/sax/XMLReader;
    if-nez v1, :cond_0

    .line 574
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 575
    .local v2, "spFactory":Ljavax/xml/parsers/SAXParserFactory;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 577
    :try_start_0
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 584
    .end local v2    # "spFactory":Ljavax/xml/parsers/SAXParserFactory;
    :cond_0
    invoke-interface {v1, p0}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 585
    invoke-virtual {p1, v1}, Ljavax/xml/transform/sax/SAXSource;->setXMLReader(Lorg/xml/sax/XMLReader;)V

    .line 586
    return-void

    .line 578
    .restart local v2    # "spFactory":Ljavax/xml/parsers/SAXParserFactory;
    :catch_0
    move-exception v0

    .line 579
    .local v0, "ex":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v3, Ljavax/xml/transform/TransformerException;

    invoke-direct {v3, v0}, Ljavax/xml/transform/TransformerException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 580
    .end local v0    # "ex":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v0

    .line 581
    .local v0, "ex":Lorg/xml/sax/SAXException;
    new-instance v3, Ljavax/xml/transform/TransformerException;

    invoke-direct {v3, v0}, Ljavax/xml/transform/TransformerException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private urlLookup(Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;
    .locals 11
    .param p1, "matchingEntry"    # Lorg/apache/tools/ant/types/ResourceLocation;

    .prologue
    .line 749
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v6

    .line 750
    .local v6, "uri":Ljava/lang/String;
    const/4 v0, 0x0

    .line 757
    .local v0, "baseURL":Ljava/net/URL;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getBase()Ljava/net/URL;

    move-result-object v9

    if-eqz v9, :cond_1

    .line 758
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/ResourceLocation;->getBase()Ljava/net/URL;

    move-result-object v0

    .line 767
    :goto_0
    const/4 v3, 0x0

    .line 768
    .local v3, "source":Lorg/xml/sax/InputSource;
    const/4 v7, 0x0

    .line 771
    .local v7, "url":Ljava/net/URL;
    :try_start_0
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v0, v6}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_3

    .end local v7    # "url":Ljava/net/URL;
    .local v8, "url":Ljava/net/URL;
    move-object v7, v8

    .line 776
    .end local v8    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    :goto_1
    if-eqz v7, :cond_0

    .line 778
    :try_start_1
    invoke-virtual {v7}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v2

    .line 779
    .local v2, "is":Ljava/io/InputStream;
    if-eqz v2, :cond_0

    .line 780
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 781
    .end local v3    # "source":Lorg/xml/sax/InputSource;
    .local v4, "source":Lorg/xml/sax/InputSource;
    :try_start_2
    invoke-virtual {v7}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v5

    .line 782
    .local v5, "sysid":Ljava/lang/String;
    invoke-virtual {v4, v5}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 783
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "catalog entry matched as a URL: \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x4

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v3, v4

    .line 791
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v4    # "source":Lorg/xml/sax/InputSource;
    .end local v5    # "sysid":Ljava/lang/String;
    .restart local v3    # "source":Lorg/xml/sax/InputSource;
    :cond_0
    :goto_2
    return-object v3

    .line 761
    .end local v3    # "source":Lorg/xml/sax/InputSource;
    .end local v7    # "url":Ljava/net/URL;
    :cond_1
    :try_start_3
    sget-object v9, Lorg/apache/tools/ant/types/XMLCatalog;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v0

    goto :goto_0

    .line 762
    :catch_0
    move-exception v1

    .line 763
    .local v1, "ex":Ljava/net/MalformedURLException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Project basedir cannot be converted to a URL"

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 786
    .end local v1    # "ex":Ljava/net/MalformedURLException;
    .restart local v3    # "source":Lorg/xml/sax/InputSource;
    .restart local v7    # "url":Ljava/net/URL;
    :catch_1
    move-exception v9

    goto :goto_2

    .end local v3    # "source":Lorg/xml/sax/InputSource;
    .restart local v2    # "is":Ljava/io/InputStream;
    .restart local v4    # "source":Lorg/xml/sax/InputSource;
    :catch_2
    move-exception v9

    move-object v3, v4

    .end local v4    # "source":Lorg/xml/sax/InputSource;
    .restart local v3    # "source":Lorg/xml/sax/InputSource;
    goto :goto_2

    .line 772
    .end local v2    # "is":Ljava/io/InputStream;
    :catch_3
    move-exception v9

    goto :goto_1
.end method


# virtual methods
.method public addConfiguredXMLCatalog(Lorg/apache/tools/ant/types/XMLCatalog;)V
    .locals 6
    .param p1, "catalog"    # Lorg/apache/tools/ant/types/XMLCatalog;

    .prologue
    .line 329
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 330
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v5

    throw v5

    .line 334
    :cond_0
    invoke-direct {p1}, Lorg/apache/tools/ant/types/XMLCatalog;->getElements()Ljava/util/Vector;

    move-result-object v3

    .line 335
    .local v3, "newElements":Ljava/util/Vector;
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getElements()Ljava/util/Vector;

    move-result-object v4

    .line 336
    .local v4, "ourElements":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 337
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 338
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 342
    :cond_1
    invoke-direct {p1}, Lorg/apache/tools/ant/types/XMLCatalog;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    .line 343
    .local v2, "nestedClasspath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 346
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 347
    .local v1, "nestedCatalogPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->createCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    invoke-virtual {v5, v1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 348
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 349
    return-void
.end method

.method public addDTD(Lorg/apache/tools/ant/types/ResourceLocation;)V
    .locals 1
    .param p1, "dtd"    # Lorg/apache/tools/ant/types/ResourceLocation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 297
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 298
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 301
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getElements()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 302
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 303
    return-void
.end method

.method public addEntity(Lorg/apache/tools/ant/types/ResourceLocation;)V
    .locals 0
    .param p1, "entity"    # Lorg/apache/tools/ant/types/ResourceLocation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 317
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->addDTD(Lorg/apache/tools/ant/types/ResourceLocation;)V

    .line 318
    return-void
.end method

.method public createCatalogPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 247
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 250
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogPath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 251
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogPath:Lorg/apache/tools/ant/types/Path;

    .line 253
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 254
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogPath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 191
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 194
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 195
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 197
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 198
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 457
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 471
    :goto_0
    monitor-exit p0

    return-void

    .line 460
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 461
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 457
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 463
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_2

    .line 464
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/XMLCatalog;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 466
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogPath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_3

    .line 467
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogPath:Lorg/apache/tools/ant/types/Path;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/XMLCatalog;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 469
    :cond_3
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getCatalogPath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 281
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getRef()Lorg/apache/tools/ant/types/XMLCatalog;

    move-result-object v0

    iget-object v0, v0, Lorg/apache/tools/ant/types/XMLCatalog;->catalogPath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public resolve(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/transform/Source;
    .locals 9
    .param p1, "href"    # Ljava/lang/String;
    .param p2, "base"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 413
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 414
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getRef()Lorg/apache/tools/ant/types/XMLCatalog;

    move-result-object v6

    invoke-virtual {v6, p1, p2}, Lorg/apache/tools/ant/types/XMLCatalog;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/transform/Source;

    move-result-object v3

    .line 452
    :goto_0
    return-object v3

    .line 417
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->dieOnCircularReference()V

    .line 419
    const/4 v3, 0x0

    .line 421
    .local v3, "source":Ljavax/xml/transform/sax/SAXSource;
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->removeFragment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 423
    .local v4, "uri":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "resolve: \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\' with base: \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v8}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 425
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogResolver()Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;

    move-result-object v6

    invoke-interface {v6, v4, p2}, Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/transform/Source;

    move-result-object v3

    .end local v3    # "source":Ljavax/xml/transform/sax/SAXSource;
    check-cast v3, Ljavax/xml/transform/sax/SAXSource;

    .line 427
    .restart local v3    # "source":Ljavax/xml/transform/sax/SAXSource;
    if-nez v3, :cond_1

    .line 428
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "No matching catalog entry found, parser will use: \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v8}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 434
    new-instance v3, Ljavax/xml/transform/sax/SAXSource;

    .end local v3    # "source":Ljavax/xml/transform/sax/SAXSource;
    invoke-direct {v3}, Ljavax/xml/transform/sax/SAXSource;-><init>()V

    .line 435
    .restart local v3    # "source":Ljavax/xml/transform/sax/SAXSource;
    const/4 v0, 0x0

    .line 437
    .local v0, "baseURL":Ljava/net/URL;
    if-nez p2, :cond_2

    .line 438
    :try_start_0
    sget-object v6, Lorg/apache/tools/ant/types/XMLCatalog;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v0

    .line 442
    :goto_1
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_3

    move-object v5, v0

    .line 443
    .local v5, "url":Ljava/net/URL;
    :goto_2
    new-instance v6, Lorg/xml/sax/InputSource;

    invoke-virtual {v5}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/xml/sax/InputSource;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljavax/xml/transform/sax/SAXSource;->setInputSource(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 451
    .end local v0    # "baseURL":Ljava/net/URL;
    .end local v5    # "url":Ljava/net/URL;
    :cond_1
    :goto_3
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/types/XMLCatalog;->setEntityResolver(Ljavax/xml/transform/sax/SAXSource;)V

    goto/16 :goto_0

    .line 440
    .restart local v0    # "baseURL":Ljava/net/URL;
    :cond_2
    :try_start_1
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .end local v0    # "baseURL":Ljava/net/URL;
    .local v1, "baseURL":Ljava/net/URL;
    move-object v0, v1

    .end local v1    # "baseURL":Ljava/net/URL;
    .restart local v0    # "baseURL":Ljava/net/URL;
    goto :goto_1

    .line 442
    :cond_3
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, v0, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 444
    :catch_0
    move-exception v2

    .line 447
    .local v2, "ex":Ljava/net/MalformedURLException;
    new-instance v6, Lorg/xml/sax/InputSource;

    invoke-direct {v6, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljavax/xml/transform/sax/SAXSource;->setInputSource(Lorg/xml/sax/InputSource;)V

    goto :goto_3
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 4
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    .line 382
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 383
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getRef()Lorg/apache/tools/ant/types/XMLCatalog;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/tools/ant/types/XMLCatalog;->resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;

    move-result-object v0

    .line 399
    :cond_0
    :goto_0
    return-object v0

    .line 386
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->dieOnCircularReference()V

    .line 388
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "resolveEntity: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\': \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 391
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogResolver()Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;->resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;

    move-result-object v0

    .line 394
    .local v0, "inputSource":Lorg/xml/sax/InputSource;
    if-nez v0, :cond_0

    .line 395
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "No matching catalog entry found, parser will use: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public setCatalogPathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 267
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 268
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 270
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->createCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 271
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 272
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 210
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 213
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 214
    iput-object p1, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 218
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 219
    return-void

    .line 216
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 230
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 231
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 233
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 234
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->setChecked(Z)V

    .line 235
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 364
    iget-object v0, p0, Lorg/apache/tools/ant/types/XMLCatalog;->elements:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 365
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/XMLCatalog;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 367
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 368
    return-void
.end method
