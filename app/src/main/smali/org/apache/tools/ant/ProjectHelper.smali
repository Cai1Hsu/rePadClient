.class public Lorg/apache/tools/ant/ProjectHelper;
.super Ljava/lang/Object;
.source "ProjectHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;
    }
.end annotation


# static fields
.field public static final ANTLIB_URI:Ljava/lang/String; = "antlib:"

.field public static final ANT_CORE_URI:Ljava/lang/String; = "antlib:org.apache.tools.ant"

.field public static final ANT_CURRENT_URI:Ljava/lang/String; = "ant:current"

.field public static final ANT_TYPE:Ljava/lang/String; = "ant-type"

.field public static final HELPER_PROPERTY:Ljava/lang/String; = "org.apache.tools.ant.ProjectHelper"

.field public static final PROJECTHELPER_REFERENCE:Ljava/lang/String; = "ant.projectHelper"

.field public static final SERVICE_ID:Ljava/lang/String; = "META-INF/services/org.apache.tools.ant.ProjectHelper"

.field private static final inIncludeMode:Ljava/lang/ThreadLocal;

.field private static final prefixSeparator:Ljava/lang/ThreadLocal;

.field private static final targetPrefix:Ljava/lang/ThreadLocal;


# instance fields
.field private extensionStack:Ljava/util/List;

.field private importStack:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 173
    new-instance v0, Lorg/apache/tools/ant/ProjectHelper$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/ProjectHelper$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/ProjectHelper;->targetPrefix:Ljava/lang/ThreadLocal;

    .line 201
    new-instance v0, Lorg/apache/tools/ant/ProjectHelper$2;

    invoke-direct {v0}, Lorg/apache/tools/ant/ProjectHelper$2;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/ProjectHelper;->prefixSeparator:Ljava/lang/ThreadLocal;

    .line 227
    new-instance v0, Lorg/apache/tools/ant/ProjectHelper$3;

    invoke-direct {v0}, Lorg/apache/tools/ant/ProjectHelper$3;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/ProjectHelper;->inIncludeMode:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ProjectHelper;->importStack:Ljava/util/Vector;

    .line 147
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ProjectHelper;->extensionStack:Ljava/util/List;

    .line 140
    return-void
.end method

.method public static addLocationToBuildException(Lorg/apache/tools/ant/BuildException;Lorg/apache/tools/ant/Location;)Lorg/apache/tools/ant/BuildException;
    .locals 3
    .param p0, "ex"    # Lorg/apache/tools/ant/BuildException;
    .param p1, "newLocation"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 540
    invoke-virtual {p0}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 551
    .end local p0    # "ex":Lorg/apache/tools/ant/BuildException;
    :cond_0
    :goto_0
    return-object p0

    .line 543
    .restart local p0    # "ex":Lorg/apache/tools/ant/BuildException;
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The following error occurred while executing this line:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "line.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Location;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 548
    .local v0, "errorMessage":Ljava/lang/String;
    if-nez p1, :cond_2

    .line 549
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0, p0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object p0, v1

    goto :goto_0

    .line 551
    :cond_2
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0, p0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    move-object p0, v1

    goto :goto_0
.end method

.method public static addText(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 378
    if-nez p2, :cond_0

    .line 385
    :goto_0
    return-void

    .line 381
    :cond_0
    instance-of v0, p1, Lorg/apache/tools/ant/TypeAdapter;

    if-eqz v0, :cond_1

    .line 382
    check-cast p1, Lorg/apache/tools/ant/TypeAdapter;

    .end local p1    # "target":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/apache/tools/ant/TypeAdapter;->getProxy()Ljava/lang/Object;

    move-result-object p1

    .line 384
    .restart local p1    # "target":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/tools/ant/IntrospectionHelper;->addText(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static addText(Lorg/apache/tools/ant/Project;Ljava/lang/Object;[CII)V
    .locals 1
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "buf"    # [C
    .param p3, "start"    # I
    .param p4, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 359
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p2, p3, p4}, Ljava/lang/String;-><init>([CII)V

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/ProjectHelper;->addText(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V

    .line 360
    return-void
.end method

.method public static configure(Ljava/lang/Object;Lorg/xml/sax/AttributeList;Lorg/apache/tools/ant/Project;)V
    .locals 7
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "attrs"    # Lorg/xml/sax/AttributeList;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 324
    instance-of v5, p0, Lorg/apache/tools/ant/TypeAdapter;

    if-eqz v5, :cond_0

    .line 325
    check-cast p0, Lorg/apache/tools/ant/TypeAdapter;

    .end local p0    # "target":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/apache/tools/ant/TypeAdapter;->getProxy()Ljava/lang/Object;

    move-result-object p0

    .line 327
    .restart local p0    # "target":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {p2, v5}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;

    move-result-object v2

    .line 329
    .local v2, "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {p1}, Lorg/xml/sax/AttributeList;->getLength()I

    move-result v3

    .local v3, "length":I
    :goto_0
    if-ge v1, v3, :cond_2

    .line 331
    invoke-interface {p1, v1}, Lorg/xml/sax/AttributeList;->getValue(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v6

    invoke-static {p2, v5, v6}, Lorg/apache/tools/ant/ProjectHelper;->replaceProperties(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;

    move-result-object v4

    .line 333
    .local v4, "value":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1, v1}, Lorg/xml/sax/AttributeList;->getName(I)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, p2, p0, v5, v4}, Lorg/apache/tools/ant/IntrospectionHelper;->setAttribute(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 334
    :catch_0
    move-exception v0

    .line 336
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    invoke-interface {p1, v1}, Lorg/xml/sax/AttributeList;->getName(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "id"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 337
    throw v0

    .line 341
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v4    # "value":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method public static configureProject(Lorg/apache/tools/ant/Project;Ljava/io/File;)V
    .locals 3
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "buildFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 79
    new-instance v1, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    .line 80
    .local v1, "resource":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/ProjectHelperRepository;->getProjectHelperForBuildFile(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/ProjectHelper;

    move-result-object v0

    .line 81
    .local v0, "helper":Lorg/apache/tools/ant/ProjectHelper;
    const-string/jumbo v2, "ant.projectHelper"

    invoke-virtual {p0, v2, v0}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    invoke-virtual {v0, p0, p1}, Lorg/apache/tools/ant/ProjectHelper;->parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public static extractNameFromComponentName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "componentName"    # Ljava/lang/String;

    .prologue
    .line 522
    const/16 v1, 0x3a

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 523
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 526
    .end local p0    # "componentName":Ljava/lang/String;
    :goto_0
    return-object p0

    .restart local p0    # "componentName":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static extractUriFromComponentName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "componentName"    # Ljava/lang/String;

    .prologue
    .line 505
    if-nez p0, :cond_0

    .line 506
    const-string/jumbo v1, ""

    .line 512
    :goto_0
    return-object v1

    .line 508
    :cond_0
    const/16 v1, 0x3a

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 509
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 510
    const-string/jumbo v1, ""

    goto :goto_0

    .line 512
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 492
    if-eqz p0, :cond_0

    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "antlib:org.apache.tools.ant"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 495
    .end local p1    # "name":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .restart local p1    # "name":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static getContextClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 301
    invoke-static {}, Lorg/apache/tools/ant/util/LoaderUtils;->isContextLoaderAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/apache/tools/ant/util/LoaderUtils;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getCurrentPrefixSeparator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    sget-object v0, Lorg/apache/tools/ant/ProjectHelper;->prefixSeparator:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getCurrentTargetPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 189
    sget-object v0, Lorg/apache/tools/ant/ProjectHelper;->targetPrefix:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getProjectHelper()Lorg/apache/tools/ant/ProjectHelper;
    .locals 1

    .prologue
    .line 288
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelpers()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/ProjectHelper;

    return-object v0
.end method

.method public static isInIncludeMode()Z
    .locals 2

    .prologue
    .line 249
    sget-object v0, Lorg/apache/tools/ant/ProjectHelper;->inIncludeMode:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parsePropertyString(Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 0
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "fragments"    # Ljava/util/Vector;
    .param p2, "propertyRefs"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 479
    invoke-static {p0, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->parsePropertyStringDefault(Ljava/lang/String;Ljava/util/Vector;Ljava/util/Vector;)V

    .line 480
    return-void
.end method

.method public static replaceProperties(Lorg/apache/tools/ant/Project;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 427
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static replaceProperties(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;
    .locals 2
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "keys"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 452
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    .line 453
    .local v0, "ph":Lorg/apache/tools/ant/PropertyHelper;
    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->replaceProperties(Ljava/lang/String;Ljava/lang/String;Ljava/util/Hashtable;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static setCurrentPrefixSeparator(Ljava/lang/String;)V
    .locals 1
    .param p0, "sep"    # Ljava/lang/String;

    .prologue
    .line 224
    sget-object v0, Lorg/apache/tools/ant/ProjectHelper;->prefixSeparator:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 225
    return-void
.end method

.method public static setCurrentTargetPrefix(Ljava/lang/String;)V
    .locals 1
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 198
    sget-object v0, Lorg/apache/tools/ant/ProjectHelper;->targetPrefix:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 199
    return-void
.end method

.method public static setInIncludeMode(Z)V
    .locals 2
    .param p0, "includeMode"    # Z

    .prologue
    .line 259
    sget-object v1, Lorg/apache/tools/ant/ProjectHelper;->inIncludeMode:Ljava/lang/ThreadLocal;

    if-eqz p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 260
    return-void

    .line 259
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static storeChild(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "parent"    # Ljava/lang/Object;
    .param p2, "child"    # Ljava/lang/Object;
    .param p3, "tag"    # Ljava/lang/String;

    .prologue
    .line 401
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {p0, v1}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;

    move-result-object v0

    .line 402
    .local v0, "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper;->storeElement(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    .line 403
    return-void
.end method


# virtual methods
.method public canParseAntlibDescriptor(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 573
    const/4 v0, 0x0

    return v0
.end method

.method public canParseBuildFile(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 1
    .param p1, "buildFile"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 597
    const/4 v0, 0x1

    return v0
.end method

.method public getDefaultBuildFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 607
    const-string/jumbo v0, "build.xml"

    return-object v0
.end method

.method public getExtensionStack()Ljava/util/List;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectHelper;->extensionStack:Ljava/util/List;

    return-object v0
.end method

.method public getImportStack()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectHelper;->importStack:Ljava/util/Vector;

    return-object v0
.end method

.method public parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;)V
    .locals 3
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "source"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 277
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ProjectHelper.parse() must be implemented in a helper plugin "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public parseAntlibDescriptor(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/UnknownElement;
    .locals 2
    .param p1, "containingProject"    # Lorg/apache/tools/ant/Project;
    .param p2, "source"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 584
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "can\'t parse antlib descriptors"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
