.class Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$1;
.super Ljava/lang/Object;
.source "IsLastModified.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;

.field private final val$pattern:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;
    .param p2, "val$pattern"    # Ljava/lang/String;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$1;->this$0:Lorg/apache/tools/ant/taskdefs/condition/IsLastModified;

    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$1;->val$pattern:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFallbackFormat()Ljava/text/DateFormat;
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPrimaryFormat()Ljava/text/DateFormat;
    .locals 2

    .prologue
    .line 73
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsLastModified$1;->val$pattern:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
