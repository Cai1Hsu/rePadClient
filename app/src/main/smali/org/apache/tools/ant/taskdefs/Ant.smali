.class public Lorg/apache/tools/ant/taskdefs/Ant;
.super Lorg/apache/tools/ant/Task;
.source "Ant.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;,
        Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;,
        Lorg/apache/tools/ant/taskdefs/Ant$Reference;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$Project:Ljava/lang/Class;


# instance fields
.field private antFile:Ljava/lang/String;

.field private dir:Ljava/io/File;

.field private inheritAll:Z

.field private inheritRefs:Z

.field private newProject:Lorg/apache/tools/ant/Project;

.field private out:Ljava/io/PrintStream;

.field private output:Ljava/lang/String;

.field private properties:Ljava/util/Vector;

.field private propertySets:Ljava/util/Vector;

.field private references:Ljava/util/Vector;

.field private targetAttributeSet:Z

.field private targets:Ljava/util/Vector;

.field private useNativeBasedir:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Ant;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 122
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 72
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    .line 78
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 81
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritAll:Z

    .line 87
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritRefs:Z

    .line 90
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    .line 93
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->references:Ljava/util/Vector;

    .line 99
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    .line 102
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->propertySets:Ljava/util/Vector;

    .line 105
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targets:Ljava/util/Vector;

    .line 108
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targetAttributeSet:Z

    .line 117
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Ant;->useNativeBasedir:Z

    .line 124
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 3
    .param p1, "owner"    # Lorg/apache/tools/ant/Task;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 130
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 72
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    .line 78
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 81
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritAll:Z

    .line 87
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritRefs:Z

    .line 90
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    .line 93
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->references:Ljava/util/Vector;

    .line 99
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    .line 102
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->propertySets:Ljava/util/Vector;

    .line 105
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targets:Ljava/util/Vector;

    .line 108
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targetAttributeSet:Z

    .line 117
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Ant;->useNativeBasedir:Z

    .line 131
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 132
    return-void
.end method

.method private addAlmostAll(Ljava/util/Hashtable;Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;)V
    .locals 4
    .param p1, "props"    # Ljava/util/Hashtable;
    .param p2, "type"    # Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    .prologue
    .line 632
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 633
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 634
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 635
    .local v1, "key":Ljava/lang/String;
    const-string/jumbo v3, "basedir"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "ant.file"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 641
    invoke-virtual {p1, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 642
    .local v2, "value":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->access$100()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    move-result-object v3

    if-ne p2, v3, :cond_1

    .line 644
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 646
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 648
    :cond_1
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->access$000()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    move-result-object v3

    if-ne p2, v3, :cond_2

    .line 649
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3, v1, v2}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 650
    :cond_2
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->access$200()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    move-result-object v3

    if-ne p2, v3, :cond_0

    .line 651
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3, v1, v2}, Lorg/apache/tools/ant/Project;->setInheritedProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 654
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method private addReferences()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 527
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getReferences()Ljava/util/Hashtable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Hashtable;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Hashtable;

    .line 529
    .local v5, "thisReferences":Ljava/util/Hashtable;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getReferences()Ljava/util/Hashtable;

    move-result-object v2

    .line 531
    .local v2, "newReferences":Ljava/util/Hashtable;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->references:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    if-lez v7, :cond_3

    .line 532
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->references:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 533
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/Ant$Reference;

    .line 534
    .local v3, "ref":Lorg/apache/tools/ant/taskdefs/Ant$Reference;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Ant$Reference;->getRefId()Ljava/lang/String;

    move-result-object v4

    .line 535
    .local v4, "refid":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 536
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "the refid attribute is required for reference elements"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 539
    :cond_0
    invoke-virtual {v5, v4}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 540
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Parent project doesn\'t contain any reference \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 546
    :cond_1
    invoke-virtual {v5, v4}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Ant$Reference;->getToRefid()Ljava/lang/String;

    move-result-object v6

    .line 548
    .local v6, "toRefid":Ljava/lang/String;
    if-nez v6, :cond_2

    .line 549
    move-object v6, v4

    .line 551
    :cond_2
    invoke-direct {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/Ant;->copyReference(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 557
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v3    # "ref":Lorg/apache/tools/ant/taskdefs/Ant$Reference;
    .end local v4    # "refid":Ljava/lang/String;
    .end local v6    # "toRefid":Ljava/lang/String;
    :cond_3
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritRefs:Z

    if-eqz v7, :cond_5

    .line 558
    invoke-virtual {v5}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .restart local v0    # "e":Ljava/util/Enumeration;
    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 559
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 560
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 563
    invoke-direct {p0, v1, v1}, Lorg/apache/tools/ant/taskdefs/Ant;->copyReference(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/Project;->inheritIDReferences(Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 567
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "key":Ljava/lang/String;
    :cond_5
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 605
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

.method private copyReference(Ljava/lang/String;Ljava/lang/String;)V
    .locals 11
    .param p1, "oldKey"    # Ljava/lang/String;
    .param p2, "newKey"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    .line 579
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v7, p1}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 580
    .local v5, "orig":Ljava/lang/Object;
    if-nez v5, :cond_0

    .line 581
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "No object referenced by "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ". Can\'t copy to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v9}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;I)V

    .line 619
    :goto_0
    return-void

    .line 587
    :cond_0
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 588
    .local v0, "c":Ljava/lang/Class;
    move-object v2, v5

    .line 590
    .local v2, "copy":Ljava/lang/Object;
    :try_start_0
    const-string/jumbo v7, "clone"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Class;

    invoke-virtual {v0, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 591
    .local v1, "cloneM":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_1

    .line 592
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v1, v5, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 593
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Adding clone of reference "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x4

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 600
    .end local v1    # "cloneM":Ljava/lang/reflect/Method;
    :cond_1
    :goto_1
    instance-of v7, v2, Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v7, :cond_3

    move-object v7, v2

    .line 601
    check-cast v7, Lorg/apache/tools/ant/ProjectComponent;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/ProjectComponent;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 618
    :cond_2
    :goto_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v7, p2, v2}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 604
    :cond_3
    :try_start_1
    const-string/jumbo v8, "setProject"

    const/4 v7, 0x1

    new-array v9, v7, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v7, Lorg/apache/tools/ant/taskdefs/Ant;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v7, :cond_4

    const-string/jumbo v7, "org.apache.tools.ant.Project"

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/Ant;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/tools/ant/taskdefs/Ant;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_3
    aput-object v7, v9, v10

    invoke-virtual {v0, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 606
    .local v6, "setProjectM":Ljava/lang/reflect/Method;
    if-eqz v6, :cond_2

    .line 607
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    aput-object v9, v7, v8

    invoke-virtual {v6, v2, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 609
    .end local v6    # "setProjectM":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v7

    goto :goto_2

    .line 604
    :cond_4
    sget-object v7, Lorg/apache/tools/ant/taskdefs/Ant;->class$org$apache$tools$ant$Project:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 612
    :catch_1
    move-exception v3

    .line 613
    .local v3, "e2":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Error setting new project instance for reference with id "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 615
    .local v4, "msg":Ljava/lang/String;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v7, v4, v3, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 595
    .end local v3    # "e2":Ljava/lang/Exception;
    .end local v4    # "msg":Ljava/lang/String;
    :catch_2
    move-exception v7

    goto :goto_1
.end method

.method private getBuildListeners()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 767
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBuildListeners()Ljava/util/Vector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method private initializeProject()V
    .locals 9

    .prologue
    .line 193
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getInputHandler()Lorg/apache/tools/ant/input/InputHandler;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/Project;->setInputHandler(Lorg/apache/tools/ant/input/InputHandler;)V

    .line 195
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getBuildListeners()Ljava/util/Iterator;

    move-result-object v2

    .line 196
    .local v2, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 197
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/BuildListener;

    invoke-virtual {v7, v6}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    goto :goto_0

    .line 200
    :cond_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 201
    const/4 v4, 0x0

    .line 202
    .local v4, "outfile":Ljava/io/File;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    if-eqz v6, :cond_2

    .line 203
    sget-object v6, Lorg/apache/tools/ant/taskdefs/Ant;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 208
    :goto_1
    :try_start_0
    new-instance v6, Ljava/io/PrintStream;

    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v7}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    .line 209
    new-instance v3, Lorg/apache/tools/ant/DefaultLogger;

    invoke-direct {v3}, Lorg/apache/tools/ant/DefaultLogger;-><init>()V

    .line 210
    .local v3, "logger":Lorg/apache/tools/ant/DefaultLogger;
    const/4 v6, 0x2

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/DefaultLogger;->setMessageOutputLevel(I)V

    .line 211
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/DefaultLogger;->setOutputPrintStream(Ljava/io/PrintStream;)V

    .line 212
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/DefaultLogger;->setErrorPrintStream(Ljava/io/PrintStream;)V

    .line 213
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v6, v3}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    .end local v3    # "logger":Lorg/apache/tools/ant/DefaultLogger;
    .end local v4    # "outfile":Ljava/io/File;
    :cond_1
    :goto_2
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->useNativeBasedir:Z

    if-eqz v6, :cond_3

    .line 220
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Project;->getUserProperties()Ljava/util/Hashtable;

    move-result-object v6

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->access$000()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Ant;->addAlmostAll(Ljava/util/Hashtable;Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;)V

    .line 225
    :goto_3
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritAll:Z

    if-nez v6, :cond_4

    .line 228
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v6}, Lorg/apache/tools/ant/Project;->initProperties()V

    .line 235
    :goto_4
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Ant;->propertySets:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 236
    .local v0, "e":Ljava/util/Enumeration;
    :goto_5
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 237
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/PropertySet;

    .line 238
    .local v5, "ps":Lorg/apache/tools/ant/types/PropertySet;
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v6

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->access$100()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Ant;->addAlmostAll(Ljava/util/Hashtable;Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;)V

    goto :goto_5

    .line 205
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v5    # "ps":Lorg/apache/tools/ant/types/PropertySet;
    .restart local v4    # "outfile":Ljava/io/File;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    goto :goto_1

    .line 214
    :catch_0
    move-exception v1

    .line 215
    .local v1, "ex":Ljava/io/IOException;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Ant: Can\'t set output to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 222
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v4    # "outfile":Ljava/io/File;
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/Project;->copyUserProperties(Lorg/apache/tools/ant/Project;)V

    goto :goto_3

    .line 232
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v6

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->access$100()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Ant;->addAlmostAll(Ljava/util/Hashtable;Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;)V

    goto :goto_4

    .line 240
    .restart local v0    # "e":Ljava/util/Enumeration;
    :cond_5
    return-void
.end method

.method private overrideProperties()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 494
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 495
    .local v3, "set":Ljava/util/Set;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_2

    .line 496
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/Property;

    .line 497
    .local v2, "p":Lorg/apache/tools/ant/taskdefs/Property;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Property;->getName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Property;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 498
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Property;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 499
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;

    .line 495
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 501
    :cond_1
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Property;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 505
    .end local v2    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 506
    .local v0, "e":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 507
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/Property;

    .line 508
    .restart local v2    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Property;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 509
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Property;->execute()V

    goto :goto_2

    .line 511
    .end local v2    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    :cond_3
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Ant;->useNativeBasedir:Z

    if-eqz v4, :cond_4

    .line 512
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/Project;->getInheritedProperties()Ljava/util/Hashtable;

    move-result-object v4

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;->access$200()Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Ant;->addAlmostAll(Ljava/util/Hashtable;Lorg/apache/tools/ant/taskdefs/Ant$PropertyType;)V

    .line 517
    :goto_3
    return-void

    .line 515
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->copyInheritedProperties(Lorg/apache/tools/ant/Project;)V

    goto :goto_3
.end method

.method private reinit()V
    .locals 0

    .prologue
    .line 182
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->init()V

    .line 183
    return-void
.end method


# virtual methods
.method public addConfiguredTarget(Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;)V
    .locals 3
    .param p1, "t"    # Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;

    .prologue
    .line 730
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targetAttributeSet:Z

    if-eqz v1, :cond_0

    .line 731
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "nested target is incompatible with the target attribute"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 734
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 735
    .local v0, "name":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 736
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "target name must not be empty"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 738
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targets:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 739
    return-void
.end method

.method public addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "ps"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 748
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->propertySets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 749
    return-void
.end method

.method public addReference(Lorg/apache/tools/ant/taskdefs/Ant$Reference;)V
    .locals 1
    .param p1, "ref"    # Lorg/apache/tools/ant/taskdefs/Ant$Reference;

    .prologue
    .line 721
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->references:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 722
    return-void
.end method

.method public createProperty()Lorg/apache/tools/ant/taskdefs/Property;
    .locals 3

    .prologue
    .line 708
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Property;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Property;-><init>(ZLorg/apache/tools/ant/Project;)V

    .line 709
    .local v0, "p":Lorg/apache/tools/ant/taskdefs/Property;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getNewProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Property;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 710
    const-string/jumbo v1, "property"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Property;->setTaskName(Ljava/lang/String;)V

    .line 711
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 712
    return-object v0
.end method

.method public execute()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 335
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    .line 336
    .local v15, "savedDir":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 337
    .local v14, "savedAntFile":Ljava/lang/String;
    new-instance v10, Lorg/apache/tools/ant/util/VectorSet;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->targets:Ljava/util/Vector;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-direct {v10, v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>(Ljava/util/Collection;)V

    .line 339
    .local v10, "locals":Ljava/util/Vector;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getNewProject()Lorg/apache/tools/ant/Project;

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    move-object/from16 v17, v0

    if-nez v17, :cond_0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritAll:Z

    move/from16 v17, v0

    if-eqz v17, :cond_0

    .line 342
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    .line 345
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->initializeProject()V

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    .line 348
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->useNativeBasedir:Z

    move/from16 v17, v0

    if-nez v17, :cond_1

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lorg/apache/tools/ant/Project;->setBaseDir(Ljava/io/File;)V

    .line 350
    if-eqz v15, :cond_1

    .line 352
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    const-string/jumbo v18, "basedir"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v19}, Lorg/apache/tools/ant/Project;->setInheritedProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    :cond_1
    :goto_0
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->overrideProperties()V

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    move-object/from16 v17, v0

    if-nez v17, :cond_2

    .line 363
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getDefaultBuildFile()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 366
    :cond_2
    sget-object v17, Lorg/apache/tools/ant/taskdefs/Ant;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v17 .. v19}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 367
    .local v8, "file":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 369
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "calling target(s) "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v17

    if-lez v17, :cond_4

    invoke-virtual {v10}, Ljava/util/Vector;->toString()Ljava/lang/String;

    move-result-object v17

    :goto_1
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string/jumbo v18, " in build file "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;I)V

    .line 372
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    const-string/jumbo v18, "ant.file"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v17 .. v19}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    const-string/jumbo v18, "ant.file"

    invoke-virtual/range {v17 .. v18}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 377
    .local v16, "thisAntFile":Ljava/lang/String;
    if-eqz v16, :cond_6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v17

    if-eqz v17, :cond_6

    .line 381
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, ""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_6

    .line 382
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getTaskName()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, "antcall"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_5

    .line 383
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v18, "antcall must not be used at the top level."

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 454
    .end local v8    # "file":Ljava/io/File;
    .end local v16    # "thisAntFile":Ljava/lang/String;
    :catchall_0
    move-exception v17

    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    .line 455
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    .line 456
    .local v6, "e":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v18

    if-eqz v18, :cond_e

    .line 457
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/apache/tools/ant/taskdefs/Property;

    .line 458
    .local v13, "p":Lorg/apache/tools/ant/taskdefs/Property;
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setProject(Lorg/apache/tools/ant/Project;)V

    goto :goto_2

    .line 357
    .end local v6    # "e":Ljava/util/Enumeration;
    .end local v13    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    :cond_3
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    goto/16 :goto_0

    .line 369
    .restart local v8    # "file":Ljava/io/File;
    :cond_4
    const-string/jumbo v17, "[default]"

    goto/16 :goto_1

    .line 386
    .restart local v16    # "thisAntFile":Ljava/lang/String;
    :cond_5
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getTaskName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " task at the"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " top level must not invoke"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " its own build file."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    :cond_6
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v8}, Lorg/apache/tools/ant/ProjectHelper;->configureProject(Lorg/apache/tools/ant/Project;Ljava/io/File;)V
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 399
    :try_start_3
    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v17

    if-nez v17, :cond_7

    .line 400
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->getDefaultTarget()Ljava/lang/String;

    move-result-object v5

    .line 401
    .local v5, "defaultTarget":Ljava/lang/String;
    if-eqz v5, :cond_7

    .line 402
    invoke-virtual {v10, v5}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 406
    .end local v5    # "defaultTarget":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    const-string/jumbo v18, "ant.file"

    invoke-virtual/range {v17 .. v18}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v18

    const-string/jumbo v19, "ant.file"

    invoke-virtual/range {v18 .. v19}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_b

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v17

    if-eqz v17, :cond_b

    .line 410
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v12

    .line 412
    .local v12, "owningTargetName":Ljava/lang/String;
    invoke-virtual {v10, v12}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 413
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getTaskName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " task calling "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "its own parent target."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 394
    .end local v12    # "owningTargetName":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 395
    .local v7, "ex":Lorg/apache/tools/ant/BuildException;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v7, v0}, Lorg/apache/tools/ant/ProjectHelper;->addLocationToBuildException(Lorg/apache/tools/ant/BuildException;Lorg/apache/tools/ant/Location;)Lorg/apache/tools/ant/BuildException;

    move-result-object v17

    throw v17

    .line 416
    .end local v7    # "ex":Lorg/apache/tools/ant/BuildException;
    .restart local v12    # "owningTargetName":Ljava/lang/String;
    :cond_8
    const/4 v4, 0x0

    .line 417
    .local v4, "circular":Z
    invoke-virtual {v10}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 418
    .local v9, "it":Ljava/util/Iterator;
    :goto_3
    if-nez v4, :cond_a

    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_a

    .line 419
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->getTargets()Ljava/util/Hashtable;

    move-result-object v17

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/tools/ant/Target;

    .line 421
    .local v11, "other":Lorg/apache/tools/ant/Target;
    if-eqz v11, :cond_9

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/Target;->dependsOn(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_9

    const/16 v17, 0x1

    :goto_4
    or-int v4, v4, v17

    goto :goto_3

    :cond_9
    const/16 v17, 0x0

    goto :goto_4

    .line 424
    .end local v11    # "other":Lorg/apache/tools/ant/Target;
    :cond_a
    if-eqz v4, :cond_b

    .line 425
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getTaskName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " task calling a target"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " that depends on"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " its parent target \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "\'."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 434
    .end local v4    # "circular":Z
    .end local v9    # "it":Ljava/util/Iterator;
    .end local v12    # "owningTargetName":Ljava/lang/String;
    :cond_b
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->addReferences()V

    .line 436
    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v17

    if-lez v17, :cond_d

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_c

    const-string/jumbo v17, ""

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v17

    if-nez v17, :cond_d

    .line 438
    :cond_c
    const/4 v3, 0x0

    .line 440
    .local v3, "be":Lorg/apache/tools/ant/BuildException;
    :try_start_4
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Entering "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string/jumbo v18, "..."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;I)V

    .line 441
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->fireSubBuildStarted()V

    .line 442
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lorg/apache/tools/ant/Project;->executeTargets(Ljava/util/Vector;)V
    :try_end_4
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 448
    :try_start_5
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Exiting "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string/jumbo v18, "."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;I)V

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/Project;->fireSubBuildFinished(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 454
    .end local v3    # "be":Lorg/apache/tools/ant/BuildException;
    :cond_d
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    .line 455
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->properties:Ljava/util/Vector;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    .line 456
    .restart local v6    # "e":Ljava/util/Enumeration;
    :goto_5
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v17

    if-eqz v17, :cond_10

    .line 457
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/apache/tools/ant/taskdefs/Property;

    .line 458
    .restart local v13    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setProject(Lorg/apache/tools/ant/Project;)V

    goto :goto_5

    .line 443
    .end local v6    # "e":Ljava/util/Enumeration;
    .end local v13    # "p":Lorg/apache/tools/ant/taskdefs/Property;
    .restart local v3    # "be":Lorg/apache/tools/ant/BuildException;
    :catch_1
    move-exception v7

    .line 444
    .restart local v7    # "ex":Lorg/apache/tools/ant/BuildException;
    :try_start_6
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v7, v0}, Lorg/apache/tools/ant/ProjectHelper;->addLocationToBuildException(Lorg/apache/tools/ant/BuildException;Lorg/apache/tools/ant/Location;)Lorg/apache/tools/ant/BuildException;

    move-result-object v3

    .line 446
    throw v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 448
    .end local v7    # "ex":Lorg/apache/tools/ant/BuildException;
    :catchall_1
    move-exception v17

    :try_start_7
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Exiting "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->log(Ljava/lang/String;I)V

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/Project;->fireSubBuildFinished(Ljava/lang/Throwable;)V

    .line 448
    throw v17
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 461
    .end local v3    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v8    # "file":Ljava/io/File;
    .end local v16    # "thisAntFile":Ljava/lang/String;
    .restart local v6    # "e":Ljava/util/Enumeration;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    move-object/from16 v18, v0

    if-eqz v18, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    move-object/from16 v18, v0

    if-eqz v18, :cond_f

    .line 463
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/PrintStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 468
    :cond_f
    :goto_6
    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    .line 469
    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 454
    throw v17

    .line 461
    .restart local v8    # "file":Ljava/io/File;
    .restart local v16    # "thisAntFile":Ljava/lang/String;
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    move-object/from16 v17, v0

    if-eqz v17, :cond_11

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    move-object/from16 v17, v0

    if-eqz v17, :cond_11

    .line 463
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Ant;->out:Ljava/io/PrintStream;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/PrintStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    .line 468
    :cond_11
    :goto_7
    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    .line 469
    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 471
    return-void

    .line 464
    :catch_2
    move-exception v17

    goto :goto_7

    .end local v8    # "file":Ljava/io/File;
    .end local v16    # "thisAntFile":Ljava/lang/String;
    :catch_3
    move-exception v18

    goto :goto_6
.end method

.method protected getDefaultBuildFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 483
    const-string/jumbo v0, "build.xml"

    return-object v0
.end method

.method protected getNewProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 757
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    if-nez v0, :cond_0

    .line 758
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->reinit()V

    .line 760
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public handleErrorFlush(Ljava/lang/String;)V
    .locals 2
    .param p1, "errorOutputToFlush"    # Ljava/lang/String;

    .prologue
    .line 322
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Project;->demuxFlush(Ljava/lang/String;Z)V

    .line 327
    :goto_0
    return-void

    .line 325
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleErrorOutput(Ljava/lang/String;)V
    .locals 2
    .param p1, "errorOutputToHandle"    # Ljava/lang/String;

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 307
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Project;->demuxOutput(Ljava/lang/String;Z)V

    .line 311
    :goto_0
    return-void

    .line 309
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleFlush(Ljava/lang/String;)V
    .locals 2
    .param p1, "toFlush"    # Ljava/lang/String;

    .prologue
    .line 289
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 290
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Project;->demuxFlush(Ljava/lang/String;Z)V

    .line 294
    :goto_0
    return-void

    .line 292
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleInput([BII)I
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/Project;->demuxInput([BII)I

    move-result v0

    .line 277
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/apache/tools/ant/Task;->handleInput([BII)I

    move-result v0

    goto :goto_0
.end method

.method public handleOutput(Ljava/lang/String;)V
    .locals 2
    .param p1, "outputToHandle"    # Ljava/lang/String;

    .prologue
    .line 251
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Project;->demuxOutput(Ljava/lang/String;Z)V

    .line 256
    :goto_0
    return-void

    .line 254
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public init()V
    .locals 1

    .prologue
    .line 167
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ant;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->createSubProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    .line 168
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->newProject:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->setJavaVersionProperty()V

    .line 169
    return-void
.end method

.method public setAntfile(Ljava/lang/String;)V
    .locals 0
    .param p1, "antFile"    # Ljava/lang/String;

    .prologue
    .line 676
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->antFile:Ljava/lang/String;

    .line 677
    return-void
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 664
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->dir:Ljava/io/File;

    .line 665
    return-void
.end method

.method public setInheritAll(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 151
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritAll:Z

    .line 152
    return-void
.end method

.method public setInheritRefs(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 160
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->inheritRefs:Z

    .line 161
    return-void
.end method

.method public setOutput(Ljava/lang/String;)V
    .locals 0
    .param p1, "outputFile"    # Ljava/lang/String;

    .prologue
    .line 699
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->output:Ljava/lang/String;

    .line 700
    return-void
.end method

.method public setTarget(Ljava/lang/String;)V
    .locals 2
    .param p1, "targetToAdd"    # Ljava/lang/String;

    .prologue
    .line 685
    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 686
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "target attribute must not be empty"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 688
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 689
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Ant;->targetAttributeSet:Z

    .line 690
    return-void
.end method

.method public setUseNativeBasedir(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 142
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Ant;->useNativeBasedir:Z

    .line 143
    return-void
.end method
