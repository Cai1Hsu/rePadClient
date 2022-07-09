.class public Lorg/apache/tools/ant/taskdefs/Available$FileDir;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Available.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Available;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileDir"
.end annotation


# static fields
.field private static final VALUES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 488
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "file"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "dir"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->VALUES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 486
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 495
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->VALUES:[Ljava/lang/String;

    return-object v0
.end method

.method public isDir()Z
    .locals 2

    .prologue
    .line 504
    const-string/jumbo v0, "dir"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isFile()Z
    .locals 2

    .prologue
    .line 513
    const-string/jumbo v0, "file"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
