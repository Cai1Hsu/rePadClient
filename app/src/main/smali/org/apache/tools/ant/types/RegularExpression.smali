.class public Lorg/apache/tools/ant/types/RegularExpression;
.super Lorg/apache/tools/ant/types/DataType;
.source "RegularExpression.java"


# static fields
.field public static final DATA_TYPE_NAME:Ljava/lang/String; = "regexp"

.field private static final FACTORY:Lorg/apache/tools/ant/util/regexp/RegexpFactory;


# instance fields
.field private alreadyInit:Z

.field private myPattern:Ljava/lang/String;

.field private regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

.field private setPatternPending:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    new-instance v0, Lorg/apache/tools/ant/util/regexp/RegexpFactory;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/regexp/RegexpFactory;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/RegularExpression;->FACTORY:Lorg/apache/tools/ant/util/regexp/RegexpFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 75
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 62
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/RegularExpression;->alreadyInit:Z

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 70
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/RegularExpression;->setPatternPending:Z

    .line 76
    return-void
.end method

.method private init(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 79
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->alreadyInit:Z

    if-nez v0, :cond_0

    .line 80
    sget-object v0, Lorg/apache/tools/ant/types/RegularExpression;->FACTORY:Lorg/apache/tools/ant/util/regexp/RegexpFactory;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->newRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->alreadyInit:Z

    .line 83
    :cond_0
    return-void
.end method

.method private setPattern()V
    .locals 2

    .prologue
    .line 85
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->setPatternPending:Z

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    iget-object v1, p0, Lorg/apache/tools/ant/types/RegularExpression;->myPattern:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/apache/tools/ant/util/regexp/Regexp;->setPattern(Ljava/lang/String;)V

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->setPatternPending:Z

    .line 89
    :cond_0
    return-void
.end method


# virtual methods
.method public getPattern(Lorg/apache/tools/ant/Project;)Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->init(Lorg/apache/tools/ant/Project;)V

    .line 111
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RegularExpression;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/RegularExpression;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->getPattern(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v0

    .line 115
    :goto_0
    return-object v0

    .line 114
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern()V

    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    invoke-interface {v0}, Lorg/apache/tools/ant/util/regexp/Regexp;->getPattern()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/RegularExpression;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 139
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/RegularExpression;

    return-object v0
.end method

.method public getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 124
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->init(Lorg/apache/tools/ant/Project;)V

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RegularExpression;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/RegularExpression;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v0

    .line 129
    :goto_0
    return-object v0

    .line 128
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern()V

    .line 129
    iget-object v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    goto :goto_0
.end method

.method public setPattern(Ljava/lang/String;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    if-nez v0, :cond_0

    .line 96
    iput-object p1, p0, Lorg/apache/tools/ant/types/RegularExpression;->myPattern:Ljava/lang/String;

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->setPatternPending:Z

    .line 101
    :goto_0
    return-void

    .line 99
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/RegularExpression;->regexp:Lorg/apache/tools/ant/util/regexp/Regexp;

    invoke-interface {v0, p1}, Lorg/apache/tools/ant/util/regexp/Regexp;->setPattern(Ljava/lang/String;)V

    goto :goto_0
.end method
