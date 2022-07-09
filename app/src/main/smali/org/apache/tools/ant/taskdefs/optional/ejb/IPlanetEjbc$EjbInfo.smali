.class Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
.super Ljava/lang/Object;
.source "IPlanetEjbc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EjbInfo"
.end annotation


# instance fields
.field private beantype:Ljava/lang/String;

.field private cmp:Z

.field private cmpDescriptors:Ljava/util/List;

.field private hasession:Z

.field private home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

.field private iiop:Z

.field private implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

.field private name:Ljava/lang/String;

.field private primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

.field private remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 907
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 896
    const-string/jumbo v0, "entity"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    .line 897
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmp:Z

    .line 898
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->iiop:Z

    .line 899
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->hasession:Z

    .line 900
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmpDescriptors:Ljava/util/List;

    .line 908
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    .line 909
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;Ljava/io/File;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    .param p1, "x1"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
        }
    .end annotation

    .prologue
    .line 890
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->checkConfiguration(Ljava/io/File;)V

    return-void
.end method

.method private checkConfiguration(Ljava/io/File;)V
    .locals 4
    .param p1, "buildDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
        }
    .end annotation

    .prologue
    .line 1049
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    if-nez v0, :cond_0

    .line 1050
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "A home interface was not found for the "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " EJB."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v0

    .line 1053
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    if-nez v0, :cond_1

    .line 1054
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "A remote interface was not found for the "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " EJB."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v0

    .line 1057
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    if-nez v0, :cond_2

    .line 1058
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "An EJB implementation class was not found for the "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " EJB."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v0

    .line 1062
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    const-string/jumbo v1, "entity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    const-string/jumbo v1, "stateless"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    const-string/jumbo v1, "stateful"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1065
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The beantype found ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ") "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "isn\'t valid in the "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " EJB."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v0

    .line 1069
    :cond_3
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmp:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    const-string/jumbo v1, "entity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 1070
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "CMP stubs and skeletons may not be generated for a Session Bean -- the \"cmp\" attribute will be ignoredfor the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " EJB."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1075
    :cond_4
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->hasession:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    const-string/jumbo v1, "stateful"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 1076
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Highly available stubs and skeletons may only be generated for a Stateful Session Bean -- the \"hasession\" attribute will be ignored for the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " EJB."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1083
    :cond_5
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_6

    .line 1084
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The remote interface "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " could not be "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v0

    .line 1088
    :cond_6
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1089
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The home interface "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " could not be "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v0

    .line 1093
    :cond_7
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_8

    .line 1094
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The EJB implementation class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " could "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "not be found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v0

    .line 1098
    :cond_8
    return-void
.end method

.method private classesToGenerate()[Ljava/lang/String;
    .locals 11

    .prologue
    .line 1276
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->iiop:Z

    if-eqz v9, :cond_0

    const/16 v9, 0xf

    new-array v0, v9, [Ljava/lang/String;

    .line 1280
    .local v0, "classnames":[Ljava/lang/String;
    :goto_0
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1281
    .local v8, "remotePkg":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassName()Ljava/lang/String;

    move-result-object v7

    .line 1282
    .local v7, "remoteClass":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1283
    .local v2, "homePkg":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 1284
    .local v1, "homeClass":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1285
    .local v4, "implPkg":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedWithUnderscores()Ljava/lang/String;

    move-result-object v3

    .line 1286
    .local v3, "implFullClass":Ljava/lang/String;
    const/4 v5, 0x0

    .line 1288
    .local v5, "index":I
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .local v6, "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_fac_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    .line 1289
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "index":I
    .restart local v5    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_home_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v6

    .line 1290
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .restart local v6    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_skel_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    .line 1291
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "index":I
    .restart local v5    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_kcp_skel_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v6

    .line 1292
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .restart local v6    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_kcp_skel_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    .line 1293
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "index":I
    .restart local v5    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_kcp_stub_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v6

    .line 1294
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .restart local v6    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_kcp_stub_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    .line 1295
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "index":I
    .restart local v5    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_stub_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v6

    .line 1296
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .restart local v6    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_stub_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    .line 1298
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->iiop:Z

    if-nez v9, :cond_1

    move v5, v6

    .line 1317
    .end local v6    # "index":I
    .restart local v5    # "index":I
    :goto_1
    return-object v0

    .line 1276
    .end local v0    # "classnames":[Ljava/lang/String;
    .end local v1    # "homeClass":Ljava/lang/String;
    .end local v2    # "homePkg":Ljava/lang/String;
    .end local v3    # "implFullClass":Ljava/lang/String;
    .end local v4    # "implPkg":Ljava/lang/String;
    .end local v5    # "index":I
    .end local v7    # "remoteClass":Ljava/lang/String;
    .end local v8    # "remotePkg":Ljava/lang/String;
    :cond_0
    const/16 v9, 0x9

    new-array v0, v9, [Ljava/lang/String;

    goto/16 :goto_0

    .line 1302
    .restart local v0    # "classnames":[Ljava/lang/String;
    .restart local v1    # "homeClass":Ljava/lang/String;
    .restart local v2    # "homePkg":Ljava/lang/String;
    .restart local v3    # "implFullClass":Ljava/lang/String;
    .restart local v4    # "implPkg":Ljava/lang/String;
    .restart local v6    # "index":I
    .restart local v7    # "remoteClass":Ljava/lang/String;
    .restart local v8    # "remotePkg":Ljava/lang/String;
    :cond_1
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "index":I
    .restart local v5    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "org.omg.stub."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_Stub"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v6

    .line 1304
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .restart local v6    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "org.omg.stub."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_Stub"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    .line 1306
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "index":I
    .restart local v5    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "org.omg.stub."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_ejb_RmiCorbaBridge_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_Tie"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v6

    .line 1309
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .restart local v6    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "org.omg.stub."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_ejb_RmiCorbaBridge_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "_Tie"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    .line 1313
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "index":I
    .restart local v5    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_RmiCorbaBridge_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v6

    .line 1315
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "index":I
    .restart local v6    # "index":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "ejb_RmiCorbaBridge_"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v0, v5

    move v5, v6

    .line 1317
    .end local v6    # "index":I
    .restart local v5    # "index":I
    goto/16 :goto_1
.end method

.method private destClassesModified(Ljava/io/File;)J
    .locals 13
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 1232
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->classesToGenerate()[Ljava/lang/String;

    move-result-object v2

    .line 1233
    .local v2, "classnames":[Ljava/lang/String;
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 1234
    .local v4, "destClassesModified":J
    const/4 v0, 0x1

    .line 1240
    .local v0, "allClassesFound":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v9, v2

    if-ge v3, v9, :cond_2

    .line 1242
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    aget-object v10, v2, v3

    const/16 v11, 0x2e

    sget-char v12, Ljava/io/File;->separatorChar:C

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ".class"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 1244
    .local v8, "pathToClass":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1250
    .local v1, "classFile":Ljava/io/File;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$300(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/util/Hashtable;

    move-result-object v9

    invoke-virtual {v9, v8, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1252
    if-eqz v0, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_1

    const/4 v0, 0x1

    .line 1254
    :goto_1
    if-eqz v0, :cond_0

    .line 1255
    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    .line 1258
    .local v6, "fileMod":J
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 1240
    .end local v6    # "fileMod":J
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1252
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 1262
    .end local v1    # "classFile":Ljava/io/File;
    .end local v8    # "pathToClass":Ljava/lang/String;
    :cond_2
    if-eqz v0, :cond_3

    .end local v4    # "destClassesModified":J
    :goto_2
    return-wide v4

    .restart local v4    # "destClassesModified":J
    :cond_3
    const-wide/16 v4, -0x1

    goto :goto_2
.end method

.method private sourceClassesModified(Ljava/io/File;)J
    .locals 14
    .param p1, "buildDir"    # Ljava/io/File;

    .prologue
    const/16 v12, 0x2e

    const-wide/16 v10, -0x1

    .line 1142
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v8

    .line 1143
    .local v8, "remoteFile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .line 1144
    .local v4, "modified":J
    cmp-long v9, v4, v10

    if-nez v9, :cond_1

    .line 1145
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "The class "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " couldn\'t "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "be found on the classpath"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-wide v2, v10

    .line 1214
    :cond_0
    :goto_0
    return-wide v2

    .line 1150
    :cond_1
    move-wide v2, v4

    .line 1153
    .local v2, "latestModified":J
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 1154
    .local v0, "homeFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .line 1155
    cmp-long v9, v4, v10

    if-nez v9, :cond_2

    .line 1156
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "The class "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " couldn\'t be "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "found on the classpath"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-wide v2, v10

    .line 1159
    goto :goto_0

    .line 1161
    :cond_2
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 1164
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    if-eqz v9, :cond_4

    .line 1165
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v7

    .line 1166
    .local v7, "pkFile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .line 1167
    cmp-long v9, v4, v10

    if-nez v9, :cond_3

    .line 1168
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "The class "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "couldn\'t be "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "found on the classpath"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-wide v2, v10

    .line 1171
    goto/16 :goto_0

    .line 1173
    :cond_3
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    .line 1187
    :goto_1
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 1188
    .local v1, "implFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .line 1189
    cmp-long v9, v4, v10

    if-nez v9, :cond_5

    .line 1190
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "The class "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " couldn\'t be found on the classpath"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-wide v2, v10

    .line 1193
    goto/16 :goto_0

    .line 1175
    .end local v1    # "implFile":Ljava/io/File;
    .end local v7    # "pkFile":Ljava/io/File;
    :cond_4
    const/4 v7, 0x0

    .restart local v7    # "pkFile":Ljava/io/File;
    goto :goto_1

    .line 1196
    .restart local v1    # "implFile":Ljava/io/File;
    :cond_5
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v6

    .line 1197
    .local v6, "pathToFile":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v12, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ".class"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1198
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$300(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/util/Hashtable;

    move-result-object v9

    invoke-virtual {v9, v6, v8}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1200
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v6

    .line 1201
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v12, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ".class"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1202
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$300(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/util/Hashtable;

    move-result-object v9

    invoke-virtual {v9, v6, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1204
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v6

    .line 1205
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v12, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ".class"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1206
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$300(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/util/Hashtable;

    move-result-object v9

    invoke-virtual {v9, v6, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1208
    if-eqz v7, :cond_0

    .line 1209
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v6

    .line 1210
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v12, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ".class"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1211
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$300(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/util/Hashtable;

    move-result-object v9

    invoke-virtual {v9, v6, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0
.end method


# virtual methods
.method public addCmpDescriptor(Ljava/lang/String;)V
    .locals 1
    .param p1, "descriptor"    # Ljava/lang/String;

    .prologue
    .line 1030
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmpDescriptors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1031
    return-void
.end method

.method public getBeantype()Ljava/lang/String;
    .locals 1

    .prologue
    .line 990
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    return-object v0
.end method

.method public getCmp()Z
    .locals 1

    .prologue
    .line 1002
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmp:Z

    return v0
.end method

.method public getCmpDescriptors()Ljava/util/List;
    .locals 1

    .prologue
    .line 1034
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmpDescriptors:Ljava/util/List;

    return-object v0
.end method

.method public getHasession()Z
    .locals 1

    .prologue
    .line 1026
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->hasession:Z

    return v0
.end method

.method public getHome()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;
    .locals 1

    .prologue
    .line 946
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    return-object v0
.end method

.method public getIiop()Z
    .locals 1

    .prologue
    .line 1014
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->iiop:Z

    return v0
.end method

.method public getImplementation()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;
    .locals 1

    .prologue
    .line 970
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 919
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 920
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    if-nez v0, :cond_0

    .line 921
    const-string/jumbo v0, "[unnamed]"

    .line 926
    :goto_0
    return-object v0

    .line 923
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getClassName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 926
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPrimaryKey()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;
    .locals 1

    .prologue
    .line 982
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    return-object v0
.end method

.method public getRemote()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;
    .locals 1

    .prologue
    .line 958
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    return-object v0
.end method

.method public mustBeRecompiled(Ljava/io/File;)Z
    .locals 5
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 1114
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->sourceClassesModified(Ljava/io/File;)J

    move-result-wide v2

    .line 1116
    .local v2, "sourceModified":J
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->destClassesModified(Ljava/io/File;)J

    move-result-wide v0

    .line 1118
    .local v0, "destModified":J
    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public setBeantype(Ljava/lang/String;)V
    .locals 1
    .param p1, "beantype"    # Ljava/lang/String;

    .prologue
    .line 986
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    .line 987
    return-void
.end method

.method public setCmp(Ljava/lang/String;)V
    .locals 1
    .param p1, "cmp"    # Ljava/lang/String;

    .prologue
    .line 998
    const-string/jumbo v0, "Container"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setCmp(Z)V

    .line 999
    return-void
.end method

.method public setCmp(Z)V
    .locals 0
    .param p1, "cmp"    # Z

    .prologue
    .line 994
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmp:Z

    .line 995
    return-void
.end method

.method public setHasession(Ljava/lang/String;)V
    .locals 1
    .param p1, "hasession"    # Ljava/lang/String;

    .prologue
    .line 1022
    const-string/jumbo v0, "true"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setHasession(Z)V

    .line 1023
    return-void
.end method

.method public setHasession(Z)V
    .locals 0
    .param p1, "hasession"    # Z

    .prologue
    .line 1018
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->hasession:Z

    .line 1019
    return-void
.end method

.method public setHome(Ljava/lang/String;)V
    .locals 1
    .param p1, "home"    # Ljava/lang/String;

    .prologue
    .line 938
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setHome(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V

    .line 939
    return-void
.end method

.method public setHome(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V
    .locals 0
    .param p1, "home"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .prologue
    .line 942
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .line 943
    return-void
.end method

.method public setIiop(Ljava/lang/String;)V
    .locals 1
    .param p1, "iiop"    # Ljava/lang/String;

    .prologue
    .line 1010
    const-string/jumbo v0, "true"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setIiop(Z)V

    .line 1011
    return-void
.end method

.method public setIiop(Z)V
    .locals 0
    .param p1, "iiop"    # Z

    .prologue
    .line 1006
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->iiop:Z

    .line 1007
    return-void
.end method

.method public setImplementation(Ljava/lang/String;)V
    .locals 1
    .param p1, "implementation"    # Ljava/lang/String;

    .prologue
    .line 962
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setImplementation(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V

    .line 963
    return-void
.end method

.method public setImplementation(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V
    .locals 0
    .param p1, "implementation"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .prologue
    .line 966
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .line 967
    return-void
.end method

.method public setPrimaryKey(Ljava/lang/String;)V
    .locals 1
    .param p1, "primaryKey"    # Ljava/lang/String;

    .prologue
    .line 974
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setPrimaryKey(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V

    .line 975
    return-void
.end method

.method public setPrimaryKey(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V
    .locals 0
    .param p1, "primaryKey"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .prologue
    .line 978
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .line 979
    return-void
.end method

.method public setRemote(Ljava/lang/String;)V
    .locals 1
    .param p1, "remote"    # Ljava/lang/String;

    .prologue
    .line 950
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setRemote(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V

    .line 951
    return-void
.end method

.method public setRemote(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;)V
    .locals 0
    .param p1, "remote"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .prologue
    .line 954
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    .line 955
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1327
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "EJB name: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              home:      "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->home:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              remote:    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->remote:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              impl:      "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->implementation:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              primaryKey: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->primaryKey:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              beantype:  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->beantype:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              cmp:       "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmp:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              iiop:      "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->iiop:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              hasession: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->hasession:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1337
    .local v1, "s":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->cmpDescriptors:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1338
    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1339
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n\r              CMP Descriptor: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1342
    :cond_0
    return-object v1
.end method
