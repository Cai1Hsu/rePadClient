.class public abstract Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "ConditionBase.java"


# instance fields
.field private conditions:Ljava/util/Vector;

.field private taskName:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 40
    const-string/jumbo v0, "condition"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->taskName:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    .line 51
    const-string/jumbo v0, "component"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->taskName:Ljava/lang/String;

    .line 52
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "taskName"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 40
    const-string/jumbo v0, "condition"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->taskName:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    .line 60
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->taskName:Ljava/lang/String;

    .line 61
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/taskdefs/condition/Condition;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/taskdefs/condition/Condition;

    .prologue
    .line 277
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 278
    return-void
.end method

.method public addAnd(Lorg/apache/tools/ant/taskdefs/condition/And;)V
    .locals 1
    .param p1, "a"    # Lorg/apache/tools/ant/taskdefs/condition/And;

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 151
    return-void
.end method

.method public addAvailable(Lorg/apache/tools/ant/taskdefs/Available;)V
    .locals 1
    .param p1, "a"    # Lorg/apache/tools/ant/taskdefs/Available;

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 111
    return-void
.end method

.method public addChecksum(Lorg/apache/tools/ant/taskdefs/Checksum;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/taskdefs/Checksum;

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 121
    return-void
.end method

.method public addContains(Lorg/apache/tools/ant/taskdefs/condition/Contains;)V
    .locals 1
    .param p1, "test"    # Lorg/apache/tools/ant/taskdefs/condition/Contains;

    .prologue
    .line 230
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 231
    return-void
.end method

.method public addEquals(Lorg/apache/tools/ant/taskdefs/condition/Equals;)V
    .locals 1
    .param p1, "e"    # Lorg/apache/tools/ant/taskdefs/condition/Equals;

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 171
    return-void
.end method

.method public addFilesMatch(Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;)V
    .locals 1
    .param p1, "test"    # Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;

    .prologue
    .line 220
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 221
    return-void
.end method

.method public addHttp(Lorg/apache/tools/ant/taskdefs/condition/Http;)V
    .locals 1
    .param p1, "h"    # Lorg/apache/tools/ant/taskdefs/condition/Http;

    .prologue
    .line 200
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 201
    return-void
.end method

.method public addIsFalse(Lorg/apache/tools/ant/taskdefs/condition/IsFalse;)V
    .locals 1
    .param p1, "test"    # Lorg/apache/tools/ant/taskdefs/condition/IsFalse;

    .prologue
    .line 250
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 251
    return-void
.end method

.method public addIsFileSelected(Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;)V
    .locals 1
    .param p1, "test"    # Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;

    .prologue
    .line 268
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 269
    return-void
.end method

.method public addIsReference(Lorg/apache/tools/ant/taskdefs/condition/IsReference;)V
    .locals 1
    .param p1, "i"    # Lorg/apache/tools/ant/taskdefs/condition/IsReference;

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 261
    return-void
.end method

.method public addIsSet(Lorg/apache/tools/ant/taskdefs/condition/IsSet;)V
    .locals 1
    .param p1, "i"    # Lorg/apache/tools/ant/taskdefs/condition/IsSet;

    .prologue
    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 191
    return-void
.end method

.method public addIsTrue(Lorg/apache/tools/ant/taskdefs/condition/IsTrue;)V
    .locals 1
    .param p1, "test"    # Lorg/apache/tools/ant/taskdefs/condition/IsTrue;

    .prologue
    .line 240
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 241
    return-void
.end method

.method public addNot(Lorg/apache/tools/ant/taskdefs/condition/Not;)V
    .locals 1
    .param p1, "n"    # Lorg/apache/tools/ant/taskdefs/condition/Not;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 141
    return-void
.end method

.method public addOr(Lorg/apache/tools/ant/taskdefs/condition/Or;)V
    .locals 1
    .param p1, "o"    # Lorg/apache/tools/ant/taskdefs/condition/Or;

    .prologue
    .line 160
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 161
    return-void
.end method

.method public addOs(Lorg/apache/tools/ant/taskdefs/condition/Os;)V
    .locals 1
    .param p1, "o"    # Lorg/apache/tools/ant/taskdefs/condition/Os;

    .prologue
    .line 180
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 181
    return-void
.end method

.method public addSocket(Lorg/apache/tools/ant/taskdefs/condition/Socket;)V
    .locals 1
    .param p1, "s"    # Lorg/apache/tools/ant/taskdefs/condition/Socket;

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 211
    return-void
.end method

.method public addUptodate(Lorg/apache/tools/ant/taskdefs/UpToDate;)V
    .locals 1
    .param p1, "u"    # Lorg/apache/tools/ant/taskdefs/UpToDate;

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 131
    return-void
.end method

.method protected countConditions()I
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method protected final getConditions()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->conditions:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getTaskName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->taskName:Ljava/lang/String;

    return-object v0
.end method

.method public setTaskName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;->taskName:Ljava/lang/String;

    .line 92
    return-void
.end method
