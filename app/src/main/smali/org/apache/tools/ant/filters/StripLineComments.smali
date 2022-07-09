.class public final Lorg/apache/tools/ant/filters/StripLineComments;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "StripLineComments.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/filters/StripLineComments$Comment;
    }
.end annotation


# static fields
.field private static final COMMENTS_KEY:Ljava/lang/String; = "comment"


# instance fields
.field private comments:Ljava/util/Vector;

.field private line:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 57
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 57
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    .line 79
    return-void
.end method

.method private getComments()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    return-object v0
.end method

.method private initialize()V
    .locals 4

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripLineComments;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 187
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_1

    .line 188
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 189
    const-string/jumbo v2, "comment"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 190
    iget-object v2, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 188
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private setComments(Ljava/util/Vector;)V
    .locals 0
    .param p1, "comments"    # Ljava/util/Vector;

    .prologue
    .line 153
    iput-object p1, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    .line 154
    return-void
.end method


# virtual methods
.method public addConfiguredComment(Lorg/apache/tools/ant/filters/StripLineComments$Comment;)V
    .locals 2
    .param p1, "comment"    # Lorg/apache/tools/ant/filters/StripLineComments$Comment;

    .prologue
    .line 143
    iget-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    invoke-virtual {p1}, Lorg/apache/tools/ant/filters/StripLineComments$Comment;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 144
    return-void
.end method

.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 176
    new-instance v0, Lorg/apache/tools/ant/filters/StripLineComments;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/StripLineComments;-><init>(Ljava/io/Reader;)V

    .line 177
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/StripLineComments;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/StripLineComments;->getComments()Ljava/util/Vector;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/filters/StripLineComments;->setComments(Ljava/util/Vector;)V

    .line 178
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/StripLineComments;->setInitialized(Z)V

    .line 179
    return-object v0
.end method

.method public read()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripLineComments;->getInitialized()Z

    move-result v4

    if-nez v4, :cond_0

    .line 94
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/StripLineComments;->initialize()V

    .line 95
    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/filters/StripLineComments;->setInitialized(Z)V

    .line 98
    :cond_0
    const/4 v0, -0x1

    .line 100
    .local v0, "ch":I
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 101
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 102
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v4, v6, :cond_2

    .line 103
    iput-object v7, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    :cond_1
    :goto_0
    move v4, v0

    .line 133
    :goto_1
    return v4

    .line 105
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    goto :goto_0

    .line 108
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripLineComments;->readLine()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    .line 109
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v2

    .line 111
    .local v2, "commentsSize":I
    :goto_2
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    if-eqz v4, :cond_6

    .line 112
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    if-ge v3, v2, :cond_4

    .line 113
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->comments:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 114
    .local v1, "comment":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 115
    iput-object v7, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    .line 120
    .end local v1    # "comment":Ljava/lang/String;
    :cond_4
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    if-nez v4, :cond_6

    .line 122
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripLineComments;->readLine()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    goto :goto_2

    .line 112
    .restart local v1    # "comment":Ljava/lang/String;
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 128
    .end local v1    # "comment":Ljava/lang/String;
    .end local v3    # "i":I
    :cond_6
    iget-object v4, p0, Lorg/apache/tools/ant/filters/StripLineComments;->line:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 129
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripLineComments;->read()I

    move-result v4

    goto :goto_1
.end method
