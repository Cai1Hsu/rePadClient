.class public Lorg/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument;
.super Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
.source "Javac.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javac;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImplementationSpecificArgument"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javac;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Javac;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javac;

    .prologue
    .line 1187
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument;->this$0:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-direct {p0}, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;-><init>()V

    return-void
.end method


# virtual methods
.method public setCompiler(Ljava/lang/String;)V
    .locals 0
    .param p1, "impl"    # Ljava/lang/String;

    .prologue
    .line 1194
    invoke-super {p0, p1}, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;->setImplementation(Ljava/lang/String;)V

    .line 1195
    return-void
.end method
