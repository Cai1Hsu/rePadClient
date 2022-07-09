.class public Lorg/apache/tools/ant/filters/ReplaceTokens$Token;
.super Ljava/lang/Object;
.source "ReplaceTokens.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/ReplaceTokens;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Token"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 352
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 384
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens$Token;->key:Ljava/lang/String;

    return-object v0
.end method

.method public final getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 393
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ReplaceTokens$Token;->value:Ljava/lang/String;

    return-object v0
.end method

.method public final setKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 366
    iput-object p1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens$Token;->key:Ljava/lang/String;

    .line 367
    return-void
.end method

.method public final setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 375
    iput-object p1, p0, Lorg/apache/tools/ant/filters/ReplaceTokens$Token;->value:Ljava/lang/String;

    .line 376
    return-void
.end method
