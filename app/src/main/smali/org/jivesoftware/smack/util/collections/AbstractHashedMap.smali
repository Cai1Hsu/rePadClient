.class public Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;
.super Ljava/util/AbstractMap;
.source "AbstractHashedMap.java"

# interfaces
.implements Lorg/jivesoftware/smack/util/collections/IterableMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$ValuesIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySetIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySetIterator;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;,
        Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashMapIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractMap",
        "<TK;TV;>;",
        "Lorg/jivesoftware/smack/util/collections/IterableMap",
        "<TK;TV;>;"
    }
.end annotation


# static fields
.field protected static final DEFAULT_CAPACITY:I = 0x10

.field protected static final DEFAULT_LOAD_FACTOR:F = 0.75f

.field protected static final DEFAULT_THRESHOLD:I = 0xc

.field protected static final GETKEY_INVALID:Ljava/lang/String; = "getKey() can only be called after next() and before remove()"

.field protected static final GETVALUE_INVALID:Ljava/lang/String; = "getValue() can only be called after next() and before remove()"

.field protected static final MAXIMUM_CAPACITY:I = 0x40000000

.field protected static final NO_NEXT_ENTRY:Ljava/lang/String; = "No next() entry in the iteration"

.field protected static final NO_PREVIOUS_ENTRY:Ljava/lang/String; = "No previous() entry in the iteration"

.field protected static final NULL:Ljava/lang/Object;

.field protected static final REMOVE_INVALID:Ljava/lang/String; = "remove() can only be called once after next()"

.field protected static final SETVALUE_INVALID:Ljava/lang/String; = "setValue() can only be called after next() and before remove()"


# instance fields
.field protected transient data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field protected transient entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field protected transient keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field protected transient loadFactor:F

.field protected transient modCount:I

.field protected transient size:I

.field protected transient threshold:I

.field protected transient values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->NULL:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 113
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 114
    return-void
.end method

.method protected constructor <init>(I)V
    .locals 1
    .param p1, "initialCapacity"    # I

    .prologue
    .line 139
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    const/high16 v0, 0x3f400000    # 0.75f

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;-><init>(IF)V

    .line 140
    return-void
.end method

.method protected constructor <init>(IF)V
    .locals 2
    .param p1, "initialCapacity"    # I
    .param p2, "loadFactor"    # F

    .prologue
    .line 152
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 153
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 154
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Initial capacity must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_0
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-lez v0, :cond_1

    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 157
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Load factor must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_2
    iput p2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    .line 160
    invoke-virtual {p0, p1, p2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->calculateThreshold(IF)I

    move-result v0

    iput v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->threshold:I

    .line 161
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->calculateNewCapacity(I)I

    move-result p1

    .line 162
    new-array v0, p1, [Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 163
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->init()V

    .line 164
    return-void
.end method

.method protected constructor <init>(IFI)V
    .locals 1
    .param p1, "initialCapacity"    # I
    .param p2, "loadFactor"    # F
    .param p3, "threshold"    # I

    .prologue
    .line 124
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 125
    iput p2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    .line 126
    new-array v0, p1, [Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 127
    iput p3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->threshold:I

    .line 128
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->init()V

    .line 129
    return-void
.end method

.method protected constructor <init>(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    const/16 v1, 0x10

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;-><init>(IF)V

    .line 174
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->putAll(Ljava/util/Map;)V

    .line 175
    return-void
.end method


# virtual methods
.method protected addEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;I)V
    .locals 1
    .param p2, "hashIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;I)V"
        }
    .end annotation

    .prologue
    .line 515
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aput-object p1, v0, p2

    .line 516
    return-void
.end method

.method protected addMapping(IILjava/lang/Object;Ljava/lang/Object;)V
    .locals 2
    .param p1, "hashIndex"    # I
    .param p2, "hashCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IITK;TV;)V"
        }
    .end annotation

    .prologue
    .line 481
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p3, "key":Ljava/lang/Object;, "TK;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    .line 482
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v1, v1, p1

    invoke-virtual {p0, v1, p2, p3, p4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->createEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILjava/lang/Object;Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    move-result-object v0

    .line 483
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->addEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;I)V

    .line 484
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    .line 485
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->checkCapacity()V

    .line 486
    return-void
.end method

.method protected calculateNewCapacity(I)I
    .locals 2
    .param p1, "proposedCapacity"    # I

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    const/high16 v1, 0x40000000    # 2.0f

    .line 629
    const/4 v0, 0x1

    .line 630
    .local v0, "newCapacity":I
    if-le p1, v1, :cond_1

    .line 631
    const/high16 v0, 0x40000000    # 2.0f

    .line 640
    :cond_0
    :goto_0
    return v0

    .line 633
    :cond_1
    :goto_1
    if-ge v0, p1, :cond_2

    .line 634
    shl-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 636
    :cond_2
    if-le v0, v1, :cond_0

    .line 637
    const/high16 v0, 0x40000000    # 2.0f

    goto :goto_0
.end method

.method protected calculateThreshold(IF)I
    .locals 1
    .param p1, "newCapacity"    # I
    .param p2, "factor"    # F

    .prologue
    .line 652
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    int-to-float v0, p1

    mul-float/2addr v0, p2

    float-to-int v0, v0

    return v0
.end method

.method protected checkCapacity()V
    .locals 3

    .prologue
    .line 577
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    iget v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->threshold:I

    if-lt v1, v2, :cond_0

    .line 578
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v1, v1

    mul-int/lit8 v0, v1, 0x2

    .line 579
    .local v0, "newCapacity":I
    const/high16 v1, 0x40000000    # 2.0f

    if-gt v0, v1, :cond_0

    .line 580
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->ensureCapacity(I)V

    .line 583
    .end local v0    # "newCapacity":I
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 3

    .prologue
    .line 345
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    .line 346
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 347
    .local v0, "data":[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    array-length v2, v0

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_0

    .line 348
    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 347
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 350
    :cond_0
    const/4 v2, 0x0

    iput v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    .line 351
    return-void
.end method

.method protected clone()Ljava/lang/Object;
    .locals 4

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    const/4 v2, 0x0

    .line 1240
    :try_start_0
    invoke-super {p0}, Ljava/util/AbstractMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;

    .line 1241
    .local v0, "cloned":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;
    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v3, v3

    new-array v3, v3, [Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v3, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1242
    const/4 v3, 0x0

    iput-object v3, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    .line 1243
    const/4 v3, 0x0

    iput-object v3, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    .line 1244
    const/4 v3, 0x0

    iput-object v3, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    .line 1245
    const/4 v3, 0x0

    iput v3, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    .line 1246
    const/4 v3, 0x0

    iput v3, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    .line 1247
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->init()V

    .line 1248
    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->putAll(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1252
    .end local v0    # "cloned":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;
    :goto_0
    return-object v0

    .line 1251
    :catch_0
    move-exception v1

    .local v1, "ex":Ljava/lang/CloneNotSupportedException;
    move-object v0, v2

    .line 1252
    goto :goto_0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 228
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    if-nez p1, :cond_0

    sget-object v2, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->NULL:Ljava/lang/Object;

    :goto_0
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hash(Ljava/lang/Object;)I

    move-result v1

    .line 229
    .local v1, "hashCode":I
    iget-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v3, v3

    invoke-virtual {p0, v1, v3}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hashIndex(II)I

    move-result v3

    aget-object v0, v2, v3

    .line 230
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    :goto_1
    if-eqz v0, :cond_2

    .line 231
    iget v2, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    if-ne v2, v1, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 232
    const/4 v2, 0x1

    .line 236
    :goto_2
    return v2

    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .end local v1    # "hashCode":I
    :cond_0
    move-object v2, p1

    .line 228
    goto :goto_0

    .line 234
    .restart local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .restart local v1    # "hashCode":I
    :cond_1
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_1

    .line 236
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    const/4 v3, 0x1

    .line 246
    if-nez p1, :cond_3

    .line 247
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v2, v4

    .local v2, "isize":I
    :goto_0
    if-ge v1, v2, :cond_5

    .line 248
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v0, v4, v1

    .line 249
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    :goto_1
    if-eqz v0, :cond_2

    .line 250
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    .line 267
    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    :cond_0
    :goto_2
    return v3

    .line 253
    .restart local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    :cond_1
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_1

    .line 247
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 257
    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .end local v1    # "i":I
    .end local v2    # "isize":I
    :cond_3
    const/4 v1, 0x0

    .restart local v1    # "i":I
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v2, v4

    .restart local v2    # "isize":I
    :goto_3
    if-ge v1, v2, :cond_5

    .line 258
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v0, v4, v1

    .line 259
    .restart local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    :goto_4
    if-eqz v0, :cond_4

    .line 260
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->isEqualValue(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 263
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_4

    .line 257
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 267
    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    :cond_5
    const/4 v3, 0x0

    goto :goto_2
.end method

.method protected createEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILjava/lang/Object;Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .locals 1
    .param p2, "hashCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;ITK;TV;)",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 502
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "next":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .local p3, "key":Ljava/lang/Object;, "TK;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILjava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method protected createEntrySetIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 787
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 788
    sget-object v0, Lorg/jivesoftware/smack/util/collections/EmptyIterator;->INSTANCE:Ljava/util/Iterator;

    .line 790
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySetIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySetIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    goto :goto_0
.end method

.method protected createKeySetIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 875
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 876
    sget-object v0, Lorg/jivesoftware/smack/util/collections/EmptyIterator;->INSTANCE:Ljava/util/Iterator;

    .line 878
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySetIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySetIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    goto :goto_0
.end method

.method protected createValuesIterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 954
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 955
    sget-object v0, Lorg/jivesoftware/smack/util/collections/EmptyIterator;->INSTANCE:Ljava/util/Iterator;

    .line 957
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$ValuesIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$ValuesIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    goto :goto_0
.end method

.method protected destroyEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    const/4 v0, 0x0

    .line 565
    iput-object v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 566
    invoke-static {p1, v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->access$002(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    invoke-static {p1, v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->access$102(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    return-void
.end method

.method protected doReadObject(Ljava/io/ObjectInputStream;)V
    .locals 7
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1216
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readFloat()F

    move-result v5

    iput v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    .line 1217
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 1218
    .local v0, "capacity":I
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v3

    .line 1219
    .local v3, "size":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->init()V

    .line 1220
    new-array v5, v0, [Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1221
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 1222
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 1223
    .local v2, "key":Ljava/lang/Object;, "TK;"
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4

    .line 1224
    .local v4, "value":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, v2, v4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1221
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1226
    .end local v2    # "key":Ljava/lang/Object;, "TK;"
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    :cond_0
    iget-object v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v5, v5

    iget v6, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    invoke-virtual {p0, v5, v6}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->calculateThreshold(IF)I

    move-result v5

    iput v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->threshold:I

    .line 1227
    return-void
.end method

.method protected doWriteObject(Ljava/io/ObjectOutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1188
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeFloat(F)V

    .line 1189
    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v1, v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 1190
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 1191
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->mapIterator()Lorg/jivesoftware/smack/util/collections/MapIterator;

    move-result-object v0

    .local v0, "it":Lorg/jivesoftware/smack/util/collections/MapIterator;
    :goto_0
    invoke-interface {v0}, Lorg/jivesoftware/smack/util/collections/MapIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1192
    invoke-interface {v0}, Lorg/jivesoftware/smack/util/collections/MapIterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1193
    invoke-interface {v0}, Lorg/jivesoftware/smack/util/collections/MapIterator;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 1195
    :cond_0
    return-void
.end method

.method protected ensureCapacity(I)V
    .locals 8
    .param p1, "newCapacity"    # I

    .prologue
    .line 591
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget-object v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v5, v7

    .line 592
    .local v5, "oldCapacity":I
    if-gt p1, v5, :cond_0

    .line 619
    :goto_0
    return-void

    .line 595
    :cond_0
    iget v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    if-nez v7, :cond_1

    .line 596
    iget v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    invoke-virtual {p0, p1, v7}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->calculateThreshold(IF)I

    move-result v7

    iput v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->threshold:I

    .line 597
    new-array v7, p1, [Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_0

    .line 599
    :cond_1
    iget-object v6, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 600
    .local v6, "oldEntries":[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    new-array v3, p1, [Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 602
    .local v3, "newEntries":[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    .line 603
    add-int/lit8 v1, v5, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_4

    .line 604
    aget-object v0, v6, v1

    .line 605
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    if-eqz v0, :cond_3

    .line 606
    const/4 v7, 0x0

    aput-object v7, v6, v1

    .line 608
    :cond_2
    iget-object v4, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 609
    .local v4, "next":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget v7, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    invoke-virtual {p0, v7, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hashIndex(II)I

    move-result v2

    .line 610
    .local v2, "index":I
    aget-object v7, v3, v2

    iput-object v7, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 611
    aput-object v0, v3, v2

    .line 612
    move-object v0, v4

    .line 613
    if-nez v0, :cond_2

    .line 603
    .end local v2    # "index":I
    .end local v4    # "next":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 616
    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :cond_4
    iget v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    invoke-virtual {p0, p1, v7}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->calculateThreshold(IF)I

    move-result v7

    iput v7, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->threshold:I

    .line 617
    iput-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_0
.end method

.method protected entryHashCode(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;)I"
        }
    .end annotation

    .prologue
    .line 679
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    return v0
.end method

.method protected entryKey(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;)TK;"
        }
    .end annotation

    .prologue
    .line 692
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    invoke-static {p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->access$000(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected entryNext(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;)",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 666
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget-object v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    return-object v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 774
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    if-nez v0, :cond_0

    .line 775
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    .line 777
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->entrySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$EntrySet;

    return-object v0
.end method

.method protected entryValue(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;)TV;"
        }
    .end annotation

    .prologue
    .line 705
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    invoke-static {p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->access$100(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 9
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1263
    if-ne p1, p0, :cond_1

    .line 1293
    :cond_0
    :goto_0
    return v5

    .line 1266
    :cond_1
    instance-of v7, p1, Ljava/util/Map;

    if-nez v7, :cond_2

    move v5, v6

    .line 1267
    goto :goto_0

    :cond_2
    move-object v3, p1

    .line 1269
    check-cast v3, Ljava/util/Map;

    .line 1270
    .local v3, "map":Ljava/util/Map;
    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size()I

    move-result v8

    if-eq v7, v8, :cond_3

    move v5, v6

    .line 1271
    goto :goto_0

    .line 1273
    :cond_3
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->mapIterator()Lorg/jivesoftware/smack/util/collections/MapIterator;

    move-result-object v1

    .line 1275
    .local v1, "it":Lorg/jivesoftware/smack/util/collections/MapIterator;
    :cond_4
    :try_start_0
    invoke-interface {v1}, Lorg/jivesoftware/smack/util/collections/MapIterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1276
    invoke-interface {v1}, Lorg/jivesoftware/smack/util/collections/MapIterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1277
    .local v2, "key":Ljava/lang/Object;
    invoke-interface {v1}, Lorg/jivesoftware/smack/util/collections/MapIterator;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 1278
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_6

    .line 1279
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_5

    invoke-interface {v3, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    :cond_5
    move v5, v6

    .line 1280
    goto :goto_0

    .line 1283
    :cond_6
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v7

    if-nez v7, :cond_4

    move v5, v6

    .line 1284
    goto :goto_0

    .line 1288
    .end local v2    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .local v0, "ignored":Ljava/lang/ClassCastException;
    move v5, v6

    .line 1289
    goto :goto_0

    .line 1290
    .end local v0    # "ignored":Ljava/lang/ClassCastException;
    :catch_1
    move-exception v0

    .local v0, "ignored":Ljava/lang/NullPointerException;
    move v5, v6

    .line 1291
    goto :goto_0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    if-nez p1, :cond_0

    sget-object v2, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->NULL:Ljava/lang/Object;

    :goto_0
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hash(Ljava/lang/Object;)I

    move-result v1

    .line 192
    .local v1, "hashCode":I
    iget-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v3, v3

    invoke-virtual {p0, v1, v3}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hashIndex(II)I

    move-result v3

    aget-object v0, v2, v3

    .line 193
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v0, :cond_2

    .line 194
    iget v2, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    if-ne v2, v1, :cond_1

    invoke-static {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->access$000(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 195
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 199
    :goto_2
    return-object v2

    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .end local v1    # "hashCode":I
    :cond_0
    move-object v2, p1

    .line 191
    goto :goto_0

    .line 197
    .restart local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .restart local v1    # "hashCode":I
    :cond_1
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_1

    .line 199
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method protected getEntry(Ljava/lang/Object;)Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 422
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    if-nez p1, :cond_0

    sget-object v2, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->NULL:Ljava/lang/Object;

    :goto_0
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hash(Ljava/lang/Object;)I

    move-result v1

    .line 423
    .local v1, "hashCode":I
    iget-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v3, v3

    invoke-virtual {p0, v1, v3}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hashIndex(II)I

    move-result v3

    aget-object v0, v2, v3

    .line 424
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v0, :cond_2

    .line 425
    iget v2, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    if-ne v2, v1, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 430
    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_2
    return-object v0

    .end local v1    # "hashCode":I
    :cond_0
    move-object v2, p1

    .line 422
    goto :goto_0

    .line 428
    .restart local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .restart local v1    # "hashCode":I
    :cond_1
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_1

    .line 430
    :cond_2
    const/4 v0, 0x0

    goto :goto_2
.end method

.method protected hash(Ljava/lang/Object;)I
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 363
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 364
    .local v0, "h":I
    shl-int/lit8 v1, v0, 0x9

    xor-int/lit8 v1, v1, -0x1

    add-int/2addr v0, v1

    .line 365
    ushr-int/lit8 v1, v0, 0xe

    xor-int/2addr v0, v1

    .line 366
    shl-int/lit8 v1, v0, 0x4

    add-int/2addr v0, v1

    .line 367
    ushr-int/lit8 v1, v0, 0xa

    xor-int/2addr v0, v1

    .line 368
    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 1302
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    const/4 v1, 0x0

    .line 1303
    .local v1, "total":I
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->createEntrySetIterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1304
    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1305
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    .line 1307
    :cond_0
    return v1
.end method

.method protected hashIndex(II)I
    .locals 1
    .param p1, "hashCode"    # I
    .param p2, "dataSize"    # I

    .prologue
    .line 407
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    add-int/lit8 v0, p2, -0x1

    and-int/2addr v0, p1

    return v0
.end method

.method protected init()V
    .locals 0

    .prologue
    .line 181
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 217
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key1"    # Ljava/lang/Object;
    .param p2, "key2"    # Ljava/lang/Object;

    .prologue
    .line 381
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    if-eq p1, p2, :cond_0

    if-eqz p1, :cond_1

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isEqualValue(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value1"    # Ljava/lang/Object;
    .param p2, "value2"    # Ljava/lang/Object;

    .prologue
    .line 394
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    if-eq p1, p2, :cond_0

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 862
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    if-nez v0, :cond_0

    .line 863
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    .line 865
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->keySet:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$KeySet;

    return-object v0
.end method

.method public mapIterator()Lorg/jivesoftware/smack/util/collections/MapIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/MapIterator",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 721
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    if-nez v0, :cond_0

    .line 722
    sget-object v0, Lorg/jivesoftware/smack/util/collections/EmptyMapIterator;->INSTANCE:Lorg/jivesoftware/smack/util/collections/MapIterator;

    .line 724
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashMapIterator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashMapIterator;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    goto :goto_0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 279
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-nez p1, :cond_0

    sget-object v4, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->NULL:Ljava/lang/Object;

    :goto_0
    invoke-virtual {p0, v4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hash(Ljava/lang/Object;)I

    move-result v1

    .line 280
    .local v1, "hashCode":I
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v4, v4

    invoke-virtual {p0, v1, v4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hashIndex(II)I

    move-result v2

    .line 281
    .local v2, "index":I
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v0, v4, v2

    .line 282
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v0, :cond_2

    .line 283
    iget v4, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    if-ne v4, v1, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, p1, v4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 284
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 285
    .local v3, "oldValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, v0, p2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->updateEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;Ljava/lang/Object;)V

    .line 291
    .end local v3    # "oldValue":Ljava/lang/Object;, "TV;"
    :goto_2
    return-object v3

    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .end local v1    # "hashCode":I
    .end local v2    # "index":I
    :cond_0
    move-object v4, p1

    .line 279
    goto :goto_0

    .line 288
    .restart local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .restart local v1    # "hashCode":I
    .restart local v2    # "index":I
    :cond_1
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_1

    .line 290
    :cond_2
    invoke-virtual {p0, v2, v1, p1, p2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->addMapping(IILjava/lang/Object;Ljava/lang/Object;)V

    .line 291
    const/4 v3, 0x0

    goto :goto_2
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 304
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v2

    .line 305
    .local v2, "mapSize":I
    if-nez v2, :cond_1

    .line 315
    :cond_0
    return-void

    .line 308
    :cond_1
    iget v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    add-int/2addr v4, v2

    int-to-float v4, v4

    iget v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->loadFactor:F

    div-float/2addr v4, v5

    const/high16 v5, 0x3f800000    # 1.0f

    add-float/2addr v4, v5

    float-to-int v3, v4

    .line 309
    .local v3, "newSize":I
    invoke-virtual {p0, v3}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->calculateNewCapacity(I)I

    move-result v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->ensureCapacity(I)V

    .line 311
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 312
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 313
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 324
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    if-nez p1, :cond_0

    sget-object v5, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->NULL:Ljava/lang/Object;

    :goto_0
    invoke-virtual {p0, v5}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hash(Ljava/lang/Object;)I

    move-result v1

    .line 325
    .local v1, "hashCode":I
    iget-object v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    array-length v5, v5

    invoke-virtual {p0, v1, v5}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->hashIndex(II)I

    move-result v2

    .line 326
    .local v2, "index":I
    iget-object v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v0, v5, v2

    .line 327
    .local v0, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    const/4 v4, 0x0

    .line 328
    .local v4, "previous":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_1
    if-eqz v0, :cond_2

    .line 329
    iget v5, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    if-ne v5, v1, :cond_1

    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, p1, v5}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->isEqualKey(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 330
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v3

    .line 331
    .local v3, "oldValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p0, v0, v2, v4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->removeMapping(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)V

    .line 337
    .end local v3    # "oldValue":Ljava/lang/Object;, "TV;"
    :goto_2
    return-object v3

    .end local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .end local v1    # "hashCode":I
    .end local v2    # "index":I
    .end local v4    # "previous":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :cond_0
    move-object v5, p1

    .line 324
    goto :goto_0

    .line 334
    .restart local v0    # "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .restart local v1    # "hashCode":I
    .restart local v2    # "index":I
    .restart local v4    # "previous":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :cond_1
    move-object v4, v0

    .line 335
    iget-object v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_1

    .line 337
    :cond_2
    const/4 v3, 0x0

    goto :goto_2
.end method

.method protected removeEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)V
    .locals 2
    .param p2, "hashIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;I",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 549
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .local p3, "previous":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    if-nez p3, :cond_0

    .line 550
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iget-object v1, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aput-object v1, v0, p2

    .line 554
    :goto_0
    return-void

    .line 552
    :cond_0
    iget-object v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    iput-object v0, p3, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    goto :goto_0
.end method

.method protected removeMapping(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)V
    .locals 1
    .param p2, "hashIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;I",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 531
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .local p3, "previous":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    .line 532
    invoke-virtual {p0, p1, p2, p3}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->removeEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;ILorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)V

    .line 533
    iget v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    .line 534
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->destroyEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;)V

    .line 535
    return-void
.end method

.method protected reuseEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;IILjava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .param p2, "hashIndex"    # I
    .param p3, "hashCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;IITK;TV;)V"
        }
    .end annotation

    .prologue
    .line 460
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .local p4, "key":Ljava/lang/Object;, "TK;"
    .local p5, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    aget-object v0, v0, p2

    iput-object v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 461
    iput p3, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->hashCode:I

    .line 462
    invoke-static {p1, p4}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->access$002(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    invoke-static {p1, p5}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->access$102(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 208
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 1316
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 1317
    const-string/jumbo v5, "{}"

    .line 1336
    :goto_0
    return-object v5

    .line 1319
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->size()I

    move-result v5

    mul-int/lit8 v5, v5, 0x20

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1320
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v5, 0x7b

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1322
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->mapIterator()Lorg/jivesoftware/smack/util/collections/MapIterator;

    move-result-object v2

    .line 1323
    .local v2, "it":Lorg/jivesoftware/smack/util/collections/MapIterator;
    invoke-interface {v2}, Lorg/jivesoftware/smack/util/collections/MapIterator;->hasNext()Z

    move-result v1

    .line 1324
    .local v1, "hasNext":Z
    :cond_1
    :goto_1
    if-eqz v1, :cond_4

    .line 1325
    invoke-interface {v2}, Lorg/jivesoftware/smack/util/collections/MapIterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 1326
    .local v3, "key":Ljava/lang/Object;
    invoke-interface {v2}, Lorg/jivesoftware/smack/util/collections/MapIterator;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 1327
    .local v4, "value":Ljava/lang/Object;
    if-ne v3, p0, :cond_2

    const-string/jumbo v3, "(this Map)"

    .end local v3    # "key":Ljava/lang/Object;
    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    if-ne v4, p0, :cond_3

    const-string/jumbo v4, "(this Map)"

    .end local v4    # "value":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1329
    invoke-interface {v2}, Lorg/jivesoftware/smack/util/collections/MapIterator;->hasNext()Z

    move-result v1

    .line 1330
    if-eqz v1, :cond_1

    .line 1331
    const/16 v5, 0x2c

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x20

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1335
    :cond_4
    const/16 v5, 0x7d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1336
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method

.method protected updateEntry(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;TV;)V"
        }
    .end annotation

    .prologue
    .line 444
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    .local p1, "entry":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    .local p2, "newValue":Ljava/lang/Object;, "TV;"
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    return-void
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 941
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    if-nez v0, :cond_0

    .line 942
    new-instance v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;-><init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    .line 944
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->values:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$Values;

    return-object v0
.end method
