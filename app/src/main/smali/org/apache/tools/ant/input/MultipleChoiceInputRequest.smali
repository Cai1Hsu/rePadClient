.class public Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;
.super Lorg/apache/tools/ant/input/InputRequest;
.source "MultipleChoiceInputRequest.java"


# instance fields
.field private final choices:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Vector;)V
    .locals 2
    .param p1, "prompt"    # Ljava/lang/String;
    .param p2, "choices"    # Ljava/util/Vector;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/input/InputRequest;-><init>(Ljava/lang/String;)V

    .line 39
    if-nez p2, :cond_0

    .line 40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "choices must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0, p2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;->choices:Ljava/util/LinkedHashSet;

    .line 43
    return-void
.end method


# virtual methods
.method public getChoices()Ljava/util/Vector;
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;->choices:Ljava/util/LinkedHashSet;

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public isInputValid()Z
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;->choices:Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;->getInput()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    invoke-virtual {p0}, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;->getInput()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;->getDefaultValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
