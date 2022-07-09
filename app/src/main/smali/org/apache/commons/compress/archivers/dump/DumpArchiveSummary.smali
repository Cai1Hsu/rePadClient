.class public Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;
.super Ljava/lang/Object;
.source "DumpArchiveSummary.java"


# instance fields
.field private devname:Ljava/lang/String;

.field private dumpDate:J

.field private filesys:Ljava/lang/String;

.field private firstrec:I

.field private flags:I

.field private hostname:Ljava/lang/String;

.field private label:Ljava/lang/String;

.field private level:I

.field private ntrec:I

.field private previousDumpDate:J

.field private volume:I


# direct methods
.method constructor <init>([B)V
    .locals 6
    .param p1, "buffer"    # [B

    .prologue
    const-wide/16 v4, 0x3e8

    const/16 v3, 0x40

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr v0, v4

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    .line 46
    const/16 v0, 0x8

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr v0, v4

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->previousDumpDate:J

    .line 47
    const/16 v0, 0xc

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->volume:I

    .line 48
    new-instance v0, Ljava/lang/String;

    const/16 v1, 0x2a4

    const/16 v2, 0x10

    invoke-direct {v0, p1, v1, v2}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    .line 49
    const/16 v0, 0x2b4

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->level:I

    .line 50
    new-instance v0, Ljava/lang/String;

    const/16 v1, 0x2b8

    invoke-direct {v0, p1, v1, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->filesys:Ljava/lang/String;

    .line 51
    new-instance v0, Ljava/lang/String;

    const/16 v1, 0x2f8

    invoke-direct {v0, p1, v1, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    .line 52
    new-instance v0, Ljava/lang/String;

    const/16 v1, 0x338

    invoke-direct {v0, p1, v1, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    .line 53
    const/16 v0, 0x378

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    .line 54
    const/16 v0, 0x37c

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->firstrec:I

    .line 55
    const/16 v0, 0x380

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->ntrec:I

    .line 58
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 308
    if-ne p0, p1, :cond_1

    .line 331
    :cond_0
    :goto_0
    return v1

    .line 312
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

    .line 313
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 316
    check-cast v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 318
    .local v0, "rhs":Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;
    iget-wide v4, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    iget-wide v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_4

    move v1, v2

    .line 319
    goto :goto_0

    .line 322
    :cond_4
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getHostname()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getHostname()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getHostname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_5
    move v1, v2

    .line 324
    goto :goto_0

    .line 327
    :cond_6
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getDevname()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getDevname()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getDevname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_7
    move v1, v2

    .line 328
    goto :goto_0
.end method

.method public getDevname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    return-object v0
.end method

.method public getDumpDate()Ljava/util/Date;
    .locals 4

    .prologue
    .line 65
    new-instance v0, Ljava/util/Date;

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getFilesystem()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->filesys:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstRecord()I
    .locals 1

    .prologue
    .line 208
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->firstrec:I

    return v0
.end method

.method public getFlags()I
    .locals 1

    .prologue
    .line 192
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    return v0
.end method

.method public getHostname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    return-object v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 114
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->level:I

    return v0
.end method

.method public getNTRec()I
    .locals 1

    .prologue
    .line 225
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->ntrec:I

    return v0
.end method

.method public getPreviousDumpDate()Ljava/util/Date;
    .locals 4

    .prologue
    .line 80
    new-instance v0, Ljava/util/Date;

    iget-wide v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->previousDumpDate:J

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getVolume()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->volume:I

    return v0
.end method

.method public hashCode()I
    .locals 8

    .prologue
    .line 284
    const/16 v0, 0x11

    .line 286
    .local v0, "hash":I
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 287
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 290
    :cond_0
    int-to-long v2, v0

    const-wide/16 v4, 0x1f

    iget-wide v6, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    long-to-int v0, v2

    .line 292
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 293
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/lit8 v0, v1, 0x11

    .line 296
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 297
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/lit8 v0, v1, 0x11

    .line 300
    :cond_2
    return v0
.end method

.method public isCompressed()Z
    .locals 2

    .prologue
    .line 260
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isExtendedAttributes()Z
    .locals 2

    .prologue
    const v1, 0x8000

    .line 276
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMetaDataOnly()Z
    .locals 2

    .prologue
    .line 268
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNewHeader()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 242
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNewInode()Z
    .locals 2

    .prologue
    .line 251
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDevname(Ljava/lang/String;)V
    .locals 0
    .param p1, "devname"    # Ljava/lang/String;

    .prologue
    .line 169
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setDumpDate(Ljava/util/Date;)V
    .locals 2
    .param p1, "dumpDate"    # Ljava/util/Date;

    .prologue
    .line 72
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    .line 73
    return-void
.end method

.method public setFilesystem(Ljava/lang/String;)V
    .locals 0
    .param p1, "filesystem"    # Ljava/lang/String;

    .prologue
    .line 153
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->filesys:Ljava/lang/String;

    .line 154
    return-void
.end method

.method public setFirstRecord(I)V
    .locals 0
    .param p1, "firstrec"    # I

    .prologue
    .line 216
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->firstrec:I

    .line 217
    return-void
.end method

.method public setFlags(I)V
    .locals 0
    .param p1, "flags"    # I

    .prologue
    .line 200
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    .line 201
    return-void
.end method

.method public setHostname(Ljava/lang/String;)V
    .locals 0
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 184
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    .line 185
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 138
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 121
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->level:I

    .line 122
    return-void
.end method

.method public setNTRec(I)V
    .locals 0
    .param p1, "ntrec"    # I

    .prologue
    .line 232
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->ntrec:I

    .line 233
    return-void
.end method

.method public setPreviousDumpDate(Ljava/util/Date;)V
    .locals 2
    .param p1, "previousDumpDate"    # Ljava/util/Date;

    .prologue
    .line 87
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->previousDumpDate:J

    .line 88
    return-void
.end method

.method public setVolume(I)V
    .locals 0
    .param p1, "volume"    # I

    .prologue
    .line 102
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->volume:I

    .line 103
    return-void
.end method
