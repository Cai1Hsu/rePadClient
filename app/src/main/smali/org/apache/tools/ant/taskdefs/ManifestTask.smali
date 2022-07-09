.class public Lorg/apache/tools/ant/taskdefs/ManifestTask;
.super Lorg/apache/tools/ant/Task;
.source "ManifestTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;
    }
.end annotation


# static fields
.field public static final VALID_ATTRIBUTE_CHARS:Ljava/lang/String; = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"


# instance fields
.field private encoding:Ljava/lang/String;

.field private flattenClassPaths:Z

.field private manifestFile:Ljava/io/File;

.field private mergeClassPaths:Z

.field private mode:Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;

.field private nestedManifest:Lorg/apache/tools/ant/taskdefs/Manifest;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 58
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Manifest;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->nestedManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 78
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mergeClassPaths:Z

    .line 83
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->flattenClassPaths:Z

    .line 103
    new-instance v0, Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mode:Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;

    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mode:Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;

    const-string/jumbo v1, "replace"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;->setValue(Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method private checkAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    .locals 6
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 156
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, "name":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 159
    .local v0, "ch":C
    const/16 v3, 0x2d

    if-eq v0, v3, :cond_0

    const/16 v3, 0x5f

    if-ne v0, v3, :cond_1

    .line 160
    :cond_0
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Manifest attribute names must not start with \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\'."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 163
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 164
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 165
    const-string/jumbo v3, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_"

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_2

    .line 166
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Manifest attribute names must not contain \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 163
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 169
    :cond_3
    return-void
.end method


# virtual methods
.method public addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    .locals 1
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->checkAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    .line 135
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->nestedManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest;->addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    .line 136
    return-void
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
    .line 116
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttributeKeys()Ljava/util/Enumeration;

    move-result-object v1

    .line 117
    .local v1, "attributeKeys":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 118
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v0

    .line 120
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->checkAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    goto :goto_0

    .line 122
    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->nestedManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/taskdefs/Manifest;->addConfiguredSection(Lorg/apache/tools/ant/taskdefs/Manifest$Section;)V

    .line 123
    return-void
.end method

.method public execute()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v17, v0

    if-nez v17, :cond_0

    .line 222
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v18, "the file attribute is required"

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 225
    :cond_0
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Manifest;->getDefaultManifest()Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v14

    .line 226
    .local v14, "toWrite":Lorg/apache/tools/ant/taskdefs/Manifest;
    const/4 v3, 0x0

    .line 227
    .local v3, "current":Lorg/apache/tools/ant/taskdefs/Manifest;
    const/4 v6, 0x0

    .line 229
    .local v6, "error":Lorg/apache/tools/ant/BuildException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v17

    if-eqz v17, :cond_1

    .line 230
    const/4 v7, 0x0

    .line 231
    .local v7, "fis":Ljava/io/FileInputStream;
    const/4 v10, 0x0

    .line 233
    .local v10, "isr":Ljava/io/InputStreamReader;
    :try_start_0
    new-instance v8, Ljava/io/FileInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v8, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .local v8, "fis":Ljava/io/FileInputStream;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->encoding:Ljava/lang/String;

    move-object/from16 v17, v0

    if-nez v17, :cond_2

    .line 235
    new-instance v11, Ljava/io/InputStreamReader;

    const-string/jumbo v17, "UTF-8"

    move-object/from16 v0, v17

    invoke-direct {v11, v8, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .end local v10    # "isr":Ljava/io/InputStreamReader;
    .local v11, "isr":Ljava/io/InputStreamReader;
    move-object v10, v11

    .line 239
    .end local v11    # "isr":Ljava/io/InputStreamReader;
    .restart local v10    # "isr":Ljava/io/InputStreamReader;
    :goto_0
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-direct {v4, v10}, Lorg/apache/tools/ant/taskdefs/Manifest;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 247
    .end local v3    # "current":Lorg/apache/tools/ant/taskdefs/Manifest;
    .local v4, "current":Lorg/apache/tools/ant/taskdefs/Manifest;
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    move-object v3, v4

    .line 252
    .end local v4    # "current":Lorg/apache/tools/ant/taskdefs/Manifest;
    .end local v8    # "fis":Ljava/io/FileInputStream;
    .end local v10    # "isr":Ljava/io/InputStreamReader;
    .restart local v3    # "current":Lorg/apache/tools/ant/taskdefs/Manifest;
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->nestedManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/taskdefs/Manifest;->getWarnings()Ljava/util/Enumeration;

    move-result-object v5

    .line 253
    .local v5, "e":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v17

    if-eqz v17, :cond_3

    .line 254
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Manifest warning: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 237
    .end local v5    # "e":Ljava/util/Enumeration;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "isr":Ljava/io/InputStreamReader;
    :cond_2
    :try_start_2
    new-instance v11, Ljava/io/InputStreamReader;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->encoding:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v11, v8, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .end local v10    # "isr":Ljava/io/InputStreamReader;
    .restart local v11    # "isr":Ljava/io/InputStreamReader;
    move-object v10, v11

    .end local v11    # "isr":Ljava/io/InputStreamReader;
    .restart local v10    # "isr":Ljava/io/InputStreamReader;
    goto :goto_0

    .line 240
    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    :catch_0
    move-exception v12

    .line 241
    .local v12, "m":Lorg/apache/tools/ant/taskdefs/ManifestException;
    :goto_3
    :try_start_3
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    .end local v6    # "error":Lorg/apache/tools/ant/BuildException;
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Existing manifest "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string/jumbo v18, " is invalid"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v6, v0, v12, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 247
    .restart local v6    # "error":Lorg/apache/tools/ant/BuildException;
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_1

    .line 243
    .end local v12    # "m":Lorg/apache/tools/ant/taskdefs/ManifestException;
    :catch_1
    move-exception v5

    .line 244
    .local v5, "e":Ljava/io/IOException;
    :goto_4
    :try_start_4
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    .end local v6    # "error":Lorg/apache/tools/ant/BuildException;
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Failed to read "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v6, v0, v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 247
    .restart local v6    # "error":Lorg/apache/tools/ant/BuildException;
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto/16 :goto_1

    .end local v5    # "e":Ljava/io/IOException;
    .end local v6    # "error":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v17

    :goto_5
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v17

    .line 258
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .end local v10    # "isr":Ljava/io/InputStreamReader;
    .local v5, "e":Ljava/util/Enumeration;
    .restart local v6    # "error":Lorg/apache/tools/ant/BuildException;
    :cond_3
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mode:Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;->getValue()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, "update"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v17

    if-eqz v17, :cond_4

    .line 259
    if-eqz v3, :cond_5

    .line 260
    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mergeClassPaths:Z

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v14, v3, v0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V

    .line 266
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->nestedManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mergeClassPaths:Z

    move/from16 v19, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v14, v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V
    :try_end_5
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_5 .. :try_end_5} :catch_2

    .line 271
    invoke-virtual {v14, v3}, Lorg/apache/tools/ant/taskdefs/Manifest;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 272
    const-string/jumbo v17, "Manifest has not changed, do not recreate"

    const/16 v18, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->log(Ljava/lang/String;I)V

    .line 292
    :goto_6
    return-void

    .line 261
    :cond_5
    if-eqz v6, :cond_4

    .line 262
    :try_start_6
    throw v6
    :try_end_6
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_6 .. :try_end_6} :catch_2

    .line 267
    :catch_2
    move-exception v12

    .line 268
    .restart local v12    # "m":Lorg/apache/tools/ant/taskdefs/ManifestException;
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v18, "Manifest is invalid"

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v12, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v17

    .line 277
    .end local v12    # "m":Lorg/apache/tools/ant/taskdefs/ManifestException;
    :cond_6
    const/4 v15, 0x0

    .line 279
    .local v15, "w":Ljava/io/PrintWriter;
    :try_start_7
    new-instance v9, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v9, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 280
    .local v9, "fos":Ljava/io/FileOutputStream;
    new-instance v13, Ljava/io/OutputStreamWriter;

    const-string/jumbo v17, "UTF-8"

    move-object/from16 v0, v17

    invoke-direct {v13, v9, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 281
    .local v13, "osw":Ljava/io/OutputStreamWriter;
    new-instance v16, Ljava/io/PrintWriter;

    move-object/from16 v0, v16

    invoke-direct {v0, v13}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 282
    .end local v15    # "w":Ljava/io/PrintWriter;
    .local v16, "w":Ljava/io/PrintWriter;
    :try_start_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->flattenClassPaths:Z

    move/from16 v17, v0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest;->write(Ljava/io/PrintWriter;Z)V

    .line 283
    invoke-virtual/range {v16 .. v16}, Ljava/io/PrintWriter;->checkError()Z

    move-result v17

    if-eqz v17, :cond_7

    .line 284
    new-instance v17, Ljava/io/IOException;

    const-string/jumbo v18, "Encountered an error writing manifest"

    invoke-direct/range {v17 .. v18}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 286
    :catch_3
    move-exception v5

    move-object/from16 v15, v16

    .line 287
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .end local v13    # "osw":Ljava/io/OutputStreamWriter;
    .end local v16    # "w":Ljava/io/PrintWriter;
    .local v5, "e":Ljava/io/IOException;
    .restart local v15    # "w":Ljava/io/PrintWriter;
    :goto_7
    :try_start_9
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Failed to write "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ManifestTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v5, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v17
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 290
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v17

    :goto_8
    invoke-static {v15}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v17

    .end local v15    # "w":Ljava/io/PrintWriter;
    .local v5, "e":Ljava/util/Enumeration;
    .restart local v9    # "fos":Ljava/io/FileOutputStream;
    .restart local v13    # "osw":Ljava/io/OutputStreamWriter;
    .restart local v16    # "w":Ljava/io/PrintWriter;
    :cond_7
    invoke-static/range {v16 .. v16}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    goto/16 :goto_6

    :catchall_2
    move-exception v17

    move-object/from16 v15, v16

    .end local v16    # "w":Ljava/io/PrintWriter;
    .restart local v15    # "w":Ljava/io/PrintWriter;
    goto :goto_8

    .line 286
    .end local v9    # "fos":Ljava/io/FileOutputStream;
    .end local v13    # "osw":Ljava/io/OutputStreamWriter;
    :catch_4
    move-exception v5

    goto :goto_7

    .line 247
    .end local v5    # "e":Ljava/util/Enumeration;
    .end local v15    # "w":Ljava/io/PrintWriter;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v10    # "isr":Ljava/io/InputStreamReader;
    :catchall_3
    move-exception v17

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_5

    .line 243
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    :catch_5
    move-exception v5

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_4

    .line 240
    .end local v7    # "fis":Ljava/io/FileInputStream;
    .restart local v8    # "fis":Ljava/io/FileInputStream;
    :catch_6
    move-exception v12

    move-object v7, v8

    .end local v8    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "fis":Ljava/io/FileInputStream;
    goto/16 :goto_3
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->encoding:Ljava/lang/String;

    .line 186
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 177
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->manifestFile:Ljava/io/File;

    .line 178
    return-void
.end method

.method public setFlattenAttributes(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 212
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->flattenClassPaths:Z

    .line 213
    return-void
.end method

.method public setMergeClassPathAttributes(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 202
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mergeClassPaths:Z

    .line 203
    return-void
.end method

.method public setMode(Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;)V
    .locals 0
    .param p1, "m"    # Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;

    .prologue
    .line 193
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestTask;->mode:Lorg/apache/tools/ant/taskdefs/ManifestTask$Mode;

    .line 194
    return-void
.end method
