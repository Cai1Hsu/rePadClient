.class public Lorg/apache/tools/ant/taskdefs/optional/depend/AntAnalyzer;
.super Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;
.source "AntAnalyzer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;-><init>()V

    .line 42
    return-void
.end method


# virtual methods
.method protected determineDependencies(Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 27
    .param p1, "files"    # Ljava/util/Vector;
    .param p2, "classes"    # Ljava/util/Vector;

    .prologue
    .line 55
    new-instance v11, Ljava/util/Hashtable;

    invoke-direct {v11}, Ljava/util/Hashtable;-><init>()V

    .line 56
    .local v11, "dependencies":Ljava/util/Hashtable;
    new-instance v7, Ljava/util/Hashtable;

    invoke-direct {v7}, Ljava/util/Hashtable;-><init>()V

    .line 57
    .local v7, "containers":Ljava/util/Hashtable;
    new-instance v21, Ljava/util/Hashtable;

    invoke-direct/range {v21 .. v21}, Ljava/util/Hashtable;-><init>()V

    .line 58
    .local v21, "toAnalyze":Ljava/util/Hashtable;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/AntAnalyzer;->getRootClasses()Ljava/util/Enumeration;

    move-result-object v15

    .local v15, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v15}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_0

    .line 59
    invoke-interface {v15}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 60
    .local v5, "classname":Ljava/lang/String;
    move-object/from16 v0, v21

    invoke-virtual {v0, v5, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 63
    .end local v5    # "classname":Ljava/lang/String;
    :cond_0
    const/4 v8, 0x0

    .line 64
    .local v8, "count":I
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/AntAnalyzer;->isClosureRequired()Z

    move-result v24

    if-eqz v24, :cond_3

    const/16 v20, 0x3e8

    .line 65
    .local v20, "maxCount":I
    :goto_1
    const/4 v2, 0x0

    .line 66
    .local v2, "analyzedDeps":Ljava/util/Hashtable;
    :goto_2
    invoke-virtual/range {v21 .. v21}, Ljava/util/Hashtable;->size()I

    move-result v24

    if-eqz v24, :cond_9

    add-int/lit8 v9, v8, 0x1

    .end local v8    # "count":I
    .local v9, "count":I
    move/from16 v0, v20

    if-ge v8, v0, :cond_8

    .line 67
    new-instance v2, Ljava/util/Hashtable;

    .end local v2    # "analyzedDeps":Ljava/util/Hashtable;
    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 68
    .restart local v2    # "analyzedDeps":Ljava/util/Hashtable;
    invoke-virtual/range {v21 .. v21}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v15

    :cond_1
    :goto_3
    invoke-interface {v15}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_5

    .line 69
    invoke-interface {v15}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 70
    .restart local v5    # "classname":Ljava/lang/String;
    invoke-virtual {v11, v5, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    :try_start_0
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/apache/tools/ant/taskdefs/optional/depend/AntAnalyzer;->getClassContainer(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 73
    .local v6, "container":Ljava/io/File;
    if-eqz v6, :cond_1

    .line 76
    invoke-virtual {v7, v6, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    const/16 v22, 0x0

    .line 79
    .local v22, "zipFile":Ljava/util/zip/ZipFile;
    const/16 v18, 0x0

    .line 81
    .local v18, "inStream":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v24

    const-string/jumbo v25, ".class"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_4

    .line 82
    new-instance v19, Ljava/io/FileInputStream;

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .end local v18    # "inStream":Ljava/io/InputStream;
    .local v19, "inStream":Ljava/io/InputStream;
    move-object/from16 v18, v19

    .line 91
    .end local v19    # "inStream":Ljava/io/InputStream;
    .restart local v18    # "inStream":Ljava/io/InputStream;
    :goto_4
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;

    invoke-direct {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;-><init>()V

    .line 92
    .local v3, "classFile":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->read(Ljava/io/InputStream;)V

    .line 93
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->getClassRefs()Ljava/util/Vector;

    move-result-object v13

    .line 94
    .local v13, "dependencyList":Ljava/util/Vector;
    invoke-virtual {v13}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v10

    .line 95
    .local v10, "depEnum":Ljava/util/Enumeration;
    :goto_5
    invoke-interface {v10}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_d

    .line 96
    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 97
    .local v12, "dependency":Ljava/lang/String;
    invoke-virtual {v2, v12, v12}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_5

    .line 100
    .end local v3    # "classFile":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    .end local v10    # "depEnum":Ljava/util/Enumeration;
    .end local v12    # "dependency":Ljava/lang/String;
    .end local v13    # "dependencyList":Ljava/util/Vector;
    :catchall_0
    move-exception v24

    :goto_6
    :try_start_2
    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 101
    if-eqz v22, :cond_2

    .line 102
    invoke-virtual/range {v22 .. v22}, Ljava/util/zip/ZipFile;->close()V

    .line 100
    :cond_2
    throw v24
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 105
    .end local v6    # "container":Ljava/io/File;
    .end local v18    # "inStream":Ljava/io/InputStream;
    .end local v22    # "zipFile":Ljava/util/zip/ZipFile;
    :catch_0
    move-exception v24

    goto :goto_3

    .line 64
    .end local v2    # "analyzedDeps":Ljava/util/Hashtable;
    .end local v5    # "classname":Ljava/lang/String;
    .end local v9    # "count":I
    .end local v20    # "maxCount":I
    .restart local v8    # "count":I
    :cond_3
    const/16 v20, 0x1

    goto :goto_1

    .line 84
    .end local v8    # "count":I
    .restart local v2    # "analyzedDeps":Ljava/util/Hashtable;
    .restart local v5    # "classname":Ljava/lang/String;
    .restart local v6    # "container":Ljava/io/File;
    .restart local v9    # "count":I
    .restart local v18    # "inStream":Ljava/io/InputStream;
    .restart local v20    # "maxCount":I
    .restart local v22    # "zipFile":Ljava/util/zip/ZipFile;
    :cond_4
    :try_start_3
    new-instance v23, Ljava/util/zip/ZipFile;

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    .end local v22    # "zipFile":Ljava/util/zip/ZipFile;
    .local v23, "zipFile":Ljava/util/zip/ZipFile;
    :try_start_4
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v25, 0x2e

    const/16 v26, 0x2f

    move/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, ".class"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 87
    .local v17, "entryName":Ljava/lang/String;
    new-instance v16, Ljava/util/zip/ZipEntry;

    invoke-direct/range {v16 .. v17}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 88
    .local v16, "entry":Ljava/util/zip/ZipEntry;
    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v18

    move-object/from16 v22, v23

    .end local v23    # "zipFile":Ljava/util/zip/ZipFile;
    .restart local v22    # "zipFile":Ljava/util/zip/ZipFile;
    goto :goto_4

    .line 110
    .end local v5    # "classname":Ljava/lang/String;
    .end local v6    # "container":Ljava/io/File;
    .end local v16    # "entry":Ljava/util/zip/ZipEntry;
    .end local v17    # "entryName":Ljava/lang/String;
    .end local v18    # "inStream":Ljava/io/InputStream;
    .end local v22    # "zipFile":Ljava/util/zip/ZipFile;
    :cond_5
    invoke-virtual/range {v21 .. v21}, Ljava/util/Hashtable;->clear()V

    .line 113
    invoke-virtual {v2}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v14

    .line 114
    .local v14, "depsEnum":Ljava/util/Enumeration;
    :cond_6
    :goto_7
    invoke-interface {v14}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_7

    .line 115
    invoke-interface {v14}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 116
    .local v4, "className":Ljava/lang/String;
    invoke-virtual {v11, v4}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_6

    .line 117
    move-object/from16 v0, v21

    invoke-virtual {v0, v4, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .end local v4    # "className":Ljava/lang/String;
    :cond_7
    move v8, v9

    .end local v9    # "count":I
    .restart local v8    # "count":I
    goto/16 :goto_2

    .end local v8    # "count":I
    .end local v14    # "depsEnum":Ljava/util/Enumeration;
    .restart local v9    # "count":I
    :cond_8
    move v8, v9

    .line 123
    .end local v9    # "count":I
    .restart local v8    # "count":I
    :cond_9
    invoke-virtual {v2}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v14

    .line 124
    .restart local v14    # "depsEnum":Ljava/util/Enumeration;
    :goto_8
    invoke-interface {v14}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_a

    .line 125
    invoke-interface {v14}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 126
    .restart local v4    # "className":Ljava/lang/String;
    invoke-virtual {v11, v4, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 129
    .end local v4    # "className":Ljava/lang/String;
    :cond_a
    invoke-virtual/range {p1 .. p1}, Ljava/util/Vector;->removeAllElements()V

    .line 130
    invoke-virtual {v7}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v15

    :goto_9
    invoke-interface {v15}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_b

    .line 131
    invoke-interface {v15}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/io/File;

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_9

    .line 134
    :cond_b
    invoke-virtual/range {p2 .. p2}, Ljava/util/Vector;->removeAllElements()V

    .line 135
    invoke-virtual {v11}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v15

    :goto_a
    invoke-interface {v15}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v24

    if-eqz v24, :cond_c

    .line 136
    invoke-interface {v15}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_a

    .line 138
    :cond_c
    return-void

    .line 100
    .end local v8    # "count":I
    .end local v14    # "depsEnum":Ljava/util/Enumeration;
    .restart local v3    # "classFile":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    .restart local v5    # "classname":Ljava/lang/String;
    .restart local v6    # "container":Ljava/io/File;
    .restart local v9    # "count":I
    .restart local v10    # "depEnum":Ljava/util/Enumeration;
    .restart local v13    # "dependencyList":Ljava/util/Vector;
    .restart local v18    # "inStream":Ljava/io/InputStream;
    .restart local v22    # "zipFile":Ljava/util/zip/ZipFile;
    :cond_d
    :try_start_5
    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 101
    if-eqz v22, :cond_1

    .line 102
    invoke-virtual/range {v22 .. v22}, Ljava/util/zip/ZipFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto/16 :goto_3

    .line 100
    .end local v3    # "classFile":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    .end local v10    # "depEnum":Ljava/util/Enumeration;
    .end local v13    # "dependencyList":Ljava/util/Vector;
    .end local v22    # "zipFile":Ljava/util/zip/ZipFile;
    .restart local v23    # "zipFile":Ljava/util/zip/ZipFile;
    :catchall_1
    move-exception v24

    move-object/from16 v22, v23

    .end local v23    # "zipFile":Ljava/util/zip/ZipFile;
    .restart local v22    # "zipFile":Ljava/util/zip/ZipFile;
    goto/16 :goto_6
.end method

.method protected supportsFileDependencies()Z
    .locals 1

    .prologue
    .line 146
    const/4 v0, 0x1

    return v0
.end method
