.class public Lcom/mongodb/util/management/NullMBeanServer;
.super Ljava/lang/Object;
.source "NullMBeanServer.java"

# interfaces
.implements Lcom/mongodb/util/management/MBeanServer;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isRegistered(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mBeanName"    # Ljava/lang/String;

    .prologue
    .line 29
    const/4 v0, 0x0

    return v0
.end method

.method public registerMBean(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0
    .param p1, "mBean"    # Ljava/lang/Object;
    .param p2, "mBeanName"    # Ljava/lang/String;

    .prologue
    .line 38
    return-void
.end method

.method public unregisterMBean(Ljava/lang/String;)V
    .locals 0
    .param p1, "mBeanName"    # Ljava/lang/String;

    .prologue
    .line 34
    return-void
.end method
