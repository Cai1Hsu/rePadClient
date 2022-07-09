.class public Lorg/apache/tools/ant/types/resources/selectors/Type;
.super Ljava/lang/Object;
.source "Type.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;
    }
.end annotation


# static fields
.field public static final ANY:Lorg/apache/tools/ant/types/resources/selectors/Type;

.field private static final ANY_ATTR:Ljava/lang/String; = "any"

.field public static final DIR:Lorg/apache/tools/ant/types/resources/selectors/Type;

.field private static final DIR_ATTR:Ljava/lang/String; = "dir"

.field public static final FILE:Lorg/apache/tools/ant/types/resources/selectors/Type;

.field private static final FILE_ATTR:Ljava/lang/String; = "file"


# instance fields
.field private type:Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 35
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Type;

    new-instance v1, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    const-string/jumbo v2, "file"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/selectors/Type;-><init>(Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;)V

    sput-object v0, Lorg/apache/tools/ant/types/resources/selectors/Type;->FILE:Lorg/apache/tools/ant/types/resources/selectors/Type;

    .line 38
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Type;

    new-instance v1, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    const-string/jumbo v2, "dir"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/selectors/Type;-><init>(Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;)V

    sput-object v0, Lorg/apache/tools/ant/types/resources/selectors/Type;->DIR:Lorg/apache/tools/ant/types/resources/selectors/Type;

    .line 41
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Type;

    new-instance v1, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    const-string/jumbo v2, "any"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/selectors/Type;-><init>(Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;)V

    sput-object v0, Lorg/apache/tools/ant/types/resources/selectors/Type;->ANY:Lorg/apache/tools/ant/types/resources/selectors/Type;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Type;->type:Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;)V
    .locals 1
    .param p1, "fd"    # Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Type;->type:Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    .line 85
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/Type;->setType(Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;)V

    .line 86
    return-void
.end method


# virtual methods
.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 3
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    const/4 v1, 0x1

    .line 102
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/selectors/Type;->type:Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    if-nez v2, :cond_0

    .line 103
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The type attribute is required."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/selectors/Type;->type:Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;->getIndex()I

    move-result v0

    .line 106
    .local v0, "i":I
    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_2

    if-ne v0, v1, :cond_3

    :cond_1
    :goto_0
    return v1

    :cond_2
    if-eqz v0, :cond_1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setType(Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;)V
    .locals 0
    .param p1, "fd"    # Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    .prologue
    .line 93
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Type;->type:Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;

    .line 94
    return-void
.end method
