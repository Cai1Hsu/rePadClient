.class public Lorg/apache/tools/ant/UnsupportedElementException;
.super Lorg/apache/tools/ant/BuildException;
.source "UnsupportedElementException.java"


# instance fields
.field private final element:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "element"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    .line 45
    iput-object p2, p0, Lorg/apache/tools/ant/UnsupportedElementException;->element:Ljava/lang/String;

    .line 46
    return-void
.end method


# virtual methods
.method public getElement()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/tools/ant/UnsupportedElementException;->element:Ljava/lang/String;

    return-object v0
.end method
