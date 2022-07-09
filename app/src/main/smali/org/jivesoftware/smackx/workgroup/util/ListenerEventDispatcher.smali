.class public Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;
.super Ljava/lang/Object;
.source "ListenerEventDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;
    }
.end annotation


# instance fields
.field protected transient hasFinishedDispatching:Z

.field protected transient isRunning:Z

.field protected transient triplets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->triplets:Ljava/util/ArrayList;

    .line 48
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->hasFinishedDispatching:Z

    .line 49
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->isRunning:Z

    .line 50
    return-void
.end method


# virtual methods
.method public addListenerTriplet(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "listenerInstance"    # Ljava/lang/Object;
    .param p2, "listenerMethod"    # Ljava/lang/reflect/Method;
    .param p3, "methodArguments"    # [Ljava/lang/Object;

    .prologue
    .line 71
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->isRunning:Z

    if-nez v0, :cond_0

    .line 72
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->triplets:Ljava/util/ArrayList;

    new-instance v1, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;

    invoke-direct {v1, p0, p1, p2, p3}, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;-><init>(Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    :cond_0
    return-void
.end method

.method public hasFinished()Z
    .locals 1

    .prologue
    .line 81
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->hasFinishedDispatching:Z

    return v0
.end method

.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 85
    const/4 v1, 0x0

    .line 87
    .local v1, "li":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;>;"
    iput-boolean v6, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->isRunning:Z

    .line 89
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->triplets:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 90
    :goto_0
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 91
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;

    .line 94
    .local v2, "tc":Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;
    :try_start_0
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;->getListenerMethod()Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;->getListenerInstance()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;->getMethodArguments()[Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Exception dispatching an event: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 98
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 102
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "tc":Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer;
    :cond_0
    iput-boolean v6, p0, Lorg/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher;->hasFinishedDispatching:Z

    .line 103
    return-void
.end method
