.class public Lorg/apache/tools/ant/taskdefs/Input;
.super Lorg/apache/tools/ant/Task;
.source "Input.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Input$HandlerType;,
        Lorg/apache/tools/ant/taskdefs/Input$Handler;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;


# instance fields
.field private addproperty:Ljava/lang/String;

.field private defaultvalue:Ljava/lang/String;

.field private handler:Lorg/apache/tools/ant/taskdefs/Input$Handler;

.field private message:Ljava/lang/String;

.field private messageAttribute:Z

.field private validargs:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 204
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 140
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input;->validargs:Ljava/lang/String;

    .line 141
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input;->message:Ljava/lang/String;

    .line 142
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input;->addproperty:Ljava/lang/String;

    .line 143
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input;->defaultvalue:Ljava/lang/String;

    .line 144
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input;->handler:Lorg/apache/tools/ant/taskdefs/Input$Handler;

    .line 205
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 111
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 195
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Input;->messageAttribute:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    :goto_0
    return-void

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Input;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Input;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input;->message:Ljava/lang/String;

    goto :goto_0
.end method

.method public createHandler()Lorg/apache/tools/ant/taskdefs/Input$Handler;
    .locals 2

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input;->handler:Lorg/apache/tools/ant/taskdefs/Input$Handler;

    if-eqz v0, :cond_0

    .line 250
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define > 1 nested input handler"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 253
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Input$Handler;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Input$Handler;-><init>(Lorg/apache/tools/ant/taskdefs/Input;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input;->handler:Lorg/apache/tools/ant/taskdefs/Input$Handler;

    .line 254
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Input;->handler:Lorg/apache/tools/ant/taskdefs/Input$Handler;

    return-object v0
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 212
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->addproperty:Ljava/lang/String;

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Input;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Input;->addproperty:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 214
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "skipping "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Input;->getTaskName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " as property "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Input;->addproperty:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " has already been set."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/Input;->log(Ljava/lang/String;)V

    .line 242
    :cond_0
    :goto_0
    return-void

    .line 219
    :cond_1
    const/4 v2, 0x0

    .line 220
    .local v2, "request":Lorg/apache/tools/ant/input/InputRequest;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->validargs:Ljava/lang/String;

    if-eqz v4, :cond_4

    .line 221
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->validargs:Ljava/lang/String;

    const/16 v5, 0x2c

    invoke-static {v4, v5}, Lorg/apache/tools/ant/util/StringUtils;->split(Ljava/lang/String;I)Ljava/util/Vector;

    move-result-object v0

    .line 222
    .local v0, "accept":Ljava/util/Vector;
    new-instance v2, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;

    .end local v2    # "request":Lorg/apache/tools/ant/input/InputRequest;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->message:Ljava/lang/String;

    invoke-direct {v2, v4, v0}, Lorg/apache/tools/ant/input/MultipleChoiceInputRequest;-><init>(Ljava/lang/String;Ljava/util/Vector;)V

    .line 226
    .end local v0    # "accept":Ljava/util/Vector;
    .restart local v2    # "request":Lorg/apache/tools/ant/input/InputRequest;
    :goto_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->defaultvalue:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/input/InputRequest;->setDefaultValue(Ljava/lang/String;)V

    .line 228
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->handler:Lorg/apache/tools/ant/taskdefs/Input$Handler;

    if-nez v4, :cond_5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Input;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/Project;->getInputHandler()Lorg/apache/tools/ant/input/InputHandler;

    move-result-object v1

    .line 232
    .local v1, "h":Lorg/apache/tools/ant/input/InputHandler;
    :goto_2
    invoke-interface {v1, v2}, Lorg/apache/tools/ant/input/InputHandler;->handleInput(Lorg/apache/tools/ant/input/InputRequest;)V

    .line 234
    invoke-virtual {v2}, Lorg/apache/tools/ant/input/InputRequest;->getInput()Ljava/lang/String;

    move-result-object v3

    .line 235
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3

    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->defaultvalue:Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 237
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Input;->defaultvalue:Ljava/lang/String;

    .line 239
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->addproperty:Ljava/lang/String;

    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    .line 240
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Input;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Input;->addproperty:Ljava/lang/String;

    invoke-virtual {v4, v5, v3}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 224
    .end local v1    # "h":Lorg/apache/tools/ant/input/InputHandler;
    .end local v3    # "value":Ljava/lang/String;
    :cond_4
    new-instance v2, Lorg/apache/tools/ant/input/InputRequest;

    .end local v2    # "request":Lorg/apache/tools/ant/input/InputRequest;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->message:Ljava/lang/String;

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/input/InputRequest;-><init>(Ljava/lang/String;)V

    .restart local v2    # "request":Lorg/apache/tools/ant/input/InputRequest;
    goto :goto_1

    .line 228
    :cond_5
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Input;->handler:Lorg/apache/tools/ant/taskdefs/Input$Handler;

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/Input$Handler;->access$100(Lorg/apache/tools/ant/taskdefs/Input$Handler;)Lorg/apache/tools/ant/input/InputHandler;

    move-result-object v1

    goto :goto_2
.end method

.method public setAddproperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "addproperty"    # Ljava/lang/String;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input;->addproperty:Ljava/lang/String;

    .line 168
    return-void
.end method

.method public setDefaultvalue(Ljava/lang/String;)V
    .locals 0
    .param p1, "defaultvalue"    # Ljava/lang/String;

    .prologue
    .line 187
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input;->defaultvalue:Ljava/lang/String;

    .line 188
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 175
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input;->message:Ljava/lang/String;

    .line 176
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Input;->messageAttribute:Z

    .line 177
    return-void
.end method

.method public setValidargs(Ljava/lang/String;)V
    .locals 0
    .param p1, "validargs"    # Ljava/lang/String;

    .prologue
    .line 156
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Input;->validargs:Ljava/lang/String;

    .line 157
    return-void
.end method
