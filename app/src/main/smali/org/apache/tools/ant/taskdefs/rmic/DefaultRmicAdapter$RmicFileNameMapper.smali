.class Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;
.super Ljava/lang/Object;
.source "DefaultRmicAdapter.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RmicFileNameMapper"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    .prologue
    .line 369
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 370
    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 22
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 384
    if-eqz p1, :cond_0

    const-string/jumbo v18, ".class"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_0

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getStubClassSuffix()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, ".class"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_0

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getSkelClassSuffix()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, ".class"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_0

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getTieClassSuffix()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, ".class"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 390
    :cond_0
    const/16 v16, 0x0

    .line 490
    :cond_1
    :goto_0
    return-object v16

    .line 394
    :cond_2
    const-string/jumbo v18, ".class"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/apache/tools/ant/util/StringUtils;->removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 396
    .local v2, "base":Ljava/lang/String;
    sget-char v18, Ljava/io/File;->separatorChar:C

    const/16 v19, 0x2e

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 397
    .local v4, "classname":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/Rmic;->getVerify()Z

    move-result v18

    if-eqz v18, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/taskdefs/Rmic;->isValidRmiRemote(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 399
    const/16 v16, 0x0

    goto :goto_0

    .line 410
    :cond_3
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v18, 0x0

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ".tmp."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$100()Ljava/util/Random;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/util/Random;->nextLong()J

    move-result-wide v20

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v16, v18

    .line 412
    .local v16, "target":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIiop()Z

    move-result v18

    if-nez v18, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIdl()Z

    move-result v18

    if-nez v18, :cond_5

    .line 414
    const-string/jumbo v18, "1.2"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/taskdefs/Rmic;->getStubVersion()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 415
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    .end local v16    # "target":[Ljava/lang/String;
    const/16 v18, 0x0

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getStubClassSuffix()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ".class"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v16, v18

    .restart local v16    # "target":[Ljava/lang/String;
    goto/16 :goto_0

    .line 419
    :cond_4
    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    .end local v16    # "target":[Ljava/lang/String;
    const/16 v18, 0x0

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getStubClassSuffix()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ".class"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v16, v18

    const/16 v18, 0x1

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getSkelClassSuffix()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ".class"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v16, v18

    .restart local v16    # "target":[Ljava/lang/String;
    goto/16 :goto_0

    .line 424
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIdl()Z

    move-result v18

    if-nez v18, :cond_1

    .line 425
    sget-char v18, Ljava/io/File;->separatorChar:C

    move/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v14

    .line 427
    .local v14, "lastSlash":I
    const-string/jumbo v5, ""

    .line 431
    .local v5, "dirname":Ljava/lang/String;
    const/4 v11, -0x1

    .line 432
    .local v11, "index":I
    const/16 v18, -0x1

    move/from16 v0, v18

    if-ne v14, v0, :cond_6

    .line 434
    const/4 v11, 0x0

    .line 440
    :goto_1
    invoke-virtual {v2, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 443
    .local v7, "filename":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLoader()Ljava/lang/ClassLoader;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 445
    .local v3, "c":Ljava/lang/Class;
    invoke-virtual {v3}, Ljava/lang/Class;->isInterface()Z

    move-result v18

    if-eqz v18, :cond_7

    .line 447
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, "_"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getStubClassSuffix()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ".class"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .end local v16    # "target":[Ljava/lang/String;
    .local v17, "target":[Ljava/lang/String;
    move-object/from16 v16, v17

    .end local v17    # "target":[Ljava/lang/String;
    .restart local v16    # "target":[Ljava/lang/String;
    goto/16 :goto_0

    .line 436
    .end local v3    # "c":Ljava/lang/Class;
    .end local v7    # "filename":Ljava/lang/String;
    :cond_6
    add-int/lit8 v11, v14, 0x1

    .line 437
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v2, v0, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 456
    .restart local v3    # "c":Ljava/lang/Class;
    .restart local v7    # "filename":Ljava/lang/String;
    :cond_7
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Rmic;->getRemoteInterface(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v12

    .line 457
    .local v12, "interf":Ljava/lang/Class;
    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    .line 458
    .local v10, "iName":Ljava/lang/String;
    const-string/jumbo v8, ""

    .line 459
    .local v8, "iDir":Ljava/lang/String;
    const/4 v9, -0x1

    .line 460
    .local v9, "iIndex":I
    const-string/jumbo v18, "."

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v13

    .line 461
    .local v13, "lastDot":I
    const/16 v18, -0x1

    move/from16 v0, v18

    if-ne v13, v0, :cond_8

    .line 463
    const/4 v9, 0x0

    .line 470
    :goto_2
    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, "_"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getTieClassSuffix()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ".class"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, "_"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual {v10, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getStubClassSuffix()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ".class"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    .end local v16    # "target":[Ljava/lang/String;
    .restart local v17    # "target":[Ljava/lang/String;
    move-object/from16 v16, v17

    .end local v17    # "target":[Ljava/lang/String;
    .restart local v16    # "target":[Ljava/lang/String;
    goto/16 :goto_0

    .line 465
    :cond_8
    add-int/lit8 v9, v13, 0x1

    .line 466
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v10, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 467
    const/16 v18, 0x2e

    sget-char v19, Ljava/io/File;->separatorChar:C

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v8

    goto/16 :goto_2

    .line 477
    .end local v3    # "c":Ljava/lang/Class;
    .end local v8    # "iDir":Ljava/lang/String;
    .end local v9    # "iIndex":I
    .end local v10    # "iName":Ljava/lang/String;
    .end local v12    # "interf":Ljava/lang/Class;
    .end local v13    # "lastDot":I
    :catch_0
    move-exception v6

    .line 478
    .local v6, "e":Ljava/lang/ClassNotFoundException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Unable to verify class "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ". It could not be found."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    invoke-virtual/range {v18 .. v20}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 481
    .end local v6    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v6

    .line 482
    .local v6, "e":Ljava/lang/NoClassDefFoundError;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Unable to verify class "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ". It is not defined."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    invoke-virtual/range {v18 .. v20}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 484
    .end local v6    # "e":Ljava/lang/NoClassDefFoundError;
    :catch_2
    move-exception v15

    .line 485
    .local v15, "t":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;->this$0:Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Unable to verify class "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, ". Loading caused Exception: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual {v15}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    invoke-virtual/range {v18 .. v20}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    goto/16 :goto_0
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 376
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 381
    return-void
.end method
