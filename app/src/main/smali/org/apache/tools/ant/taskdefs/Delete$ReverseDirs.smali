.class Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;
.super Ljava/lang/Object;
.source "Delete.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Delete;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReverseDirs"
.end annotation


# static fields
.field static final REVERSE:Ljava/util/Comparator;


# instance fields
.field private basedir:Ljava/io/File;

.field private dirs:[Ljava/lang/String;

.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Delete$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Delete$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->REVERSE:Ljava/util/Comparator;

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V
    .locals 2
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "basedir"    # Ljava/io/File;
    .param p3, "dirs"    # [Ljava/lang/String;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->project:Lorg/apache/tools/ant/Project;

    .line 94
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->basedir:Ljava/io/File;

    .line 95
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->dirs:[Ljava/lang/String;

    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->dirs:[Ljava/lang/String;

    sget-object v1, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->REVERSE:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 97
    return-void
.end method


# virtual methods
.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 99
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->project:Lorg/apache/tools/ant/Project;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->basedir:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->dirs:[Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->dirs:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method
