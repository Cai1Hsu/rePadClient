.class public Lorg/apache/tools/ant/taskdefs/Manifest;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Manifest$Section;,
        Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    }
.end annotation


# static fields
.field public static final ATTRIBUTE_CLASSPATH:Ljava/lang/String; = "Class-Path"

.field private static final ATTRIBUTE_CLASSPATH_LC:Ljava/lang/String;

.field public static final ATTRIBUTE_FROM:Ljava/lang/String; = "From"

.field private static final ATTRIBUTE_FROM_LC:Ljava/lang/String;

.field public static final ATTRIBUTE_MANIFEST_VERSION:Ljava/lang/String; = "Manifest-Version"

.field private static final ATTRIBUTE_MANIFEST_VERSION_LC:Ljava/lang/String;

.field public static final ATTRIBUTE_NAME:Ljava/lang/String; = "Name"

.field private static final ATTRIBUTE_NAME_LC:Ljava/lang/String;

.field public static final ATTRIBUTE_SIGNATURE_VERSION:Ljava/lang/String; = "Signature-Version"

.field public static final DEFAULT_MANIFEST_VERSION:Ljava/lang/String; = "1.0"

.field public static final EOL:Ljava/lang/String; = "\r\n"

.field public static final ERROR_FROM_FORBIDDEN:Ljava/lang/String; = "Manifest attributes should not start with \"From\" in \""

.field public static final JAR_ENCODING:Ljava/lang/String; = "UTF-8"

.field public static final MAX_LINE_LENGTH:I = 0x48

.field public static final MAX_SECTION_LENGTH:I = 0x46

.field static class$org$apache$tools$ant$taskdefs$Manifest:Ljava/lang/Class;


# instance fields
.field private mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

.field private manifestVersion:Ljava/lang/String;

.field private sections:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 94
    const-string/jumbo v0, "Manifest-Version"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_MANIFEST_VERSION_LC:Ljava/lang/String;

    .line 96
    const-string/jumbo v0, "Name"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_NAME_LC:Ljava/lang/String;

    .line 98
    const-string/jumbo v0, "From"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_FROM_LC:Ljava/lang/String;

    .line 100
    const-string/jumbo v0, "Class-Path"

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_CLASSPATH_LC:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 838
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 786
    const-string/jumbo v0, "1.0"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    .line 789
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    .line 792
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    .line 839
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    .line 840
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 10
    .param p1, "r"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 851
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 786
    const-string/jumbo v7, "1.0"

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    .line 789
    new-instance v7, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-direct {v7}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;-><init>()V

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    .line 792
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    .line 852
    new-instance v4, Ljava/io/BufferedReader;

    invoke-direct {v4, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 854
    .local v4, "reader":Ljava/io/BufferedReader;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v7, v4}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->read(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v2

    .line 855
    .local v2, "nextSectionName":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    const-string/jumbo v8, "Manifest-Version"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 857
    .local v3, "readManifestVersion":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 858
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    .line 859
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    const-string/jumbo v8, "Manifest-Version"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->removeAttribute(Ljava/lang/String;)V

    .line 862
    :cond_0
    const/4 v1, 0x0

    .line 863
    .local v1, "line":Ljava/lang/String;
    :cond_1
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 864
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_1

    .line 868
    new-instance v5, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-direct {v5}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;-><init>()V

    .line 869
    .local v5, "section":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    if-nez v2, :cond_3

    .line 870
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    invoke-direct {v6, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>(Ljava/lang/String;)V

    .line 871
    .local v6, "sectionName":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "Name"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 872
    new-instance v7, Lorg/apache/tools/ant/taskdefs/ManifestException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Manifest sections should start with a \"Name\" attribute and not \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/taskdefs/ManifestException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 877
    :cond_2
    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 886
    .end local v6    # "sectionName":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    :goto_1
    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->setName(Ljava/lang/String;)V

    .line 887
    invoke-virtual {v5, v4}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->read(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v2

    .line 888
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Manifest;->addConfiguredSection(Lorg/apache/tools/ant/taskdefs/Manifest$Section;)V

    goto :goto_0

    .line 882
    :cond_3
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>(Ljava/lang/String;)V

    .line 883
    .local v0, "firstAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->addAttributeAndCheck(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)Ljava/lang/String;

    goto :goto_1

    .line 890
    .end local v0    # "firstAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v5    # "section":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    :cond_4
    return-void
.end method

.method static access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_NAME_LC:Ljava/lang/String;

    return-object v0
.end method

.method static access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_FROM_LC:Ljava/lang/String;

    return-object v0
.end method

.method static access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_CLASSPATH_LC:Ljava/lang/String;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 806
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

.method public static getDefaultManifest()Lorg/apache/tools/ant/taskdefs/Manifest;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 802
    const/4 v4, 0x0

    .line 803
    .local v4, "in":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 805
    .local v5, "insr":Ljava/io/InputStreamReader;
    :try_start_0
    const-string/jumbo v1, "/org/apache/tools/ant/defaultManifest.mf"

    .line 806
    .local v1, "defManifest":Ljava/lang/String;
    sget-object v8, Lorg/apache/tools/ant/taskdefs/Manifest;->class$org$apache$tools$ant$taskdefs$Manifest:Ljava/lang/Class;

    if-nez v8, :cond_0

    const-string/jumbo v8, "org.apache.tools.ant.taskdefs.Manifest"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/Manifest;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lorg/apache/tools/ant/taskdefs/Manifest;->class$org$apache$tools$ant$taskdefs$Manifest:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v8, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 807
    if-nez v4, :cond_1

    .line 808
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Could not find default manifest: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 827
    .end local v1    # "defManifest":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 828
    .local v3, "e":Lorg/apache/tools/ant/taskdefs/ManifestException;
    :goto_1
    :try_start_1
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "Default manifest is invalid !!"

    invoke-direct {v8, v9, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 832
    .end local v3    # "e":Lorg/apache/tools/ant/taskdefs/ManifestException;
    :catchall_0
    move-exception v8

    :goto_2
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 833
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v8

    .line 806
    .restart local v1    # "defManifest":Ljava/lang/String;
    :cond_0
    :try_start_2
    sget-object v8, Lorg/apache/tools/ant/taskdefs/Manifest;->class$org$apache$tools$ant$taskdefs$Manifest:Ljava/lang/Class;
    :try_end_2
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 812
    :cond_1
    :try_start_3
    new-instance v6, Ljava/io/InputStreamReader;

    const-string/jumbo v8, "UTF-8"

    invoke-direct {v6, v4, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 813
    .end local v5    # "insr":Ljava/io/InputStreamReader;
    .local v6, "insr":Ljava/io/InputStreamReader;
    :try_start_4
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-direct {v2, v6}, Lorg/apache/tools/ant/taskdefs/Manifest;-><init>(Ljava/io/Reader;)V

    .line 814
    .local v2, "defaultManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    const-string/jumbo v8, "java.runtime.version"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 815
    .local v7, "version":Ljava/lang/String;
    if-nez v7, :cond_2

    .line 816
    const-string/jumbo v8, "java.vm.version"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 818
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    const-string/jumbo v8, "Created-By"

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "java.vm.vendor"

    invoke-static {v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ")"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v8, v9}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    .local v0, "createdBy":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Manifest;->getMainSection()Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    move-result-object v8

    invoke-static {v8, v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->access$300(Lorg/apache/tools/ant/taskdefs/Manifest$Section;Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 832
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 833
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    move-object v5, v6

    .end local v0    # "createdBy":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v2    # "defaultManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    .end local v6    # "insr":Ljava/io/InputStreamReader;
    .end local v7    # "version":Ljava/lang/String;
    .restart local v5    # "insr":Ljava/io/InputStreamReader;
    :goto_3
    return-object v2

    .line 823
    :catch_1
    move-exception v3

    move-object v6, v5

    .line 824
    .end local v5    # "insr":Ljava/io/InputStreamReader;
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    .restart local v6    # "insr":Ljava/io/InputStreamReader;
    :goto_4
    :try_start_5
    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_5
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 825
    .end local v6    # "insr":Ljava/io/InputStreamReader;
    .restart local v5    # "insr":Ljava/io/InputStreamReader;
    :try_start_6
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-direct {v2, v5}, Lorg/apache/tools/ant/taskdefs/Manifest;-><init>(Ljava/io/Reader;)V
    :try_end_6
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 832
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 833
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_3

    .line 829
    .end local v1    # "defManifest":Ljava/lang/String;
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_2
    move-exception v3

    .line 830
    .local v3, "e":Ljava/io/IOException;
    :goto_5
    :try_start_7
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "Unable to read default manifest"

    invoke-direct {v8, v9, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 832
    .end local v3    # "e":Ljava/io/IOException;
    .end local v5    # "insr":Ljava/io/InputStreamReader;
    .restart local v1    # "defManifest":Ljava/lang/String;
    .restart local v6    # "insr":Ljava/io/InputStreamReader;
    :catchall_1
    move-exception v8

    move-object v5, v6

    .end local v6    # "insr":Ljava/io/InputStreamReader;
    .restart local v5    # "insr":Ljava/io/InputStreamReader;
    goto/16 :goto_2

    .line 829
    .end local v5    # "insr":Ljava/io/InputStreamReader;
    .restart local v6    # "insr":Ljava/io/InputStreamReader;
    :catch_3
    move-exception v3

    move-object v5, v6

    .end local v6    # "insr":Ljava/io/InputStreamReader;
    .restart local v5    # "insr":Ljava/io/InputStreamReader;
    goto :goto_5

    .line 827
    .end local v5    # "insr":Ljava/io/InputStreamReader;
    .restart local v6    # "insr":Ljava/io/InputStreamReader;
    :catch_4
    move-exception v3

    move-object v5, v6

    .end local v6    # "insr":Ljava/io/InputStreamReader;
    .restart local v5    # "insr":Ljava/io/InputStreamReader;
    goto/16 :goto_1

    .line 823
    .end local v5    # "insr":Ljava/io/InputStreamReader;
    .restart local v6    # "insr":Ljava/io/InputStreamReader;
    :catch_5
    move-exception v3

    goto :goto_4
.end method


# virtual methods
.method public addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    .locals 2
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 917
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 918
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Attributes must have name and value"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 920
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/apache/tools/ant/taskdefs/Manifest;->ATTRIBUTE_MANIFEST_VERSION_LC:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 921
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    .line 925
    :goto_0
    return-void

    .line 923
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    goto :goto_0
.end method

.method public addConfiguredSection(Lorg/apache/tools/ant/taskdefs/Manifest$Section;)V
    .locals 3
    .param p1, "section"    # Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 901
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getName()Ljava/lang/String;

    move-result-object v0

    .line 902
    .local v0, "sectionName":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 903
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Sections must have a name"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 905
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "rhs"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1118
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    .line 1139
    :cond_0
    :goto_0
    return v1

    .line 1122
    :cond_1
    if-ne p1, p0, :cond_2

    .line 1123
    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 1126
    check-cast v0, Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 1127
    .local v0, "rhsManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 1128
    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 1135
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1139
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 1131
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0
.end method

.method public getMainSection()Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .locals 1

    .prologue
    .line 1157
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    return-object v0
.end method

.method public getManifestVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1148
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getSection(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1168
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    return-object v0
.end method

.method public getSectionNames()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 1177
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/CollectionUtils;->asEnumeration(Ljava/util/Iterator;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getWarnings()Ljava/util/Enumeration;
    .locals 6

    .prologue
    .line 1076
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 1078
    .local v4, "warnings":Ljava/util/Vector;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getWarnings()Ljava/util/Enumeration;

    move-result-object v3

    .line 1079
    .local v3, "warnEnum":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1080
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 1084
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1085
    .local v0, "e":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1086
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    .line 1087
    .local v2, "section":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getWarnings()Ljava/util/Enumeration;

    move-result-object v1

    .line 1088
    .local v1, "e2":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1089
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1

    .line 1093
    .end local v1    # "e2":Ljava/util/Enumeration;
    .end local v2    # "section":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    :cond_2
    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v5

    return-object v5
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 1101
    const/4 v0, 0x0

    .line 1103
    .local v0, "hashCode":I
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1104
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1106
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1107
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1109
    return v0
.end method

.method public merge(Lorg/apache/tools/ant/taskdefs/Manifest;)V
    .locals 1
    .param p1, "other"    # Lorg/apache/tools/ant/taskdefs/Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 937
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;Z)V

    .line 938
    return-void
.end method

.method public merge(Lorg/apache/tools/ant/taskdefs/Manifest;Z)V
    .locals 1
    .param p1, "other"    # Lorg/apache/tools/ant/taskdefs/Manifest;
    .param p2, "overwriteMain"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 953
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V

    .line 954
    return-void
.end method

.method public merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V
    .locals 6
    .param p1, "other"    # Lorg/apache/tools/ant/taskdefs/Manifest;
    .param p2, "overwriteMain"    # Z
    .param p3, "mergeClassPaths"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 973
    if-eqz p1, :cond_4

    .line 974
    if-eqz p2, :cond_2

    .line 975
    iget-object v4, p1, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    .line 980
    :goto_0
    iget-object v4, p1, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 981
    iget-object v4, p1, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    .line 984
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest;->getSectionNames()Ljava/util/Enumeration;

    move-result-object v0

    .line 985
    .local v0, "e":Ljava/util/Enumeration;
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 986
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 987
    .local v3, "sectionName":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    .line 988
    .local v2, "ourSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    iget-object v4, p1, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    .line 990
    .local v1, "otherSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    if-nez v2, :cond_3

    .line 991
    if-eqz v1, :cond_1

    .line 992
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/Manifest;->addConfiguredSection(Lorg/apache/tools/ant/taskdefs/Manifest$Section;)V

    goto :goto_1

    .line 977
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "otherSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .end local v2    # "ourSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .end local v3    # "sectionName":Ljava/lang/String;
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    iget-object v5, p1, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v4, v5, p3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->merge(Lorg/apache/tools/ant/taskdefs/Manifest$Section;Z)V

    goto :goto_0

    .line 995
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v1    # "otherSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .restart local v2    # "ourSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .restart local v3    # "sectionName":Ljava/lang/String;
    :cond_3
    invoke-virtual {v2, v1, p3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->merge(Lorg/apache/tools/ant/taskdefs/Manifest$Section;Z)V

    goto :goto_1

    .line 999
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "otherSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .end local v2    # "ourSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .end local v3    # "sectionName":Ljava/lang/String;
    :cond_4
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1061
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 1063
    .local v1, "sw":Ljava/io/StringWriter;
    :try_start_0
    new-instance v2, Ljava/io/PrintWriter;

    invoke-direct {v2, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Manifest;->write(Ljava/io/PrintWriter;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1067
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    return-object v2

    .line 1064
    :catch_0
    move-exception v0

    .line 1065
    .local v0, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public write(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "writer"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1010
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Manifest;->write(Ljava/io/PrintWriter;Z)V

    .line 1011
    return-void
.end method

.method public write(Ljava/io/PrintWriter;Z)V
    .locals 7
    .param p1, "writer"    # Ljava/io/PrintWriter;
    .param p2, "flatten"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1025
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Manifest-Version: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->manifestVersion:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1026
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    const-string/jumbo v6, "Signature-Version"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1028
    .local v3, "signatureVersion":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 1029
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Signature-Version: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1031
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    const-string/jumbo v6, "Signature-Version"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->removeAttribute(Ljava/lang/String;)V

    .line 1033
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v5, p1, p2}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->write(Ljava/io/PrintWriter;Z)V

    .line 1036
    if-eqz v3, :cond_1

    .line 1038
    :try_start_0
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    const-string/jumbo v5, "Signature-Version"

    invoke-direct {v4, v5, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1040
    .local v4, "svAttr":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->mainSection:Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-virtual {v5, v4}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1046
    .end local v4    # "svAttr":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    :cond_1
    :goto_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest;->sections:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1047
    .local v0, "e":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1048
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1049
    .local v2, "sectionName":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Manifest;->getSection(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    move-result-object v1

    .line 1050
    .local v1, "section":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    invoke-virtual {v1, p1, p2}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->write(Ljava/io/PrintWriter;Z)V

    goto :goto_1

    .line 1052
    .end local v1    # "section":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .end local v2    # "sectionName":Ljava/lang/String;
    :cond_2
    return-void

    .line 1041
    .end local v0    # "e":Ljava/util/Iterator;
    :catch_0
    move-exception v5

    goto :goto_0
.end method
