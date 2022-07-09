.class public Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
.super Ljava/lang/Object;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PackageName"
.end annotation


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 254
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->name:Ljava/lang/String;

    .line 255
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 271
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
