.class public Lorg/apache/tools/ant/UnsupportedAttributeException;
.super Lorg/apache/tools/ant/BuildException;
.source "UnsupportedAttributeException.java"


# instance fields
.field private final attribute:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    .line 36
    iput-object p2, p0, Lorg/apache/tools/ant/UnsupportedAttributeException;->attribute:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public getAttribute()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/apache/tools/ant/UnsupportedAttributeException;->attribute:Ljava/lang/String;

    return-object v0
.end method
