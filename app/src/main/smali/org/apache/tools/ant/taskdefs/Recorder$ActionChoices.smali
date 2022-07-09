.class public Lorg/apache/tools/ant/taskdefs/Recorder$ActionChoices;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Recorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Recorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ActionChoices"
.end annotation


# static fields
.field private static final VALUES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 178
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "start"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "stop"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Recorder$ActionChoices;->VALUES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 177
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Recorder$ActionChoices;->VALUES:[Ljava/lang/String;

    return-object v0
.end method
