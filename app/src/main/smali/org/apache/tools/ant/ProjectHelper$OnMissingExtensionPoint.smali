.class public final Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;
.super Ljava/lang/Object;
.source "ProjectHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/ProjectHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "OnMissingExtensionPoint"
.end annotation


# static fields
.field public static final FAIL:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

.field public static final IGNORE:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

.field public static final WARN:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

.field private static final values:[Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 96
    new-instance v0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    const-string/jumbo v1, "fail"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->FAIL:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    .line 100
    new-instance v0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    const-string/jumbo v1, "warn"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->WARN:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    .line 104
    new-instance v0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    const-string/jumbo v1, "ignore"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->IGNORE:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    .line 107
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    const/4 v1, 0x0

    sget-object v2, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->FAIL:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->WARN:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->IGNORE:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->values:[Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->name:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 125
    if-nez p0, :cond_0

    .line 126
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 128
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->values:[Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 129
    sget-object v1, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->values:[Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 130
    sget-object v1, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->values:[Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    aget-object v1, v1, v0

    return-object v1

    .line 128
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 133
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unknown onMissingExtensionPoint "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->name:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->name:Ljava/lang/String;

    return-object v0
.end method
