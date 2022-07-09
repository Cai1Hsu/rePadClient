.class public Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;
.super Ljava/lang/Object;
.source "Javah.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/Javah;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ClassArgument"
.end annotation


# instance fields
.field private name:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/Javah;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/Javah;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/Javah;

    .prologue
    .line 121
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;->this$0:Lorg/apache/tools/ant/taskdefs/optional/Javah;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 129
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;->name:Ljava/lang/String;

    .line 130
    return-void
.end method
