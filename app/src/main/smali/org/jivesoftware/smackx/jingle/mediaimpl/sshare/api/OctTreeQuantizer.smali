.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;
.super Ljava/lang/Object;
.source "OctTreeQuantizer.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/Quantizer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field static final MAX_LEVEL:I = 0x5


# instance fields
.field private colorList:[Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/Vector",
            "<",
            "Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;",
            ">;"
        }
    .end annotation
.end field

.field private colors:I

.field private maximumColors:I

.field private nodes:I

.field private reduceColors:I

.field private root:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x6

    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->nodes:I

    .line 74
    iput v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    .line 78
    const/16 v1, 0x100

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->setup(I)V

    .line 79
    new-array v1, v3, [Ljava/util/Vector;

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colorList:[Ljava/util/Vector;

    .line 80
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 81
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colorList:[Ljava/util/Vector;

    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    aput-object v2, v1, v0

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 82
    :cond_0
    new-instance v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->root:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    .line 83
    return-void
.end method

.method static synthetic access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-object v0
.end method

.method private buildColorTable(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;[II)I
    .locals 5
    .param p1, "node"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .param p2, "table"    # [I
    .param p3, "index"    # I

    .prologue
    .line 265
    iget v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->maximumColors:I

    if-le v3, v4, :cond_0

    .line 266
    iget v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->maximumColors:I

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceTree(I)V

    .line 268
    :cond_0
    iget-boolean v3, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->isLeaf:Z

    if-eqz v3, :cond_2

    .line 269
    iget v0, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    .line 270
    .local v0, "count":I
    const/high16 v3, -0x1000000

    iget v4, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    div-int/2addr v4, v0

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v3, v4

    iget v4, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    div-int/2addr v4, v0

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    iget v4, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    div-int/2addr v4, v0

    or-int/2addr v3, v4

    aput v3, p2, p3

    .line 274
    add-int/lit8 v2, p3, 0x1

    .end local p3    # "index":I
    .local v2, "index":I
    iput p3, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->index:I

    move p3, v2

    .line 283
    .end local v0    # "count":I
    .end local v2    # "index":I
    .restart local p3    # "index":I
    :cond_1
    return p3

    .line 276
    :cond_2
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v3, 0x8

    if-ge v1, v3, :cond_1

    .line 277
    iget-object v3, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aget-object v3, v3, v1

    if-eqz v3, :cond_3

    .line 278
    iput p3, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->index:I

    .line 279
    iget-object v3, p1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aget-object v3, v3, v1

    invoke-direct {p0, v3, p2, p3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->buildColorTable(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;[II)I

    move-result p3

    .line 276
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private insertColor(I)V
    .locals 11
    .param p1, "rgb"    # I

    .prologue
    const/4 v10, 0x5

    const/4 v9, 0x1

    .line 146
    shr-int/lit8 v8, p1, 0x10

    and-int/lit16 v7, v8, 0xff

    .line 147
    .local v7, "red":I
    shr-int/lit8 v8, p1, 0x8

    and-int/lit16 v3, v8, 0xff

    .line 148
    .local v3, "green":I
    and-int/lit16 v1, p1, 0xff

    .line 150
    .local v1, "blue":I
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->root:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    .line 153
    .local v6, "node":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    const/4 v5, 0x0

    .local v5, "level":I
    :goto_0
    if-gt v5, v10, :cond_6

    .line 155
    const/16 v8, 0x80

    shr-int v0, v8, v5

    .line 157
    .local v0, "bit":I
    const/4 v4, 0x0

    .line 158
    .local v4, "index":I
    and-int v8, v7, v0

    if-eqz v8, :cond_0

    .line 159
    add-int/lit8 v4, v4, 0x4

    .line 160
    :cond_0
    and-int v8, v3, v0

    if-eqz v8, :cond_1

    .line 161
    add-int/lit8 v4, v4, 0x2

    .line 162
    :cond_1
    and-int v8, v1, v0

    if-eqz v8, :cond_2

    .line 163
    add-int/lit8 v4, v4, 0x1

    .line 165
    :cond_2
    iget-object v8, v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aget-object v2, v8, v4

    .line 167
    .local v2, "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    if-nez v2, :cond_4

    .line 168
    iget v8, v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->children:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->children:I

    .line 170
    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    .end local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    invoke-direct {v2, p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;)V

    .line 171
    .restart local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    iput-object v6, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->parent:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    .line 172
    iget-object v8, v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aput-object v2, v8, v4

    .line 173
    const/4 v8, 0x0

    iput-boolean v8, v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->isLeaf:Z

    .line 174
    iget v8, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->nodes:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->nodes:I

    .line 175
    iget-object v8, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colorList:[Ljava/util/Vector;

    aget-object v8, v8, v5

    invoke-virtual {v8, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 177
    if-ne v5, v10, :cond_3

    .line 178
    iput-boolean v9, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->isLeaf:Z

    .line 179
    iput v9, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    .line 180
    iput v7, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    .line 181
    iput v3, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    .line 182
    iput v1, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    .line 183
    iput v5, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->level:I

    .line 184
    iget v8, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    .line 199
    .end local v0    # "bit":I
    .end local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .end local v4    # "index":I
    :goto_1
    return-void

    .line 188
    .restart local v0    # "bit":I
    .restart local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .restart local v4    # "index":I
    :cond_3
    move-object v6, v2

    .line 153
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 189
    :cond_4
    iget-boolean v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->isLeaf:Z

    if-eqz v8, :cond_5

    .line 190
    iget v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    .line 191
    iget v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    add-int/2addr v8, v7

    iput v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    .line 192
    iget v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    add-int/2addr v8, v3

    iput v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    .line 193
    iget v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    add-int/2addr v8, v1

    iput v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    goto :goto_1

    .line 196
    :cond_5
    move-object v6, v2

    goto :goto_2

    .line 198
    .end local v0    # "bit":I
    .end local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .end local v4    # "index":I
    :cond_6
    sget-object v8, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v9, "insertColor failed"

    invoke-virtual {v8, v9}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private reduceTree(I)V
    .locals 8
    .param p1, "numColors"    # I

    .prologue
    .line 202
    const/4 v3, 0x4

    .local v3, "level":I
    :goto_0
    if-ltz v3, :cond_5

    .line 203
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colorList:[Ljava/util/Vector;

    aget-object v5, v6, v3

    .line 204
    .local v5, "v":Ljava/util/Vector;, "Ljava/util/Vector<Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;>;"
    if-eqz v5, :cond_4

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v6

    if-lez v6, :cond_4

    .line 205
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v6

    if-ge v2, v6, :cond_4

    .line 206
    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    .line 207
    .local v4, "node":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    iget v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->children:I

    if-lez v6, :cond_3

    .line 208
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    const/16 v6, 0x8

    if-ge v1, v6, :cond_2

    .line 209
    iget-object v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aget-object v0, v6, v1

    .line 210
    .local v0, "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    if-eqz v0, :cond_1

    .line 211
    iget-boolean v6, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->isLeaf:Z

    if-nez v6, :cond_0

    .line 212
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "not a leaf!"

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 213
    :cond_0
    iget v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    iget v7, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    add-int/2addr v6, v7

    iput v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    .line 214
    iget v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    iget v7, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    add-int/2addr v6, v7

    iput v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    .line 215
    iget v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    iget v7, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    add-int/2addr v6, v7

    iput v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    .line 216
    iget v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    iget v7, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    add-int/2addr v6, v7

    iput v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    .line 217
    iget-object v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    const/4 v7, 0x0

    aput-object v7, v6, v1

    .line 218
    iget v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->children:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->children:I

    .line 219
    iget v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    .line 220
    iget v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->nodes:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->nodes:I

    .line 221
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colorList:[Ljava/util/Vector;

    add-int/lit8 v7, v3, 0x1

    aget-object v6, v6, v7

    invoke-virtual {v6, v0}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 208
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 224
    .end local v0    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    :cond_2
    const/4 v6, 0x1

    iput-boolean v6, v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->isLeaf:Z

    .line 225
    iget v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    .line 226
    iget v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    if-gt v6, p1, :cond_3

    .line 234
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v4    # "node":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .end local v5    # "v":Ljava/util/Vector;, "Ljava/util/Vector<Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;>;"
    :goto_3
    return-void

    .line 205
    .restart local v2    # "j":I
    .restart local v4    # "node":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .restart local v5    # "v":Ljava/util/Vector;, "Ljava/util/Vector<Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;>;"
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 202
    .end local v2    # "j":I
    .end local v4    # "node":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    :cond_4
    add-int/lit8 v3, v3, -0x1

    goto/16 :goto_0

    .line 233
    .end local v5    # "v":Ljava/util/Vector;, "Ljava/util/Vector<Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;>;"
    :cond_5
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "Unable to reduce the OctTree"

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto :goto_3
.end method


# virtual methods
.method public addPixels([III)V
    .locals 3
    .param p1, "pixels"    # [I
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 101
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 102
    add-int v1, v0, p2

    aget v1, p1, v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->insertColor(I)V

    .line 103
    iget v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    iget v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceColors:I

    if-le v1, v2, :cond_0

    .line 104
    iget v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceColors:I

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceTree(I)V

    .line 101
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 106
    :cond_1
    return-void
.end method

.method public buildColorTable([I[I)V
    .locals 4
    .param p1, "inPixels"    # [I
    .param p2, "table"    # [I

    .prologue
    .line 252
    array-length v0, p1

    .line 253
    .local v0, "count":I
    array-length v2, p2

    iput v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->maximumColors:I

    .line 254
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 255
    aget v2, p1, v1

    invoke-direct {p0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->insertColor(I)V

    .line 256
    iget v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    iget v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceColors:I

    if-le v2, v3, :cond_0

    .line 257
    iget v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceColors:I

    invoke-direct {p0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceTree(I)V

    .line 254
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 259
    :cond_1
    iget v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    iget v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->maximumColors:I

    if-le v2, v3, :cond_2

    .line 260
    iget v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->maximumColors:I

    invoke-direct {p0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceTree(I)V

    .line 261
    :cond_2
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->root:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    const/4 v3, 0x0

    invoke-direct {p0, v2, p2, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->buildColorTable(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;[II)I

    .line 262
    return-void
.end method

.method public buildColorTable()[I
    .locals 3

    .prologue
    .line 241
    iget v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->colors:I

    new-array v0, v1, [I

    .line 242
    .local v0, "table":[I
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->root:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->buildColorTable(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;[II)I

    .line 243
    return-object v0
.end method

.method public getIndexForColor(I)I
    .locals 10
    .param p1, "rgb"    # I

    .prologue
    .line 114
    shr-int/lit8 v8, p1, 0x10

    and-int/lit16 v7, v8, 0xff

    .line 115
    .local v7, "red":I
    shr-int/lit8 v8, p1, 0x8

    and-int/lit16 v3, v8, 0xff

    .line 116
    .local v3, "green":I
    and-int/lit16 v1, p1, 0xff

    .line 118
    .local v1, "blue":I
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->root:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    .line 120
    .local v6, "node":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    const/4 v5, 0x0

    .local v5, "level":I
    :goto_0
    const/4 v8, 0x5

    if-gt v5, v8, :cond_5

    .line 122
    const/16 v8, 0x80

    shr-int v0, v8, v5

    .line 124
    .local v0, "bit":I
    const/4 v4, 0x0

    .line 125
    .local v4, "index":I
    and-int v8, v7, v0

    if-eqz v8, :cond_0

    .line 126
    add-int/lit8 v4, v4, 0x4

    .line 127
    :cond_0
    and-int v8, v3, v0

    if-eqz v8, :cond_1

    .line 128
    add-int/lit8 v4, v4, 0x2

    .line 129
    :cond_1
    and-int v8, v1, v0

    if-eqz v8, :cond_2

    .line 130
    add-int/lit8 v4, v4, 0x1

    .line 132
    :cond_2
    iget-object v8, v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aget-object v2, v8, v4

    .line 134
    .local v2, "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    if-nez v2, :cond_3

    .line 135
    iget v8, v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->index:I

    .line 142
    .end local v0    # "bit":I
    .end local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .end local v4    # "index":I
    :goto_1
    return v8

    .line 136
    .restart local v0    # "bit":I
    .restart local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .restart local v4    # "index":I
    :cond_3
    iget-boolean v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->isLeaf:Z

    if-eqz v8, :cond_4

    .line 137
    iget v8, v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->index:I

    goto :goto_1

    .line 139
    :cond_4
    move-object v6, v2

    .line 120
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 141
    .end local v0    # "bit":I
    .end local v2    # "child":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
    .end local v4    # "index":I
    :cond_5
    sget-object v8, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v9, "getIndexForColor failed"

    invoke-virtual {v8, v9}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 142
    const/4 v8, 0x0

    goto :goto_1
.end method

.method public setup(I)V
    .locals 2
    .param p1, "numColors"    # I

    .prologue
    .line 90
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->maximumColors:I

    .line 91
    const/16 v0, 0x200

    mul-int/lit8 v1, p1, 0x2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->reduceColors:I

    .line 92
    return-void
.end method
