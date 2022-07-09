.class public Lorg/apache/tools/ant/types/resources/selectors/Name;
.super Ljava/lang/Object;
.source "Name.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# instance fields
.field private cs:Z

.field private expression:Lorg/apache/tools/ant/util/regexp/Regexp;

.field private handleDirSep:Z

.field private pattern:Ljava/lang/String;

.field private project:Lorg/apache/tools/ant/Project;

.field private reg:Lorg/apache/tools/ant/types/RegularExpression;

.field private regex:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->regex:Ljava/lang/String;

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->cs:Z

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->handleDirSep:Z

    return-void
.end method

.method private matches(Ljava/lang/String;)Z
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->pattern:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->pattern:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/selectors/Name;->modify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/Name;->modify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->cs:Z

    invoke-static {v0, v1, v2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    .line 141
    :goto_0
    return v0

    .line 136
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    if-nez v0, :cond_1

    .line 137
    new-instance v0, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->regex:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->expression:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 141
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->expression:Lorg/apache/tools/ant/util/regexp/Regexp;

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/Name;->modify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->cs:Z

    invoke-static {v2}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(Z)I

    move-result v2

    invoke-interface {v0, v1, v2}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z

    move-result v0

    goto :goto_0
.end method

.method private modify(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 146
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->handleDirSep:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "\\"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 149
    .end local p1    # "s":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .restart local p1    # "s":Ljava/lang/String;
    :cond_1
    const/16 v0, 0x5c

    const/16 v1, 0x2f

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method


# virtual methods
.method public doesHandledirSep()Z
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->handleDirSep:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public getRegex()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->regex:Ljava/lang/String;

    return-object v0
.end method

.method public isCaseSensitive()Z
    .locals 1

    .prologue
    .line 95
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->cs:Z

    return v0
.end method

.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 3
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 124
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "n":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/selectors/Name;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 126
    const/4 v2, 0x1

    .line 129
    :goto_0
    return v2

    .line 128
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/types/resources/selectors/Name;->matches(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0
.end method

.method public setCaseSensitive(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->cs:Z

    .line 88
    return-void
.end method

.method public setHandleDirSep(Z)V
    .locals 0
    .param p1, "handleDirSep"    # Z

    .prologue
    .line 105
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->handleDirSep:Z

    .line 106
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "n"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->pattern:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 44
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->project:Lorg/apache/tools/ant/Project;

    .line 45
    return-void
.end method

.method public setRegex(Ljava/lang/String;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->regex:Ljava/lang/String;

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Name;->reg:Lorg/apache/tools/ant/types/RegularExpression;

    .line 71
    return-void
.end method
