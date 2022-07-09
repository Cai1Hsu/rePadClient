.class public Lorg/apache/tools/ant/dispatch/DispatchUtils;
.super Ljava/lang/Object;
.source "DispatchUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final execute(Ljava/lang/Object;)V
    .locals 21
    .param p0, "task"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 38
    const-string/jumbo v9, "execute"

    .line 39
    .local v9, "methodName":Ljava/lang/String;
    const/4 v4, 0x0

    .line 41
    .local v4, "dispatchable":Lorg/apache/tools/ant/dispatch/Dispatchable;
    :try_start_0
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/apache/tools/ant/dispatch/Dispatchable;

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 42
    move-object/from16 v0, p0

    check-cast v0, Lorg/apache/tools/ant/dispatch/Dispatchable;

    move-object v4, v0
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 52
    :cond_0
    :goto_0
    if-eqz v4, :cond_8

    .line 53
    const/4 v8, 0x0

    .line 55
    .local v8, "mName":Ljava/lang/String;
    :try_start_1
    invoke-interface {v4}, Lorg/apache/tools/ant/dispatch/Dispatchable;->getActionParameterName()Ljava/lang/String;

    move-result-object v10

    .line 56
    .local v10, "name":Ljava/lang/String;
    if-eqz v10, :cond_7

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-lez v17, :cond_7

    .line 57
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "get"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    const/16 v20, 0x1

    invoke-virtual/range {v18 .. v20}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 58
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-le v0, v1, :cond_1

    .line 59
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 61
    :cond_1
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 62
    .local v3, "c":Ljava/lang/Class;
    const/16 v17, 0x0

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v3, v8, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 63
    .local v2, "actionM":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_4

    .line 64
    const/16 v17, 0x0

    check-cast v17, [Ljava/lang/Object;

    move-object/from16 v0, v17

    invoke-virtual {v2, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 65
    .local v12, "o":Ljava/lang/Object;
    if-eqz v12, :cond_6

    .line 66
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    .line 67
    .local v14, "s":Ljava/lang/String;
    if-eqz v14, :cond_5

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-lez v17, :cond_5

    .line 68
    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 69
    const/4 v6, 0x0

    .line 70
    .local v6, "executeM":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    const/16 v18, 0x0

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v9, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 72
    if-nez v6, :cond_3

    .line 73
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "No public "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "() in "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    .line 96
    .end local v2    # "actionM":Ljava/lang/reflect/Method;
    .end local v3    # "c":Ljava/lang/Class;
    .end local v6    # "executeM":Ljava/lang/reflect/Method;
    .end local v10    # "name":Ljava/lang/String;
    .end local v12    # "o":Ljava/lang/Object;
    .end local v14    # "s":Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 97
    .local v11, "nsme":Ljava/lang/NoSuchMethodException;
    :try_start_2
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "No public "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "() in "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    .line 111
    .end local v8    # "mName":Ljava/lang/String;
    .end local v11    # "nsme":Ljava/lang/NoSuchMethodException;
    .end local p0    # "task":Ljava/lang/Object;
    :catch_1
    move-exception v7

    .line 112
    .local v7, "ie":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v7}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v15

    .line 113
    .local v15, "t":Ljava/lang/Throwable;
    instance-of v0, v15, Lorg/apache/tools/ant/BuildException;

    move/from16 v17, v0

    if-eqz v17, :cond_a

    .line 114
    check-cast v15, Lorg/apache/tools/ant/BuildException;

    .end local v15    # "t":Ljava/lang/Throwable;
    throw v15

    .line 43
    .end local v7    # "ie":Ljava/lang/reflect/InvocationTargetException;
    .restart local p0    # "task":Ljava/lang/Object;
    :cond_2
    :try_start_3
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/apache/tools/ant/UnknownElement;

    move/from16 v17, v0

    if-eqz v17, :cond_0

    .line 44
    move-object/from16 v0, p0

    check-cast v0, Lorg/apache/tools/ant/UnknownElement;

    move-object/from16 v16, v0

    .line 45
    .local v16, "ue":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/ant/UnknownElement;->getRealThing()Ljava/lang/Object;

    move-result-object v13

    .line 46
    .local v13, "realThing":Ljava/lang/Object;
    if-eqz v13, :cond_0

    instance-of v0, v13, Lorg/apache/tools/ant/dispatch/Dispatchable;

    move/from16 v17, v0

    if-eqz v17, :cond_0

    instance-of v0, v13, Lorg/apache/tools/ant/Task;

    move/from16 v17, v0

    if-eqz v17, :cond_0

    .line 49
    move-object v0, v13

    check-cast v0, Lorg/apache/tools/ant/dispatch/Dispatchable;

    move-object v4, v0
    :try_end_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 77
    .end local v13    # "realThing":Ljava/lang/Object;
    .end local v16    # "ue":Lorg/apache/tools/ant/UnknownElement;
    .restart local v2    # "actionM":Ljava/lang/reflect/Method;
    .restart local v3    # "c":Ljava/lang/Class;
    .restart local v6    # "executeM":Ljava/lang/reflect/Method;
    .restart local v8    # "mName":Ljava/lang/String;
    .restart local v10    # "name":Ljava/lang/String;
    .restart local v12    # "o":Ljava/lang/Object;
    .restart local v14    # "s":Ljava/lang/String;
    :cond_3
    const/16 v17, 0x0

    :try_start_4
    check-cast v17, [Ljava/lang/Object;

    move-object/from16 v0, v17

    invoke-virtual {v6, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/apache/tools/ant/UnknownElement;

    move/from16 v17, v0

    if-eqz v17, :cond_4

    .line 79
    move-object/from16 v0, p0

    check-cast v0, Lorg/apache/tools/ant/UnknownElement;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Lorg/apache/tools/ant/UnknownElement;->setRealThing(Ljava/lang/Object;)V

    .line 123
    .end local v2    # "actionM":Ljava/lang/reflect/Method;
    .end local v3    # "c":Ljava/lang/Class;
    .end local v6    # "executeM":Ljava/lang/reflect/Method;
    .end local v8    # "mName":Ljava/lang/String;
    .end local v10    # "name":Ljava/lang/String;
    .end local v12    # "o":Ljava/lang/Object;
    .end local v14    # "s":Ljava/lang/String;
    .end local p0    # "task":Ljava/lang/Object;
    :cond_4
    :goto_1
    return-void

    .line 82
    .restart local v2    # "actionM":Ljava/lang/reflect/Method;
    .restart local v3    # "c":Ljava/lang/Class;
    .restart local v8    # "mName":Ljava/lang/String;
    .restart local v10    # "name":Ljava/lang/String;
    .restart local v12    # "o":Ljava/lang/Object;
    .restart local v14    # "s":Ljava/lang/String;
    .restart local p0    # "task":Ljava/lang/Object;
    :cond_5
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Dispatchable Task attribute \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "\' not set or value is empty."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_4} :catch_2

    .line 120
    .end local v2    # "actionM":Ljava/lang/reflect/Method;
    .end local v3    # "c":Ljava/lang/Class;
    .end local v8    # "mName":Ljava/lang/String;
    .end local v10    # "name":Ljava/lang/String;
    .end local v12    # "o":Ljava/lang/Object;
    .end local v14    # "s":Ljava/lang/String;
    .end local p0    # "task":Ljava/lang/Object;
    :catch_2
    move-exception v5

    .line 121
    .local v5, "e":Ljava/lang/IllegalAccessException;
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v17

    invoke-direct {v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v17

    .line 87
    .end local v5    # "e":Ljava/lang/IllegalAccessException;
    .restart local v2    # "actionM":Ljava/lang/reflect/Method;
    .restart local v3    # "c":Ljava/lang/Class;
    .restart local v8    # "mName":Ljava/lang/String;
    .restart local v10    # "name":Ljava/lang/String;
    .restart local v12    # "o":Ljava/lang/Object;
    .restart local p0    # "task":Ljava/lang/Object;
    :cond_6
    :try_start_5
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Dispatchable Task attribute \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "\' not set or value is empty."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 93
    .end local v2    # "actionM":Ljava/lang/reflect/Method;
    .end local v3    # "c":Ljava/lang/Class;
    .end local v12    # "o":Ljava/lang/Object;
    :cond_7
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v18, "Action Parameter Name must not be empty for Dispatchable Task."

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_5} :catch_2

    .line 100
    .end local v8    # "mName":Ljava/lang/String;
    .end local v10    # "name":Ljava/lang/String;
    :cond_8
    const/4 v6, 0x0

    .line 101
    .restart local v6    # "executeM":Ljava/lang/reflect/Method;
    :try_start_6
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    const/16 v18, 0x0

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v9, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 102
    if-nez v6, :cond_9

    .line 103
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "No public "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "() in "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_6
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_6 .. :try_end_6} :catch_2

    .line 118
    .end local v6    # "executeM":Ljava/lang/reflect/Method;
    .end local p0    # "task":Ljava/lang/Object;
    :catch_3
    move-exception v5

    .line 119
    .local v5, "e":Ljava/lang/NoSuchMethodException;
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v17

    invoke-direct {v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v17

    .line 106
    .end local v5    # "e":Ljava/lang/NoSuchMethodException;
    .restart local v6    # "executeM":Ljava/lang/reflect/Method;
    .restart local p0    # "task":Ljava/lang/Object;
    :cond_9
    const/16 v17, 0x0

    :try_start_7
    check-cast v17, [Ljava/lang/Object;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v6, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    move-object/from16 v0, p0

    instance-of v0, v0, Lorg/apache/tools/ant/UnknownElement;

    move/from16 v17, v0

    if-eqz v17, :cond_4

    .line 108
    check-cast p0, Lorg/apache/tools/ant/UnknownElement;

    .end local p0    # "task":Ljava/lang/Object;
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setRealThing(Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_7 .. :try_end_7} :catch_2

    goto/16 :goto_1

    .line 116
    .end local v6    # "executeM":Ljava/lang/reflect/Method;
    .restart local v7    # "ie":Ljava/lang/reflect/InvocationTargetException;
    .restart local v15    # "t":Ljava/lang/Throwable;
    :cond_a
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v17

    invoke-direct {v0, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v17
.end method
