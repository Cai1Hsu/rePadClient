.class public Lde/javawi/jstun/test/demo/BindingLifetimeTestDemo;
.super Ljava/lang/Object;
.source "BindingLifetimeTestDemo.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 7
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 25
    :try_start_0
    new-instance v2, Ljava/util/logging/FileHandler;

    const-string/jumbo v4, "logging.txt"

    invoke-direct {v2, v4}, Ljava/util/logging/FileHandler;-><init>(Ljava/lang/String;)V

    .line 26
    .local v2, "fh":Ljava/util/logging/Handler;
    new-instance v4, Ljava/util/logging/SimpleFormatter;

    invoke-direct {v4}, Ljava/util/logging/SimpleFormatter;-><init>()V

    invoke-virtual {v2, v4}, Ljava/util/logging/Handler;->setFormatter(Ljava/util/logging/Formatter;)V

    .line 27
    const-string/jumbo v4, "de.javawi.stun"

    invoke-static {v4}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/logging/Logger;->addHandler(Ljava/util/logging/Handler;)V

    .line 28
    const-string/jumbo v4, "de.javawi.stun"

    invoke-static {v4}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v4

    sget-object v5, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->setLevel(Ljava/util/logging/Level;)V

    .line 29
    new-instance v3, Lde/javawi/jstun/test/BindingLifetimeTest;

    const-string/jumbo v4, "iphone-stun.freenet.de"

    const/16 v5, 0xd96

    invoke-direct {v3, v4, v5}, Lde/javawi/jstun/test/BindingLifetimeTest;-><init>(Ljava/lang/String;I)V

    .line 33
    .local v3, "test":Lde/javawi/jstun/test/BindingLifetimeTest;
    invoke-virtual {v3}, Lde/javawi/jstun/test/BindingLifetimeTest;->test()V

    .line 34
    const/4 v0, 0x1

    .line 35
    .local v0, "continueWhile":Z
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 36
    const-wide/16 v4, 0x1388

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 37
    invoke-virtual {v3}, Lde/javawi/jstun/test/BindingLifetimeTest;->getLifetime()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 38
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Lifetime: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lde/javawi/jstun/test/BindingLifetimeTest;->getLifetime()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " Finished: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lde/javawi/jstun/test/BindingLifetimeTest;->isCompleted()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 39
    invoke-virtual {v3}, Lde/javawi/jstun/test/BindingLifetimeTest;->isCompleted()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 42
    .end local v0    # "continueWhile":Z
    .end local v2    # "fh":Ljava/util/logging/Handler;
    .end local v3    # "test":Lde/javawi/jstun/test/BindingLifetimeTest;
    :catch_0
    move-exception v1

    .line 43
    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 44
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 46
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    return-void
.end method
