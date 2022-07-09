.class public Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;
.super Ljava/lang/Object;
.source "SchemaValidate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SchemaLocation"
.end annotation


# static fields
.field public static final ERROR_NO_FILE:Ljava/lang/String; = "File not found: "

.field public static final ERROR_NO_LOCATION:Ljava/lang/String; = "No file or URL supplied for the schema "

.field public static final ERROR_NO_URI:Ljava/lang/String; = "No namespace URI"

.field public static final ERROR_NO_URL_REPRESENTATION:Ljava/lang/String; = "Cannot make a URL of "

.field public static final ERROR_TWO_LOCATIONS:Ljava/lang/String; = "Both URL and File were given for schema "


# instance fields
.field private file:Ljava/io/File;

.field private namespace:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 353
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 354
    return-void
.end method

.method private isSet(Ljava/lang/String;)Z
    .locals 1
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 467
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 477
    if-ne p0, p1, :cond_1

    .line 497
    :cond_0
    :goto_0
    return v1

    .line 480
    :cond_1
    instance-of v3, p1, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    if-nez v3, :cond_2

    move v1, v2

    .line 481
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 484
    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    .line 486
    .local v0, "schemaLocation":Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_3
    move v1, v2

    .line 487
    goto :goto_0

    .line 486
    :cond_4
    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    if-nez v3, :cond_3

    .line 489
    :cond_5
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    :cond_6
    move v1, v2

    .line 491
    goto :goto_0

    .line 489
    :cond_7
    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 493
    :cond_8
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 494
    goto :goto_0

    .line 493
    :cond_9
    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 377
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    return-object v0
.end method

.method public getSchemaLocationURL()Ljava/lang/String;
    .locals 7

    .prologue
    .line 411
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    if-eqz v4, :cond_0

    const/4 v1, 0x1

    .line 412
    .local v1, "hasFile":Z
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->isSet(Ljava/lang/String;)Z

    move-result v2

    .line 414
    .local v2, "hasURL":Z
    if-nez v1, :cond_1

    if-nez v2, :cond_1

    .line 415
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "No file or URL supplied for the schema "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 411
    .end local v1    # "hasFile":Z
    .end local v2    # "hasURL":Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 417
    .restart local v1    # "hasFile":Z
    .restart local v2    # "hasURL":Z
    :cond_1
    if-eqz v1, :cond_2

    if-eqz v2, :cond_2

    .line 418
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Both URL and File were given for schema "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 420
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    .line 421
    .local v3, "schema":Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 422
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_3

    .line 423
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "File not found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 427
    :cond_3
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 433
    :cond_4
    return-object v3

    .line 428
    :catch_0
    move-exception v0

    .line 430
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Cannot make a URL of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getURIandLocation()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 443
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->validateNamespace()V

    .line 444
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 445
    .local v0, "buffer":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 446
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 447
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->getSchemaLocationURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 448
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    return-object v1
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 507
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 508
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v3, v0, 0x1d

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 509
    mul-int/lit8 v2, v0, 0x1d

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 511
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 507
    goto :goto_0

    .restart local v0    # "result":I
    :cond_2
    move v2, v1

    .line 508
    goto :goto_1
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 386
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    .line 387
    return-void
.end method

.method public setNamespace(Ljava/lang/String;)V
    .locals 0
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 369
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    .line 370
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 402
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    .line 403
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 520
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 521
    .local v0, "buffer":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->namespace:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 522
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 523
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 524
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 525
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 521
    :cond_0
    const-string/jumbo v1, "(anonymous)"

    goto :goto_0

    .line 523
    :cond_1
    const-string/jumbo v1, ""

    goto :goto_1

    .line 524
    :cond_2
    const-string/jumbo v1, ""

    goto :goto_2
.end method

.method public validateNamespace()V
    .locals 2

    .prologue
    .line 456
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->getNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->isSet(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 457
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No namespace URI"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 459
    :cond_0
    return-void
.end method
