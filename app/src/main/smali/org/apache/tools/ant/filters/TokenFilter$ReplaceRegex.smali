.class public Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;
.super Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;
.source "TokenFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/TokenFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReplaceRegex"
.end annotation


# instance fields
.field private flags:Ljava/lang/String;

.field private from:Ljava/lang/String;

.field private initialized:Z

.field private options:I

.field private regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

.field private regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

.field private substitution:Lorg/apache/tools/ant/types/Substitution;

.field private to:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 440
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;-><init>()V

    .line 445
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->initialized:Z

    .line 446
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->flags:Ljava/lang/String;

    return-void
.end method

.method private initialize()V
    .locals 2

    .prologue
    .line 473
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->initialized:Z

    if-eqz v0, :cond_0

    .line 488
    :goto_0
    return-void

    .line 476
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->flags:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/ant/filters/TokenFilter;->convertRegexOptions(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->options:I

    .line 477
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->from:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 478
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Missing pattern in replaceregex"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 480
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    .line 481
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->from:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 482
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 483
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->to:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 484
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->to:Ljava/lang/String;

    .line 486
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/types/Substitution;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Substitution;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->substitution:Lorg/apache/tools/ant/types/Substitution;

    .line 487
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->substitution:Lorg/apache/tools/ant/types/Substitution;

    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->to:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Substitution;->setExpression(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public filter(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 495
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->initialize()V

    .line 497
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    iget v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->options:I

    invoke-interface {v0, p1, v1}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 500
    .end local p1    # "line":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "line":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->substitution:Lorg/apache/tools/ant/types/Substitution;

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Substitution;->getExpression(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->options:I

    invoke-interface {v0, p1, v1, v2}, Lorg/apache/tools/ant/util/regexp/Regexp;->substitute(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public setFlags(Ljava/lang/String;)V
    .locals 0
    .param p1, "flags"    # Ljava/lang/String;

    .prologue
    .line 469
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->flags:Ljava/lang/String;

    .line 470
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 455
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->from:Ljava/lang/String;

    .line 456
    return-void
.end method

.method public setReplace(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 462
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;->to:Ljava/lang/String;

    .line 463
    return-void
.end method
