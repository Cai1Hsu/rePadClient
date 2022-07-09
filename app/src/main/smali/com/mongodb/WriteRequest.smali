.class abstract Lcom/mongodb/WriteRequest;
.super Ljava/lang/Object;
.source "WriteRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/WriteRequest$Type;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method


# virtual methods
.method public abstract getType()Lcom/mongodb/WriteRequest$Type;
.end method
