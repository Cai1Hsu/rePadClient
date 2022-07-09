.class public Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "TokenFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/TokenFilter$Filter;
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/TokenFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DeleteCharacters"
.end annotation


# instance fields
.field private deleteChars:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 606
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 610
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;->deleteChars:Ljava/lang/String;

    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;C)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;
    .param p1, "x1"    # C

    .prologue
    .line 606
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;->isDeleteCharacter(C)Z

    move-result v0

    return v0
.end method

.method private isDeleteCharacter(C)Z
    .locals 2
    .param p1, "c"    # C

    .prologue
    .line 670
    const/4 v0, 0x0

    .local v0, "d":I
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;->deleteChars:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 671
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;->deleteChars:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, p1, :cond_0

    .line 672
    const/4 v1, 0x1

    .line 675
    :goto_1
    return v1

    .line 670
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 675
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 1
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 644
    new-instance v0, Lorg/apache/tools/ant/filters/TokenFilter$1;

    invoke-direct {v0, p0, p1}, Lorg/apache/tools/ant/filters/TokenFilter$1;-><init>(Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;Ljava/io/Reader;)V

    return-object v0
.end method

.method public filter(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 626
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 627
    .local v2, "output":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 628
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 629
    .local v0, "ch":C
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;->isDeleteCharacter(C)Z

    move-result v3

    if-nez v3, :cond_0

    .line 630
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 627
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 633
    .end local v0    # "ch":C
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public setChars(Ljava/lang/String;)V
    .locals 1
    .param p1, "deleteChars"    # Ljava/lang/String;

    .prologue
    .line 617
    invoke-static {p1}, Lorg/apache/tools/ant/filters/TokenFilter;->resolveBackSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;->deleteChars:Ljava/lang/String;

    .line 618
    return-void
.end method
