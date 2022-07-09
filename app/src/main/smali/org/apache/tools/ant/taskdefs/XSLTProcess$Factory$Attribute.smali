.class public Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;
.super Ljava/lang/Object;
.source "XSLTProcess.java"

# interfaces
.implements Lorg/apache/tools/ant/DynamicConfigurator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Attribute"
.end annotation


# instance fields
.field private name:Ljava/lang/String;

.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1334
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createDynamicElement(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1363
    const/4 v0, 0x0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1346
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1353
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public setDynamicAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1375
    const-string/jumbo v1, "name"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1376
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->name:Ljava/lang/String;

    .line 1394
    :goto_0
    return-void

    .line 1377
    :cond_0
    const-string/jumbo v1, "value"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1380
    const-string/jumbo v1, "true"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1381
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->value:Ljava/lang/Object;

    goto :goto_0

    .line 1382
    :cond_1
    const-string/jumbo v1, "false"

    invoke-virtual {v1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1383
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->value:Ljava/lang/Object;

    goto :goto_0

    .line 1386
    :cond_2
    :try_start_0
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p2}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->value:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1387
    :catch_0
    move-exception v0

    .line 1388
    .local v0, "e":Ljava/lang/NumberFormatException;
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->value:Ljava/lang/Object;

    goto :goto_0

    .line 1392
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_3
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unsupported attribute: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
