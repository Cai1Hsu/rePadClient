.class public Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
.super Ljava/lang/Object;
.source "DumpArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;,
        Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;,
        Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    }
.end annotation


# instance fields
.field private atime:J

.field private ctime:J

.field private generation:I

.field private gid:I

.field private header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

.field private ino:I

.field private isDeleted:Z

.field private mode:I

.field private mtime:J

.field private name:Ljava/lang/String;

.field private nlink:I

.field private offset:J

.field private originalName:Ljava/lang/String;

.field private permissions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;",
            ">;"
        }
    .end annotation
.end field

.field private simpleName:Ljava/lang/String;

.field private size:J

.field private summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

.field private type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

.field private uid:I

.field private volume:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    sget-object v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->UNKNOWN:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 183
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 193
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 196
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 213
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "simpleName"    # Ljava/lang/String;

    .prologue
    .line 220
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    sget-object v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->UNKNOWN:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 183
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 193
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 196
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 221
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 222
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    .line 223
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;ILorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "simpleName"    # Ljava/lang/String;
    .param p3, "ino"    # I
    .param p4, "type"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .prologue
    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    sget-object v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->UNKNOWN:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 183
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 193
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 196
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 235
    invoke-virtual {p0, p4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setType(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V

    .line 236
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 237
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    .line 238
    iput p3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    .line 239
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->offset:J

    .line 240
    return-void
.end method

.method static parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .locals 14
    .param p0, "buffer"    # [B

    .prologue
    const/16 v11, 0x200

    const-wide/16 v12, 0x3e8

    const/4 v10, 0x0

    .line 435
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;-><init>()V

    .line 436
    .local v0, "entry":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    iget-object v1, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 438
    .local v1, "header":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    invoke-static {p0, v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-static {v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->find(I)Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v6

    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$002(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;)Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    .line 444
    const/16 v6, 0xc

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$102(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 446
    const/16 v6, 0x14

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$202(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    .line 450
    const/16 v6, 0x20

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert16([BI)I

    move-result v3

    .line 453
    .local v3, "m":I
    shr-int/lit8 v6, v3, 0xc

    and-int/lit8 v6, v6, 0xf

    invoke-static {v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->find(I)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setType(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V

    .line 456
    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setMode(I)V

    .line 458
    const/16 v6, 0x22

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert16([BI)I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->nlink:I

    .line 460
    const/16 v6, 0x28

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert64([BI)J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setSize(J)V

    .line 462
    const/16 v6, 0x30

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v12

    const/16 v8, 0x34

    invoke-static {p0, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v8

    div-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    add-long v4, v6, v8

    .line 464
    .local v4, "t":J
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setAccessTime(Ljava/util/Date;)V

    .line 465
    const/16 v6, 0x38

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v12

    const/16 v8, 0x3c

    invoke-static {p0, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v8

    div-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    add-long v4, v6, v8

    .line 467
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setLastModifiedDate(Ljava/util/Date;)V

    .line 468
    const/16 v6, 0x40

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v12

    const/16 v8, 0x44

    invoke-static {p0, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v8

    div-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    add-long v4, v6, v8

    .line 470
    iput-wide v4, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ctime:J

    .line 476
    const/16 v6, 0x8c

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->generation:I

    .line 477
    const/16 v6, 0x90

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setUserId(I)V

    .line 478
    const/16 v6, 0x94

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setGroupId(I)V

    .line 480
    const/16 v6, 0xa0

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$302(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 482
    invoke-static {v1, v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$402(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 484
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v11, :cond_1

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$300(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 485
    add-int/lit16 v6, v2, 0xa4

    aget-byte v6, p0, v6

    if-nez v6, :cond_0

    .line 486
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$408(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    .line 484
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 490
    :cond_1
    const/16 v6, 0xa4

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$500(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)[B

    move-result-object v7

    invoke-static {p0, v6, v7, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 492
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getVolume()I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->volume:I

    .line 495
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 395
    if-ne p1, p0, :cond_1

    .line 416
    :cond_0
    :goto_0
    return v1

    .line 397
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    :cond_2
    move v1, v2

    .line 398
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 401
    check-cast v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 403
    .local v0, "rhs":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    if-eqz v3, :cond_4

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    if-nez v3, :cond_5

    :cond_4
    move v1, v2

    .line 404
    goto :goto_0

    .line 407
    :cond_5
    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    iget v4, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 408
    goto :goto_0

    .line 411
    :cond_6
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    if-nez v3, :cond_7

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    if-nez v3, :cond_8

    :cond_7
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    iget-object v4, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    invoke-virtual {v3, v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_8
    move v1, v2

    .line 413
    goto :goto_0
.end method

.method public getAccessTime()Ljava/util/Date;
    .locals 4

    .prologue
    .line 704
    new-instance v0, Ljava/util/Date;

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->atime:J

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getCreationTime()Ljava/util/Date;
    .locals 4

    .prologue
    .line 288
    new-instance v0, Ljava/util/Date;

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ctime:J

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method getEntrySize()J
    .locals 2

    .prologue
    .line 683
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->size:J

    return-wide v0
.end method

.method public getGeneration()I
    .locals 1

    .prologue
    .line 302
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->generation:I

    return v0
.end method

.method public getGroupId()I
    .locals 1

    .prologue
    .line 732
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->gid:I

    return v0
.end method

.method public getHeaderCount()I
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getCount()I

    move-result v0

    return v0
.end method

.method public getHeaderHoles()I
    .locals 1

    .prologue
    .line 372
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getHoles()I

    move-result v0

    return v0
.end method

.method public getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v0

    return-object v0
.end method

.method public getIno()I
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getIno()I

    move-result v0

    return v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .locals 4

    .prologue
    .line 591
    new-instance v0, Ljava/util/Date;

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mtime:J

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .prologue
    .line 654
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mode:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 562
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNlink()I
    .locals 1

    .prologue
    .line 274
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->nlink:I

    return v0
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 330
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->offset:J

    return-wide v0
.end method

.method getOriginalName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 570
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->originalName:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissions()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;",
            ">;"
        }
    .end annotation

    .prologue
    .line 669
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    return-object v0
.end method

.method public getSimpleName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 676
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->size:J

    goto :goto_0
.end method

.method public getType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;
    .locals 1

    .prologue
    .line 640
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    return-object v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 718
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->uid:I

    return v0
.end method

.method public getVolume()I
    .locals 1

    .prologue
    .line 344
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->volume:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 387
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    return v0
.end method

.method public isBlkDev()Z
    .locals 2

    .prologue
    .line 626
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->BLKDEV:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isChrDev()Z
    .locals 2

    .prologue
    .line 619
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->CHRDEV:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDeleted()Z
    .locals 1

    .prologue
    .line 316
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDeleted:Z

    return v0
.end method

.method public isDirectory()Z
    .locals 2

    .prologue
    .line 598
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->DIRECTORY:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFifo()Z
    .locals 2

    .prologue
    .line 633
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->FIFO:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFile()Z
    .locals 2

    .prologue
    .line 605
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->FILE:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSocket()Z
    .locals 2

    .prologue
    .line 612
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->SOCKET:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSparseRecord(I)Z
    .locals 1
    .param p1, "idx"    # I

    .prologue
    .line 379
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0, p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getCdata(I)I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAccessTime(Ljava/util/Date;)V
    .locals 2
    .param p1, "atime"    # Ljava/util/Date;

    .prologue
    .line 711
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->atime:J

    .line 712
    return-void
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .locals 2
    .param p1, "ctime"    # Ljava/util/Date;

    .prologue
    .line 295
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ctime:J

    .line 296
    return-void
.end method

.method public setDeleted(Z)V
    .locals 0
    .param p1, "isDeleted"    # Z

    .prologue
    .line 323
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDeleted:Z

    .line 324
    return-void
.end method

.method public setGeneration(I)V
    .locals 0
    .param p1, "generation"    # I

    .prologue
    .line 309
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->generation:I

    .line 310
    return-void
.end method

.method public setGroupId(I)V
    .locals 0
    .param p1, "gid"    # I

    .prologue
    .line 739
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->gid:I

    .line 740
    return-void
.end method

.method public setLastModifiedDate(Ljava/util/Date;)V
    .locals 2
    .param p1, "mtime"    # Ljava/util/Date;

    .prologue
    .line 697
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mtime:J

    .line 698
    return-void
.end method

.method public setMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 661
    and-int/lit16 v0, p1, 0xfff

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mode:I

    .line 662
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;->find(I)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 663
    return-void
.end method

.method public final setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 577
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->originalName:Ljava/lang/String;

    .line 578
    if-eqz p1, :cond_1

    .line 579
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 580
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 582
    :cond_0
    const-string/jumbo v0, "./"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 583
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 586
    :cond_1
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->name:Ljava/lang/String;

    .line 587
    return-void
.end method

.method public setNlink(I)V
    .locals 0
    .param p1, "nlink"    # I

    .prologue
    .line 281
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->nlink:I

    .line 282
    return-void
.end method

.method public setOffset(J)V
    .locals 1
    .param p1, "offset"    # J

    .prologue
    .line 337
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->offset:J

    .line 338
    return-void
.end method

.method protected setSimpleName(Ljava/lang/String;)V
    .locals 0
    .param p1, "simpleName"    # Ljava/lang/String;

    .prologue
    .line 260
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    .line 261
    return-void
.end method

.method public setSize(J)V
    .locals 1
    .param p1, "size"    # J

    .prologue
    .line 690
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->size:J

    .line 691
    return-void
.end method

.method public setType(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V
    .locals 0
    .param p1, "type"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .prologue
    .line 647
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 648
    return-void
.end method

.method public setUserId(I)V
    .locals 0
    .param p1, "uid"    # I

    .prologue
    .line 725
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->uid:I

    .line 726
    return-void
.end method

.method public setVolume(I)V
    .locals 0
    .param p1, "volume"    # I

    .prologue
    .line 351
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->volume:I

    .line 352
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 424
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method update([B)V
    .locals 5
    .param p1, "buffer"    # [B

    .prologue
    const/16 v4, 0x200

    const/4 v3, 0x0

    .line 502
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    const/16 v2, 0x10

    invoke-static {p1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v2

    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$102(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 503
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    const/16 v2, 0xa0

    invoke-static {p1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v2

    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$302(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 505
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-static {v1, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$402(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 507
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_1

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$300(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 508
    add-int/lit16 v1, v0, 0xa4

    aget-byte v1, p1, v1

    if-nez v1, :cond_0

    .line 509
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$408(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    .line 507
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 513
    :cond_1
    const/16 v1, 0xa4

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-static {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$500(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)[B

    move-result-object v2

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 514
    return-void
.end method
