.class public Lorg/apache/tools/ant/listener/AnsiColorLogger;
.super Lorg/apache/tools/ant/DefaultLogger;
.source "AnsiColorLogger.java"


# static fields
.field private static final ATTR_DIM:I = 0x2

.field private static final END_COLOR:Ljava/lang/String; = "\u001b[m"

.field private static final FG_BLUE:I = 0x22

.field private static final FG_CYAN:I = 0x24

.field private static final FG_GREEN:I = 0x20

.field private static final FG_MAGENTA:I = 0x23

.field private static final FG_RED:I = 0x1f

.field private static final PREFIX:Ljava/lang/String; = "\u001b["

.field private static final SEPARATOR:C = ';'

.field private static final SUFFIX:Ljava/lang/String; = "m"


# instance fields
.field private colorsSet:Z

.field private debugColor:Ljava/lang/String;

.field private errColor:Ljava/lang/String;

.field private infoColor:Ljava/lang/String;

.field private verboseColor:Ljava/lang/String;

.field private warnColor:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/apache/tools/ant/DefaultLogger;-><init>()V

    .line 131
    const-string/jumbo v0, "\u001b[2;31m"

    iput-object v0, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->errColor:Ljava/lang/String;

    .line 133
    const-string/jumbo v0, "\u001b[2;35m"

    iput-object v0, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->warnColor:Ljava/lang/String;

    .line 135
    const-string/jumbo v0, "\u001b[2;36m"

    iput-object v0, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->infoColor:Ljava/lang/String;

    .line 137
    const-string/jumbo v0, "\u001b[2;32m"

    iput-object v0, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->verboseColor:Ljava/lang/String;

    .line 139
    const-string/jumbo v0, "\u001b[2;34m"

    iput-object v0, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->debugColor:Ljava/lang/String;

    .line 142
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->colorsSet:Z

    return-void
.end method

.method private setColors()V
    .locals 12

    .prologue
    .line 149
    const-string/jumbo v10, "ant.logger.defaults"

    invoke-static {v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 150
    .local v7, "userColorFile":Ljava/lang/String;
    const-string/jumbo v6, "/org/apache/tools/ant/listener/defaults.properties"

    .line 153
    .local v6, "systemColorFile":Ljava/lang/String;
    const/4 v2, 0x0

    .line 156
    .local v2, "in":Ljava/io/InputStream;
    :try_start_0
    new-instance v5, Ljava/util/Properties;

    invoke-direct {v5}, Ljava/util/Properties;-><init>()V

    .line 158
    .local v5, "prop":Ljava/util/Properties;
    if-eqz v7, :cond_7

    .line 159
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v7}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .end local v2    # "in":Ljava/io/InputStream;
    .local v3, "in":Ljava/io/InputStream;
    move-object v2, v3

    .line 164
    .end local v3    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :goto_0
    if-eqz v2, :cond_0

    .line 165
    invoke-virtual {v5, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 168
    :cond_0
    const-string/jumbo v10, "AnsiColorLogger.ERROR_COLOR"

    invoke-virtual {v5, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "errC":Ljava/lang/String;
    const-string/jumbo v10, "AnsiColorLogger.WARNING_COLOR"

    invoke-virtual {v5, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 170
    .local v9, "warn":Ljava/lang/String;
    const-string/jumbo v10, "AnsiColorLogger.INFO_COLOR"

    invoke-virtual {v5, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 171
    .local v4, "info":Ljava/lang/String;
    const-string/jumbo v10, "AnsiColorLogger.VERBOSE_COLOR"

    invoke-virtual {v5, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 172
    .local v8, "verbose":Ljava/lang/String;
    const-string/jumbo v10, "AnsiColorLogger.DEBUG_COLOR"

    invoke-virtual {v5, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 173
    .local v0, "debug":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 174
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "\u001b["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "m"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->errColor:Ljava/lang/String;

    .line 176
    :cond_1
    if-eqz v9, :cond_2

    .line 177
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "\u001b["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "m"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->warnColor:Ljava/lang/String;

    .line 179
    :cond_2
    if-eqz v4, :cond_3

    .line 180
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "\u001b["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "m"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->infoColor:Ljava/lang/String;

    .line 182
    :cond_3
    if-eqz v8, :cond_4

    .line 183
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "\u001b["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "m"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->verboseColor:Ljava/lang/String;

    .line 185
    :cond_4
    if-eqz v0, :cond_5

    .line 186
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "\u001b["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "m"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->debugColor:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    :cond_5
    if-eqz v2, :cond_6

    .line 193
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 199
    .end local v0    # "debug":Ljava/lang/String;
    .end local v1    # "errC":Ljava/lang/String;
    .end local v4    # "info":Ljava/lang/String;
    .end local v5    # "prop":Ljava/util/Properties;
    .end local v8    # "verbose":Ljava/lang/String;
    .end local v9    # "warn":Ljava/lang/String;
    :cond_6
    :goto_1
    return-void

    .line 161
    .restart local v5    # "prop":Ljava/util/Properties;
    :cond_7
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    goto/16 :goto_0

    .line 191
    .end local v5    # "prop":Ljava/util/Properties;
    :catchall_0
    move-exception v10

    if-eqz v2, :cond_8

    .line 193
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 191
    :cond_8
    :goto_2
    throw v10

    .line 188
    :catch_0
    move-exception v10

    .line 191
    if-eqz v2, :cond_6

    .line 193
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 194
    :catch_1
    move-exception v10

    goto :goto_1

    :catch_2
    move-exception v11

    goto :goto_2
.end method


# virtual methods
.method protected printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/PrintStream;
    .param p3, "priority"    # I

    .prologue
    const/4 v3, 0x0

    .line 208
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 209
    iget-boolean v2, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->colorsSet:Z

    if-nez v2, :cond_0

    .line 210
    invoke-direct {p0}, Lorg/apache/tools/ant/listener/AnsiColorLogger;->setColors()V

    .line 211
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->colorsSet:Z

    .line 214
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 215
    .local v0, "msg":Ljava/lang/StringBuffer;
    packed-switch p3, :pswitch_data_0

    .line 235
    iget-object v2, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->debugColor:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 236
    const-string/jumbo v2, "\u001b[m"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 239
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 240
    .local v1, "strmessage":Ljava/lang/String;
    invoke-virtual {p2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 242
    .end local v0    # "msg":Ljava/lang/StringBuffer;
    .end local v1    # "strmessage":Ljava/lang/String;
    :cond_1
    return-void

    .line 217
    .restart local v0    # "msg":Ljava/lang/StringBuffer;
    :pswitch_0
    iget-object v2, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->errColor:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 218
    const-string/jumbo v2, "\u001b[m"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 221
    :pswitch_1
    iget-object v2, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->warnColor:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 222
    const-string/jumbo v2, "\u001b[m"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 225
    :pswitch_2
    iget-object v2, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->infoColor:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 226
    const-string/jumbo v2, "\u001b[m"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 229
    :pswitch_3
    iget-object v2, p0, Lorg/apache/tools/ant/listener/AnsiColorLogger;->verboseColor:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 230
    const-string/jumbo v2, "\u001b[m"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 215
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
