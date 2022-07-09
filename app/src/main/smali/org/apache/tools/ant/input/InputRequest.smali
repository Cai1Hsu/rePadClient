.class public Lorg/apache/tools/ant/input/InputRequest;
.super Ljava/lang/Object;
.source "InputRequest.java"


# instance fields
.field private defaultValue:Ljava/lang/String;

.field private input:Ljava/lang/String;

.field private final prompt:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "prompt"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    if-nez p1, :cond_0

    .line 37
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "prompt must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/input/InputRequest;->prompt:Ljava/lang/String;

    .line 41
    return-void
.end method


# virtual methods
.method public getDefaultValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/input/InputRequest;->defaultValue:Ljava/lang/String;

    return-object v0
.end method

.method public getInput()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/tools/ant/input/InputRequest;->input:Ljava/lang/String;

    return-object v0
.end method

.method public getPrompt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/apache/tools/ant/input/InputRequest;->prompt:Ljava/lang/String;

    return-object v0
.end method

.method public isInputValid()Z
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method public setDefaultValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "d"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/apache/tools/ant/input/InputRequest;->defaultValue:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public setInput(Ljava/lang/String;)V
    .locals 0
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lorg/apache/tools/ant/input/InputRequest;->input:Ljava/lang/String;

    .line 57
    return-void
.end method
