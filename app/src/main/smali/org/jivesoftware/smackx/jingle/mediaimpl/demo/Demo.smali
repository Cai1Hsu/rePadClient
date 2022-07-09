.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;
.super Ljavax/swing/JFrame;
.source "Demo.java"


# static fields
.field private static final serialVersionUID:J = -0x5b5f2477db175c0fL


# instance fields
.field private incoming:Lorg/jivesoftware/smackx/jingle/JingleSession;

.field private jid:Ljavax/swing/JTextField;

.field private jm:Lorg/jivesoftware/smackx/jingle/JingleManager;

.field private outgoing:Lorg/jivesoftware/smackx/jingle/JingleSession;

.field private pass:Ljava/lang/String;

.field private server:Ljava/lang/String;

.field private transportManager:Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

.field private user:Ljava/lang/String;

.field private xmppConnection:Lorg/jivesoftware/smack/Connection;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "server"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "pass"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 60
    invoke-direct {p0}, Ljavax/swing/JFrame;-><init>()V

    .line 47
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->transportManager:Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .line 48
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    .line 50
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->server:Ljava/lang/String;

    .line 51
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->user:Ljava/lang/String;

    .line 52
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->pass:Ljava/lang/String;

    .line 54
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jm:Lorg/jivesoftware/smackx/jingle/JingleManager;

    .line 55
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->incoming:Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 56
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->outgoing:Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 62
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->server:Ljava/lang/String;

    .line 63
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->user:Ljava/lang/String;

    .line 64
    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->pass:Ljava/lang/String;

    .line 66
    const-string/jumbo v1, "jeffw"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 67
    new-instance v1, Ljavax/swing/JTextField;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "eowyn@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/Smack"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/swing/JTextField;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jid:Ljavax/swing/JTextField;

    .line 72
    :goto_0
    new-instance v1, Lorg/jivesoftware/smack/XMPPConnection;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/XMPPConnection;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    .line 74
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->connect()V

    .line 75
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, p2, p3}, Lorg/jivesoftware/smack/Connection;->login(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->initialize()V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :goto_1
    return-void

    .line 69
    :cond_0
    new-instance v1, Ljavax/swing/JTextField;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "jeffw@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/Smack"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/swing/JTextField;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jid:Ljavax/swing/JTextField;

    goto :goto_0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_1
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->incoming:Lorg/jivesoftware/smackx/jingle/JingleSession;

    return-object v0
.end method

.method static synthetic access$002(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 44
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->incoming:Lorg/jivesoftware/smackx/jingle/JingleSession;

    return-object p1
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->outgoing:Lorg/jivesoftware/smackx/jingle/JingleSession;

    return-object v0
.end method

.method static synthetic access$102(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 44
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->outgoing:Lorg/jivesoftware/smackx/jingle/JingleSession;

    return-object p1
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Ljavax/swing/JTextField;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jid:Ljavax/swing/JTextField;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleManager;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jm:Lorg/jivesoftware/smackx/jingle/JingleManager;

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 5
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x2

    const/4 v4, 0x1

    .line 168
    const/4 v0, 0x0

    .line 170
    .local v0, "demo":Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;
    array-length v1, p0

    if-le v1, v3, :cond_0

    .line 171
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    .end local v0    # "demo":Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;
    const/4 v1, 0x0

    aget-object v1, p0, v1

    aget-object v2, p0, v4

    aget-object v3, p0, v3

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .restart local v0    # "demo":Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->pack()V

    .line 173
    invoke-virtual {v0, v4}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->setVisible(Z)V

    .line 174
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->setDefaultCloseOperation(I)V

    .line 177
    :cond_0
    return-void
.end method


# virtual methods
.method public createGUI()V
    .locals 4

    .prologue
    .line 116
    new-instance v0, Ljavax/swing/JPanel;

    invoke-direct {v0}, Ljavax/swing/JPanel;-><init>()V

    .line 118
    .local v0, "jPanel":Ljavax/swing/JPanel;
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jid:Ljavax/swing/JTextField;

    invoke-virtual {v0, v1}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 120
    new-instance v1, Ljavax/swing/JButton;

    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;

    const-string/jumbo v3, "Call"

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$2;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljavax/swing/JButton;-><init>(Ljavax/swing/Action;)V

    invoke-virtual {v0, v1}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 135
    new-instance v1, Ljavax/swing/JButton;

    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;

    const-string/jumbo v3, "Hangup"

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$3;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljavax/swing/JButton;-><init>(Ljavax/swing/Action;)V

    invoke-virtual {v0, v1}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 162
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 164
    return-void
.end method

.method public initialize()V
    .locals 5

    .prologue
    .line 84
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    const-string/jumbo v3, "10.47.47.53"

    const/16 v4, 0xd96

    invoke-direct {v0, v2, v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;I)V

    .line 85
    .local v0, "icetm0":Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v1, "mediaManagers":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;>;"
    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;

    invoke-direct {v2, v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;

    invoke-direct {v2, v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    new-instance v2, Lorg/jivesoftware/smackx/jingle/JingleManager;

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v2, v3, v1}, Lorg/jivesoftware/smackx/jingle/JingleManager;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/util/List;)V

    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jm:Lorg/jivesoftware/smackx/jingle/JingleManager;

    .line 90
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jm:Lorg/jivesoftware/smackx/jingle/JingleManager;

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smackx/jingle/JingleManager;->addCreationListener(Lorg/jivesoftware/smackx/jingle/listeners/CreatedJingleSessionListener;)V

    .line 92
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->jm:Lorg/jivesoftware/smackx/jingle/JingleManager;

    new-instance v3, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$1;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$1;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)V

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/JingleManager;->addJingleSessionRequestListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionRequestListener;)V

    .line 111
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->createGUI()V

    .line 112
    return-void
.end method
