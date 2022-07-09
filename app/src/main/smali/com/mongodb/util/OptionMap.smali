.class public Lcom/mongodb/util/OptionMap;
.super Ljava/util/TreeMap;
.source "OptionMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/TreeMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/util/TreeMap;-><init>()V

    return-void
.end method


# virtual methods
.method public getInt(Ljava/lang/String;I)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "def"    # I

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mongodb/util/OptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p2}, Lcom/mongodb/util/StringParseUtil;->parseIfInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method
