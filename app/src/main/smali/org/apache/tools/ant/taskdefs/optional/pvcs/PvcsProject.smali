.class public Lorg/apache/tools/ant/taskdefs/optional/pvcs/PvcsProject;
.super Ljava/lang/Object;
.source "PvcsProject.java"


# instance fields
.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/PvcsProject;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/PvcsProject;->name:Ljava/lang/String;

    .line 40
    return-void
.end method
