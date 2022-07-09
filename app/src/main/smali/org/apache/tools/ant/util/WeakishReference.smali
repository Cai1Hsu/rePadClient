.class public Lorg/apache/tools/ant/util/WeakishReference;
.super Ljava/lang/Object;
.source "WeakishReference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/WeakishReference$HardReference;
    }
.end annotation


# instance fields
.field private weakref:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .param p1, "reference"    # Ljava/lang/Object;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/WeakishReference;->weakref:Ljava/lang/ref/WeakReference;

    .line 51
    return-void
.end method

.method public static createReference(Ljava/lang/Object;)Lorg/apache/tools/ant/util/WeakishReference;
    .locals 1
    .param p0, "object"    # Ljava/lang/Object;

    .prologue
    .line 70
    new-instance v0, Lorg/apache/tools/ant/util/WeakishReference;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/util/WeakishReference;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/tools/ant/util/WeakishReference;->weakref:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
