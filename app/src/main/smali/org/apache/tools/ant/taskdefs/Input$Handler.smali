.class public Lorg/apache/tools/ant/taskdefs/Input$Handler;
.super Lorg/apache/tools/ant/taskdefs/DefBase;
.source "Input.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Input;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Handler"
.end annotation


# instance fields
.field private classname:Ljava/lang/String;

.field private refid:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Input;

.field private type:Lorg/apache/tools/ant/taskdefs/Input$HandlerType;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Input;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Input;

    .prologue
    const/4 v0, 0x0

    .line 48
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->this$0:Lorg/apache/tools/ant/taskdefs/Input;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;-><init>()V

    .line 50
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->refid:Ljava/lang/String;

    .line 51
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->type:Lorg/apache/tools/ant/taskdefs/Input$HandlerType;

    .line 52
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->classname:Ljava/lang/String;

    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Input$Handler;)Lorg/apache/tools/ant/input/InputHandler;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Input$Handler;

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Input$Handler;->getInputHandler()Lorg/apache/tools/ant/input/InputHandler;

    move-result-object v0

    return-object v0
.end method

.method private getInputHandler()Lorg/apache/tools/ant/input/InputHandler;
    .locals 4

    .prologue
    .line 98
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->type:Lorg/apache/tools/ant/taskdefs/Input$HandlerType;

    if-eqz v1, :cond_0

    .line 99
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->type:Lorg/apache/tools/ant/taskdefs/Input$HandlerType;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Input$HandlerType;->access$000(Lorg/apache/tools/ant/taskdefs/Input$HandlerType;)Lorg/apache/tools/ant/input/InputHandler;

    move-result-object v1

    .line 110
    :goto_0
    return-object v1

    .line 101
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->refid:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 103
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Input$Handler;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->refid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/input/InputHandler;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->refid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " does not denote an InputHandler"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 109
    .end local v0    # "e":Ljava/lang/ClassCastException;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->classname:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 110
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->classname:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Input$Handler;->createLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    sget-object v1, Lorg/apache/tools/ant/taskdefs/Input;->class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;

    if-nez v1, :cond_2

    const-string/jumbo v1, "org.apache.tools.ant.input.InputHandler"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Input;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Input;->class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;

    :goto_1
    invoke-static {v2, v3, v1}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/input/InputHandler;

    goto :goto_0

    :cond_2
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Input;->class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;

    goto :goto_1

    .line 113
    :cond_3
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Must specify refid, classname or type"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getClassname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->classname:Ljava/lang/String;

    return-object v0
.end method

.method public getRefid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->refid:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lorg/apache/tools/ant/taskdefs/Input$HandlerType;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->type:Lorg/apache/tools/ant/taskdefs/Input$HandlerType;

    return-object v0
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->classname:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public setRefid(Ljava/lang/String;)V
    .locals 0
    .param p1, "refid"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->refid:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public setType(Lorg/apache/tools/ant/taskdefs/Input$HandlerType;)V
    .locals 0
    .param p1, "type"    # Lorg/apache/tools/ant/taskdefs/Input$HandlerType;

    .prologue
    .line 88
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input$Handler;->type:Lorg/apache/tools/ant/taskdefs/Input$HandlerType;

    .line 89
    return-void
.end method
