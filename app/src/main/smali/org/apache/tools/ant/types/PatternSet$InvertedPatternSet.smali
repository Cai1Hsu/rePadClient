.class final Lorg/apache/tools/ant/types/PatternSet$InvertedPatternSet;
.super Lorg/apache/tools/ant/types/PatternSet;
.source "PatternSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/PatternSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "InvertedPatternSet"
.end annotation


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/types/PatternSet;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/types/PatternSet;

    .prologue
    .line 179
    invoke-direct {p0}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    .line 180
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/PatternSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PatternSet$InvertedPatternSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 181
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/PatternSet$InvertedPatternSet;->addConfiguredPatternset(Lorg/apache/tools/ant/types/PatternSet;)V

    .line 182
    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/types/PatternSet;Lorg/apache/tools/ant/types/PatternSet$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/types/PatternSet;
    .param p2, "x1"    # Lorg/apache/tools/ant/types/PatternSet$1;

    .prologue
    .line 178
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/PatternSet$InvertedPatternSet;-><init>(Lorg/apache/tools/ant/types/PatternSet;)V

    return-void
.end method


# virtual methods
.method public getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 187
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 184
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
