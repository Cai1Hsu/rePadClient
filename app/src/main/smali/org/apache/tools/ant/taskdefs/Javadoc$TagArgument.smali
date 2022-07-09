.class public Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;
.super Lorg/apache/tools/ant/types/FileSet;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TagArgument"
.end annotation


# instance fields
.field private enabled:Z

.field private name:Ljava/lang/String;

.field private scope:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;

    .prologue
    .line 1315
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-direct {p0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 1304
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->name:Ljava/lang/String;

    .line 1306
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->enabled:Z

    .line 1312
    const-string/jumbo v0, "a"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->scope:Ljava/lang/String;

    .line 1317
    return-void
.end method


# virtual methods
.method public getParameter()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1422
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->name:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1423
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No name specified for custom tag."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1425
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->getDescription()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1426
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->enabled:Z

    if-eqz v0, :cond_2

    const-string/jumbo v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->scope:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1431
    :goto_1
    return-object v0

    .line 1426
    :cond_2
    const-string/jumbo v0, "X"

    goto :goto_0

    .line 1428
    :cond_3
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->enabled:Z

    if-eqz v0, :cond_4

    const-string/jumbo v0, "a"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->scope:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 1429
    :cond_4
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->enabled:Z

    if-eqz v0, :cond_5

    const-string/jumbo v0, ""

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->scope:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_5
    const-string/jumbo v0, "X"

    goto :goto_2

    .line 1431
    :cond_6
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->name:Ljava/lang/String;

    goto :goto_1
.end method

.method public setEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 1412
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->enabled:Z

    .line 1413
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1326
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->name:Ljava/lang/String;

    .line 1327
    return-void
.end method

.method public setScope(Ljava/lang/String;)V
    .locals 11
    .param p1, "verboseScope"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x3

    .line 1346
    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 1348
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Javadoc;->SCOPE_ELEMENTS:[Ljava/lang/String;

    array-length v7, v7

    new-array v1, v7, [Z

    .line 1350
    .local v1, "elements":[Z
    const/4 v2, 0x0

    .line 1351
    .local v2, "gotAll":Z
    const/4 v3, 0x0

    .line 1355
    .local v3, "gotNotAll":Z
    new-instance v6, Ljava/util/StringTokenizer;

    const-string/jumbo v7, ","

    invoke-direct {v6, p1, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1356
    .local v6, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1357
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 1358
    .local v5, "next":Ljava/lang/String;
    const-string/jumbo v7, "all"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1359
    if-eqz v2, :cond_0

    .line 1360
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    const-string/jumbo v8, "Repeated tag scope element: all"

    invoke-virtual {v7, v8, v10}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1363
    :cond_0
    const/4 v2, 0x1

    goto :goto_0

    .line 1366
    :cond_1
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Javadoc;->SCOPE_ELEMENTS:[Ljava/lang/String;

    array-length v7, v7

    if-ge v4, v7, :cond_2

    .line 1367
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Javadoc;->SCOPE_ELEMENTS:[Ljava/lang/String;

    aget-object v7, v7, v4

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1371
    :cond_2
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Javadoc;->SCOPE_ELEMENTS:[Ljava/lang/String;

    array-length v7, v7

    if-ne v4, v7, :cond_4

    .line 1372
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Unrecognised scope element: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1366
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1375
    :cond_4
    aget-boolean v7, v1, v4

    if-eqz v7, :cond_5

    .line 1376
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Repeated tag scope element: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v10}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1379
    :cond_5
    const/4 v7, 0x1

    aput-boolean v7, v1, v4

    .line 1380
    const/4 v3, 0x1

    goto :goto_0

    .line 1385
    .end local v4    # "i":I
    .end local v5    # "next":Ljava/lang/String;
    :cond_6
    if-eqz v3, :cond_7

    if-eqz v2, :cond_7

    .line 1386
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Mixture of \"all\" and other scope elements in tag parameter."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1389
    :cond_7
    if-nez v3, :cond_8

    if-nez v2, :cond_8

    .line 1390
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "No scope elements specified in tag parameter."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1393
    :cond_8
    if-eqz v2, :cond_9

    .line 1394
    const-string/jumbo v7, "a"

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->scope:Ljava/lang/String;

    .line 1404
    :goto_2
    return-void

    .line 1396
    :cond_9
    new-instance v0, Ljava/lang/StringBuffer;

    array-length v7, v1

    invoke-direct {v0, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1397
    .local v0, "buff":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    array-length v7, v1

    if-ge v4, v7, :cond_b

    .line 1398
    aget-boolean v7, v1, v4

    if-eqz v7, :cond_a

    .line 1399
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Javadoc;->SCOPE_ELEMENTS:[Ljava/lang/String;

    aget-object v7, v7, v4

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1397
    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1402
    :cond_b
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->scope:Ljava/lang/String;

    goto :goto_2
.end method
