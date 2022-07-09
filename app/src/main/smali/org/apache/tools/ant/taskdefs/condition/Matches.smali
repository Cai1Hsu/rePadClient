.class public Lorg/apache/tools/ant/taskdefs/condition/Matches;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Matches.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private caseSensitive:Z

.field private multiLine:Z

.field private regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

.field private singleLine:Z

.field private string:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->caseSensitive:Z

    .line 35
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->multiLine:Z

    .line 36
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->singleLine:Z

    return-void
.end method


# virtual methods
.method public addRegexp(Lorg/apache/tools/ant/types/RegularExpression;)V
    .locals 2
    .param p1, "regularExpression"    # Lorg/apache/tools/ant/types/RegularExpression;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    if-eqz v0, :cond_0

    .line 71
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one regular expression is allowed."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    .line 75
    return-void
.end method

.method public eval()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->string:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 109
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Parameter string is required in matches."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 112
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    if-nez v2, :cond_1

    .line 113
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Missing pattern in matches."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 115
    :cond_1
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->caseSensitive:Z

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->multiLine:Z

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->singleLine:Z

    invoke-static {v2, v3, v4}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(ZZZ)I

    move-result v0

    .line 116
    .local v0, "options":I
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/Matches;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v1

    .line 117
    .local v1, "regexp":Lorg/apache/tools/ant/util/regexp/Regexp;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->string:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z

    move-result v2

    return v2
.end method

.method public setCasesensitive(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->caseSensitive:Z

    .line 84
    return-void
.end method

.method public setMultiline(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 91
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->multiLine:Z

    .line 92
    return-void
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 2
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    if-eqz v0, :cond_0

    .line 55
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one regular expression is allowed."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->regularExpression:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public setSingleLine(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 100
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->singleLine:Z

    .line 101
    return-void
.end method

.method public setString(Ljava/lang/String;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Matches;->string:Ljava/lang/String;

    .line 46
    return-void
.end method
