.class public Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;
.super Ljava/lang/Object;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SourceFile"
.end annotation


# instance fields
.field private file:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 287
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 294
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;->file:Ljava/io/File;

    .line 296
    return-void
.end method


# virtual methods
.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;->file:Ljava/io/File;

    return-object v0
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 304
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;->file:Ljava/io/File;

    .line 305
    return-void
.end method
