.class public Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;
.super Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;
.source "TokenFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/TokenFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ContainsRegex"
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
    .line 508
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;-><init>()V

    .line 513
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->initialized:Z

    .line 514
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->flags:Ljava/lang/String;

    return-void
.end method

.method private initialize()V
    .locals 2

    .prologue
    .line 541
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->initialized:Z

    if-eqz v0, :cond_1

    .line 556
    :cond_0
    :goto_0
    return-void

    .line 544
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->flags:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/ant/filters/TokenFilter;->convertRegexOptions(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->options:I

    .line 545
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->from:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 546
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Missing from in containsregex"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 548
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    .line 549
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->from:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 550
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 551
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->to:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 554
    new-instance v0, Lorg/apache/tools/ant/types/Substitution;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Substitution;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->substitution:Lorg/apache/tools/ant/types/Substitution;

    .line 555
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->substitution:Lorg/apache/tools/ant/types/Substitution;

    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->to:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Substitution;->setExpression(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public filter(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 564
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->initialize()V

    .line 565
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    iget v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->options:I

    invoke-interface {v0, p1, v1}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 566
    const/4 p1, 0x0

    .line 571
    .end local p1    # "string":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 568
    .restart local p1    # "string":Ljava/lang/String;
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->substitution:Lorg/apache/tools/ant/types/Substitution;

    if-eqz v0, :cond_0

    .line 571
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->substitution:Lorg/apache/tools/ant/types/Substitution;

    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Substitution;->getExpression(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->options:I

    invoke-interface {v0, p1, v1, v2}, Lorg/apache/tools/ant/util/regexp/Regexp;->substitute(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public setFlags(Ljava/lang/String;)V
    .locals 0
    .param p1, "flags"    # Ljava/lang/String;

    .prologue
    .line 537
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->flags:Ljava/lang/String;

    .line 538
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 523
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->from:Ljava/lang/String;

    .line 524
    return-void
.end method

.method public setReplace(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 530
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;->to:Ljava/lang/String;

    .line 531
    return-void
.end method
