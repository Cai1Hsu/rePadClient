.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;
.super Ljava/awt/Frame;
.source "JMFInit.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field private static final serialVersionUID:J = 0x59e0d667496d3190L


# instance fields
.field private done:Z

.field private tempDir:Ljava/lang/String;

.field private userHome:Ljava/lang/String;

.field private visible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Z)V
    .locals 5
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "visible"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 50
    const-string/jumbo v2, "Initializing JMF..."

    invoke-direct {p0, v2}, Ljava/awt/Frame;-><init>(Ljava/lang/String;)V

    .line 41
    const-string/jumbo v2, "/tmp"

    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->tempDir:Ljava/lang/String;

    .line 43
    iput-boolean v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->done:Z

    .line 47
    iput-boolean v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->visible:Z

    .line 52
    iput-boolean p2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->visible:Z

    .line 54
    const-string/jumbo v2, "secure.allowCaptureFromApplets"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/sun/media/util/Registry;->set(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 55
    const-string/jumbo v2, "secure.allowSaveFileFromApplets"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/sun/media/util/Registry;->set(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 57
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->updateTemp([Ljava/lang/String;)V

    .line 60
    :try_start_0
    invoke-static {}, Lcom/sun/media/util/Registry;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_0
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 68
    .local v0, "detectThread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->run()V

    .line 81
    return-void

    .line 62
    .end local v0    # "detectThread":Ljava/lang/Thread;
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "Failed to commit to JMFRegistry!"

    invoke-direct {p0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private createGUI()V
    .locals 6

    .prologue
    .line 281
    new-instance v2, Ljava/awt/TextArea;

    const/4 v3, 0x5

    const/16 v4, 0x32

    invoke-direct {v2, v3, v4}, Ljava/awt/TextArea;-><init>(II)V

    .line 282
    .local v2, "textBox":Ljava/awt/TextArea;
    const-string/jumbo v3, "Center"

    invoke-virtual {p0, v3, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 283
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/awt/TextArea;->setEditable(Z)V

    .line 284
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->addNotify()V

    .line 285
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->pack()V

    .line 287
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v3

    invoke-virtual {v3}, Ljava/awt/Toolkit;->getScreenSize()Ljava/awt/Dimension;

    move-result-object v3

    invoke-virtual {v3}, Ljava/awt/Dimension;->getWidth()D

    move-result-wide v4

    double-to-int v1, v4

    .line 289
    .local v1, "scrWidth":I
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v3

    invoke-virtual {v3}, Ljava/awt/Toolkit;->getScreenSize()Ljava/awt/Dimension;

    move-result-object v3

    invoke-virtual {v3}, Ljava/awt/Dimension;->getHeight()D

    move-result-wide v4

    double-to-int v0, v4

    .line 292
    .local v0, "scrHeight":I
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->getWidth()I

    move-result v3

    sub-int v3, v1, v3

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->getHeight()I

    move-result v4

    sub-int v4, v0, v4

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {p0, v3, v4}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->setLocation(II)V

    .line 294
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->visible:Z

    invoke-virtual {p0, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->setVisible(Z)V

    .line 296
    return-void
.end method

.method private detectCaptureDevices()V
    .locals 5

    .prologue
    .line 110
    const-string/jumbo v4, "Looking for Audio capturer"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V

    .line 113
    :try_start_0
    const-string/jumbo v4, "DirectSoundAuto"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 114
    .local v0, "dsauto":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 115
    const-string/jumbo v4, "Finished detecting DirectSound capturer"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ThreadDeath; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    .line 126
    .end local v0    # "dsauto":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    :try_start_1
    const-string/jumbo v4, "JavaSoundAuto"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 127
    .local v1, "jsauto":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 128
    const-string/jumbo v4, "Finished detecting javasound capturer"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/ThreadDeath; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 185
    .end local v1    # "jsauto":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    return-void

    .line 117
    :catch_0
    move-exception v3

    .line 118
    .local v3, "td":Ljava/lang/ThreadDeath;
    throw v3

    .line 130
    .end local v3    # "td":Ljava/lang/ThreadDeath;
    :catch_1
    move-exception v3

    .line 131
    .restart local v3    # "td":Ljava/lang/ThreadDeath;
    throw v3

    .line 133
    .end local v3    # "td":Ljava/lang/ThreadDeath;
    :catch_2
    move-exception v2

    .line 134
    .local v2, "t":Ljava/lang/Throwable;
    const-string/jumbo v4, "JavaSound capturer detection failed!"

    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V

    goto :goto_1

    .line 120
    .end local v2    # "t":Ljava/lang/Throwable;
    :catch_3
    move-exception v4

    goto :goto_0
.end method

.method private detectDirectAudio()V
    .locals 13

    .prologue
    .line 189
    const/4 v10, 0x4

    .line 190
    .local v10, "plType":I
    const-string/jumbo v7, "com.sun.media.renderer.audio.DirectAudioRenderer"

    .line 193
    .local v7, "dar":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v1, "VFWAuto"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 196
    .local v6, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string/jumbo v1, "com.sun.media.protocol.dsound.DSound"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 198
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 200
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljavax/media/Renderer;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    .local v11, "rend":Ljavax/media/Renderer;
    :try_start_1
    new-instance v0, Ljavax/media/format/AudioFormat;

    const-string/jumbo v1, "LINEAR"

    const-wide v2, 0x40e5888000000000L    # 44100.0

    const/16 v4, 0x10

    const/4 v5, 0x2

    invoke-direct/range {v0 .. v5}, Ljavax/media/format/AudioFormat;-><init>(Ljava/lang/String;DII)V

    .line 205
    .local v0, "af":Ljavax/media/format/AudioFormat;
    invoke-interface {v11, v0}, Ljavax/media/Renderer;->setInputFormat(Ljavax/media/Format;)Ljavax/media/Format;

    .line 206
    invoke-interface {v11}, Ljavax/media/Renderer;->open()V

    .line 207
    invoke-interface {v11}, Ljavax/media/Renderer;->getSupportedInputFormats()[Ljavax/media/Format;

    move-result-object v8

    .line 209
    .local v8, "inputFormats":[Ljavax/media/Format;
    const/4 v1, 0x0

    new-array v1, v1, [Ljavax/media/Format;

    invoke-static {v7, v8, v1, v10}, Ljavax/media/PlugInManager;->addPlugIn(Ljava/lang/String;[Ljavax/media/Format;[Ljavax/media/Format;I)Z

    .line 212
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v1, v2, v10}, Ljavax/media/PlugInManager;->getPlugInList(Ljavax/media/Format;Ljavax/media/Format;I)Ljava/util/Vector;

    move-result-object v12

    .line 214
    .local v12, "rendList":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v9

    .line 215
    .local v9, "listSize":I
    add-int/lit8 v1, v9, -0x1

    invoke-virtual {v12, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 216
    add-int/lit8 v1, v9, -0x1

    invoke-virtual {v12, v1}, Ljava/util/Vector;->removeElementAt(I)V

    .line 217
    const/4 v1, 0x0

    invoke-virtual {v12, v7, v1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 218
    invoke-static {v12, v10}, Ljavax/media/PlugInManager;->setPlugInList(Ljava/util/Vector;I)V

    .line 219
    invoke-static {}, Ljavax/media/PlugInManager;->commit()V

    .line 222
    :cond_0
    invoke-interface {v11}, Ljavax/media/Renderer;->close()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 231
    .end local v0    # "af":Ljavax/media/format/AudioFormat;
    .end local v6    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "inputFormats":[Ljavax/media/Format;
    .end local v9    # "listSize":I
    .end local v11    # "rend":Ljavax/media/Renderer;
    .end local v12    # "rendList":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_0
    return-void

    .line 228
    :catch_0
    move-exception v1

    goto :goto_0

    .line 224
    .restart local v6    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v11    # "rend":Ljavax/media/Renderer;
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private detectS8DirectAudio()V
    .locals 11

    .prologue
    .line 235
    const/4 v5, 0x4

    .line 236
    .local v5, "plType":I
    const-string/jumbo v1, "com.sun.media.renderer.audio.DirectAudioRenderer"

    .line 239
    .local v1, "dar":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v9, "SunVideoAuto"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 242
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 244
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljavax/media/Renderer;

    .line 246
    .local v6, "rend":Ljavax/media/Renderer;
    instance-of v9, v6, Lcom/sun/media/ExclusiveUse;

    if-eqz v9, :cond_1

    check-cast v6, Lcom/sun/media/ExclusiveUse;

    .end local v6    # "rend":Ljavax/media/Renderer;
    invoke-interface {v6}, Lcom/sun/media/ExclusiveUse;->isExclusive()Z

    move-result v9

    if-nez v9, :cond_1

    .line 249
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {v9, v10, v5}, Ljavax/media/PlugInManager;->getPlugInList(Ljavax/media/Format;Ljavax/media/Format;I)Ljava/util/Vector;

    move-result-object v7

    .line 251
    .local v7, "rendList":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v4

    .line 252
    .local v4, "listSize":I
    const/4 v2, 0x0

    .line 253
    .local v2, "found":Z
    const/4 v8, 0x0

    .line 255
    .local v8, "rname":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_0

    .line 256
    invoke-virtual {v7, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "rname":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 257
    .restart local v8    # "rname":Ljava/lang/String;
    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 258
    const/4 v2, 0x1

    .line 259
    invoke-virtual {v7, v3}, Ljava/util/Vector;->removeElementAt(I)V

    .line 264
    :cond_0
    if-eqz v2, :cond_1

    .line 265
    const/4 v9, 0x0

    invoke-virtual {v7, v1, v9}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 266
    invoke-static {v7, v5}, Ljavax/media/PlugInManager;->setPlugInList(Ljava/util/Vector;I)V

    .line 267
    invoke-static {}, Ljavax/media/PlugInManager;->commit()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "found":Z
    .end local v3    # "i":I
    .end local v4    # "listSize":I
    .end local v7    # "rendList":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v8    # "rname":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 255
    .restart local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v2    # "found":Z
    .restart local v3    # "i":I
    .restart local v4    # "listSize":I
    .restart local v7    # "rendList":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "rname":Ljava/lang/String;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 271
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "found":Z
    .end local v3    # "i":I
    .end local v4    # "listSize":I
    .end local v7    # "rendList":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .end local v8    # "rname":Ljava/lang/String;
    :catch_0
    move-exception v9

    goto :goto_1
.end method

.method private message(Ljava/lang/String;)V
    .locals 1
    .param p1, "mesg"    # Ljava/lang/String;

    .prologue
    .line 277
    sget-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 278
    return-void
.end method

.method public static start(Z)V
    .locals 2
    .param p0, "visible"    # Z

    .prologue
    .line 299
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;-><init>([Ljava/lang/String;Z)V

    .line 300
    return-void
.end method

.method private updateTemp([Ljava/lang/String;)V
    .locals 4
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 91
    if-eqz p1, :cond_0

    array-length v2, p1

    if-lez v2, :cond_0

    .line 92
    const/4 v2, 0x0

    aget-object v2, p1, v2

    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->tempDir:Ljava/lang/String;

    .line 94
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Setting cache directory to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->tempDir:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V

    .line 95
    new-instance v1, Lcom/sun/media/util/Registry;

    invoke-direct {v1}, Lcom/sun/media/util/Registry;-><init>()V

    .line 97
    .local v1, "r":Lcom/sun/media/util/Registry;
    :try_start_0
    const-string/jumbo v2, "secure.cacheDir"

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->tempDir:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/sun/media/util/Registry;->set(Ljava/lang/String;Ljava/lang/Object;)Z

    .line 98
    invoke-static {}, Lcom/sun/media/util/Registry;->commit()Z

    .line 100
    const-string/jumbo v2, "Updated registry"

    invoke-direct {p0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .end local v1    # "r":Lcom/sun/media/util/Registry;
    :cond_0
    :goto_0
    return-void

    .line 102
    .restart local v1    # "r":Lcom/sun/media/util/Registry;
    :catch_0
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v2, "Couldn\'t update registry!"

    invoke-direct {p0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->message(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->detectDirectAudio()V

    .line 85
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->detectS8DirectAudio()V

    .line 86
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->detectCaptureDevices()V

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;->done:Z

    .line 88
    return-void
.end method
