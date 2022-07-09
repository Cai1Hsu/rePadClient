.class public Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;
.super Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Javadoc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DocletInfo"
.end annotation


# instance fields
.field private params:Ljava/util/Vector;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;

    .prologue
    .line 214
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;-><init>()V

    .line 217
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->params:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public createParam()Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;
    .locals 2

    .prologue
    .line 225
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->this$0:Lorg/apache/tools/ant/taskdefs/Javadoc;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    .line 226
    .local v0, "param":Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->params:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 228
    return-object v0
.end method

.method public getParams()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->params:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method
