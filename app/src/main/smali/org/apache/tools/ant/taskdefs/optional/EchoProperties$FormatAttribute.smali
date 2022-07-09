.class public Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "EchoProperties.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FormatAttribute"
.end annotation


# instance fields
.field private formats:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 240
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 241
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "xml"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "text"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute;->formats:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute;->formats:[Ljava/lang/String;

    return-object v0
.end method
