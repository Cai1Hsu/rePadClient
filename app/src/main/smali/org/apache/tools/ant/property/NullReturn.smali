.class public final Lorg/apache/tools/ant/property/NullReturn;
.super Ljava/lang/Object;
.source "NullReturn.java"


# static fields
.field public static final NULL:Lorg/apache/tools/ant/property/NullReturn;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    new-instance v0, Lorg/apache/tools/ant/property/NullReturn;

    invoke-direct {v0}, Lorg/apache/tools/ant/property/NullReturn;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/property/NullReturn;->NULL:Lorg/apache/tools/ant/property/NullReturn;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    const-string/jumbo v0, "null"

    return-object v0
.end method
