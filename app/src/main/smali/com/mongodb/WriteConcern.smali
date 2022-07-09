.class public Lcom/mongodb/WriteConcern;
.super Ljava/lang/Object;
.source "WriteConcern.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/WriteConcern$Majority;
    }
.end annotation


# static fields
.field public static final ACKNOWLEDGED:Lcom/mongodb/WriteConcern;

.field public static final ERRORS_IGNORED:Lcom/mongodb/WriteConcern;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FSYNCED:Lcom/mongodb/WriteConcern;

.field public static final FSYNC_SAFE:Lcom/mongodb/WriteConcern;

.field public static final JOURNALED:Lcom/mongodb/WriteConcern;

.field public static final JOURNAL_SAFE:Lcom/mongodb/WriteConcern;

.field public static final MAJORITY:Lcom/mongodb/WriteConcern;

.field public static final NONE:Lcom/mongodb/WriteConcern;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final NORMAL:Lcom/mongodb/WriteConcern;

.field public static final REPLICAS_SAFE:Lcom/mongodb/WriteConcern;

.field public static final REPLICA_ACKNOWLEDGED:Lcom/mongodb/WriteConcern;

.field public static final SAFE:Lcom/mongodb/WriteConcern;

.field public static final UNACKNOWLEDGED:Lcom/mongodb/WriteConcern;

.field private static _namedConcerns:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/mongodb/WriteConcern;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x1a27b26265177473L


# instance fields
.field final _continueOnError:Z

.field final _fsync:Z

.field final _j:Z

.field _w:Ljava/lang/Object;

.field final _wtimeout:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, -0x1

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 69
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v3}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->ERRORS_IGNORED:Lcom/mongodb/WriteConcern;

    .line 76
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v1}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->ACKNOWLEDGED:Lcom/mongodb/WriteConcern;

    .line 82
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v2}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->UNACKNOWLEDGED:Lcom/mongodb/WriteConcern;

    .line 88
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v1}, Lcom/mongodb/WriteConcern;-><init>(Z)V

    sput-object v0, Lcom/mongodb/WriteConcern;->FSYNCED:Lcom/mongodb/WriteConcern;

    .line 94
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v1, v2, v2, v1}, Lcom/mongodb/WriteConcern;-><init>(IIZZ)V

    sput-object v0, Lcom/mongodb/WriteConcern;->JOURNALED:Lcom/mongodb/WriteConcern;

    .line 99
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v4}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->REPLICA_ACKNOWLEDGED:Lcom/mongodb/WriteConcern;

    .line 108
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v3}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->NONE:Lcom/mongodb/WriteConcern;

    .line 117
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v2}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->NORMAL:Lcom/mongodb/WriteConcern;

    .line 126
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v1}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->SAFE:Lcom/mongodb/WriteConcern;

    .line 131
    new-instance v0, Lcom/mongodb/WriteConcern$Majority;

    invoke-direct {v0}, Lcom/mongodb/WriteConcern$Majority;-><init>()V

    sput-object v0, Lcom/mongodb/WriteConcern;->MAJORITY:Lcom/mongodb/WriteConcern;

    .line 140
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v1}, Lcom/mongodb/WriteConcern;-><init>(Z)V

    sput-object v0, Lcom/mongodb/WriteConcern;->FSYNC_SAFE:Lcom/mongodb/WriteConcern;

    .line 149
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v1, v2, v2, v1}, Lcom/mongodb/WriteConcern;-><init>(IIZZ)V

    sput-object v0, Lcom/mongodb/WriteConcern;->JOURNAL_SAFE:Lcom/mongodb/WriteConcern;

    .line 157
    new-instance v0, Lcom/mongodb/WriteConcern;

    invoke-direct {v0, v4}, Lcom/mongodb/WriteConcern;-><init>(I)V

    sput-object v0, Lcom/mongodb/WriteConcern;->REPLICAS_SAFE:Lcom/mongodb/WriteConcern;

    .line 160
    const/4 v0, 0x0

    sput-object v0, Lcom/mongodb/WriteConcern;->_namedConcerns:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/mongodb/WriteConcern;-><init>(I)V

    .line 169
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "w"    # I

    .prologue
    const/4 v0, 0x0

    .line 176
    invoke-direct {p0, p1, v0, v0}, Lcom/mongodb/WriteConcern;-><init>(IIZ)V

    .line 177
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "wtimeout"    # I

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/WriteConcern;-><init>(IIZ)V

    .line 194
    return-void
.end method

.method public constructor <init>(IIZ)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "wtimeout"    # I
    .param p3, "fsync"    # Z

    .prologue
    .line 219
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/mongodb/WriteConcern;-><init>(IIZZ)V

    .line 220
    return-void
.end method

.method public constructor <init>(IIZZ)V
    .locals 6
    .param p1, "w"    # I
    .param p2, "wtimeout"    # I
    .param p3, "fsync"    # Z
    .param p4, "j"    # Z

    .prologue
    .line 238
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/WriteConcern;-><init>(IIZZZ)V

    .line 239
    return-void
.end method

.method public constructor <init>(IIZZZ)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "wtimeout"    # I
    .param p3, "fsync"    # Z
    .param p4, "j"    # Z
    .param p5, "continueOnError"    # Z

    .prologue
    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    .line 259
    iput p2, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    .line 260
    iput-boolean p3, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    .line 261
    iput-boolean p4, p0, Lcom/mongodb/WriteConcern;->_j:Z

    .line 262
    iput-boolean p5, p0, Lcom/mongodb/WriteConcern;->_continueOnError:Z

    .line 263
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "w"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 184
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/mongodb/WriteConcern;-><init>(Ljava/lang/String;IZZ)V

    .line 185
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZZ)V
    .locals 6
    .param p1, "w"    # Ljava/lang/String;
    .param p2, "wtimeout"    # I
    .param p3, "fsync"    # Z
    .param p4, "j"    # Z

    .prologue
    .line 281
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/WriteConcern;-><init>(Ljava/lang/String;IZZZ)V

    .line 282
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZZZ)V
    .locals 2
    .param p1, "w"    # Ljava/lang/String;
    .param p2, "wtimeout"    # I
    .param p3, "fsync"    # Z
    .param p4, "j"    # Z
    .param p5, "continueOnError"    # Z

    .prologue
    .line 301
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 302
    if-nez p1, :cond_0

    .line 303
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "w can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_0
    iput-object p1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    .line 307
    iput p2, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    .line 308
    iput-boolean p3, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    .line 309
    iput-boolean p4, p0, Lcom/mongodb/WriteConcern;->_j:Z

    .line 310
    iput-boolean p5, p0, Lcom/mongodb/WriteConcern;->_continueOnError:Z

    .line 311
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2
    .param p1, "fsync"    # Z

    .prologue
    .line 201
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/mongodb/WriteConcern;-><init>(IIZ)V

    .line 202
    return-void
.end method

.method private addFSync(Lcom/mongodb/BasicDBObject;)V
    .locals 2
    .param p1, "document"    # Lcom/mongodb/BasicDBObject;

    .prologue
    .line 364
    iget-boolean v0, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    if-eqz v0, :cond_0

    .line 365
    const-string/jumbo v0, "fsync"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    :cond_0
    return-void
.end method

.method private addJ(Lcom/mongodb/BasicDBObject;)V
    .locals 2
    .param p1, "document"    # Lcom/mongodb/BasicDBObject;

    .prologue
    .line 358
    iget-boolean v0, p0, Lcom/mongodb/WriteConcern;->_j:Z

    if-eqz v0, :cond_0

    .line 359
    const-string/jumbo v0, "j"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    :cond_0
    return-void
.end method

.method private addWTimeout(Lcom/mongodb/BasicDBObject;)V
    .locals 2
    .param p1, "document"    # Lcom/mongodb/BasicDBObject;

    .prologue
    .line 370
    iget v0, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    if-lez v0, :cond_0

    .line 371
    const-string/jumbo v0, "wtimeout"

    iget v1, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    :cond_0
    return-void
.end method

.method public static majorityWriteConcern(IZZ)Lcom/mongodb/WriteConcern$Majority;
    .locals 1
    .param p0, "wtimeout"    # I
    .param p1, "fsync"    # Z
    .param p2, "j"    # Z

    .prologue
    .line 585
    new-instance v0, Lcom/mongodb/WriteConcern$Majority;

    invoke-direct {v0, p0, p1, p2}, Lcom/mongodb/WriteConcern$Majority;-><init>(IZZ)V

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/WriteConcern;
    .locals 9
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 467
    sget-object v7, Lcom/mongodb/WriteConcern;->_namedConcerns:Ljava/util/Map;

    if-nez v7, :cond_2

    .line 468
    new-instance v6, Ljava/util/HashMap;

    const/16 v7, 0x8

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v6, v7, v8}, Ljava/util/HashMap;-><init>(IF)V

    .line 469
    .local v6, "newMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mongodb/WriteConcern;>;"
    const-class v7, Lcom/mongodb/WriteConcern;

    invoke-virtual {v7}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v2, v0, v3

    .line 470
    .local v2, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Lcom/mongodb/WriteConcern;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 472
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 473
    .local v4, "key":Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mongodb/WriteConcern;

    invoke-virtual {v6, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    .end local v4    # "key":Ljava/lang/String;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 474
    :catch_0
    move-exception v1

    .line 475
    .local v1, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 481
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "f":Ljava/lang/reflect/Field;
    :cond_1
    sput-object v6, Lcom/mongodb/WriteConcern;->_namedConcerns:Ljava/util/Map;

    .line 484
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v3    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "newMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/mongodb/WriteConcern;>;"
    :cond_2
    sget-object v7, Lcom/mongodb/WriteConcern;->_namedConcerns:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mongodb/WriteConcern;

    return-object v7
.end method


# virtual methods
.method asDBObject()Lcom/mongodb/BasicDBObject;
    .locals 3

    .prologue
    .line 346
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 348
    .local v0, "document":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v1, "w"

    iget-object v2, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    invoke-direct {p0, v0}, Lcom/mongodb/WriteConcern;->addWTimeout(Lcom/mongodb/BasicDBObject;)V

    .line 351
    invoke-direct {p0, v0}, Lcom/mongodb/WriteConcern;->addFSync(Lcom/mongodb/BasicDBObject;)V

    .line 352
    invoke-direct {p0, v0}, Lcom/mongodb/WriteConcern;->addJ(Lcom/mongodb/BasicDBObject;)V

    .line 354
    return-object v0
.end method

.method public callGetLastError()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 455
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 456
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    .line 457
    :goto_0
    return v0

    :cond_0
    move v0, v2

    .line 456
    goto :goto_0

    .line 457
    :cond_1
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    if-eqz v0, :cond_2

    :goto_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method

.method public continueOnError(Z)Lcom/mongodb/WriteConcern;
    .locals 6
    .param p1, "continueOnError"    # Z

    .prologue
    .line 535
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 536
    new-instance v0, Lcom/mongodb/WriteConcern;

    iget-object v1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget v2, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    iget-boolean v3, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    iget-boolean v4, p0, Lcom/mongodb/WriteConcern;->_j:Z

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/WriteConcern;-><init>(IIZZZ)V

    .line 538
    :goto_0
    return-object v0

    .line 537
    :cond_0
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 538
    new-instance v0, Lcom/mongodb/WriteConcern;

    iget-object v1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget v2, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    iget-boolean v3, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    iget-boolean v4, p0, Lcom/mongodb/WriteConcern;->_j:Z

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/WriteConcern;-><init>(Ljava/lang/String;IZZZ)V

    goto :goto_0

    .line 540
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "The w parameter must be an int or a String"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public continueOnErrorForInsert(Z)Lcom/mongodb/WriteConcern;
    .locals 1
    .param p1, "continueOnErrorForInsert"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 563
    invoke-virtual {p0, p1}, Lcom/mongodb/WriteConcern;->continueOnError(Z)Lcom/mongodb/WriteConcern;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 494
    if-ne p0, p1, :cond_1

    .line 505
    :cond_0
    :goto_0
    return v1

    .line 495
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 497
    check-cast v0, Lcom/mongodb/WriteConcern;

    .line 499
    .local v0, "that":Lcom/mongodb/WriteConcern;
    iget-boolean v3, p0, Lcom/mongodb/WriteConcern;->_continueOnError:Z

    iget-boolean v4, v0, Lcom/mongodb/WriteConcern;->_continueOnError:Z

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 500
    :cond_4
    iget-boolean v3, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    iget-boolean v4, v0, Lcom/mongodb/WriteConcern;->_fsync:Z

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 501
    :cond_5
    iget-boolean v3, p0, Lcom/mongodb/WriteConcern;->_j:Z

    iget-boolean v4, v0, Lcom/mongodb/WriteConcern;->_j:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    goto :goto_0

    .line 502
    :cond_6
    iget v3, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    iget v4, v0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    if-eq v3, v4, :cond_7

    move v1, v2

    goto :goto_0

    .line 503
    :cond_7
    iget-object v3, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    iget-object v4, v0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public fsync()Z
    .locals 1

    .prologue
    .line 434
    iget-boolean v0, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    return v0
.end method

.method public getCommand()Lcom/mongodb/BasicDBObject;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 319
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "getlasterror"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 321
    .local v0, "command":Lcom/mongodb/BasicDBObject;
    iget-object v1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    instance-of v1, v1, Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-gt v1, v3, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    instance-of v1, v1, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 322
    :cond_1
    const-string/jumbo v1, "w"

    iget-object v2, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    :cond_2
    invoke-direct {p0, v0}, Lcom/mongodb/WriteConcern;->addWTimeout(Lcom/mongodb/BasicDBObject;)V

    .line 326
    invoke-direct {p0, v0}, Lcom/mongodb/WriteConcern;->addFSync(Lcom/mongodb/BasicDBObject;)V

    .line 327
    invoke-direct {p0, v0}, Lcom/mongodb/WriteConcern;->addJ(Lcom/mongodb/BasicDBObject;)V

    .line 329
    return-object v0
.end method

.method public getContinueOnError()Z
    .locals 1

    .prologue
    .line 549
    iget-boolean v0, p0, Lcom/mongodb/WriteConcern;->_continueOnError:Z

    return v0
.end method

.method public getContinueOnErrorForInsert()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 573
    invoke-virtual {p0}, Lcom/mongodb/WriteConcern;->getContinueOnError()Z

    move-result v0

    return v0
.end method

.method public getFsync()Z
    .locals 1

    .prologue
    .line 426
    iget-boolean v0, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    return v0
.end method

.method public getJ()Z
    .locals 1

    .prologue
    .line 523
    iget-boolean v0, p0, Lcom/mongodb/WriteConcern;->_j:Z

    return v0
.end method

.method public getW()I
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getWObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    return-object v0
.end method

.method public getWString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWtimeout()I
    .locals 1

    .prologue
    .line 418
    iget v0, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    return v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 510
    iget-object v1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 511
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v4, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    add-int v0, v1, v4

    .line 512
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v1, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    add-int v0, v4, v1

    .line 513
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v1, p0, Lcom/mongodb/WriteConcern;->_j:Z

    if-eqz v1, :cond_1

    move v1, v2

    :goto_1
    add-int v0, v4, v1

    .line 514
    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v4, p0, Lcom/mongodb/WriteConcern;->_continueOnError:Z

    if-eqz v4, :cond_2

    :goto_2
    add-int v0, v1, v2

    .line 515
    return v0

    :cond_0
    move v1, v3

    .line 512
    goto :goto_0

    :cond_1
    move v1, v3

    .line 513
    goto :goto_1

    :cond_2
    move v2, v3

    .line 514
    goto :goto_2
.end method

.method public raiseNetworkErrors()Z
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 445
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    .line 446
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ltz v0, :cond_0

    move v0, v1

    .line 447
    :goto_0
    return v0

    :cond_0
    move v0, v2

    .line 446
    goto :goto_0

    .line 447
    :cond_1
    iget-object v0, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    if-eqz v0, :cond_2

    :goto_1
    move v0, v1

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method

.method public setWObject(Ljava/lang/Object;)V
    .locals 2
    .param p1, "w"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 384
    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/lang/String;

    if-nez v0, :cond_0

    .line 385
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The w parameter must be an int or a String"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 386
    :cond_0
    iput-object p1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    .line 387
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 489
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "WriteConcern "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/WriteConcern;->getCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " / (Continue on error? "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/WriteConcern;->getContinueOnErrorForInsert()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method useServerDefault()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 337
    iget-object v1, p0, Lcom/mongodb/WriteConcern;->_w:Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/mongodb/WriteConcern;->_wtimeout:I

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/mongodb/WriteConcern;->_fsync:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/mongodb/WriteConcern;->_j:Z

    if-nez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
