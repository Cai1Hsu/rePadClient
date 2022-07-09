.class public Lorg/apache/tools/ant/types/selectors/NotSelector;
.super Lorg/apache/tools/ant/types/selectors/NoneSelector;
.source "NotSelector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/NoneSelector;-><init>()V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 0
    .param p1, "other"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/NotSelector;-><init>()V

    .line 45
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/NotSelector;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 46
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 53
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/NotSelector;->hasSelectors()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    const-string/jumbo v1, "{notselect: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/NoneSelector;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 58
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 2

    .prologue
    .line 66
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/NotSelector;->selectorCount()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 67
    const-string/jumbo v0, "One and only one selector is allowed within the <not> tag"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/NotSelector;->setError(Ljava/lang/String;)V

    .line 70
    :cond_0
    return-void
.end method
