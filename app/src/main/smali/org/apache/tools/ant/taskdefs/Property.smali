.class public Lorg/apache/tools/ant/taskdefs/Property;
.super Lorg/apache/tools/ant/Task;
.source "Property.java"


# static fields
.field static class$java$io$InputStream:Ljava/lang/Class;


# instance fields
.field private basedir:Ljava/io/File;

.field protected classpath:Lorg/apache/tools/ant/types/Path;

.field protected env:Ljava/lang/String;

.field private fallback:Lorg/apache/tools/ant/Project;

.field protected file:Ljava/io/File;

.field protected name:Ljava/lang/String;

.field protected prefix:Ljava/lang/String;

.field private prefixValues:Z

.field protected ref:Lorg/apache/tools/ant/types/Reference;

.field private relative:Z

.field protected resource:Ljava/lang/String;

.field private untypedValue:Ljava/lang/Object;

.field protected url:Ljava/net/URL;

.field protected userProperty:Z

.field protected value:Ljava/lang/String;

.field private valueAttributeUsed:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;-><init>(Z)V

    .line 107
    return-void
.end method

.method protected constructor <init>(Z)V
    .locals 1
    .param p1, "userProperty"    # Z

    .prologue
    .line 115
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Property;-><init>(ZLorg/apache/tools/ant/Project;)V

    .line 116
    return-void
.end method

.method protected constructor <init>(ZLorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "userProperty"    # Z
    .param p2, "fallback"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v0, 0x0

    .line 125
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 94
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->valueAttributeUsed:Z

    .line 95
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->relative:Z

    .line 97
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefixValues:Z

    .line 126
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->userProperty:Z

    .line 127
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Property;->fallback:Lorg/apache/tools/ant/Project;

    .line 128
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 569
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

.method private internalSetValue(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 196
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->untypedValue:Ljava/lang/Object;

    .line 198
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->value:Ljava/lang/String;

    .line 199
    return-void

    .line 198
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private loadProperties(Ljava/util/Properties;Ljava/io/InputStream;Z)V
    .locals 7
    .param p1, "props"    # Ljava/util/Properties;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "isXml"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 564
    if-eqz p3, :cond_1

    .line 568
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string/jumbo v4, "loadFromXML"

    const/4 v2, 0x1

    new-array v5, v2, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v2, Lorg/apache/tools/ant/taskdefs/Property;->class$java$io$InputStream:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "java.io.InputStream"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Property;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/Property;->class$java$io$InputStream:Ljava/lang/Class;

    :goto_0
    aput-object v2, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 570
    .local v1, "loadXmlMethod":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    .end local v1    # "loadXmlMethod":Ljava/lang/reflect/Method;
    :goto_1
    return-void

    .line 568
    :cond_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Property;->class$java$io$InputStream:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 571
    :catch_0
    move-exception v0

    .line 572
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 573
    const-string/jumbo v2, "Can not load xml based property definition on Java < 5"

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 574
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v0

    .line 576
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 580
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p1, p2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    goto :goto_1
.end method

.method private resolveAllProperties(Ljava/util/Map;)V
    .locals 4
    .param p1, "props"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 728
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    .line 730
    .local v0, "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    new-instance v1, Lorg/apache/tools/ant/property/ResolvePropertyMap;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/tools/ant/PropertyHelper;->getExpanders()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/property/ResolvePropertyMap;-><init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/property/GetProperty;Ljava/util/Collection;)V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getPrefixValues()Z

    move-result v3

    invoke-virtual {v1, p1, v2, v3}, Lorg/apache/tools/ant/property/ResolvePropertyMap;->resolveAllProperties(Ljava/util/Map;Ljava/lang/String;Z)V

    .line 735
    return-void
.end method


# virtual methods
.method protected addProperties(Ljava/util/Properties;)V
    .locals 6
    .param p1, "props"    # Ljava/util/Properties;

    .prologue
    .line 681
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 682
    .local v2, "m":Ljava/util/HashMap;
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/Property;->resolveAllProperties(Ljava/util/Map;)V

    .line 683
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 684
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 685
    .local v1, "k":Ljava/lang/Object;
    instance-of v4, v1, Ljava/lang/String;

    if-eqz v4, :cond_0

    move-object v3, v1

    .line 686
    check-cast v3, Ljava/lang/String;

    .line 687
    .local v3, "propertyName":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefix:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 688
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefix:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 690
    :cond_1
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Property;->addProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 693
    .end local v1    # "k":Ljava/lang/Object;
    .end local v3    # "propertyName":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method protected addProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 711
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    .line 712
    .local v0, "ph":Lorg/apache/tools/ant/PropertyHelper;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Property;->userProperty:Z

    if-eqz v1, :cond_1

    .line 713
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/PropertyHelper;->getUserProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 714
    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->setInheritedProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 721
    :goto_0
    return-void

    .line 716
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Override ignored for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 719
    :cond_1
    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/PropertyHelper;->setNewProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected addProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/String;

    .prologue
    .line 701
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Property;->addProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 702
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 217
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Property;->valueAttributeUsed:Z

    if-nez v1, :cond_2

    .line 218
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 219
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 220
    .local v0, "currentValue":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 221
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 223
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Property;->internalSetValue(Ljava/lang/Object;)V

    .line 228
    .end local v0    # "currentValue":Ljava/lang/String;
    :cond_1
    return-void

    .line 224
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 225
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "can\'t combine nested text with value attribute"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 406
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 407
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 409
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 457
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    if-nez v5, :cond_0

    .line 458
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string/jumbo v6, "project has not been set"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 461
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 462
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->untypedValue:Ljava/lang/Object;

    if-nez v5, :cond_2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->ref:Lorg/apache/tools/ant/types/Reference;

    if-nez v5, :cond_2

    .line 463
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "You must specify value, location or refid with the name attribute"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 468
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->url:Ljava/net/URL;

    if-nez v5, :cond_2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->file:Ljava/io/File;

    if-nez v5, :cond_2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->resource:Ljava/lang/String;

    if-nez v5, :cond_2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->env:Ljava/lang/String;

    if-nez v5, :cond_2

    .line 469
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "You must specify url, file, resource or environment when not using the name attribute"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 475
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->url:Ljava/net/URL;

    if-nez v5, :cond_3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->file:Ljava/io/File;

    if-nez v5, :cond_3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->resource:Ljava/lang/String;

    if-nez v5, :cond_3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefix:Ljava/lang/String;

    if-eqz v5, :cond_3

    .line 476
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Prefix is only valid when loading from a url, file or resource"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 480
    :cond_3
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->untypedValue:Ljava/lang/Object;

    if-eqz v5, :cond_4

    .line 481
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->relative:Z

    if-eqz v5, :cond_c

    .line 483
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->untypedValue:Ljava/lang/Object;

    instance-of v5, v5, Ljava/io/File;

    if-eqz v5, :cond_a

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->untypedValue:Ljava/lang/Object;

    check-cast v5, Ljava/io/File;

    move-object v2, v5

    .line 484
    .local v2, "from":Ljava/io/File;
    :goto_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->basedir:Ljava/io/File;

    if-eqz v5, :cond_b

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Property;->basedir:Ljava/io/File;

    .line 485
    .local v4, "to":Ljava/io/File;
    :goto_1
    invoke-static {v4, v2}, Lorg/apache/tools/ant/util/FileUtils;->getRelativePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    .line 486
    .local v3, "relPath":Ljava/lang/String;
    const/16 v5, 0x2f

    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 487
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    invoke-virtual {p0, v5, v3}, Lorg/apache/tools/ant/taskdefs/Property;->addProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 496
    .end local v2    # "from":Ljava/io/File;
    .end local v3    # "relPath":Ljava/lang/String;
    .end local v4    # "to":Ljava/io/File;
    :cond_4
    :goto_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->file:Ljava/io/File;

    if-eqz v5, :cond_5

    .line 497
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->file:Ljava/io/File;

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Property;->loadFile(Ljava/io/File;)V

    .line 500
    :cond_5
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->url:Ljava/net/URL;

    if-eqz v5, :cond_6

    .line 501
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->url:Ljava/net/URL;

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Property;->loadUrl(Ljava/net/URL;)V

    .line 504
    :cond_6
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->resource:Ljava/lang/String;

    if-eqz v5, :cond_7

    .line 505
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->resource:Ljava/lang/String;

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Property;->loadResource(Ljava/lang/String;)V

    .line 508
    :cond_7
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->env:Ljava/lang/String;

    if-eqz v5, :cond_8

    .line 509
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->env:Ljava/lang/String;

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Property;->loadEnvironment(Ljava/lang/String;)V

    .line 512
    :cond_8
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    if-eqz v5, :cond_9

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->ref:Lorg/apache/tools/ant/types/Reference;

    if-eqz v5, :cond_9

    .line 514
    :try_start_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Property;->ref:Lorg/apache/tools/ant/types/Reference;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Property;->addProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_1

    .line 525
    :cond_9
    :goto_3
    return-void

    .line 483
    :cond_a
    :try_start_2
    new-instance v2, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->untypedValue:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 488
    :catch_0
    move-exception v1

    .line 489
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v5, v1, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 484
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "from":Ljava/io/File;
    :cond_b
    :try_start_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v4

    goto :goto_1

    .line 492
    .end local v2    # "from":Ljava/io/File;
    :cond_c
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Property;->untypedValue:Ljava/lang/Object;

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Property;->addProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 516
    :catch_1
    move-exception v0

    .line 517
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->fallback:Lorg/apache/tools/ant/Project;

    if-eqz v5, :cond_d

    .line 518
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Property;->ref:Lorg/apache/tools/ant/types/Reference;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Property;->fallback:Lorg/apache/tools/ant/Project;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Property;->addProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 521
    :cond_d
    throw v0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getEnvironment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 386
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->env:Ljava/lang/String;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->file:Ljava/io/File;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method public getPrefixValues()Z
    .locals 1

    .prologue
    .line 314
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefixValues:Z

    return v0
.end method

.method public getRefid()Lorg/apache/tools/ant/types/Reference;
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->ref:Lorg/apache/tools/ant/types/Reference;

    return-object v0
.end method

.method public getResource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 353
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->resource:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/net/URL;
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->url:Ljava/net/URL;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->value:Ljava/lang/String;

    return-object v0
.end method

.method protected loadEnvironment(Ljava/lang/String;)V
    .locals 6
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 662
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 663
    .local v3, "props":Ljava/util/Properties;
    const-string/jumbo v4, "."

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 664
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 666
    :cond_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Loading Environment "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V

    .line 667
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironmentVariables()Ljava/util/Map;

    move-result-object v2

    .line 668
    .local v2, "osEnv":Ljava/util/Map;
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "e":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 669
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 670
    .local v1, "entry":Ljava/util/Map$Entry;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 672
    .end local v1    # "entry":Ljava/util/Map$Entry;
    :cond_1
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Property;->addProperties(Ljava/util/Properties;)V

    .line 673
    return-void
.end method

.method protected loadFile(Ljava/io/File;)V
    .locals 7
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x3

    .line 590
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 591
    .local v3, "props":Ljava/util/Properties;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Loading "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V

    .line 593
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    .line 594
    const/4 v1, 0x0

    .line 596
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 597
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .local v2, "fis":Ljava/io/FileInputStream;
    :try_start_2
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ".xml"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    invoke-direct {p0, v3, v2, v4}, Lorg/apache/tools/ant/taskdefs/Property;->loadProperties(Ljava/util/Properties;Ljava/io/InputStream;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 599
    :try_start_3
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 601
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Property;->addProperties(Ljava/util/Properties;)V

    .line 609
    .end local v2    # "fis":Ljava/io/FileInputStream;
    :goto_0
    return-void

    .line 599
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v4

    :goto_1
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v4
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 606
    .end local v1    # "fis":Ljava/io/FileInputStream;
    :catch_0
    move-exception v0

    .line 607
    .local v0, "ex":Ljava/io/IOException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 603
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_0
    :try_start_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to find property file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 599
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method protected loadResource(Ljava/lang/String;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 616
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    .line 617
    .local v4, "props":Ljava/util/Properties;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Resource Loading "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V

    .line 618
    const/4 v3, 0x0

    .line 619
    .local v3, "is":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 620
    .local v0, "cL":Ljava/lang/ClassLoader;
    const/4 v1, 0x0

    .line 622
    .local v1, "cleanup":Z
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v5, :cond_2

    .line 623
    const/4 v1, 0x1

    .line 624
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    .line 629
    :goto_0
    if-nez v0, :cond_3

    .line 630
    invoke-static {p1}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 635
    :goto_1
    if-eqz v3, :cond_4

    .line 636
    const-string/jumbo v5, ".xml"

    invoke-virtual {p1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    invoke-direct {p0, v4, v3, v5}, Lorg/apache/tools/ant/taskdefs/Property;->loadProperties(Ljava/util/Properties;Ljava/io/InputStream;Z)V

    .line 637
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/Property;->addProperties(Ljava/util/Properties;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 644
    :goto_2
    if-eqz v3, :cond_0

    .line 646
    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 651
    :cond_0
    :goto_3
    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 652
    check-cast v0, Lorg/apache/tools/ant/AntClassLoader;

    .end local v0    # "cL":Ljava/lang/ClassLoader;
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 655
    :cond_1
    return-void

    .line 626
    .restart local v0    # "cL":Ljava/lang/ClassLoader;
    :cond_2
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_0

    .line 632
    :cond_3
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    goto :goto_1

    .line 639
    :cond_4
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to find resource "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 641
    :catch_0
    move-exception v2

    .line 642
    .local v2, "ex":Ljava/io/IOException;
    :try_start_3
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v5, v2, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 644
    .end local v2    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    if-eqz v3, :cond_5

    .line 646
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 651
    :cond_5
    :goto_4
    if-eqz v1, :cond_6

    if-eqz v0, :cond_6

    .line 652
    check-cast v0, Lorg/apache/tools/ant/AntClassLoader;

    .end local v0    # "cL":Ljava/lang/ClassLoader;
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 644
    :cond_6
    throw v5

    .line 647
    .restart local v0    # "cL":Ljava/lang/ClassLoader;
    :catch_1
    move-exception v6

    goto :goto_4

    :catch_2
    move-exception v5

    goto :goto_3
.end method

.method protected loadUrl(Ljava/net/URL;)V
    .locals 5
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 533
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 534
    .local v2, "props":Ljava/util/Properties;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Loading "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V

    .line 536
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 538
    .local v1, "is":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    invoke-direct {p0, v2, v1, v3}, Lorg/apache/tools/ant/taskdefs/Property;->loadProperties(Ljava/util/Properties;Ljava/io/InputStream;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 540
    if-eqz v1, :cond_0

    .line 541
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 544
    :cond_0
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Property;->addProperties(Ljava/util/Properties;)V

    .line 548
    return-void

    .line 540
    :catchall_0
    move-exception v3

    if-eqz v1, :cond_1

    .line 541
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_1
    throw v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 545
    .end local v1    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 546
    .local v0, "ex":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
.end method

.method public setBasedir(Ljava/io/File;)V
    .locals 0
    .param p1, "basedir"    # Ljava/io/File;

    .prologue
    .line 145
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->basedir:Ljava/io/File;

    .line 146
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 394
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 395
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 399
    :goto_0
    return-void

    .line 397
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 418
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Property;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 419
    return-void
.end method

.method public setEnvironment(Ljava/lang/String;)V
    .locals 0
    .param p1, "env"    # Ljava/lang/String;

    .prologue
    .line 377
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->env:Ljava/lang/String;

    .line 378
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 245
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->file:Ljava/io/File;

    .line 246
    return-void
.end method

.method public setLocation(Ljava/io/File;)V
    .locals 1
    .param p1, "location"    # Ljava/io/File;

    .prologue
    .line 175
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->relative:Z

    if-eqz v0, :cond_0

    .line 176
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Property;->internalSetValue(Ljava/lang/Object;)V

    .line 180
    :goto_0
    return-void

    .line 178
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 153
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->name:Ljava/lang/String;

    .line 154
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 282
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefix:Ljava/lang/String;

    .line 283
    if-eqz p1, :cond_0

    const-string/jumbo v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 284
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefix:Ljava/lang/String;

    .line 286
    :cond_0
    return-void
.end method

.method public setPrefixValues(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 304
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->prefixValues:Z

    .line 305
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 0
    .param p1, "ref"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 327
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->ref:Lorg/apache/tools/ant/types/Reference;

    .line 328
    return-void
.end method

.method public setRelative(Z)V
    .locals 0
    .param p1, "relative"    # Z

    .prologue
    .line 136
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->relative:Z

    .line 137
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 0
    .param p1, "resource"    # Ljava/lang/String;

    .prologue
    .line 345
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->resource:Ljava/lang/String;

    .line 346
    return-void
.end method

.method public setUrl(Ljava/net/URL;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 263
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Property;->url:Ljava/net/URL;

    .line 264
    return-void
.end method

.method public setUserProperty(Z)V
    .locals 2
    .param p1, "userProperty"    # Z

    .prologue
    .line 438
    const-string/jumbo v0, "DEPRECATED: Ignoring request to set user property in Property task."

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Property;->log(Ljava/lang/String;I)V

    .line 440
    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 191
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->valueAttributeUsed:Z

    .line 192
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Property;->internalSetValue(Ljava/lang/Object;)V

    .line 193
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 208
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Property;->setValue(Ljava/lang/Object;)V

    .line 209
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 447
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->value:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Property;->value:Ljava/lang/String;

    goto :goto_0
.end method
