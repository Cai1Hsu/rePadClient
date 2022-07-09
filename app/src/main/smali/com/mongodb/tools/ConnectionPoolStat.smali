.class public Lcom/mongodb/tools/ConnectionPoolStat;
.super Ljava/lang/Object;
.source "ConnectionPoolStat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/tools/ConnectionPoolStat$Position;,
        Lcom/mongodb/tools/ConnectionPoolStat$StringType;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final mBeanConnection:Ljavax/management/MBeanServerConnection;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-static {}, Ljava/lang/management/ManagementFactory;->getPlatformMBeanServer()Ljavax/management/MBeanServer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/tools/ConnectionPoolStat;->mBeanConnection:Ljavax/management/MBeanServerConnection;

    .line 69
    return-void
.end method

.method public constructor <init>(Ljavax/management/MBeanServerConnection;)V
    .locals 0
    .param p1, "mBeanConnection"    # Ljavax/management/MBeanServerConnection;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/mongodb/tools/ConnectionPoolStat;->mBeanConnection:Ljavax/management/MBeanServerConnection;

    .line 59
    return-void
.end method

.method private static getIntegerArg(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "arg"    # Ljava/lang/String;
    .param p1, "argName"    # Ljava/lang/String;

    .prologue
    .line 174
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " arg must be an integer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mongodb/tools/ConnectionPoolStat;->printErrorAndUsageAndExit(Ljava/lang/String;)V

    .line 178
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method

.method private getKeyString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 299
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getValueString(Ljava/lang/Object;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)Ljava/lang/String;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "stringType"    # Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    .prologue
    .line 303
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mongodb/tools/ConnectionPoolStat$StringType;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    if-ne p2, v0, :cond_0

    .line 304
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 20
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 117
    const-string/jumbo v3, "localhost"

    .line 118
    .local v3, "host":Ljava/lang/String;
    const/4 v7, -0x1

    .line 119
    .local v7, "port":I
    const-wide/16 v12, 0x0

    .line 120
    .local v12, "rowCount":J
    const/16 v11, 0x3e8

    .line 122
    .local v11, "sleepTime":I
    const/4 v8, 0x0

    .line 123
    .local v8, "pos":I
    :goto_0
    move-object/from16 v0, p0

    array-length v15, v0

    if-ge v8, v15, :cond_7

    .line 124
    aget-object v15, p0, v8

    const-string/jumbo v16, "--help"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 125
    invoke-static {}, Lcom/mongodb/tools/ConnectionPoolStat;->printUsage()V

    .line 126
    const/4 v15, 0x0

    invoke-static {v15}, Ljava/lang/System;->exit(I)V

    .line 123
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 127
    :cond_0
    aget-object v15, p0, v8

    const-string/jumbo v16, "--host"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1

    aget-object v15, p0, v8

    const-string/jumbo v16, "-h"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 128
    :cond_1
    add-int/lit8 v8, v8, 0x1

    aget-object v3, p0, v8

    goto :goto_1

    .line 129
    :cond_2
    aget-object v15, p0, v8

    const-string/jumbo v16, "--port"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 130
    add-int/lit8 v8, v8, 0x1

    aget-object v15, p0, v8

    const-string/jumbo v16, "--port"

    invoke-static/range {v15 .. v16}, Lcom/mongodb/tools/ConnectionPoolStat;->getIntegerArg(Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    goto :goto_1

    .line 131
    :cond_3
    aget-object v15, p0, v8

    const-string/jumbo v16, "--rowcount"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_4

    aget-object v15, p0, v8

    const-string/jumbo v16, "-n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 132
    :cond_4
    add-int/lit8 v8, v8, 0x1

    aget-object v15, p0, v8

    const-string/jumbo v16, "--rowCount"

    invoke-static/range {v15 .. v16}, Lcom/mongodb/tools/ConnectionPoolStat;->getIntegerArg(Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    int-to-long v12, v15

    goto :goto_1

    .line 133
    :cond_5
    aget-object v15, p0, v8

    const-string/jumbo v16, "-"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 134
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "unknown option "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    aget-object v16, p0, v8

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/mongodb/tools/ConnectionPoolStat;->printErrorAndUsageAndExit(Ljava/lang/String;)V

    goto :goto_1

    .line 137
    :cond_6
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "pos":I
    .local v9, "pos":I
    aget-object v15, p0, v8

    const-string/jumbo v16, "sleep time"

    invoke-static/range {v15 .. v16}, Lcom/mongodb/tools/ConnectionPoolStat;->getIntegerArg(Ljava/lang/String;Ljava/lang/String;)I

    move-result v15

    mul-int/lit16 v11, v15, 0x3e8

    move v8, v9

    .line 142
    .end local v9    # "pos":I
    .restart local v8    # "pos":I
    :cond_7
    move-object/from16 v0, p0

    array-length v15, v0

    if-eq v8, v15, :cond_8

    .line 143
    const-string/jumbo v15, "too many positional options"

    invoke-static {v15}, Lcom/mongodb/tools/ConnectionPoolStat;->printErrorAndUsageAndExit(Ljava/lang/String;)V

    .line 146
    :cond_8
    const/4 v15, -0x1

    if-ne v7, v15, :cond_9

    const-string/jumbo v15, ":"

    invoke-virtual {v3, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_9

    .line 147
    const-string/jumbo v15, "port is required"

    invoke-static {v15}, Lcom/mongodb/tools/ConnectionPoolStat;->printErrorAndUsageAndExit(Ljava/lang/String;)V

    .line 150
    :cond_9
    const/4 v15, -0x1

    if-eq v7, v15, :cond_c

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ":"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 152
    .local v4, "hostAndPort":Ljava/lang/String;
    :goto_2
    const-wide/16 v16, 0x0

    cmp-long v15, v12, v16

    if-nez v15, :cond_a

    .line 153
    const-wide v12, 0x7fffffffffffffffL

    .line 156
    :cond_a
    new-instance v14, Ljavax/management/remote/JMXServiceURL;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "service:jmx:rmi:///jndi/rmi://"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "/jmxrmi"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljavax/management/remote/JMXServiceURL;-><init>(Ljava/lang/String;)V

    .line 157
    .local v14, "u":Ljavax/management/remote/JMXServiceURL;
    invoke-static {v14}, Ljavax/management/remote/JMXConnectorFactory;->connect(Ljavax/management/remote/JMXServiceURL;)Ljavax/management/remote/JMXConnector;

    move-result-object v2

    .line 158
    .local v2, "connector":Ljavax/management/remote/JMXConnector;
    invoke-interface {v2}, Ljavax/management/remote/JMXConnector;->getMBeanServerConnection()Ljavax/management/MBeanServerConnection;

    move-result-object v6

    .line 160
    .local v6, "mBeanConnection":Ljavax/management/MBeanServerConnection;
    :try_start_0
    new-instance v10, Lcom/mongodb/tools/ConnectionPoolStat;

    invoke-direct {v10, v6}, Lcom/mongodb/tools/ConnectionPoolStat;-><init>(Ljavax/management/MBeanServerConnection;)V

    .line 161
    .local v10, "printer":Lcom/mongodb/tools/ConnectionPoolStat;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3
    int-to-long v0, v5

    move-wide/from16 v16, v0

    cmp-long v15, v16, v12

    if-gez v15, :cond_d

    .line 162
    sget-object v15, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v10}, Lcom/mongodb/tools/ConnectionPoolStat;->getStats()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 163
    int-to-long v0, v5

    move-wide/from16 v16, v0

    const-wide/16 v18, 0x1

    sub-long v18, v12, v18

    cmp-long v15, v16, v18

    if-eqz v15, :cond_b

    .line 164
    int-to-long v0, v11

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    :cond_b
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .end local v2    # "connector":Ljavax/management/remote/JMXConnector;
    .end local v4    # "hostAndPort":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "mBeanConnection":Ljavax/management/MBeanServerConnection;
    .end local v10    # "printer":Lcom/mongodb/tools/ConnectionPoolStat;
    .end local v14    # "u":Ljavax/management/remote/JMXServiceURL;
    :cond_c
    move-object v4, v3

    .line 150
    goto :goto_2

    .line 168
    .restart local v2    # "connector":Ljavax/management/remote/JMXConnector;
    .restart local v4    # "hostAndPort":Ljava/lang/String;
    .restart local v5    # "i":I
    .restart local v6    # "mBeanConnection":Ljavax/management/MBeanServerConnection;
    .restart local v10    # "printer":Lcom/mongodb/tools/ConnectionPoolStat;
    .restart local v14    # "u":Ljavax/management/remote/JMXServiceURL;
    :cond_d
    invoke-interface {v2}, Ljavax/management/remote/JMXConnector;->close()V

    .line 170
    return-void

    .line 168
    .end local v5    # "i":I
    .end local v10    # "printer":Lcom/mongodb/tools/ConnectionPoolStat;
    :catchall_0
    move-exception v15

    invoke-interface {v2}, Ljavax/management/remote/JMXConnector;->close()V

    throw v15
.end method

.method private print(Ljava/io/PrintWriter;)V
    .locals 7
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/management/JMException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v4, p0, Lcom/mongodb/tools/ConnectionPoolStat;->mBeanConnection:Ljavax/management/MBeanServerConnection;

    new-instance v5, Ljavax/management/ObjectName;

    const-string/jumbo v6, "com.mongodb:type=ConnectionPool,*"

    invoke-direct {v5, v6}, Ljavax/management/ObjectName;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Ljavax/management/MBeanServerConnection;->queryNames(Ljavax/management/ObjectName;Ljavax/management/QueryExp;)Ljava/util/Set;

    move-result-object v0

    .line 218
    .local v0, "beanSet":Ljava/util/Set;, "Ljava/util/Set<Ljavax/management/ObjectName;>;"
    const-string/jumbo v4, "{ pools : ["

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 219
    const/4 v1, 0x0

    .line 220
    .local v1, "i":I
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/management/ObjectName;

    .line 221
    .local v3, "objectName":Ljavax/management/ObjectName;
    const-string/jumbo v4, "   { "

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 222
    const-string/jumbo v4, "ObjectName"

    invoke-virtual {v3}, Ljavax/management/ObjectName;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->printAttribute(Ljava/lang/String;Ljava/lang/Object;Ljava/io/PrintWriter;)V

    .line 223
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 224
    const-string/jumbo v4, "     "

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 225
    const-string/jumbo v4, "Host"

    invoke-direct {p0, v4, v3, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->printAttribute(Ljava/lang/String;Ljavax/management/ObjectName;Ljava/io/PrintWriter;)V

    .line 226
    const-string/jumbo v4, "Port"

    invoke-direct {p0, v4, v3, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->printAttribute(Ljava/lang/String;Ljavax/management/ObjectName;Ljava/io/PrintWriter;)V

    .line 227
    const-string/jumbo v4, "MaxSize"

    invoke-direct {p0, v4, v3, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->printAttribute(Ljava/lang/String;Ljavax/management/ObjectName;Ljava/io/PrintWriter;)V

    .line 228
    invoke-direct {p0, p1, v3}, Lcom/mongodb/tools/ConnectionPoolStat;->printStatistics(Ljava/io/PrintWriter;Ljavax/management/ObjectName;)V

    .line 229
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "   }"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v1, v4, :cond_0

    const-string/jumbo v4, ""

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 230
    add-int/lit8 v1, v1, 0x1

    .line 231
    goto :goto_0

    .line 229
    :cond_0
    const-string/jumbo v4, ","

    goto :goto_1

    .line 232
    .end local v3    # "objectName":Ljavax/management/ObjectName;
    :cond_1
    const-string/jumbo v4, "  ]"

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 233
    const-string/jumbo v4, "}"

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 234
    return-void
.end method

.method private printAttribute(Ljava/lang/String;Ljava/lang/Object;Ljava/io/PrintWriter;)V
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 289
    sget-object v4, Lcom/mongodb/tools/ConnectionPoolStat$Position;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    sget-object v5, Lcom/mongodb/tools/ConnectionPoolStat$StringType;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/tools/ConnectionPoolStat;->printAttribute(Ljava/lang/String;Ljava/lang/Object;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V

    .line 290
    return-void
.end method

.method private printAttribute(Ljava/lang/String;Ljava/lang/Object;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "pw"    # Ljava/io/PrintWriter;
    .param p4, "position"    # Lcom/mongodb/tools/ConnectionPoolStat$Position;
    .param p5, "stringType"    # Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    .prologue
    .line 293
    if-eqz p2, :cond_0

    .line 294
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->getKeyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p2, p5}, Lcom/mongodb/tools/ConnectionPoolStat;->getValueString(Ljava/lang/Object;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;->LAST:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    if-ne p4, v0, :cond_1

    const-string/jumbo v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 296
    :cond_0
    return-void

    .line 294
    :cond_1
    const-string/jumbo v0, ", "

    goto :goto_0
.end method

.method private printAttribute(Ljava/lang/String;Ljavax/management/ObjectName;Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "objectName"    # Ljavax/management/ObjectName;
    .param p3, "pw"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/management/InstanceNotFoundException;,
            Ljava/io/IOException;,
            Ljavax/management/ReflectionException;,
            Ljavax/management/AttributeNotFoundException;,
            Ljavax/management/MBeanException;
        }
    .end annotation

    .prologue
    .line 285
    iget-object v0, p0, Lcom/mongodb/tools/ConnectionPoolStat;->mBeanConnection:Ljavax/management/MBeanServerConnection;

    invoke-interface {v0, p2, p1}, Ljavax/management/MBeanServerConnection;->getAttribute(Ljavax/management/ObjectName;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/mongodb/tools/ConnectionPoolStat;->printAttribute(Ljava/lang/String;Ljava/lang/Object;Ljava/io/PrintWriter;)V

    .line 286
    return-void
.end method

.method private printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "compositeData"    # Ljavax/management/openmbean/CompositeData;
    .param p3, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 269
    sget-object v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;)V

    .line 270
    return-void
.end method

.method private printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;)V
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "compositeData"    # Ljavax/management/openmbean/CompositeData;
    .param p3, "pw"    # Ljava/io/PrintWriter;
    .param p4, "position"    # Lcom/mongodb/tools/ConnectionPoolStat$Position;

    .prologue
    .line 273
    sget-object v5, Lcom/mongodb/tools/ConnectionPoolStat$StringType;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V

    .line 274
    return-void
.end method

.method private printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "compositeData"    # Ljavax/management/openmbean/CompositeData;
    .param p3, "pw"    # Ljava/io/PrintWriter;
    .param p4, "position"    # Lcom/mongodb/tools/ConnectionPoolStat$Position;
    .param p5, "stringType"    # Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    .prologue
    .line 281
    invoke-interface {p2, p1}, Ljavax/management/openmbean/CompositeData;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/tools/ConnectionPoolStat;->printAttribute(Ljava/lang/String;Ljava/lang/Object;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V

    .line 282
    return-void
.end method

.method private printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "compositeData"    # Ljavax/management/openmbean/CompositeData;
    .param p3, "pw"    # Ljava/io/PrintWriter;
    .param p4, "stringType"    # Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    .prologue
    .line 277
    sget-object v4, Lcom/mongodb/tools/ConnectionPoolStat$Position;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V

    .line 278
    return-void
.end method

.method private static printErrorAndUsageAndExit(Ljava/lang/String;)V
    .locals 3
    .param p0, "error"    # Ljava/lang/String;

    .prologue
    .line 182
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ERROR: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 183
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 184
    invoke-static {}, Lcom/mongodb/tools/ConnectionPoolStat;->printUsage()V

    .line 185
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    .line 186
    return-void
.end method

.method private printInUseConnections(Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V
    .locals 6
    .param p1, "statistics"    # Ljavax/management/openmbean/CompositeData;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/management/InstanceNotFoundException;,
            Ljava/io/IOException;,
            Ljavax/management/ReflectionException;,
            Ljavax/management/AttributeNotFoundException;,
            Ljavax/management/MBeanException;
        }
    .end annotation

    .prologue
    .line 250
    const-string/jumbo v3, "inUseConnections"

    .line 251
    .local v3, "key":Ljava/lang/String;
    invoke-interface {p1, v3}, Ljavax/management/openmbean/CompositeData;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljavax/management/openmbean/CompositeData;

    move-object v1, v4

    check-cast v1, [Ljavax/management/openmbean/CompositeData;

    .line 252
    .local v1, "compositeDataArray":[Ljavax/management/openmbean/CompositeData;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "     "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0, v3}, Lcom/mongodb/tools/ConnectionPoolStat;->getKeyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ": ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 253
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-ge v2, v4, :cond_1

    .line 254
    aget-object v0, v1, v2

    .line 255
    .local v0, "compositeData":Ljavax/management/openmbean/CompositeData;
    const-string/jumbo v4, "      { "

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 256
    const-string/jumbo v4, "namespace"

    invoke-direct {p0, v4, v0, p2}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 257
    const-string/jumbo v4, "opCode"

    invoke-direct {p0, v4, v0, p2}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 258
    const-string/jumbo v4, "query"

    sget-object v5, Lcom/mongodb/tools/ConnectionPoolStat$StringType;->JSON:Lcom/mongodb/tools/ConnectionPoolStat$StringType;

    invoke-direct {p0, v4, v0, p2, v5}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$StringType;)V

    .line 259
    const-string/jumbo v4, "numDocuments"

    invoke-direct {p0, v4, v0, p2}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 260
    const-string/jumbo v4, "threadName"

    invoke-direct {p0, v4, v0, p2}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 261
    const-string/jumbo v4, "durationMS"

    invoke-direct {p0, v4, v0, p2}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 262
    const-string/jumbo v4, "localPort"

    sget-object v5, Lcom/mongodb/tools/ConnectionPoolStat$Position;->LAST:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    invoke-direct {p0, v4, v0, p2, v5}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;Lcom/mongodb/tools/ConnectionPoolStat$Position;)V

    .line 263
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, " }"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v4, v1

    add-int/lit8 v4, v4, -0x1

    if-ne v2, v4, :cond_0

    const-string/jumbo v4, ""

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 253
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 263
    :cond_0
    const-string/jumbo v4, ", "

    goto :goto_1

    .line 265
    .end local v0    # "compositeData":Ljavax/management/openmbean/CompositeData;
    :cond_1
    const-string/jumbo v4, "     ]"

    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 266
    return-void
.end method

.method private printSimpleStatistics(Ljava/io/PrintWriter;Ljavax/management/openmbean/CompositeData;)V
    .locals 1
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "statistics"    # Ljavax/management/openmbean/CompositeData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/management/InstanceNotFoundException;,
            Ljava/io/IOException;,
            Ljavax/management/ReflectionException;,
            Ljavax/management/AttributeNotFoundException;,
            Ljavax/management/MBeanException;
        }
    .end annotation

    .prologue
    .line 244
    const-string/jumbo v0, "total"

    invoke-direct {p0, v0, p2, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 245
    const-string/jumbo v0, "inUse"

    invoke-direct {p0, v0, p2, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->printCompositeDataAttribute(Ljava/lang/String;Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 246
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 247
    return-void
.end method

.method private printStatistics(Ljava/io/PrintWriter;Ljavax/management/ObjectName;)V
    .locals 3
    .param p1, "pw"    # Ljava/io/PrintWriter;
    .param p2, "objectName"    # Ljavax/management/ObjectName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/management/InstanceNotFoundException;,
            Ljava/io/IOException;,
            Ljavax/management/ReflectionException;,
            Ljavax/management/AttributeNotFoundException;,
            Ljavax/management/MBeanException;
        }
    .end annotation

    .prologue
    .line 237
    const-string/jumbo v0, "Statistics"

    .line 238
    .local v0, "key":Ljava/lang/String;
    iget-object v2, p0, Lcom/mongodb/tools/ConnectionPoolStat;->mBeanConnection:Ljavax/management/MBeanServerConnection;

    invoke-interface {v2, p2, v0}, Ljavax/management/MBeanServerConnection;->getAttribute(Ljavax/management/ObjectName;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/management/openmbean/CompositeData;

    .line 239
    .local v1, "statistics":Ljavax/management/openmbean/CompositeData;
    invoke-direct {p0, p1, v1}, Lcom/mongodb/tools/ConnectionPoolStat;->printSimpleStatistics(Ljava/io/PrintWriter;Ljavax/management/openmbean/CompositeData;)V

    .line 240
    invoke-direct {p0, v1, p1}, Lcom/mongodb/tools/ConnectionPoolStat;->printInUseConnections(Ljavax/management/openmbean/CompositeData;Ljava/io/PrintWriter;)V

    .line 241
    return-void
.end method

.method private static printUsage()V
    .locals 2

    .prologue
    .line 189
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "View live MongoDB connection pool statistics from a remote JMX server."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 190
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 191
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "usage: java com.mongodb.tools.ConnectionPoolStat [options] [sleep time"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 192
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "sleep time: time to wait (in seconds) between calls. Defaults to 1"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 193
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "options:"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 194
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  --help                 produce help message"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 195
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  --port arg             JMX remote port. Required. Can also use --host hostname:port"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 196
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  -h [ --host ] arg      JMX remote host. Defaults to localhost"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 197
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  -n [ --rowcount ] arg  number of times to print stats (0 for indefinite)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 198
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 199
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "Fields"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 200
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  objectName                     - name of the JMX bean for this connection pool"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 201
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  host                           - host of the mongod/mongos server"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 202
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  port                           - port of the mongod/mongos server"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 203
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  maxSize                        - max # of connections allowed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 204
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  total                          - # of connections allocated"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 205
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUse                          - # of connections in use"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 206
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections               - list of all in use connections"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 207
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections.namespace     - namespace on which connection is operating"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 208
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections.opCode        - operation connection is executing"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 209
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections.query         - query the connection is executing (for query/update/remove)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 210
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections.numDocuments  - # of documents in the message (mostly relevant for batch inserts)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 211
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections.threadName    - name of thread on which connection is executing"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 212
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections.durationMS    - duration that the operation has been executing so far"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 213
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  inUseConnections.localPort     - local port of the connection"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 214
    return-void
.end method


# virtual methods
.method public getStats()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/management/JMException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    new-instance v0, Ljava/io/CharArrayWriter;

    invoke-direct {v0}, Ljava/io/CharArrayWriter;-><init>()V

    .line 102
    .local v0, "charArrayWriter":Ljava/io/CharArrayWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 103
    .local v1, "printWriter":Ljava/io/PrintWriter;
    invoke-direct {p0, v1}, Lcom/mongodb/tools/ConnectionPoolStat;->print(Ljava/io/PrintWriter;)V

    .line 104
    invoke-virtual {v0}, Ljava/io/CharArrayWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
