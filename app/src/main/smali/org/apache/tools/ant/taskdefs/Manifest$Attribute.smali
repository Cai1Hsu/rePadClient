.class public Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Manifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Attribute"
.end annotation


# static fields
.field private static final MAX_NAME_LENGTH:I = 0x46

.field private static final MAX_NAME_VALUE_LENGTH:I = 0x44


# instance fields
.field private currentIndex:I

.field private name:Ljava/lang/String;

.field private values:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    .line 130
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    .line 136
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    .line 141
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    .line 130
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    .line 136
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    .line 151
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->parse(Ljava/lang/String;)V

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    .line 130
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    .line 136
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    .line 161
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    .line 162
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->setValue(Ljava/lang/String;)V

    .line 163
    return-void
.end method

.method private writeValue(Ljava/io/PrintWriter;Ljava/lang/String;)V
    .locals 8
    .param p1, "writer"    # Ljava/io/PrintWriter;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x46

    .line 363
    const/4 v1, 0x0

    .line 364
    .local v1, "line":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    const-string/jumbo v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    array-length v2, v4

    .line 365
    .local v2, "nameLength":I
    const/16 v4, 0x44

    if-le v2, v4, :cond_2

    .line 366
    if-le v2, v6, :cond_0

    .line 367
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to write manifest line "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 370
    :cond_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 371
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 375
    :goto_0
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    array-length v4, v4

    if-le v4, v6, :cond_5

    .line 377
    const/16 v0, 0x46

    .line 378
    .local v0, "breakIndex":I
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v0, v4, :cond_1

    .line 379
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .line 381
    :cond_1
    invoke-virtual {v1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 383
    .local v3, "section":Ljava/lang/String;
    :goto_1
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    array-length v4, v4

    if-le v4, v6, :cond_3

    if-lez v0, :cond_3

    .line 384
    add-int/lit8 v0, v0, -0x1

    .line 385
    invoke-virtual {v1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 373
    .end local v0    # "breakIndex":I
    .end local v3    # "section":Ljava/lang/String;
    :cond_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 387
    .restart local v0    # "breakIndex":I
    .restart local v3    # "section":Ljava/lang/String;
    :cond_3
    if-nez v0, :cond_4

    .line 388
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to write manifest line "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 391
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 392
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 394
    .end local v0    # "breakIndex":I
    .end local v3    # "section":Ljava/lang/String;
    :cond_5
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 395
    return-void
.end method


# virtual methods
.method public addContinuation(Ljava/lang/String;)V
    .locals 3
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 315
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    invoke-virtual {v1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 316
    .local v0, "currentValue":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->setValue(Ljava/lang/String;)V

    .line 317
    return-void
.end method

.method public addValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 292
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    .line 293
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->setValue(Ljava/lang/String;)V

    .line 294
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "rhs"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 186
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-eq v4, v5, :cond_1

    .line 202
    :cond_0
    :goto_0
    return v3

    .line 190
    :cond_1
    if-ne p1, p0, :cond_2

    .line 191
    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    move-object v1, p1

    .line 194
    check-cast v1, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    .line 195
    .local v1, "rhsAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "lhsKey":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 197
    .local v2, "rhsKey":Ljava/lang/String;
    if-nez v0, :cond_3

    if-nez v2, :cond_0

    :cond_3
    if-eqz v0, :cond_4

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 202
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    iget-object v4, v1, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    invoke-virtual {v3, v4}, Ljava/util/Vector;->equals(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_0
.end method

.method public getKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 249
    const/4 v0, 0x0

    .line 251
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 5

    .prologue
    .line 274
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-nez v3, :cond_0

    .line 275
    const/4 v3, 0x0

    .line 283
    :goto_0
    return-object v3

    .line 278
    :cond_0
    const-string/jumbo v1, ""

    .line 279
    .local v1, "fullValue":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValues()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 280
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 281
    .local v2, "value":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 283
    .end local v2    # "value":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public getValues()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 302
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 170
    const/4 v0, 0x0

    .line 172
    .local v0, "hashCode":I
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 173
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 176
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 177
    return v0
.end method

.method public parse(Ljava/lang/String;)V
    .locals 4
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 214
    const-string/jumbo v1, ": "

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 215
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 216
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ManifestException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Manifest line \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" is not valid as it does not "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "contain a name and a value separated by \': \' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/taskdefs/ManifestException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 220
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    .line 221
    add-int/lit8 v1, v0, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->setValue(Ljava/lang/String;)V

    .line 222
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 230
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->name:Ljava/lang/String;

    .line 231
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 260
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 261
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 262
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    .line 266
    :goto_0
    return-void

    .line 264
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->values:Ljava/util/Vector;

    iget v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->currentIndex:I

    invoke-virtual {v0, p1, v1}, Ljava/util/Vector;->setElementAt(Ljava/lang/Object;I)V

    goto :goto_0
.end method

.method public write(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "writer"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 328
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->write(Ljava/io/PrintWriter;Z)V

    .line 329
    return-void
.end method

.method public write(Ljava/io/PrintWriter;Z)V
    .locals 2
    .param p1, "writer"    # Ljava/io/PrintWriter;
    .param p2, "flatten"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 344
    if-nez p2, :cond_0

    .line 345
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValues()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 346
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, p1, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->writeValue(Ljava/io/PrintWriter;Ljava/lang/String;)V

    goto :goto_0

    .line 349
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->writeValue(Ljava/io/PrintWriter;Ljava/lang/String;)V

    .line 351
    :cond_1
    return-void
.end method
