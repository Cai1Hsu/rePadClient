.class public Lcom/edutech/appmanage/utils/ApkController;
.super Ljava/lang/Object;
.source "ApkController.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static apkIntentInstall(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p0, "apkpath"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 178
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 179
    .local v0, "installIntent":Landroid/content/Intent;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 180
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 179
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 182
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 183
    return-void
.end method

.method private static apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V
    .locals 4
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 303
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "package:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 304
    .local v0, "packageURI":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.DELETE"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 305
    .local v1, "uninstallIntent":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 306
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 307
    return-void
.end method

.method private static apkUninstall(Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 274
    :try_start_0
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SlientUninstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 275
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SuSlientUninstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 277
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V

    .line 299
    :goto_0
    return-void

    .line 280
    :cond_0
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5378\u8f7d\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 284
    :catch_0
    move-exception v0

    .line 286
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SuSlientUninstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 288
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 292
    :catch_1
    move-exception v1

    .line 294
    .local v1, "e1":Ljava/lang/Exception;
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkIntentUninstall(Ljava/lang/String;Landroid/content/Context;)V

    .line 295
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":InstallApk\u5378\u8f7d\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 282
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "e1":Ljava/lang/Exception;
    :cond_1
    :try_start_2
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SlientInstall\u5378\u8f7d\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 291
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_3
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5378\u8f7d\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method private static apkinstall(Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "apkpath"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 153
    :try_start_0
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 154
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 155
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkIntentInstall(Ljava/lang/String;Landroid/content/Context;)V

    .line 174
    :goto_0
    return-void

    .line 157
    :cond_0
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 161
    :catch_0
    move-exception v0

    .line 163
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {p0}, Lcom/edutech/utils/InstallApkUtil;->SuSlientInstall(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 164
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkIntentInstall(Ljava/lang/String;Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 167
    :catch_1
    move-exception v1

    .line 169
    .local v1, "e1":Ljava/lang/Exception;
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkIntentInstall(Ljava/lang/String;Landroid/content/Context;)V

    .line 170
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":InstallApk\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 159
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "e1":Ljava/lang/Exception;
    :cond_1
    :try_start_2
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SlientInstall\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 166
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_3
    const-string/jumbo v2, "sysService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, ":SuSlientInstall\u5b89\u88c5\u6210\u529f\uff01"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0
.end method

.method private static apkinstall_samsung(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p0, "apkpath"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 139
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 140
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SILENCE_INSTALL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M1016Pro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 142
    const-string/jumbo v1, "uri"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 147
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 149
    return-void

    .line 144
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    .line 145
    const-string/jumbo v2, "application/vnd.android.package-archive"

    .line 144
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private static apkuninstall_samsung(Ljava/lang/String;Landroid/content/Context;)V
    .locals 3
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 263
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 264
    .local v0, "intent1":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SILENCE_UNINSTALL"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 265
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v2, "M1016Pro"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 266
    const-string/jumbo v1, "pgk"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 270
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 271
    return-void

    .line 268
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "package://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private static clientInstall(Ljava/lang/String;)Z
    .locals 7
    .param p0, "apkPath"    # Ljava/lang/String;

    .prologue
    .line 335
    const/4 v0, 0x0

    .line 336
    .local v0, "PrintWriter":Ljava/io/PrintWriter;
    const/4 v3, 0x0

    .line 338
    .local v3, "process":Ljava/lang/Process;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    const-string/jumbo v6, "su"

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 339
    new-instance v1, Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .local v1, "PrintWriter":Ljava/io/PrintWriter;
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "chmod 777 "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 342
    const-string/jumbo v5, "export LD_LIBRARY_PATH=/vendor/lib:/system/lib"

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 343
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "pm install -r "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 345
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 346
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 347
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v4

    .line 348
    .local v4, "value":I
    invoke-static {v4}, Lcom/edutech/appmanage/utils/ApkController;->returnResult(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v5

    .line 352
    if-eqz v3, :cond_0

    .line 353
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    :cond_0
    move-object v0, v1

    .line 356
    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .end local v4    # "value":I
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    :goto_0
    return v5

    .line 349
    :catch_0
    move-exception v2

    .line 350
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 352
    if-eqz v3, :cond_1

    .line 353
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 356
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 351
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 352
    :goto_2
    if-eqz v3, :cond_2

    .line 353
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 355
    :cond_2
    throw v5

    .line 351
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_2

    .line 349
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_1
.end method

.method private static clientUninstall(Ljava/lang/String;)Z
    .locals 7
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 363
    const/4 v0, 0x0

    .line 364
    .local v0, "PrintWriter":Ljava/io/PrintWriter;
    const/4 v3, 0x0

    .line 366
    .local v3, "process":Ljava/lang/Process;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    const-string/jumbo v6, "su"

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 367
    new-instance v1, Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .local v1, "PrintWriter":Ljava/io/PrintWriter;
    :try_start_1
    const-string/jumbo v5, "LD_LIBRARY_PATH=/vendor/lib:/system/lib "

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 369
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "pm uninstall "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 370
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 371
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 372
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v4

    .line 373
    .local v4, "value":I
    invoke-static {v4}, Lcom/edutech/appmanage/utils/ApkController;->returnResult(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v5

    .line 377
    if-eqz v3, :cond_0

    .line 378
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    :cond_0
    move-object v0, v1

    .line 381
    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .end local v4    # "value":I
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    :goto_0
    return v5

    .line 374
    :catch_0
    move-exception v2

    .line 375
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 377
    if-eqz v3, :cond_1

    .line 378
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 381
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 376
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 377
    :goto_2
    if-eqz v3, :cond_2

    .line 378
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 380
    :cond_2
    throw v5

    .line 376
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_2

    .line 374
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_1
.end method

.method private static hasRootPerssion()Z
    .locals 7

    .prologue
    .line 312
    const/4 v0, 0x0

    .line 313
    .local v0, "PrintWriter":Ljava/io/PrintWriter;
    const/4 v3, 0x0

    .line 315
    .local v3, "process":Ljava/lang/Process;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    const-string/jumbo v6, "su"

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 316
    new-instance v1, Ljava/io/PrintWriter;

    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 317
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .local v1, "PrintWriter":Ljava/io/PrintWriter;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 318
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 319
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v4

    .line 320
    .local v4, "value":I
    invoke-static {v4}, Lcom/edutech/appmanage/utils/ApkController;->returnResult(I)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v5

    .line 324
    if-eqz v3, :cond_0

    .line 325
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 328
    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .end local v4    # "value":I
    :cond_0
    :goto_0
    return v5

    .line 321
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    :catch_0
    move-exception v2

    .line 322
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 324
    if-eqz v3, :cond_1

    .line 325
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 328
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 323
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 324
    :goto_2
    if-eqz v3, :cond_2

    .line 325
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 327
    :cond_2
    throw v5

    .line 323
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_2

    .line 321
    .end local v0    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v1    # "PrintWriter":Ljava/io/PrintWriter;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "PrintWriter":Ljava/io/PrintWriter;
    .restart local v0    # "PrintWriter":Ljava/io/PrintWriter;
    goto :goto_1
.end method

.method public static install(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 10
    .param p0, "apkPath"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 32
    const/4 v0, 0x0

    .line 33
    .local v0, "boo":Z
    new-instance v1, Landroid/content/ComponentName;

    const-string/jumbo v8, "com.launcher.activity"

    .line 34
    const-class v9, Lcom/edutech/appmanage/utils/ApkController;

    invoke-virtual {v9}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    .line 33
    invoke-direct {v1, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .local v1, "cn":Landroid/content/ComponentName;
    new-instance v4, Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    invoke-direct {v4, p1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;-><init>(Landroid/content/Context;)V

    .line 38
    .local v4, "mHwPDM":Lcom/huawei/android/app/admin/HwDevicePolicyManager;
    new-instance v5, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-direct {v5, p1}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    .line 41
    .local v5, "mMiaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    :try_start_0
    invoke-virtual {v4, v1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 48
    :goto_0
    if-eqz v0, :cond_0

    .line 51
    :try_start_1
    invoke-virtual {v4, v1, p0}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->installPackage(Landroid/content/ComponentName;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 78
    :goto_1
    return v6

    .line 43
    :catch_0
    move-exception v2

    .line 45
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "exception"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 53
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .restart local v2    # "e":Ljava/lang/Exception;
    move v6, v7

    .line 54
    goto :goto_1

    .line 56
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "A10-70F"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "YiJiao"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 57
    invoke-virtual {v5, p0}, Landroid/app/mia/MiaMdmPolicyManager;->silentInstall(Ljava/lang/String;)V

    .line 58
    const-string/jumbo v7, "apkinstall"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "lenovo:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 64
    :cond_1
    :try_start_2
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "QC80A"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "N5110ZB"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, ".T360Z"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P350"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P550"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P583"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    .line 65
    const-string/jumbo v8, "apkinstall"

    const-string/jumbo v9, "apkinstall"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkinstall(Ljava/lang/String;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 76
    :catch_2
    move-exception v3

    .local v3, "e2":Ljava/lang/Exception;
    move v6, v7

    .line 78
    goto/16 :goto_1

    .line 72
    .end local v3    # "e2":Ljava/lang/Exception;
    :cond_2
    const-string/jumbo v8, "apkinstall"

    const-string/jumbo v9, "apkinstall_samsung"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkinstall_samsung(Ljava/lang/String;Landroid/content/Context;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1
.end method

.method private static returnResult(I)Z
    .locals 2
    .param p0, "value"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 408
    if-nez p0, :cond_0

    .line 413
    :goto_0
    return v0

    .line 410
    :cond_0
    if-ne p0, v0, :cond_1

    move v0, v1

    .line 411
    goto :goto_0

    :cond_1
    move v0, v1

    .line 413
    goto :goto_0
.end method

.method public static startApp(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "activityName"    # Ljava/lang/String;

    .prologue
    .line 389
    const/4 v2, 0x0

    .line 390
    .local v2, "isSuccess":Z
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "am start -n "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " \n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 391
    .local v0, "cmd":Ljava/lang/String;
    const/4 v3, 0x0

    .line 393
    .local v3, "process":Ljava/lang/Process;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 394
    invoke-virtual {v3}, Ljava/lang/Process;->waitFor()I

    move-result v4

    .line 395
    .local v4, "value":I
    invoke-static {v4}, Lcom/edutech/appmanage/utils/ApkController;->returnResult(I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 399
    .end local v2    # "isSuccess":Z
    if-eqz v3, :cond_0

    .line 400
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 403
    .end local v4    # "value":I
    :cond_0
    :goto_0
    return v2

    .line 396
    .restart local v2    # "isSuccess":Z
    :catch_0
    move-exception v1

    .line 397
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 399
    if-eqz v3, :cond_0

    .line 400
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    goto :goto_0

    .line 398
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 399
    if-eqz v3, :cond_1

    .line 400
    invoke-virtual {v3}, Ljava/lang/Process;->destroy()V

    .line 402
    :cond_1
    throw v5
.end method

.method public static uninstall(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 10
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 202
    const/4 v0, 0x0

    .line 203
    .local v0, "boo":Z
    new-instance v1, Landroid/content/ComponentName;

    const-string/jumbo v8, "com.launcher.activity"

    .line 204
    const-class v9, Lcom/edutech/appmanage/utils/ApkController;

    invoke-virtual {v9}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    .line 203
    invoke-direct {v1, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .local v1, "cn":Landroid/content/ComponentName;
    new-instance v4, Lcom/huawei/android/app/admin/HwDevicePolicyManager;

    invoke-direct {v4, p1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;-><init>(Landroid/content/Context;)V

    .line 208
    .local v4, "mHwPDM":Lcom/huawei/android/app/admin/HwDevicePolicyManager;
    new-instance v5, Landroid/app/mia/MiaMdmPolicyManager;

    invoke-direct {v5, p1}, Landroid/app/mia/MiaMdmPolicyManager;-><init>(Landroid/content/Context;)V

    .line 210
    .local v5, "mMiaMdmPolicyManager":Landroid/app/mia/MiaMdmPolicyManager;
    :try_start_0
    invoke-virtual {v4, v1}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->isRecentTaskButtonDisabled(Landroid/content/ComponentName;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 217
    :goto_0
    if-eqz v0, :cond_0

    .line 220
    const/4 v8, 0x1

    :try_start_1
    invoke-virtual {v4, v1, p0, v8}, Lcom/huawei/android/app/admin/HwDevicePolicyManager;->uninstallPackage(Landroid/content/ComponentName;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 245
    :goto_1
    return v6

    .line 212
    :catch_0
    move-exception v2

    .line 214
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "exception"

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 222
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .restart local v2    # "e":Ljava/lang/Exception;
    move v6, v7

    .line 223
    goto :goto_1

    .line 225
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "A10-70F"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "YiJiao"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 226
    invoke-virtual {v5, p0}, Landroid/app/mia/MiaMdmPolicyManager;->silentUnInstall(Ljava/lang/String;)V

    .line 227
    const-string/jumbo v7, "apkinstall"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "lenovo:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 232
    :cond_1
    :try_start_2
    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "QC80A"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "N5110ZB"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, ".T360Z"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P350"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P550"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    const-string/jumbo v9, "P583"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-gez v8, :cond_2

    .line 234
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkUninstall(Ljava/lang/String;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 243
    :catch_2
    move-exception v3

    .local v3, "e2":Ljava/lang/Exception;
    move v6, v7

    .line 245
    goto/16 :goto_1

    .line 240
    .end local v3    # "e2":Ljava/lang/Exception;
    :cond_2
    invoke-static {p0, p1}, Lcom/edutech/appmanage/utils/ApkController;->apkuninstall_samsung(Ljava/lang/String;Landroid/content/Context;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1
.end method
