.class public Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;
.super Ljava/lang/Object;
.source "EnhancedDebuggerWindow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$PopupListener;
    }
.end annotation


# static fields
.field public static MAX_TABLE_ROWS:I

.field public static PERSISTED_DEBUGGER:Z

.field private static connectionActiveIcon:Ljavax/swing/ImageIcon;

.field private static connectionClosedIcon:Ljavax/swing/ImageIcon;

.field private static connectionClosedOnErrorIcon:Ljavax/swing/ImageIcon;

.field private static connectionCreatedIcon:Ljavax/swing/ImageIcon;

.field private static instance:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;


# instance fields
.field private debuggers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;",
            ">;"
        }
    .end annotation
.end field

.field private frame:Ljavax/swing/JFrame;

.field private tabbedPane:Ljavax/swing/JTabbedPane;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x0

    sput-boolean v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->PERSISTED_DEBUGGER:Z

    .line 60
    const/16 v0, 0x96

    sput v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->MAX_TABLE_ROWS:I

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/trafficlight_off.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 68
    .local v0, "url":Ljava/net/URL;
    if-eqz v0, :cond_0

    .line 69
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionCreatedIcon:Ljavax/swing/ImageIcon;

    .line 71
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/trafficlight_green.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionActiveIcon:Ljavax/swing/ImageIcon;

    .line 77
    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/trafficlight_red.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 80
    if-eqz v0, :cond_2

    .line 81
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionClosedIcon:Ljavax/swing/ImageIcon;

    .line 83
    :cond_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/warning.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionClosedOnErrorIcon:Ljavax/swing/ImageIcon;

    .line 90
    :cond_3
    iput-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    .line 91
    iput-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    .line 92
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->debuggers:Ljava/util/List;

    .line 95
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    return-object v0
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->debuggers:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JFrame;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    return-object v0
.end method

.method static declared-synchronized addDebugger(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 2
    .param p0, "debugger"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 115
    const-class v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v0

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->showNewDebugger(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    monitor-exit v1

    return-void

    .line 115
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized connectionClosed(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 4
    .param p0, "debugger"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 159
    const-class v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v0

    iget-object v0, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v2

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v2, v3}, Ljavax/swing/JTabbedPane;->indexOfComponent(Ljava/awt/Component;)I

    move-result v2

    sget-object v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionClosedIcon:Ljavax/swing/ImageIcon;

    invoke-virtual {v0, v2, v3}, Ljavax/swing/JTabbedPane;->setIconAt(ILjavax/swing/Icon;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    monitor-exit v1

    return-void

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static declared-synchronized connectionClosedOnError(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/Exception;)V
    .locals 5
    .param p0, "debugger"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 171
    const-class v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v1

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v1, v3}, Ljavax/swing/JTabbedPane;->indexOfComponent(Ljava/awt/Component;)I

    move-result v0

    .line 172
    .local v0, "index":I
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v1

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Connection closed due to the exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Ljavax/swing/JTabbedPane;->setToolTipTextAt(ILjava/lang/String;)V

    .line 175
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v1

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    sget-object v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionClosedOnErrorIcon:Ljavax/swing/ImageIcon;

    invoke-virtual {v1, v0, v3}, Ljavax/swing/JTabbedPane;->setIconAt(ILjavax/swing/Icon;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    monitor-exit v2

    return-void

    .line 171
    .end local v0    # "index":I
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method static declared-synchronized connectionEstablished(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 4
    .param p0, "debugger"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 181
    const-class v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v0

    iget-object v0, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v2

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v2, v3}, Ljavax/swing/JTabbedPane;->indexOfComponent(Ljava/awt/Component;)I

    move-result v2

    sget-object v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionActiveIcon:Ljavax/swing/ImageIcon;

    invoke-virtual {v0, v2, v3}, Ljavax/swing/JTabbedPane;->setIconAt(ILjavax/swing/Icon;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    monitor-exit v1

    return-void

    .line 181
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private createDebug()V
    .locals 14

    .prologue
    .line 192
    new-instance v11, Ljavax/swing/JFrame;

    const-string/jumbo v12, "Smack Debug Window"

    invoke-direct {v11, v12}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    iput-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    .line 194
    sget-boolean v11, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->PERSISTED_DEBUGGER:Z

    if-nez v11, :cond_0

    .line 196
    iget-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    new-instance v12, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$1;

    invoke-direct {v12, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$1;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)V

    invoke-virtual {v11, v12}, Ljavax/swing/JFrame;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 205
    :cond_0
    new-instance v11, Ljavax/swing/JTabbedPane;

    invoke-direct {v11}, Ljavax/swing/JTabbedPane;-><init>()V

    iput-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    .line 208
    new-instance v3, Ljavax/swing/JPanel;

    invoke-direct {v3}, Ljavax/swing/JPanel;-><init>()V

    .line 209
    .local v3, "informationPanel":Ljavax/swing/JPanel;
    new-instance v11, Ljavax/swing/BoxLayout;

    const/4 v12, 0x1

    invoke-direct {v11, v3, v12}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v3, v11}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 212
    new-instance v10, Ljavax/swing/JPanel;

    invoke-direct {v10}, Ljavax/swing/JPanel;-><init>()V

    .line 213
    .local v10, "versionPanel":Ljavax/swing/JPanel;
    new-instance v11, Ljavax/swing/BoxLayout;

    const/4 v12, 0x0

    invoke-direct {v11, v10, v12}, Ljavax/swing/BoxLayout;-><init>(Ljava/awt/Container;I)V

    invoke-virtual {v10, v11}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 214
    new-instance v11, Ljava/awt/Dimension;

    const/16 v12, 0x7d0

    const/16 v13, 0x1f

    invoke-direct {v11, v12, v13}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v10, v11}, Ljavax/swing/JPanel;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 215
    new-instance v11, Ljavax/swing/JLabel;

    const-string/jumbo v12, " Smack version: "

    invoke-direct {v11, v12}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 216
    new-instance v1, Ljavax/swing/JFormattedTextField;

    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getVersion()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v1, v11}, Ljavax/swing/JFormattedTextField;-><init>(Ljava/lang/Object;)V

    .line 217
    .local v1, "field":Ljavax/swing/JFormattedTextField;
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Ljavax/swing/JFormattedTextField;->setEditable(Z)V

    .line 218
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Ljavax/swing/JFormattedTextField;->setBorder(Ljavax/swing/border/Border;)V

    .line 219
    invoke-virtual {v10, v1}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 220
    invoke-virtual {v3, v10}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 223
    new-instance v4, Ljavax/swing/JPanel;

    invoke-direct {v4}, Ljavax/swing/JPanel;-><init>()V

    .line 224
    .local v4, "iqProvidersPanel":Ljavax/swing/JPanel;
    new-instance v11, Ljava/awt/GridLayout;

    const/4 v12, 0x1

    const/4 v13, 0x1

    invoke-direct {v11, v12, v13}, Ljava/awt/GridLayout;-><init>(II)V

    invoke-virtual {v4, v11}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 225
    const-string/jumbo v11, "Installed IQ Providers"

    invoke-static {v11}, Ljavax/swing/BorderFactory;->createTitledBorder(Ljava/lang/String;)Ljavax/swing/border/TitledBorder;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 226
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 227
    .local v9, "providers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;

    move-result-object v11

    invoke-virtual {v11}, Lorg/jivesoftware/smack/provider/ProviderManager;->getIQProviders()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 228
    .local v8, "provider":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-class v12, Ljava/lang/Class;

    if-ne v11, v12, :cond_1

    .line 229
    check-cast v8, Ljava/lang/Class;

    .end local v8    # "provider":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 232
    .restart local v8    # "provider":Ljava/lang/Object;
    :cond_1
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 236
    .end local v8    # "provider":Ljava/lang/Object;
    :cond_2
    invoke-static {v9}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 237
    new-instance v5, Ljavax/swing/JList;

    invoke-direct {v5, v9}, Ljavax/swing/JList;-><init>(Ljava/util/Vector;)V

    .line 238
    .local v5, "list":Ljavax/swing/JList;
    new-instance v11, Ljavax/swing/JScrollPane;

    invoke-direct {v11, v5}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v4, v11}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 239
    invoke-virtual {v3, v4}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 242
    new-instance v0, Ljavax/swing/JPanel;

    invoke-direct {v0}, Ljavax/swing/JPanel;-><init>()V

    .line 243
    .local v0, "extensionProvidersPanel":Ljavax/swing/JPanel;
    new-instance v11, Ljava/awt/GridLayout;

    const/4 v12, 0x1

    const/4 v13, 0x1

    invoke-direct {v11, v12, v13}, Ljava/awt/GridLayout;-><init>(II)V

    invoke-virtual {v0, v11}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 244
    const-string/jumbo v11, "Installed Extension Providers"

    invoke-static {v11}, Ljavax/swing/BorderFactory;->createTitledBorder(Ljava/lang/String;)Ljavax/swing/border/TitledBorder;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 245
    new-instance v9, Ljava/util/Vector;

    .end local v9    # "providers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 246
    .restart local v9    # "providers":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;

    move-result-object v11

    invoke-virtual {v11}, Lorg/jivesoftware/smack/provider/ProviderManager;->getExtensionProviders()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 247
    .restart local v8    # "provider":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-class v12, Ljava/lang/Class;

    if-ne v11, v12, :cond_3

    .line 248
    check-cast v8, Ljava/lang/Class;

    .end local v8    # "provider":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 251
    .restart local v8    # "provider":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 255
    .end local v8    # "provider":Ljava/lang/Object;
    :cond_4
    invoke-static {v9}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 256
    new-instance v5, Ljavax/swing/JList;

    .end local v5    # "list":Ljavax/swing/JList;
    invoke-direct {v5, v9}, Ljavax/swing/JList;-><init>(Ljava/util/Vector;)V

    .line 257
    .restart local v5    # "list":Ljavax/swing/JList;
    new-instance v11, Ljavax/swing/JScrollPane;

    invoke-direct {v11, v5}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v0, v11}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 258
    invoke-virtual {v3, v0}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 260
    iget-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    const-string/jumbo v12, "Smack Info"

    invoke-virtual {v11, v12, v3}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 263
    new-instance v6, Ljavax/swing/JPopupMenu;

    invoke-direct {v6}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 265
    .local v6, "menu":Ljavax/swing/JPopupMenu;
    new-instance v7, Ljavax/swing/JMenuItem;

    const-string/jumbo v11, "Close"

    invoke-direct {v7, v11}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 266
    .local v7, "menuItem":Ljavax/swing/JMenuItem;
    new-instance v11, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;

    invoke-direct {v11, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)V

    invoke-virtual {v7, v11}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 284
    invoke-virtual {v6, v7}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 286
    new-instance v7, Ljavax/swing/JMenuItem;

    .end local v7    # "menuItem":Ljavax/swing/JMenuItem;
    const-string/jumbo v11, "Close All Not Active"

    invoke-direct {v7, v11}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 287
    .restart local v7    # "menuItem":Ljavax/swing/JMenuItem;
    new-instance v11, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;

    invoke-direct {v11, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)V

    invoke-virtual {v7, v11}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 310
    invoke-virtual {v6, v7}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 312
    iget-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    new-instance v12, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$PopupListener;

    invoke-direct {v12, p0, v6}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$PopupListener;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;Ljavax/swing/JPopupMenu;)V

    invoke-virtual {v11, v12}, Ljavax/swing/JTabbedPane;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 314
    iget-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    invoke-virtual {v11}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    move-result-object v11

    iget-object v12, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v11, v12}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 316
    iget-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    const/16 v12, 0x28a

    const/16 v13, 0x190

    invoke-virtual {v11, v12, v13}, Ljavax/swing/JFrame;->setSize(II)V

    .line 318
    sget-boolean v11, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->PERSISTED_DEBUGGER:Z

    if-nez v11, :cond_5

    .line 319
    iget-object v11, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Ljavax/swing/JFrame;->setVisible(Z)V

    .line 321
    :cond_5
    return-void
.end method

.method public static getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;
    .locals 1

    .prologue
    .line 103
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->instance:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->instance:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    .line 106
    :cond_0
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->instance:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    return-object v0
.end method

.method private showNewDebugger(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 3
    .param p1, "debugger"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 124
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    if-nez v0, :cond_0

    .line 125
    invoke-direct {p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->createDebug()V

    .line 127
    :cond_0
    iget-object v0, p1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Connection_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v2}, Ljavax/swing/JTabbedPane;->getComponentCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JTabbedPane;->setName(Ljava/lang/String;)V

    .line 128
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v1, p1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v2}, Ljavax/swing/JTabbedPane;->getComponentCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljavax/swing/JTabbedPane;->add(Ljava/awt/Component;I)Ljava/awt/Component;

    .line 129
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v2, p1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v1, v2}, Ljavax/swing/JTabbedPane;->indexOfComponent(Ljava/awt/Component;)I

    move-result v1

    sget-object v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionCreatedIcon:Ljavax/swing/ImageIcon;

    invoke-virtual {v0, v1, v2}, Ljavax/swing/JTabbedPane;->setIconAt(ILjavax/swing/Icon;)V

    .line 130
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Smack Debug Window -- Total connections: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v2}, Ljavax/swing/JTabbedPane;->getComponentCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JFrame;->setTitle(Ljava/lang/String;)V

    .line 133
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->debuggers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    return-void
.end method

.method static declared-synchronized userHasLogged(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;)V
    .locals 4
    .param p0, "debugger"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 144
    const-class v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v1

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v1, v3}, Ljavax/swing/JTabbedPane;->indexOfComponent(Ljava/awt/Component;)I

    move-result v0

    .line 145
    .local v0, "index":I
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v1

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v1, v0, p1}, Ljavax/swing/JTabbedPane;->setTitleAt(ILjava/lang/String;)V

    .line 148
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v1

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->tabbedPane:Ljavax/swing/JTabbedPane;

    sget-object v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->connectionActiveIcon:Ljavax/swing/ImageIcon;

    invoke-virtual {v1, v0, v3}, Ljavax/swing/JTabbedPane;->setIconAt(ILjavax/swing/Icon;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    monitor-exit v2

    return-void

    .line 144
    .end local v0    # "index":I
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public isVisible()Z
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    invoke-virtual {v0}, Ljavax/swing/JFrame;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public rootWindowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 4
    .param p1, "evt"    # Ljava/awt/event/WindowEvent;

    .prologue
    .line 331
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->debuggers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .line 332
    .local v0, "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->cancel()V

    goto :goto_0

    .line 335
    .end local v0    # "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    :cond_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->debuggers:Ljava/util/List;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->debuggers:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 337
    const/4 v2, 0x0

    sput-object v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->instance:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    .line 338
    return-void
.end method

.method public setVisible(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 367
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    if-eqz v0, :cond_0

    .line 368
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->frame:Ljavax/swing/JFrame;

    invoke-virtual {v0, p1}, Ljavax/swing/JFrame;->setVisible(Z)V

    .line 370
    :cond_0
    return-void
.end method
