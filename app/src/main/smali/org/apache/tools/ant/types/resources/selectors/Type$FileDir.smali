.class public Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Type.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/resources/selectors/Type;
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
    .line 47
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "file"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "dir"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "any"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;->VALUES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 60
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;->setValue(Ljava/lang/String;)V

    .line 61
    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lorg/apache/tools/ant/types/resources/selectors/Type$FileDir;->VALUES:[Ljava/lang/String;

    return-object v0
.end method
