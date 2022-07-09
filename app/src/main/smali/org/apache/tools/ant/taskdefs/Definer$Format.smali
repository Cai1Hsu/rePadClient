.class public Lorg/apache/tools/ant/taskdefs/Definer$Format;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Definer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Definer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Format"
.end annotation


# static fields
.field public static final PROPERTIES:I = 0x0

.field public static final XML:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 135
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 144
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "properties"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "xml"

    aput-object v2, v0, v1

    return-object v0
.end method
