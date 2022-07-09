.class public Lcom/edutech/appmanage/utils/ShellUtils;
.super Ljava/lang/Object;
.source "ShellUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    }
.end annotation


# static fields
.field public static final COMMAND_EXIT:Ljava/lang/String; = "exit\n"

.field public static final COMMAND_LINE_END:Ljava/lang/String; = "\n"

.field public static final COMMAND_SH:Ljava/lang/String; = "sh"

.field public static final COMMAND_SU:Ljava/lang/String; = "su"


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static checkRootPermission()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 44
    const-string/jumbo v2, "echo root"

    invoke-static {v2, v0, v1}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand(Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v2

    iget v2, v2, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;->result:I

    if-nez v2, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public static execCommand(Ljava/lang/String;Z)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    .locals 3
    .param p0, "command"    # Ljava/lang/String;
    .param p1, "isRoot"    # Z

    .prologue
    const/4 v2, 0x1

    .line 58
    new-array v0, v2, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0, p1, v2}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand([Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public static execCommand(Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    .locals 2
    .param p0, "command"    # Ljava/lang/String;
    .param p1, "isRoot"    # Z
    .param p2, "isNeedResultMsg"    # Z

    .prologue
    .line 106
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v0, p1, p2}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand([Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public static execCommand(Ljava/util/List;Z)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    .locals 2
    .param p1, "isRoot"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p0, :cond_0

    const/4 v0, 0x0

    .line 75
    :goto_0
    const/4 v1, 0x1

    .line 73
    invoke-static {v0, p1, v1}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand([Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v0

    return-object v0

    .line 74
    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public static execCommand(Ljava/util/List;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    .locals 1
    .param p1, "isRoot"    # Z
    .param p2, "isNeedResultMsg"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;ZZ)",
            "Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p0, :cond_0

    const/4 v0, 0x0

    .line 123
    :goto_0
    invoke-static {v0, p1, p2}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand([Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v0

    return-object v0

    .line 124
    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public static execCommand([Ljava/lang/String;Z)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    .locals 1
    .param p0, "commands"    # [Ljava/lang/String;
    .param p1, "isRoot"    # Z

    .prologue
    .line 89
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/edutech/appmanage/utils/ShellUtils;->execCommand([Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public static execCommand([Ljava/lang/String;ZZ)Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;
    .locals 21
    .param p0, "commands"    # [Ljava/lang/String;
    .param p1, "isRoot"    # Z
    .param p2, "isNeedResultMsg"    # Z

    .prologue
    .line 146
    const/4 v12, -0x1

    .line 147
    .local v12, "result":I
    if-eqz p0, :cond_0

    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v18, v0

    if-nez v18, :cond_1

    .line 148
    :cond_0
    new-instance v18, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v12, v1, v2}, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 216
    :goto_0
    return-object v18

    .line 151
    :cond_1
    const/4 v11, 0x0

    .line 152
    .local v11, "process":Ljava/lang/Process;
    const/16 v16, 0x0

    .line 153
    .local v16, "successResult":Ljava/io/BufferedReader;
    const/4 v7, 0x0

    .line 154
    .local v7, "errorResult":Ljava/io/BufferedReader;
    const/4 v14, 0x0

    .line 155
    .local v14, "successMsg":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 157
    .local v5, "errorMsg":Ljava/lang/StringBuilder;
    const/4 v9, 0x0

    .line 159
    .local v9, "os":Ljava/io/DataOutputStream;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v19

    .line 160
    if-eqz p1, :cond_8

    const-string/jumbo v18, "su"

    .line 159
    :goto_1
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v11

    .line 161
    new-instance v10, Ljava/io/DataOutputStream;

    invoke-virtual {v11}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v10, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_7
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .local v10, "os":Ljava/io/DataOutputStream;
    :try_start_1
    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v19, v0

    const/16 v18, 0x0

    :goto_2
    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_9

    .line 173
    const-string/jumbo v18, "exit\n"

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 174
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->flush()V

    .line 176
    invoke-virtual {v11}, Ljava/lang/Process;->waitFor()I

    move-result v12

    .line 178
    if-eqz p2, :cond_2

    .line 179
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 180
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .local v15, "successMsg":Ljava/lang/StringBuilder;
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_9
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 181
    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .local v6, "errorMsg":Ljava/lang/StringBuilder;
    :try_start_3
    new-instance v17, Ljava/io/BufferedReader;

    new-instance v18, Ljava/io/InputStreamReader;

    .line 182
    invoke-virtual {v11}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 181
    invoke-direct/range {v17 .. v18}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_e
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_a
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 183
    .end local v16    # "successResult":Ljava/io/BufferedReader;
    .local v17, "successResult":Ljava/io/BufferedReader;
    :try_start_4
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v18, Ljava/io/InputStreamReader;

    .line 184
    invoke-virtual {v11}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 183
    move-object/from16 v0, v18

    invoke-direct {v8, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_f
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_b
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 186
    .end local v7    # "errorResult":Ljava/io/BufferedReader;
    .local v8, "errorResult":Ljava/io/BufferedReader;
    :goto_3
    :try_start_5
    invoke-virtual/range {v17 .. v17}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .local v13, "s":Ljava/lang/String;
    if-nez v13, :cond_e

    .line 189
    :goto_4
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    move-result-object v13

    if-nez v13, :cond_f

    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    move-object v7, v8

    .end local v8    # "errorResult":Ljava/io/BufferedReader;
    .restart local v7    # "errorResult":Ljava/io/BufferedReader;
    move-object/from16 v16, v17

    .line 199
    .end local v13    # "s":Ljava/lang/String;
    .end local v17    # "successResult":Ljava/io/BufferedReader;
    .restart local v16    # "successResult":Ljava/io/BufferedReader;
    :cond_2
    if-eqz v10, :cond_3

    .line 200
    :try_start_6
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->close()V

    .line 202
    :cond_3
    if-eqz v16, :cond_4

    .line 203
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedReader;->close()V

    .line 205
    :cond_4
    if-eqz v7, :cond_5

    .line 206
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    .line 212
    :cond_5
    :goto_5
    if-eqz v11, :cond_6

    .line 213
    invoke-virtual {v11}, Ljava/lang/Process;->destroy()V

    :cond_6
    move-object v9, v10

    .line 216
    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    :cond_7
    :goto_6
    new-instance v19, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;

    if-nez v14, :cond_17

    const/16 v18, 0x0

    move-object/from16 v20, v18

    .line 217
    :goto_7
    if-nez v5, :cond_18

    const/16 v18, 0x0

    .line 216
    :goto_8
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lcom/edutech/appmanage/utils/ShellUtils$CommandResult;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    move-object/from16 v18, v19

    goto/16 :goto_0

    .line 160
    :cond_8
    :try_start_7
    const-string/jumbo v18, "sh"
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_c
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_1

    .line 162
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    :cond_9
    :try_start_8
    aget-object v3, p0, v18

    .line 163
    .local v3, "command":Ljava/lang/String;
    if-nez v3, :cond_a

    .line 162
    :goto_9
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_2

    .line 169
    :cond_a
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 170
    const-string/jumbo v20, "\n"

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 171
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->flush()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_9

    .line 193
    .end local v3    # "command":Ljava/lang/String;
    :catch_0
    move-exception v4

    move-object v9, v10

    .line 194
    .end local v10    # "os":Ljava/io/DataOutputStream;
    .local v4, "e":Ljava/io/IOException;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    :goto_a
    :try_start_9
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 199
    if-eqz v9, :cond_b

    .line 200
    :try_start_a
    invoke-virtual {v9}, Ljava/io/DataOutputStream;->close()V

    .line 202
    :cond_b
    if-eqz v16, :cond_c

    .line 203
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedReader;->close()V

    .line 205
    :cond_c
    if-eqz v7, :cond_d

    .line 206
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_3

    .line 212
    :cond_d
    :goto_b
    if-eqz v11, :cond_7

    .line 213
    invoke-virtual {v11}, Ljava/lang/Process;->destroy()V

    goto :goto_6

    .line 187
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v7    # "errorResult":Ljava/io/BufferedReader;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .end local v16    # "successResult":Ljava/io/BufferedReader;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v8    # "errorResult":Ljava/io/BufferedReader;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v13    # "s":Ljava/lang/String;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v17    # "successResult":Ljava/io/BufferedReader;
    :cond_e
    :try_start_b
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 193
    .end local v13    # "s":Ljava/lang/String;
    :catch_1
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    move-object v7, v8

    .end local v8    # "errorResult":Ljava/io/BufferedReader;
    .restart local v7    # "errorResult":Ljava/io/BufferedReader;
    move-object/from16 v16, v17

    .end local v17    # "successResult":Ljava/io/BufferedReader;
    .restart local v16    # "successResult":Ljava/io/BufferedReader;
    goto :goto_a

    .line 190
    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v7    # "errorResult":Ljava/io/BufferedReader;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .end local v16    # "successResult":Ljava/io/BufferedReader;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v8    # "errorResult":Ljava/io/BufferedReader;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v13    # "s":Ljava/lang/String;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v17    # "successResult":Ljava/io/BufferedReader;
    :cond_f
    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_1
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    goto/16 :goto_4

    .line 195
    .end local v13    # "s":Ljava/lang/String;
    :catch_2
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    move-object v7, v8

    .end local v8    # "errorResult":Ljava/io/BufferedReader;
    .restart local v7    # "errorResult":Ljava/io/BufferedReader;
    move-object/from16 v16, v17

    .line 196
    .end local v17    # "successResult":Ljava/io/BufferedReader;
    .local v4, "e":Ljava/lang/Exception;
    .restart local v16    # "successResult":Ljava/io/BufferedReader;
    :goto_c
    :try_start_c
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 199
    if-eqz v9, :cond_10

    .line 200
    :try_start_d
    invoke-virtual {v9}, Ljava/io/DataOutputStream;->close()V

    .line 202
    :cond_10
    if-eqz v16, :cond_11

    .line 203
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedReader;->close()V

    .line 205
    :cond_11
    if-eqz v7, :cond_12

    .line 206
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_4

    .line 212
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_12
    :goto_d
    if-eqz v11, :cond_7

    .line 213
    invoke-virtual {v11}, Ljava/lang/Process;->destroy()V

    goto/16 :goto_6

    .line 208
    .local v4, "e":Ljava/io/IOException;
    :catch_3
    move-exception v4

    .line 209
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_b

    .line 208
    .local v4, "e":Ljava/lang/Exception;
    :catch_4
    move-exception v4

    .line 209
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_d

    .line 197
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v18

    .line 199
    :goto_e
    if-eqz v9, :cond_13

    .line 200
    :try_start_e
    invoke-virtual {v9}, Ljava/io/DataOutputStream;->close()V

    .line 202
    :cond_13
    if-eqz v16, :cond_14

    .line 203
    invoke-virtual/range {v16 .. v16}, Ljava/io/BufferedReader;->close()V

    .line 205
    :cond_14
    if-eqz v7, :cond_15

    .line 206
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_5

    .line 212
    :cond_15
    :goto_f
    if-eqz v11, :cond_16

    .line 213
    invoke-virtual {v11}, Ljava/lang/Process;->destroy()V

    .line 215
    :cond_16
    throw v18

    .line 208
    :catch_5
    move-exception v4

    .line 209
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_f

    .line 208
    .end local v4    # "e":Ljava/io/IOException;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    :catch_6
    move-exception v4

    .line 209
    .restart local v4    # "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_5

    .line 217
    .end local v4    # "e":Ljava/io/IOException;
    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    :cond_17
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v20, v18

    goto/16 :goto_7

    .line 218
    :cond_18
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    goto/16 :goto_8

    .line 197
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    :catchall_1
    move-exception v18

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    goto :goto_e

    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    :catchall_2
    move-exception v18

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    goto :goto_e

    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    :catchall_3
    move-exception v18

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    goto :goto_e

    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .end local v16    # "successResult":Ljava/io/BufferedReader;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v17    # "successResult":Ljava/io/BufferedReader;
    :catchall_4
    move-exception v18

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    move-object/from16 v16, v17

    .end local v17    # "successResult":Ljava/io/BufferedReader;
    .restart local v16    # "successResult":Ljava/io/BufferedReader;
    goto :goto_e

    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v7    # "errorResult":Ljava/io/BufferedReader;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .end local v16    # "successResult":Ljava/io/BufferedReader;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v8    # "errorResult":Ljava/io/BufferedReader;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v17    # "successResult":Ljava/io/BufferedReader;
    :catchall_5
    move-exception v18

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    move-object v7, v8

    .end local v8    # "errorResult":Ljava/io/BufferedReader;
    .restart local v7    # "errorResult":Ljava/io/BufferedReader;
    move-object/from16 v16, v17

    .end local v17    # "successResult":Ljava/io/BufferedReader;
    .restart local v16    # "successResult":Ljava/io/BufferedReader;
    goto :goto_e

    .line 195
    :catch_7
    move-exception v4

    goto :goto_c

    .end local v9    # "os":Ljava/io/DataOutputStream;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    :catch_8
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    goto :goto_c

    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    :catch_9
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    goto :goto_c

    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    :catch_a
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    goto :goto_c

    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .end local v16    # "successResult":Ljava/io/BufferedReader;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v17    # "successResult":Ljava/io/BufferedReader;
    :catch_b
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    move-object/from16 v16, v17

    .end local v17    # "successResult":Ljava/io/BufferedReader;
    .restart local v16    # "successResult":Ljava/io/BufferedReader;
    goto/16 :goto_c

    .line 193
    :catch_c
    move-exception v4

    goto/16 :goto_a

    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    :catch_d
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    goto/16 :goto_a

    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    :catch_e
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    goto/16 :goto_a

    .end local v5    # "errorMsg":Ljava/lang/StringBuilder;
    .end local v9    # "os":Ljava/io/DataOutputStream;
    .end local v14    # "successMsg":Ljava/lang/StringBuilder;
    .end local v16    # "successResult":Ljava/io/BufferedReader;
    .restart local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v17    # "successResult":Ljava/io/BufferedReader;
    :catch_f
    move-exception v4

    move-object v9, v10

    .end local v10    # "os":Ljava/io/DataOutputStream;
    .restart local v9    # "os":Ljava/io/DataOutputStream;
    move-object v5, v6

    .end local v6    # "errorMsg":Ljava/lang/StringBuilder;
    .restart local v5    # "errorMsg":Ljava/lang/StringBuilder;
    move-object v14, v15

    .end local v15    # "successMsg":Ljava/lang/StringBuilder;
    .restart local v14    # "successMsg":Ljava/lang/StringBuilder;
    move-object/from16 v16, v17

    .end local v17    # "successResult":Ljava/io/BufferedReader;
    .restart local v16    # "successResult":Ljava/io/BufferedReader;
    goto/16 :goto_a
.end method
