.class public Lorg/apache/tools/ant/taskdefs/Recorder;
.super Lorg/apache/tools/ant/Task;
.source "Recorder.java"

# interfaces
.implements Lorg/apache/tools/ant/SubBuildListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Recorder$VerbosityLevelChoices;,
        Lorg/apache/tools/ant/taskdefs/Recorder$ActionChoices;
    }
.end annotation


# static fields
.field private static recorderEntries:Ljava/util/Hashtable;


# instance fields
.field private append:Ljava/lang/Boolean;

.field private emacsMode:Z

.field private filename:Ljava/lang/String;

.field private loglevel:I

.field private start:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Recorder;->recorderEntries:Ljava/util/Hashtable;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 49
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 55
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->filename:Ljava/lang/String;

    .line 59
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->append:Ljava/lang/Boolean;

    .line 64
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->start:Ljava/lang/Boolean;

    .line 66
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->loglevel:I

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->emacsMode:Z

    .line 194
    return-void
.end method

.method private cleanup()V
    .locals 6

    .prologue
    .line 311
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Recorder;->recorderEntries:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Hashtable;

    .line 312
    .local v0, "entries":Ljava/util/Hashtable;
    invoke-virtual {v0}, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 313
    .local v2, "itEntries":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 314
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 315
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/RecorderEntry;

    .line 316
    .local v3, "re":Lorg/apache/tools/ant/taskdefs/RecorderEntry;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    if-ne v4, v5, :cond_0

    .line 317
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Recorder;->recorderEntries:Ljava/util/Hashtable;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 320
    .end local v1    # "entry":Ljava/util/Map$Entry;
    .end local v3    # "re":Lorg/apache/tools/ant/taskdefs/RecorderEntry;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, p0}, Lorg/apache/tools/ant/Project;->removeBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 321
    return-void
.end method


# virtual methods
.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 290
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->cleanup()V

    .line 291
    return-void
.end method

.method public buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 234
    return-void
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 147
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->filename:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 148
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "No filename specified"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 151
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "setting a recorder for name "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 155
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->filename:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Recorder;->getRecorder(Ljava/lang/String;Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/taskdefs/RecorderEntry;

    move-result-object v0

    .line 157
    .local v0, "recorder":Lorg/apache/tools/ant/taskdefs/RecorderEntry;
    iget v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->loglevel:I

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->setMessageOutputLevel(I)V

    .line 158
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->emacsMode:Z

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->setEmacsMode(Z)V

    .line 159
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->start:Ljava/lang/Boolean;

    if-eqz v1, :cond_1

    .line 160
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->start:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 161
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->reopenFile()V

    .line 162
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->start:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->setRecordState(Ljava/lang/Boolean;)V

    .line 168
    :cond_1
    :goto_0
    return-void

    .line 164
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->start:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->setRecordState(Ljava/lang/Boolean;)V

    .line 165
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->closeFile()V

    goto :goto_0
.end method

.method protected getRecorder(Ljava/lang/String;Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/taskdefs/RecorderEntry;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "proj"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 208
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Recorder;->recorderEntries:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 211
    .local v1, "o":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 213
    new-instance v0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;-><init>(Ljava/lang/String;)V

    .line 215
    .local v0, "entry":Lorg/apache/tools/ant/taskdefs/RecorderEntry;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->append:Ljava/lang/Boolean;

    if-nez v2, :cond_0

    .line 216
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->openFile(Z)V

    .line 220
    :goto_0
    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 221
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Recorder;->recorderEntries:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    :goto_1
    return-object v0

    .line 218
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->append:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->openFile(Z)V

    goto :goto_0

    .end local v0    # "entry":Lorg/apache/tools/ant/taskdefs/RecorderEntry;
    :cond_1
    move-object v0, v1

    .line 223
    check-cast v0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;

    .restart local v0    # "entry":Lorg/apache/tools/ant/taskdefs/RecorderEntry;
    goto :goto_1
.end method

.method public init()V
    .locals 1

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 82
    return-void
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 282
    return-void
.end method

.method public setAction(Lorg/apache/tools/ant/taskdefs/Recorder$ActionChoices;)V
    .locals 2
    .param p1, "action"    # Lorg/apache/tools/ant/taskdefs/Recorder$ActionChoices;

    .prologue
    .line 104
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Recorder$ActionChoices;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "start"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->start:Ljava/lang/Boolean;

    .line 109
    :goto_0
    return-void

    .line 107
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->start:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setAppend(Z)V
    .locals 1
    .param p1, "append"    # Z

    .prologue
    .line 117
    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->append:Ljava/lang/Boolean;

    .line 118
    return-void

    .line 117
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setEmacsMode(Z)V
    .locals 0
    .param p1, "emacsMode"    # Z

    .prologue
    .line 126
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->emacsMode:Z

    .line 127
    return-void
.end method

.method public setLoglevel(Lorg/apache/tools/ant/taskdefs/Recorder$VerbosityLevelChoices;)V
    .locals 1
    .param p1, "level"    # Lorg/apache/tools/ant/taskdefs/Recorder$VerbosityLevelChoices;

    .prologue
    .line 136
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Recorder$VerbosityLevelChoices;->getLevel()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->loglevel:I

    .line 137
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fname"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Recorder;->filename:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public subBuildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 300
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 301
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Recorder;->cleanup()V

    .line 303
    :cond_0
    return-void
.end method

.method public subBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 242
    return-void
.end method

.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 258
    return-void
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 250
    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 274
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 266
    return-void
.end method
