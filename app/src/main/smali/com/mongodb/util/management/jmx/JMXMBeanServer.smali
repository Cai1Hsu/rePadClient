.class public Lcom/mongodb/util/management/jmx/JMXMBeanServer;
.super Ljava/lang/Object;
.source "JMXMBeanServer.java"

# interfaces
.implements Lcom/mongodb/util/management/MBeanServer;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final server:Ljavax/management/MBeanServer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-string/jumbo v0, "com.mongodb.driver.management"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    invoke-static {}, Ljava/lang/management/ManagementFactory;->getPlatformMBeanServer()Ljavax/management/MBeanServer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->server:Ljavax/management/MBeanServer;

    return-void
.end method

.method private createObjectName(Ljava/lang/String;)Ljavax/management/ObjectName;
    .locals 1
    .param p1, "mBeanName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/management/MalformedObjectNameException;
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Ljavax/management/ObjectName;

    invoke-direct {v0, p1}, Ljavax/management/ObjectName;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public isRegistered(Ljava/lang/String;)Z
    .locals 5
    .param p1, "mBeanName"    # Ljava/lang/String;

    .prologue
    .line 42
    :try_start_0
    iget-object v1, p0, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->server:Ljavax/management/MBeanServer;

    invoke-direct {p0, p1}, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->createObjectName(Ljava/lang/String;)Ljavax/management/ObjectName;

    move-result-object v2

    invoke-interface {v1, v2}, Ljavax/management/MBeanServer;->isRegistered(Ljavax/management/ObjectName;)Z
    :try_end_0
    .catch Ljavax/management/MalformedObjectNameException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 45
    :goto_0
    return v1

    .line 43
    :catch_0
    move-exception v0

    .line 44
    .local v0, "e":Ljavax/management/MalformedObjectNameException;
    sget-object v1, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->LOGGER:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unable to register MBean "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public registerMBean(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 6
    .param p1, "mBean"    # Ljava/lang/Object;
    .param p2, "mBeanName"    # Ljava/lang/String;

    .prologue
    .line 61
    :try_start_0
    iget-object v1, p0, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->server:Ljavax/management/MBeanServer;

    invoke-direct {p0, p2}, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->createObjectName(Ljava/lang/String;)Ljavax/management/ObjectName;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljavax/management/MBeanServer;->registerMBean(Ljava/lang/Object;Ljavax/management/ObjectName;)Ljavax/management/ObjectInstance;
    :try_end_0
    .catch Ljavax/management/InstanceAlreadyExistsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 67
    :goto_0
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, "e":Ljavax/management/InstanceAlreadyExistsException;
    sget-object v1, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->LOGGER:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const-string/jumbo v3, "A JMX MBean with the name \'%s\' already exists"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto :goto_0

    .line 64
    .end local v0    # "e":Ljavax/management/InstanceAlreadyExistsException;
    :catch_1
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->LOGGER:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unable to register MBean "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public unregisterMBean(Ljava/lang/String;)V
    .locals 5
    .param p1, "mBeanName"    # Ljava/lang/String;

    .prologue
    .line 52
    :try_start_0
    iget-object v1, p0, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->server:Ljavax/management/MBeanServer;

    invoke-direct {p0, p1}, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->createObjectName(Ljava/lang/String;)Ljavax/management/ObjectName;

    move-result-object v2

    invoke-interface {v1, v2}, Ljavax/management/MBeanServer;->unregisterMBean(Ljavax/management/ObjectName;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :goto_0
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/mongodb/util/management/jmx/JMXMBeanServer;->LOGGER:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unable to register MBean "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
