.class public Lorg/apache/tools/tar/TarEntry;
.super Ljava/lang/Object;
.source "TarEntry.java"

# interfaces
.implements Lorg/apache/tools/tar/TarConstants;


# static fields
.field public static final DEFAULT_DIR_MODE:I = 0x41ed

.field public static final DEFAULT_FILE_MODE:I = 0x81a4

.field public static final MAX_NAMELEN:I = 0x1f

.field public static final MILLIS_PER_SECOND:I = 0x3e8


# instance fields
.field private devMajor:I

.field private devMinor:I

.field private file:Ljava/io/File;

.field private groupId:I

.field private groupName:Ljava/lang/StringBuffer;

.field private linkFlag:B

.field private linkName:Ljava/lang/StringBuffer;

.field private magic:Ljava/lang/StringBuffer;

.field private modTime:J

.field private mode:I

.field private name:Ljava/lang/StringBuffer;

.field private size:J

.field private userId:I

.field private userName:Ljava/lang/StringBuffer;


# direct methods
.method private constructor <init>()V
    .locals 5

    .prologue
    const/16 v4, 0x1f

    const/4 v3, 0x0

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v2, "ustar"

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->magic:Ljava/lang/StringBuffer;

    .line 139
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    .line 140
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->linkName:Ljava/lang/StringBuffer;

    .line 142
    const-string/jumbo v1, "user.name"

    const-string/jumbo v2, ""

    invoke-static {v1, v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "user":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v4, :cond_0

    .line 145
    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 148
    :cond_0
    iput v3, p0, Lorg/apache/tools/tar/TarEntry;->userId:I

    .line 149
    iput v3, p0, Lorg/apache/tools/tar/TarEntry;->groupId:I

    .line 150
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->userName:Ljava/lang/StringBuffer;

    .line 151
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->groupName:Ljava/lang/StringBuffer;

    .line 152
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    .line 153
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 7
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v6, 0x0

    .line 217
    invoke-direct {p0}, Lorg/apache/tools/tar/TarEntry;-><init>()V

    .line 219
    iput-object p1, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    .line 221
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v6}, Lorg/apache/tools/tar/TarEntry;->normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 222
    .local v0, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    const-string/jumbo v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/tar/TarEntry;->linkName:Ljava/lang/StringBuffer;

    .line 223
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    .line 225
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 226
    const/16 v2, 0x41ed

    iput v2, p0, Lorg/apache/tools/tar/TarEntry;->mode:I

    .line 227
    const/16 v2, 0x35

    iput-byte v2, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    .line 229
    iget-object v2, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    .line 230
    .local v1, "nameLength":I
    if-eqz v1, :cond_0

    iget-object v2, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v2

    const/16 v3, 0x2f

    if-eq v2, v3, :cond_1

    .line 231
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 233
    :cond_1
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->size:J

    .line 240
    .end local v1    # "nameLength":I
    :goto_0
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->modTime:J

    .line 241
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->devMajor:I

    .line 242
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->devMinor:I

    .line 243
    return-void

    .line 235
    :cond_2
    const v2, 0x81a4

    iput v2, p0, Lorg/apache/tools/tar/TarEntry;->mode:I

    .line 236
    const/16 v2, 0x30

    iput-byte v2, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    .line 237
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->size:J

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 162
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/tar/TarEntry;-><init>(Ljava/lang/String;Z)V

    .line 163
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;B)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "linkFlag"    # B

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lorg/apache/tools/tar/TarEntry;-><init>(Ljava/lang/String;)V

    .line 204
    iput-byte p2, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    .line 205
    const/16 v0, 0x4c

    if-ne p2, v0, :cond_0

    .line 206
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "ustar  "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/tar/TarEntry;->magic:Ljava/lang/StringBuffer;

    .line 208
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "preserveLeadingSlashes"    # Z

    .prologue
    const/4 v6, 0x0

    .line 174
    invoke-direct {p0}, Lorg/apache/tools/tar/TarEntry;-><init>()V

    .line 176
    invoke-static {p1, p2}, Lorg/apache/tools/tar/TarEntry;->normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 177
    const-string/jumbo v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    .line 179
    .local v0, "isDir":Z
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->devMajor:I

    .line 180
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->devMinor:I

    .line 181
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    .line 182
    if-eqz v0, :cond_0

    const/16 v1, 0x41ed

    :goto_0
    iput v1, p0, Lorg/apache/tools/tar/TarEntry;->mode:I

    .line 183
    if-eqz v0, :cond_1

    const/16 v1, 0x35

    :goto_1
    iput-byte v1, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    .line 184
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->userId:I

    .line 185
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->groupId:I

    .line 186
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->size:J

    .line 187
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->modTime:J

    .line 188
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->linkName:Ljava/lang/StringBuffer;

    .line 189
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->userName:Ljava/lang/StringBuffer;

    .line 190
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/tar/TarEntry;->groupName:Ljava/lang/StringBuffer;

    .line 191
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->devMajor:I

    .line 192
    iput v6, p0, Lorg/apache/tools/tar/TarEntry;->devMinor:I

    .line 194
    return-void

    .line 182
    :cond_0
    const v1, 0x81a4

    goto :goto_0

    .line 183
    :cond_1
    const/16 v1, 0x30

    goto :goto_1
.end method

.method public constructor <init>([B)V
    .locals 0
    .param p1, "headerBuf"    # [B

    .prologue
    .line 252
    invoke-direct {p0}, Lorg/apache/tools/tar/TarEntry;-><init>()V

    .line 253
    invoke-virtual {p0, p1}, Lorg/apache/tools/tar/TarEntry;->parseTarHeader([B)V

    .line 254
    return-void
.end method

.method private static normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 10
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "preserveLeadingSlashes"    # Z

    .prologue
    const/16 v9, 0x3a

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, -0x1

    .line 628
    const-string/jumbo v4, "os.name"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 630
    .local v3, "osname":Ljava/lang/String;
    if-eqz v3, :cond_2

    .line 635
    const-string/jumbo v4, "windows"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 636
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v8, :cond_2

    .line 637
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 638
    .local v0, "ch1":C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 640
    .local v1, "ch2":C
    if-ne v1, v9, :cond_2

    const/16 v4, 0x61

    if-lt v0, v4, :cond_0

    const/16 v4, 0x7a

    if-le v0, v4, :cond_1

    :cond_0
    const/16 v4, 0x41

    if-lt v0, v4, :cond_2

    const/16 v4, 0x5a

    if-gt v0, v4, :cond_2

    .line 643
    :cond_1
    invoke-virtual {p0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 654
    .end local v0    # "ch1":C
    .end local v1    # "ch2":C
    :cond_2
    :goto_0
    sget-char v4, Ljava/io/File;->separatorChar:C

    const/16 v5, 0x2f

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 659
    :goto_1
    if-nez p1, :cond_4

    const-string/jumbo v4, "/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 660
    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 646
    :cond_3
    const-string/jumbo v4, "netware"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-le v4, v6, :cond_2

    .line 647
    invoke-virtual {p0, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 648
    .local v2, "colon":I
    if-eq v2, v6, :cond_2

    .line 649
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 662
    .end local v2    # "colon":I
    :cond_4
    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "it"    # Ljava/lang/Object;

    .prologue
    .line 275
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 276
    :cond_0
    const/4 v0, 0x0

    .line 278
    .end local p1    # "it":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p1    # "it":Ljava/lang/Object;
    :cond_1
    check-cast p1, Lorg/apache/tools/tar/TarEntry;

    .end local p1    # "it":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/tools/tar/TarEntry;->equals(Lorg/apache/tools/tar/TarEntry;)Z

    move-result v0

    goto :goto_0
.end method

.method public equals(Lorg/apache/tools/tar/TarEntry;)Z
    .locals 2
    .param p1, "it"    # Lorg/apache/tools/tar/TarEntry;

    .prologue
    .line 264
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getDirectoryEntries()[Lorg/apache/tools/tar/TarEntry;
    .locals 7

    .prologue
    .line 535
    iget-object v3, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_2

    .line 536
    :cond_0
    const/4 v3, 0x0

    new-array v2, v3, [Lorg/apache/tools/tar/TarEntry;

    .line 546
    :cond_1
    return-object v2

    .line 539
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 540
    .local v1, "list":[Ljava/lang/String;
    array-length v3, v1

    new-array v2, v3, [Lorg/apache/tools/tar/TarEntry;

    .line 542
    .local v2, "result":[Lorg/apache/tools/tar/TarEntry;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_1

    .line 543
    new-instance v3, Lorg/apache/tools/tar/TarEntry;

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    aget-object v6, v1, v0

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lorg/apache/tools/tar/TarEntry;-><init>(Ljava/io/File;)V

    aput-object v3, v2, v0

    .line 542
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 466
    iget-object v0, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    return-object v0
.end method

.method public getGroupId()I
    .locals 1

    .prologue
    .line 362
    iget v0, p0, Lorg/apache/tools/tar/TarEntry;->groupId:I

    return v0
.end method

.method public getGroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lorg/apache/tools/tar/TarEntry;->groupName:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLinkName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lorg/apache/tools/tar/TarEntry;->linkName:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModTime()Ljava/util/Date;
    .locals 6

    .prologue
    .line 457
    new-instance v0, Ljava/util/Date;

    iget-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->modTime:J

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .prologue
    .line 475
    iget v0, p0, Lorg/apache/tools/tar/TarEntry;->mode:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 308
    iget-object v0, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 484
    iget-wide v0, p0, Lorg/apache/tools/tar/TarEntry;->size:J

    return-wide v0
.end method

.method public getUserId()I
    .locals 1

    .prologue
    .line 344
    iget v0, p0, Lorg/apache/tools/tar/TarEntry;->userId:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 380
    iget-object v0, p0, Lorg/apache/tools/tar/TarEntry;->userName:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 287
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isDescendent(Lorg/apache/tools/tar/TarEntry;)Z
    .locals 2
    .param p1, "desc"    # Lorg/apache/tools/tar/TarEntry;

    .prologue
    .line 299
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isDirectory()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 513
    iget-object v1, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    if-eqz v1, :cond_1

    .line 514
    iget-object v0, p0, Lorg/apache/tools/tar/TarEntry;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    .line 525
    :cond_0
    :goto_0
    return v0

    .line 517
    :cond_1
    iget-byte v1, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    const/16 v2, 0x35

    if-eq v1, v2, :cond_0

    .line 521
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 525
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isGNULongNameEntry()Z
    .locals 2

    .prologue
    .line 503
    iget-byte v0, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    const/16 v1, 0x4c

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "././@LongLink"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public parseTarHeader([B)V
    .locals 8
    .param p1, "header"    # [B

    .prologue
    const/16 v7, 0x64

    const/16 v6, 0x20

    const/16 v5, 0xc

    const/16 v4, 0x8

    .line 593
    const/4 v0, 0x0

    .line 595
    .local v0, "offset":I
    invoke-static {p1, v0, v7}, Lorg/apache/tools/tar/TarUtils;->parseName([BII)Ljava/lang/StringBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    .line 596
    add-int/lit8 v0, v0, 0x64

    .line 597
    invoke-static {p1, v0, v4}, Lorg/apache/tools/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lorg/apache/tools/tar/TarEntry;->mode:I

    .line 598
    add-int/lit8 v0, v0, 0x8

    .line 599
    invoke-static {p1, v0, v4}, Lorg/apache/tools/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lorg/apache/tools/tar/TarEntry;->userId:I

    .line 600
    add-int/lit8 v0, v0, 0x8

    .line 601
    invoke-static {p1, v0, v4}, Lorg/apache/tools/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lorg/apache/tools/tar/TarEntry;->groupId:I

    .line 602
    add-int/lit8 v0, v0, 0x8

    .line 603
    invoke-static {p1, v0, v5}, Lorg/apache/tools/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->size:J

    .line 604
    add-int/lit8 v0, v0, 0xc

    .line 605
    invoke-static {p1, v0, v5}, Lorg/apache/tools/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/tar/TarEntry;->modTime:J

    .line 606
    add-int/lit8 v0, v0, 0xc

    .line 607
    add-int/lit8 v0, v0, 0x8

    .line 608
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "offset":I
    .local v1, "offset":I
    aget-byte v2, p1, v0

    iput-byte v2, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    .line 609
    invoke-static {p1, v1, v7}, Lorg/apache/tools/tar/TarUtils;->parseName([BII)Ljava/lang/StringBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/tar/TarEntry;->linkName:Ljava/lang/StringBuffer;

    .line 610
    add-int/lit8 v0, v1, 0x64

    .line 611
    .end local v1    # "offset":I
    .restart local v0    # "offset":I
    invoke-static {p1, v0, v4}, Lorg/apache/tools/tar/TarUtils;->parseName([BII)Ljava/lang/StringBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/tar/TarEntry;->magic:Ljava/lang/StringBuffer;

    .line 612
    add-int/lit8 v0, v0, 0x8

    .line 613
    invoke-static {p1, v0, v6}, Lorg/apache/tools/tar/TarUtils;->parseName([BII)Ljava/lang/StringBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/tar/TarEntry;->userName:Ljava/lang/StringBuffer;

    .line 614
    add-int/lit8 v0, v0, 0x20

    .line 615
    invoke-static {p1, v0, v6}, Lorg/apache/tools/tar/TarUtils;->parseName([BII)Ljava/lang/StringBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/tar/TarEntry;->groupName:Ljava/lang/StringBuffer;

    .line 616
    add-int/lit8 v0, v0, 0x20

    .line 617
    invoke-static {p1, v0, v4}, Lorg/apache/tools/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lorg/apache/tools/tar/TarEntry;->devMajor:I

    .line 618
    add-int/lit8 v0, v0, 0x8

    .line 619
    invoke-static {p1, v0, v4}, Lorg/apache/tools/tar/TarUtils;->parseOctal([BII)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lorg/apache/tools/tar/TarEntry;->devMinor:I

    .line 620
    return-void
.end method

.method public setGroupId(I)V
    .locals 0
    .param p1, "groupId"    # I

    .prologue
    .line 371
    iput p1, p0, Lorg/apache/tools/tar/TarEntry;->groupId:I

    .line 372
    return-void
.end method

.method public setGroupName(Ljava/lang/String;)V
    .locals 1
    .param p1, "groupName"    # Ljava/lang/String;

    .prologue
    .line 407
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/tar/TarEntry;->groupName:Ljava/lang/StringBuffer;

    .line 408
    return-void
.end method

.method public setIds(II)V
    .locals 0
    .param p1, "userId"    # I
    .param p2, "groupId"    # I

    .prologue
    .line 417
    invoke-virtual {p0, p1}, Lorg/apache/tools/tar/TarEntry;->setUserId(I)V

    .line 418
    invoke-virtual {p0, p2}, Lorg/apache/tools/tar/TarEntry;->setGroupId(I)V

    .line 419
    return-void
.end method

.method public setModTime(J)V
    .locals 3
    .param p1, "time"    # J

    .prologue
    .line 439
    const-wide/16 v0, 0x3e8

    div-long v0, p1, v0

    iput-wide v0, p0, Lorg/apache/tools/tar/TarEntry;->modTime:J

    .line 440
    return-void
.end method

.method public setModTime(Ljava/util/Date;)V
    .locals 4
    .param p1, "time"    # Ljava/util/Date;

    .prologue
    .line 448
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/tools/tar/TarEntry;->modTime:J

    .line 449
    return-void
.end method

.method public setMode(I)V
    .locals 0
    .param p1, "mode"    # I

    .prologue
    .line 326
    iput p1, p0, Lorg/apache/tools/tar/TarEntry;->mode:I

    .line 327
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 317
    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lorg/apache/tools/tar/TarEntry;->normalizeFileName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    .line 318
    return-void
.end method

.method public setNames(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;

    .prologue
    .line 428
    invoke-virtual {p0, p1}, Lorg/apache/tools/tar/TarEntry;->setUserName(Ljava/lang/String;)V

    .line 429
    invoke-virtual {p0, p2}, Lorg/apache/tools/tar/TarEntry;->setGroupName(Ljava/lang/String;)V

    .line 430
    return-void
.end method

.method public setSize(J)V
    .locals 1
    .param p1, "size"    # J

    .prologue
    .line 493
    iput-wide p1, p0, Lorg/apache/tools/tar/TarEntry;->size:J

    .line 494
    return-void
.end method

.method public setUserId(I)V
    .locals 0
    .param p1, "userId"    # I

    .prologue
    .line 353
    iput p1, p0, Lorg/apache/tools/tar/TarEntry;->userId:I

    .line 354
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 1
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 389
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/tar/TarEntry;->userName:Ljava/lang/StringBuffer;

    .line 390
    return-void
.end method

.method public writeEntryHeader([B)V
    .locals 12
    .param p1, "outbuf"    # [B

    .prologue
    const/16 v11, 0x64

    const/16 v10, 0xc

    const/16 v9, 0x20

    const/16 v8, 0x8

    .line 555
    const/4 v4, 0x0

    .line 557
    .local v4, "offset":I
    iget-object v6, p0, Lorg/apache/tools/tar/TarEntry;->name:Ljava/lang/StringBuffer;

    invoke-static {v6, p1, v4, v11}, Lorg/apache/tools/tar/TarUtils;->getNameBytes(Ljava/lang/StringBuffer;[BII)I

    move-result v4

    .line 558
    iget v6, p0, Lorg/apache/tools/tar/TarEntry;->mode:I

    int-to-long v6, v6

    invoke-static {v6, v7, p1, v4, v8}, Lorg/apache/tools/tar/TarUtils;->getOctalBytes(J[BII)I

    move-result v4

    .line 559
    iget v6, p0, Lorg/apache/tools/tar/TarEntry;->userId:I

    int-to-long v6, v6

    invoke-static {v6, v7, p1, v4, v8}, Lorg/apache/tools/tar/TarUtils;->getOctalBytes(J[BII)I

    move-result v4

    .line 560
    iget v6, p0, Lorg/apache/tools/tar/TarEntry;->groupId:I

    int-to-long v6, v6

    invoke-static {v6, v7, p1, v4, v8}, Lorg/apache/tools/tar/TarUtils;->getOctalBytes(J[BII)I

    move-result v4

    .line 561
    iget-wide v6, p0, Lorg/apache/tools/tar/TarEntry;->size:J

    invoke-static {v6, v7, p1, v4, v10}, Lorg/apache/tools/tar/TarUtils;->getLongOctalBytes(J[BII)I

    move-result v4

    .line 562
    iget-wide v6, p0, Lorg/apache/tools/tar/TarEntry;->modTime:J

    invoke-static {v6, v7, p1, v4, v10}, Lorg/apache/tools/tar/TarUtils;->getLongOctalBytes(J[BII)I

    move-result v4

    .line 564
    move v1, v4

    .line 566
    .local v1, "csOffset":I
    const/4 v0, 0x0

    .local v0, "c":I
    move v5, v4

    .end local v4    # "offset":I
    .local v5, "offset":I
    :goto_0
    if-ge v0, v8, :cond_0

    .line 567
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "offset":I
    .restart local v4    # "offset":I
    aput-byte v9, p1, v5

    .line 566
    add-int/lit8 v0, v0, 0x1

    move v5, v4

    .end local v4    # "offset":I
    .restart local v5    # "offset":I
    goto :goto_0

    .line 570
    :cond_0
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "offset":I
    .restart local v4    # "offset":I
    iget-byte v6, p0, Lorg/apache/tools/tar/TarEntry;->linkFlag:B

    aput-byte v6, p1, v5

    .line 571
    iget-object v6, p0, Lorg/apache/tools/tar/TarEntry;->linkName:Ljava/lang/StringBuffer;

    invoke-static {v6, p1, v4, v11}, Lorg/apache/tools/tar/TarUtils;->getNameBytes(Ljava/lang/StringBuffer;[BII)I

    move-result v4

    .line 572
    iget-object v6, p0, Lorg/apache/tools/tar/TarEntry;->magic:Ljava/lang/StringBuffer;

    invoke-static {v6, p1, v4, v8}, Lorg/apache/tools/tar/TarUtils;->getNameBytes(Ljava/lang/StringBuffer;[BII)I

    move-result v4

    .line 573
    iget-object v6, p0, Lorg/apache/tools/tar/TarEntry;->userName:Ljava/lang/StringBuffer;

    invoke-static {v6, p1, v4, v9}, Lorg/apache/tools/tar/TarUtils;->getNameBytes(Ljava/lang/StringBuffer;[BII)I

    move-result v4

    .line 574
    iget-object v6, p0, Lorg/apache/tools/tar/TarEntry;->groupName:Ljava/lang/StringBuffer;

    invoke-static {v6, p1, v4, v9}, Lorg/apache/tools/tar/TarUtils;->getNameBytes(Ljava/lang/StringBuffer;[BII)I

    move-result v4

    .line 575
    iget v6, p0, Lorg/apache/tools/tar/TarEntry;->devMajor:I

    int-to-long v6, v6

    invoke-static {v6, v7, p1, v4, v8}, Lorg/apache/tools/tar/TarUtils;->getOctalBytes(J[BII)I

    move-result v4

    .line 576
    iget v6, p0, Lorg/apache/tools/tar/TarEntry;->devMinor:I

    int-to-long v6, v6

    invoke-static {v6, v7, p1, v4, v8}, Lorg/apache/tools/tar/TarUtils;->getOctalBytes(J[BII)I

    move-result v4

    .line 578
    :goto_1
    array-length v6, p1

    if-ge v4, v6, :cond_1

    .line 579
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "offset":I
    .restart local v5    # "offset":I
    const/4 v6, 0x0

    aput-byte v6, p1, v4

    move v4, v5

    .end local v5    # "offset":I
    .restart local v4    # "offset":I
    goto :goto_1

    .line 582
    :cond_1
    invoke-static {p1}, Lorg/apache/tools/tar/TarUtils;->computeCheckSum([B)J

    move-result-wide v2

    .line 584
    .local v2, "chk":J
    invoke-static {v2, v3, p1, v1, v8}, Lorg/apache/tools/tar/TarUtils;->getCheckSumOctalBytes(J[BII)I

    .line 585
    return-void
.end method
