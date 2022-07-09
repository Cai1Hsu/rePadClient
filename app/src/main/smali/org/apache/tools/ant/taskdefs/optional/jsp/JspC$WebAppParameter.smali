.class public Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;
.super Ljava/lang/Object;
.source "JspC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WebAppParameter"
.end annotation


# instance fields
.field private directory:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 681
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 693
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;->directory:Ljava/io/File;

    return-object v0
.end method

.method public setBaseDir(Ljava/io/File;)V
    .locals 0
    .param p1, "directory"    # Ljava/io/File;

    .prologue
    .line 701
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;->directory:Ljava/io/File;

    .line 702
    return-void
.end method
