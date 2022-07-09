.class public Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;
.super Lorg/apache/tools/ant/Task;
.source "EchoProperties.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;,
        Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute;
    }
.end annotation


# static fields
.field private static final ATTR_NAME:Ljava/lang/String; = "name"

.field private static final ATTR_VALUE:Ljava/lang/String; = "value"

.field private static final PROPERTIES:Ljava/lang/String; = "properties"

.field private static final PROPERTY:Ljava/lang/String; = "property"


# instance fields
.field private destfile:Ljava/io/File;

.field private failonerror:Z

.field private format:Ljava/lang/String;

.field private inFile:Ljava/io/File;

.field private prefix:Ljava/lang/String;

.field private propertySets:Ljava/util/Vector;

.field private regex:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 88
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 113
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    .line 119
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    .line 126
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    .line 128
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->propertySets:Ljava/util/Vector;

    .line 130
    const-string/jumbo v0, "text"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->format:Ljava/lang/String;

    .line 426
    return-void
.end method

.method private static getDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    .locals 2

    .prologue
    .line 535
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 536
    :catch_0
    move-exception v0

    .line 537
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private sortProperties(Ljava/util/Properties;)Ljava/util/List;
    .locals 6
    .param p1, "props"    # Ljava/util/Properties;

    .prologue
    .line 451
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/Properties;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 452
    .local v2, "sorted":Ljava/util/List;
    invoke-virtual {p1}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .line 453
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 454
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 455
    .local v1, "name":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;

    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v3, v1, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 457
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 458
    return-object v2
.end method


# virtual methods
.method public addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "ps"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 225
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->propertySets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 226
    return-void
.end method

.method public execute()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 258
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->prefix:Ljava/lang/String;

    if-eqz v11, :cond_0

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->regex:Ljava/lang/String;

    if-eqz v11, :cond_0

    .line 259
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "Please specify either prefix or regex, but not both"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v11

    .line 263
    :cond_0
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 267
    .local v0, "allProps":Ljava/util/Hashtable;
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    if-nez v11, :cond_2

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->propertySets:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v11

    if-nez v11, :cond_2

    .line 269
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/util/Hashtable;->putAll(Ljava/util/Map;)V

    .line 320
    :cond_1
    :goto_0
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->propertySets:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 321
    .local v1, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v11

    if-eqz v11, :cond_a

    .line 322
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/tools/ant/types/PropertySet;

    .line 323
    .local v10, "ps":Lorg/apache/tools/ant/types/PropertySet;
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/util/Hashtable;->putAll(Ljava/util/Map;)V

    goto :goto_1

    .line 270
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v10    # "ps":Lorg/apache/tools/ant/types/PropertySet;
    :cond_2
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    if-eqz v11, :cond_1

    .line 271
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_5

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->isDirectory()Z

    move-result v11

    if-eqz v11, :cond_5

    .line 272
    const-string/jumbo v6, "srcfile is a directory!"

    .line 273
    .local v6, "message":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    if-eqz v11, :cond_3

    .line 274
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v6, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v11

    .line 276
    :cond_3
    invoke-virtual {p0, v6, v12}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V

    .line 371
    .end local v6    # "message":Ljava/lang/String;
    :cond_4
    :goto_2
    return-void

    .line 281
    :cond_5
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_7

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->canRead()Z

    move-result v11

    if-nez v11, :cond_7

    .line 282
    const-string/jumbo v6, "Can not read from the specified srcfile!"

    .line 283
    .restart local v6    # "message":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    if-eqz v11, :cond_6

    .line 284
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v6, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v11

    .line 286
    :cond_6
    invoke-virtual {p0, v6, v12}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 291
    .end local v6    # "message":Ljava/lang/String;
    :cond_7
    const/4 v3, 0x0

    .line 293
    .local v3, "in":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    invoke-direct {v4, v11}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    .end local v3    # "in":Ljava/io/FileInputStream;
    .local v4, "in":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v9, Ljava/util/Properties;

    invoke-direct {v9}, Ljava/util/Properties;-><init>()V

    .line 295
    .local v9, "props":Ljava/util/Properties;
    invoke-virtual {v9, v4}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 296
    invoke-virtual {v0, v9}, Ljava/util/Hashtable;->putAll(Ljava/util/Map;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 316
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_0

    .line 297
    .end local v4    # "in":Ljava/io/FileInputStream;
    .end local v9    # "props":Ljava/util/Properties;
    .restart local v3    # "in":Ljava/io/FileInputStream;
    :catch_0
    move-exception v2

    .line 298
    .local v2, "fnfe":Ljava/io/FileNotFoundException;
    :goto_3
    :try_start_2
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Could not find file "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 300
    .restart local v6    # "message":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    if-eqz v11, :cond_8

    .line 301
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v6, v2, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 316
    .end local v2    # "fnfe":Ljava/io/FileNotFoundException;
    .end local v6    # "message":Ljava/lang/String;
    :catchall_0
    move-exception v11

    :goto_4
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v11

    .line 303
    .restart local v2    # "fnfe":Ljava/io/FileNotFoundException;
    .restart local v6    # "message":Ljava/lang/String;
    :cond_8
    const/4 v11, 0x1

    :try_start_3
    invoke-virtual {p0, v6, v11}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 316
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_2

    .line 306
    .end local v2    # "fnfe":Ljava/io/FileNotFoundException;
    .end local v6    # "message":Ljava/lang/String;
    :catch_1
    move-exception v5

    .line 307
    .local v5, "ioe":Ljava/io/IOException;
    :goto_5
    :try_start_4
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Could not read file "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 309
    .restart local v6    # "message":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    if-eqz v11, :cond_9

    .line 310
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v6, v5, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v11

    .line 312
    :cond_9
    const/4 v11, 0x1

    invoke-virtual {p0, v6, v11}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 316
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto/16 :goto_2

    .line 326
    .end local v3    # "in":Ljava/io/FileInputStream;
    .end local v5    # "ioe":Ljava/io/IOException;
    .end local v6    # "message":Ljava/lang/String;
    .restart local v1    # "e":Ljava/util/Enumeration;
    :cond_a
    const/4 v7, 0x0

    .line 328
    .local v7, "os":Ljava/io/OutputStream;
    :try_start_5
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    if-nez v11, :cond_b

    .line 329
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 330
    .end local v7    # "os":Ljava/io/OutputStream;
    .local v8, "os":Ljava/io/OutputStream;
    :try_start_6
    invoke-virtual {p0, v0, v8}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->saveProperties(Ljava/util/Hashtable;Ljava/io/OutputStream;)V

    .line 331
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x2

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    move-object v7, v8

    .line 363
    .end local v8    # "os":Ljava/io/OutputStream;
    .restart local v7    # "os":Ljava/io/OutputStream;
    :goto_6
    if-eqz v7, :cond_4

    .line 365
    :try_start_7
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto/16 :goto_2

    .line 366
    :catch_2
    move-exception v11

    goto/16 :goto_2

    .line 333
    :cond_b
    :try_start_8
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_e

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->isDirectory()Z

    move-result v11

    if-eqz v11, :cond_e

    .line 334
    const-string/jumbo v6, "destfile is a directory!"

    .line 335
    .restart local v6    # "message":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    if-eqz v11, :cond_d

    .line 336
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v6, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v11
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 356
    .end local v6    # "message":Ljava/lang/String;
    :catch_3
    move-exception v5

    .line 357
    .restart local v5    # "ioe":Ljava/io/IOException;
    :goto_7
    :try_start_9
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    if-eqz v11, :cond_11

    .line 358
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v5, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v11
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 363
    .end local v5    # "ioe":Ljava/io/IOException;
    :catchall_1
    move-exception v11

    :goto_8
    if-eqz v7, :cond_c

    .line 365
    :try_start_a
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    .line 363
    :cond_c
    :goto_9
    throw v11

    .line 338
    .restart local v6    # "message":Ljava/lang/String;
    :cond_d
    const/4 v11, 0x0

    :try_start_b
    invoke-virtual {p0, v6, v11}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 363
    if-eqz v7, :cond_4

    .line 365
    :try_start_c
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_2

    goto/16 :goto_2

    .line 343
    .end local v6    # "message":Ljava/lang/String;
    :cond_e
    :try_start_d
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->canWrite()Z

    move-result v11

    if-nez v11, :cond_10

    .line 344
    const-string/jumbo v6, "Can not write to the specified destfile!"

    .line 346
    .restart local v6    # "message":Ljava/lang/String;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    if-eqz v11, :cond_f

    .line 347
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v11, v6, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v11

    .line 349
    :cond_f
    const/4 v11, 0x0

    invoke-virtual {p0, v6, v11}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 363
    if-eqz v7, :cond_4

    .line 365
    :try_start_e
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_2

    goto/16 :goto_2

    .line 353
    .end local v6    # "message":Ljava/lang/String;
    :cond_10
    :try_start_f
    new-instance v8, Ljava/io/FileOutputStream;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    invoke-direct {v8, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_3
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .line 354
    .end local v7    # "os":Ljava/io/OutputStream;
    .restart local v8    # "os":Ljava/io/OutputStream;
    :try_start_10
    invoke-virtual {p0, v0, v8}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->saveProperties(Ljava/util/Hashtable;Ljava/io/OutputStream;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_5
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    move-object v7, v8

    .end local v8    # "os":Ljava/io/OutputStream;
    .restart local v7    # "os":Ljava/io/OutputStream;
    goto/16 :goto_6

    .line 360
    .restart local v5    # "ioe":Ljava/io/IOException;
    :cond_11
    :try_start_11
    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x2

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;I)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_1

    .line 363
    if-eqz v7, :cond_4

    .line 365
    :try_start_12
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_2

    goto/16 :goto_2

    .line 366
    .end local v5    # "ioe":Ljava/io/IOException;
    :catch_4
    move-exception v12

    goto :goto_9

    .line 363
    .end local v7    # "os":Ljava/io/OutputStream;
    .restart local v8    # "os":Ljava/io/OutputStream;
    :catchall_2
    move-exception v11

    move-object v7, v8

    .end local v8    # "os":Ljava/io/OutputStream;
    .restart local v7    # "os":Ljava/io/OutputStream;
    goto :goto_8

    .line 356
    .end local v7    # "os":Ljava/io/OutputStream;
    .restart local v8    # "os":Ljava/io/OutputStream;
    :catch_5
    move-exception v5

    move-object v7, v8

    .end local v8    # "os":Ljava/io/OutputStream;
    .restart local v7    # "os":Ljava/io/OutputStream;
    goto :goto_7

    .line 316
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v7    # "os":Ljava/io/OutputStream;
    .restart local v4    # "in":Ljava/io/FileInputStream;
    :catchall_3
    move-exception v11

    move-object v3, v4

    .end local v4    # "in":Ljava/io/FileInputStream;
    .restart local v3    # "in":Ljava/io/FileInputStream;
    goto/16 :goto_4

    .line 306
    .end local v3    # "in":Ljava/io/FileInputStream;
    .restart local v4    # "in":Ljava/io/FileInputStream;
    :catch_6
    move-exception v5

    move-object v3, v4

    .end local v4    # "in":Ljava/io/FileInputStream;
    .restart local v3    # "in":Ljava/io/FileInputStream;
    goto/16 :goto_5

    .line 297
    .end local v3    # "in":Ljava/io/FileInputStream;
    .restart local v4    # "in":Ljava/io/FileInputStream;
    :catch_7
    move-exception v2

    move-object v3, v4

    .end local v4    # "in":Ljava/io/FileInputStream;
    .restart local v3    # "in":Ljava/io/FileInputStream;
    goto/16 :goto_3
.end method

.method protected jdkSaveProperties(Ljava/util/Properties;Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 4
    .param p1, "props"    # Ljava/util/Properties;
    .param p2, "os"    # Ljava/io/OutputStream;
    .param p3, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 512
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 517
    if-eqz p2, :cond_0

    .line 519
    :try_start_1
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 525
    :cond_0
    :goto_0
    return-void

    .line 514
    :catch_0
    move-exception v0

    .line 515
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 517
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    if-eqz p2, :cond_1

    .line 519
    :try_start_3
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 517
    :cond_1
    :goto_1
    throw v2

    .line 520
    :catch_1
    move-exception v1

    .line 521
    .local v1, "ioex":Ljava/io/IOException;
    const-string/jumbo v3, "Failed to close output stream"

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 520
    .end local v1    # "ioex":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 521
    .restart local v1    # "ioex":Ljava/io/IOException;
    const-string/jumbo v2, "Failed to close output stream"

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected saveProperties(Ljava/util/Hashtable;Ljava/io/OutputStream;)V
    .locals 8
    .param p1, "allProps"    # Ljava/util/Hashtable;
    .param p2, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 387
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 388
    .local v1, "keyList":Ljava/util/List;
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 389
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;

    invoke-direct {v3, p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;-><init>(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;Ljava/util/List;)V

    .line 410
    .local v3, "props":Ljava/util/Properties;
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    .line 411
    .local v4, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_0

    .line 412
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 413
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 414
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v3, v2, v5}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 411
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 416
    .end local v2    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_0
    const-string/jumbo v6, "text"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->format:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 417
    const-string/jumbo v6, "Ant properties"

    invoke-virtual {p0, v3, p2, v6}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->jdkSaveProperties(Ljava/util/Properties;Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 421
    :cond_1
    :goto_1
    return-void

    .line 418
    :cond_2
    const-string/jumbo v6, "xml"

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->format:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 419
    invoke-virtual {p0, v3, p2}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->xmlSaveProperties(Ljava/util/Properties;Ljava/io/OutputStream;)V

    goto :goto_1
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 0
    .param p1, "destfile"    # Ljava/io/File;

    .prologue
    .line 155
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->destfile:Ljava/io/File;

    .line 156
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "failonerror"    # Z

    .prologue
    .line 167
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->failonerror:Z

    .line 168
    return-void
.end method

.method public setFormat(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute;)V
    .locals 1
    .param p1, "ea"    # Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute;

    .prologue
    .line 233
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->format:Ljava/lang/String;

    .line 234
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 185
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->prefix:Ljava/lang/String;

    .line 187
    new-instance v0, Lorg/apache/tools/ant/types/PropertySet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PropertySet;-><init>()V

    .line 188
    .local v0, "ps":Lorg/apache/tools/ant/types/PropertySet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PropertySet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 189
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PropertySet;->appendPrefix(Ljava/lang/String;)V

    .line 190
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 192
    .end local v0    # "ps":Lorg/apache/tools/ant/types/PropertySet;
    :cond_0
    return-void
.end method

.method public setRegex(Ljava/lang/String;)V
    .locals 2
    .param p1, "regex"    # Ljava/lang/String;

    .prologue
    .line 210
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 211
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->regex:Ljava/lang/String;

    .line 212
    new-instance v0, Lorg/apache/tools/ant/types/PropertySet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PropertySet;-><init>()V

    .line 213
    .local v0, "ps":Lorg/apache/tools/ant/types/PropertySet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PropertySet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 214
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PropertySet;->appendRegex(Ljava/lang/String;)V

    .line 215
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 217
    .end local v0    # "ps":Lorg/apache/tools/ant/types/PropertySet;
    :cond_0
    return-void
.end method

.method public setSrcfile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 145
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->inFile:Ljava/io/File;

    .line 146
    return-void
.end method

.method protected xmlSaveProperties(Ljava/util/Properties;Ljava/io/OutputStream;)V
    .locals 12
    .param p1, "props"    # Ljava/util/Properties;
    .param p2, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 470
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->getDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 471
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string/jumbo v9, "properties"

    invoke-interface {v0, v9}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 473
    .local v4, "rootElement":Lorg/w3c/dom/Element;
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;->sortProperties(Ljava/util/Properties;)Ljava/util/List;

    move-result-object v5

    .line 477
    .local v5, "sorted":Ljava/util/List;
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 478
    .local v2, "iten":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 479
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;

    .line 480
    .local v6, "tuple":Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;
    const-string/jumbo v9, "property"

    invoke-interface {v0, v9}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 481
    .local v3, "propElement":Lorg/w3c/dom/Element;
    const-string/jumbo v9, "name"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->access$100(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v3, v9, v10}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    const-string/jumbo v9, "value"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;->access$200(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v3, v9, v10}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    invoke-interface {v4, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_0

    .line 486
    .end local v3    # "propElement":Lorg/w3c/dom/Element;
    .end local v6    # "tuple":Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple;
    :cond_0
    const/4 v7, 0x0

    .line 488
    .local v7, "wri":Ljava/io/Writer;
    :try_start_0
    new-instance v8, Ljava/io/OutputStreamWriter;

    const-string/jumbo v9, "UTF8"

    invoke-direct {v8, p2, v9}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 489
    .end local v7    # "wri":Ljava/io/Writer;
    .local v8, "wri":Ljava/io/Writer;
    :try_start_1
    const-string/jumbo v9, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 490
    new-instance v9, Lorg/apache/tools/ant/util/DOMElementWriter;

    invoke-direct {v9}, Lorg/apache/tools/ant/util/DOMElementWriter;-><init>()V

    const/4 v10, 0x0

    const-string/jumbo v11, "\t"

    invoke-virtual {v9, v4, v8, v10, v11}, Lorg/apache/tools/ant/util/DOMElementWriter;->write(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    .line 491
    invoke-virtual {v8}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 495
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 497
    return-void

    .line 492
    .end local v8    # "wri":Ljava/io/Writer;
    .restart local v7    # "wri":Ljava/io/Writer;
    :catch_0
    move-exception v1

    .line 493
    .local v1, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_2
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Unable to write XML file"

    invoke-direct {v9, v10, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 495
    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    :goto_2
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v9

    .end local v7    # "wri":Ljava/io/Writer;
    .restart local v8    # "wri":Ljava/io/Writer;
    :catchall_1
    move-exception v9

    move-object v7, v8

    .end local v8    # "wri":Ljava/io/Writer;
    .restart local v7    # "wri":Ljava/io/Writer;
    goto :goto_2

    .line 492
    .end local v7    # "wri":Ljava/io/Writer;
    .restart local v8    # "wri":Ljava/io/Writer;
    :catch_1
    move-exception v1

    move-object v7, v8

    .end local v8    # "wri":Ljava/io/Writer;
    .restart local v7    # "wri":Ljava/io/Writer;
    goto :goto_1
.end method
