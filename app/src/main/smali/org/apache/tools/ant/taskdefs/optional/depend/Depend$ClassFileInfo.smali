.class Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
.super Ljava/lang/Object;
.source "Depend.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ClassFileInfo"
.end annotation


# instance fields
.field private absoluteFile:Ljava/io/File;

.field private className:Ljava/lang/String;

.field private isUserWarned:Z

.field private sourceFile:Ljava/io/File;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->isUserWarned:Z

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$1;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;-><init>()V

    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->className:Ljava/lang/String;

    return-object v0
.end method

.method static access$002(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->className:Ljava/lang/String;

    return-object p1
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->absoluteFile:Ljava/io/File;

    return-object v0
.end method

.method static access$102(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/io/File;)Ljava/io/File;
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->absoluteFile:Ljava/io/File;

    return-object p1
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->sourceFile:Ljava/io/File;

    return-object v0
.end method

.method static access$202(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/io/File;)Ljava/io/File;
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->sourceFile:Ljava/io/File;

    return-object p1
.end method

.method static access$300(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .prologue
    .line 53
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->isUserWarned:Z

    return v0
.end method

.method static access$302(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .param p1, "x1"    # Z

    .prologue
    .line 53
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->isUserWarned:Z

    return p1
.end method
