.class public Lorg/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument;
.super Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
.source "Rmic.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Rmic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImplementationSpecificArgument"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Rmic;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Rmic;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Rmic;

    .prologue
    .line 832
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument;->this$0:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-direct {p0}, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;-><init>()V

    return-void
.end method


# virtual methods
.method public setCompiler(Ljava/lang/String;)V
    .locals 0
    .param p1, "impl"    # Ljava/lang/String;

    .prologue
    .line 843
    invoke-super {p0, p1}, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;->setImplementation(Ljava/lang/String;)V

    .line 844
    return-void
.end method
