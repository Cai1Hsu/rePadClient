.class public Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;
.super Ljava/lang/Object;
.source "XSLTProcess.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/XSLTProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;
    }
.end annotation


# instance fields
.field private attributes:Ljava/util/Vector;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 1285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1293
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;->attributes:Ljava/util/Vector;

    .line 1334
    return-void
.end method


# virtual methods
.method public addAttribute(Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;)V
    .locals 1
    .param p1, "attr"    # Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;

    .prologue
    .line 1315
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;->attributes:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1316
    return-void
.end method

.method public getAttributes()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 1323
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;->attributes:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1299
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1307
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;->name:Ljava/lang/String;

    .line 1308
    return-void
.end method
