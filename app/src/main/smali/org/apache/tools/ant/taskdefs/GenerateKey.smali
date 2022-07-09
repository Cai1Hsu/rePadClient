.class public Lorg/apache/tools/ant/taskdefs/GenerateKey;
.super Lorg/apache/tools/ant/Task;
.source "GenerateKey.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;,
        Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;
    }
.end annotation


# instance fields
.field protected alias:Ljava/lang/String;

.field protected dname:Ljava/lang/String;

.field protected expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

.field protected keyalg:Ljava/lang/String;

.field protected keypass:Ljava/lang/String;

.field protected keysize:I

.field protected keystore:Ljava/lang/String;

.field protected sigalg:Ljava/lang/String;

.field protected storepass:Ljava/lang/String;

.field protected storetype:Ljava/lang/String;

.field protected validity:I

.field protected verbose:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 80
    return-void
.end method


# virtual methods
.method public createDname()Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 192
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    if-eqz v0, :cond_0

    .line 193
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "DName sub-element can only be specified once."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 196
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->dname:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 197
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "It is not possible to specify dname  both as attribute and element."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 200
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    .line 201
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    return-object v0
.end method

.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 322
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->alias:Ljava/lang/String;

    if-nez v3, :cond_0

    .line 323
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "alias attribute must be set"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 326
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storepass:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 327
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "storepass attribute must be set"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 330
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->dname:Ljava/lang/String;

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    if-nez v3, :cond_2

    .line 331
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "dname must be set"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 334
    :cond_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 336
    .local v2, "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v3, "-genkey "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 338
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->verbose:Z

    if-eqz v3, :cond_3

    .line 339
    const-string/jumbo v3, "-v "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 342
    :cond_3
    const-string/jumbo v3, "-alias \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 343
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->alias:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 344
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 346
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->dname:Ljava/lang/String;

    if-eqz v3, :cond_4

    .line 347
    const-string/jumbo v3, "-dname \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 348
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->dname:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 349
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 352
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    if-eqz v3, :cond_5

    .line 353
    const-string/jumbo v3, "-dname \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 354
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 355
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 358
    :cond_5
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keystore:Ljava/lang/String;

    if-eqz v3, :cond_6

    .line 359
    const-string/jumbo v3, "-keystore \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 360
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keystore:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 361
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 364
    :cond_6
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storepass:Ljava/lang/String;

    if-eqz v3, :cond_7

    .line 365
    const-string/jumbo v3, "-storepass \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 366
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storepass:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 367
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 370
    :cond_7
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storetype:Ljava/lang/String;

    if-eqz v3, :cond_8

    .line 371
    const-string/jumbo v3, "-storetype \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 372
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storetype:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 373
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 376
    :cond_8
    const-string/jumbo v3, "-keypass \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 377
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keypass:Ljava/lang/String;

    if-eqz v3, :cond_d

    .line 378
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keypass:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 382
    :goto_0
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 384
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->sigalg:Ljava/lang/String;

    if-eqz v3, :cond_9

    .line 385
    const-string/jumbo v3, "-sigalg \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 386
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->sigalg:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 387
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 390
    :cond_9
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keyalg:Ljava/lang/String;

    if-eqz v3, :cond_a

    .line 391
    const-string/jumbo v3, "-keyalg \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 392
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keyalg:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 393
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 397
    :cond_a
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keysize:I

    if-lez v3, :cond_b

    .line 398
    const-string/jumbo v3, "-keysize \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 399
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keysize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 400
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 403
    :cond_b
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->validity:I

    if-lez v3, :cond_c

    .line 404
    const-string/jumbo v3, "-validity \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 405
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->validity:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 406
    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 409
    :cond_c
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Generating Key for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->alias:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/GenerateKey;->log(Ljava/lang/String;)V

    .line 410
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ExecTask;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 411
    .local v1, "cmd":Lorg/apache/tools/ant/taskdefs/ExecTask;
    const-string/jumbo v3, "keytool"

    invoke-static {v3}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    .line 412
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    .line 413
    .local v0, "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 414
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setFailonerror(Z)V

    .line 415
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/GenerateKey;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setTaskName(Ljava/lang/String;)V

    .line 416
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V

    .line 417
    return-void

    .line 380
    .end local v0    # "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    .end local v1    # "cmd":Lorg/apache/tools/ant/taskdefs/ExecTask;
    :cond_d
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storepass:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_0
.end method

.method public setAlias(Ljava/lang/String;)V
    .locals 0
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 223
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->alias:Ljava/lang/String;

    .line 224
    return-void
.end method

.method public setDname(Ljava/lang/String;)V
    .locals 2
    .param p1, "dname"    # Ljava/lang/String;

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->expandedDname:Lorg/apache/tools/ant/taskdefs/GenerateKey$DistinguishedName;

    if-eqz v0, :cond_0

    .line 211
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "It is not possible to specify dname  both as attribute and element."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->dname:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public setKeyalg(Ljava/lang/String;)V
    .locals 0
    .param p1, "keyalg"    # Ljava/lang/String;

    .prologue
    .line 276
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keyalg:Ljava/lang/String;

    .line 277
    return-void
.end method

.method public setKeypass(Ljava/lang/String;)V
    .locals 0
    .param p1, "keypass"    # Ljava/lang/String;

    .prologue
    .line 259
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keypass:Ljava/lang/String;

    .line 260
    return-void
.end method

.method public setKeysize(Ljava/lang/String;)V
    .locals 3
    .param p1, "keysize"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 288
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keysize:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    return-void

    .line 289
    :catch_0
    move-exception v0

    .line 290
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "KeySize attribute should be a integer"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setKeystore(Ljava/lang/String;)V
    .locals 0
    .param p1, "keystore"    # Ljava/lang/String;

    .prologue
    .line 232
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->keystore:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public setSigalg(Ljava/lang/String;)V
    .locals 0
    .param p1, "sigalg"    # Ljava/lang/String;

    .prologue
    .line 268
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->sigalg:Ljava/lang/String;

    .line 269
    return-void
.end method

.method public setStorepass(Ljava/lang/String;)V
    .locals 0
    .param p1, "storepass"    # Ljava/lang/String;

    .prologue
    .line 241
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storepass:Ljava/lang/String;

    .line 242
    return-void
.end method

.method public setStoretype(Ljava/lang/String;)V
    .locals 0
    .param p1, "storetype"    # Ljava/lang/String;

    .prologue
    .line 250
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->storetype:Ljava/lang/String;

    .line 251
    return-void
.end method

.method public setValidity(Ljava/lang/String;)V
    .locals 3
    .param p1, "validity"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 302
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->validity:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    return-void

    .line 303
    :catch_0
    move-exception v0

    .line 304
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Validity attribute should be a integer"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "verbose"    # Z

    .prologue
    .line 313
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey;->verbose:Z

    .line 314
    return-void
.end method
