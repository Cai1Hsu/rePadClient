.class public Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/debugger/SmackDebugger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;,
        Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;,
        Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;
    }
.end annotation


# static fields
.field private static final NEWLINE:Ljava/lang/String; = "\n"

.field private static iqPacketIcon:Ljavax/swing/ImageIcon;

.field private static messagePacketIcon:Ljavax/swing/ImageIcon;

.field private static packetReceivedIcon:Ljavax/swing/ImageIcon;

.field private static packetSentIcon:Ljavax/swing/ImageIcon;

.field private static presencePacketIcon:Ljavax/swing/ImageIcon;

.field private static unknownPacketTypeIcon:Ljavax/swing/ImageIcon;


# instance fields
.field private connListener:Lorg/jivesoftware/smack/ConnectionListener;

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private creationTime:Ljava/util/Date;

.field private messageTextArea:Ljavax/swing/JTextArea;

.field private messagesTable:Ljavax/swing/table/DefaultTableModel;

.field private packetReaderListener:Lorg/jivesoftware/smack/PacketListener;

.field private packetWriterListener:Lorg/jivesoftware/smack/PacketListener;

.field private reader:Ljava/io/Reader;

.field private readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

.field private receivedIQPackets:I

.field private receivedMessagePackets:I

.field private receivedOtherPackets:I

.field private receivedPackets:I

.field private receivedPresencePackets:I

.field private sentIQPackets:I

.field private sentMessagePackets:I

.field private sentOtherPackets:I

.field private sentPackets:I

.field private sentPresencePackets:I

.field private statisticsTable:Ljavax/swing/table/DefaultTableModel;

.field private statusField:Ljavax/swing/JFormattedTextField;

.field tabbedPane:Ljavax/swing/JTabbedPane;

.field private userField:Ljavax/swing/JFormattedTextField;

.field private writer:Ljava/io/Writer;

.field private writerListener:Lorg/jivesoftware/smack/util/WriterListener;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/io/Writer;Ljava/io/Reader;)V
    .locals 5
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "writer"    # Ljava/io/Writer;
    .param p3, "reader"    # Ljava/io/Reader;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/nav_left_blue.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 81
    .local v0, "url":Ljava/net/URL;
    if-eqz v0, :cond_0

    .line 82
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetReceivedIcon:Ljavax/swing/ImageIcon;

    .line 84
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/nav_right_red.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 86
    if-eqz v0, :cond_1

    .line 87
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetSentIcon:Ljavax/swing/ImageIcon;

    .line 89
    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/photo_portrait.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->presencePacketIcon:Ljavax/swing/ImageIcon;

    .line 94
    :cond_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/question_and_answer.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 97
    if-eqz v0, :cond_3

    .line 98
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->iqPacketIcon:Ljavax/swing/ImageIcon;

    .line 100
    :cond_3
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/message.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 101
    if-eqz v0, :cond_4

    .line 102
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messagePacketIcon:Ljavax/swing/ImageIcon;

    .line 104
    :cond_4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string/jumbo v2, "images/unknown.png"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 105
    if-eqz v0, :cond_5

    .line 106
    new-instance v1, Ljavax/swing/ImageIcon;

    invoke-direct {v1, v0}, Ljavax/swing/ImageIcon;-><init>(Ljava/net/URL;)V

    sput-object v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->unknownPacketTypeIcon:Ljavax/swing/ImageIcon;

    .line 110
    :cond_5
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messagesTable:Ljavax/swing/table/DefaultTableModel;

    .line 111
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messageTextArea:Ljavax/swing/JTextArea;

    .line 112
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    .line 113
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    .line 115
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 117
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetReaderListener:Lorg/jivesoftware/smack/PacketListener;

    .line 118
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetWriterListener:Lorg/jivesoftware/smack/PacketListener;

    .line 119
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    .line 126
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->creationTime:Ljava/util/Date;

    .line 129
    iput-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    .line 130
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPackets:I

    .line 131
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPackets:I

    .line 132
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentIQPackets:I

    .line 133
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedIQPackets:I

    .line 134
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentMessagePackets:I

    .line 135
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedMessagePackets:I

    .line 136
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPresencePackets:I

    .line 137
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPresencePackets:I

    .line 138
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentOtherPackets:I

    .line 139
    iput v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedOtherPackets:I

    .line 144
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 145
    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    .line 146
    iput-object p3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    .line 147
    invoke-direct {p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->createDebug()V

    .line 148
    invoke-static {p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->addDebugger(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    .line 149
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    .param p1, "x1"    # Ljava/text/SimpleDateFormat;
    .param p2, "x2"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addReadPacketToTable(Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    .param p1, "x1"    # Ljava/text/SimpleDateFormat;
    .param p2, "x2"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addSentPacketToTable(Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V

    return-void
.end method

.method static synthetic access$1008(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedIQPackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedIQPackets:I

    return v0
.end method

.method static synthetic access$1100()Ljavax/swing/ImageIcon;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messagePacketIcon:Ljavax/swing/ImageIcon;

    return-object v0
.end method

.method static synthetic access$1208(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedMessagePackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedMessagePackets:I

    return v0
.end method

.method static synthetic access$1300()Ljavax/swing/ImageIcon;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->presencePacketIcon:Ljavax/swing/ImageIcon;

    return-object v0
.end method

.method static synthetic access$1408(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPresencePackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPresencePackets:I

    return v0
.end method

.method static synthetic access$1500()Ljavax/swing/ImageIcon;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->unknownPacketTypeIcon:Ljavax/swing/ImageIcon;

    return-object v0
.end method

.method static synthetic access$1608(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedOtherPackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedOtherPackets:I

    return v0
.end method

.method static synthetic access$1700(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->formatXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800()Ljavax/swing/ImageIcon;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetReceivedIcon:Ljavax/swing/ImageIcon;

    return-object v0
.end method

.method static synthetic access$1900(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->updateStatistics()V

    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JFormattedTextField;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    return-object v0
.end method

.method static synthetic access$2008(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPackets:I

    return v0
.end method

.method static synthetic access$2108(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentIQPackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentIQPackets:I

    return v0
.end method

.method static synthetic access$2208(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentMessagePackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentMessagePackets:I

    return v0
.end method

.method static synthetic access$2308(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPresencePackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPresencePackets:I

    return v0
.end method

.method static synthetic access$2408(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentOtherPackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentOtherPackets:I

    return v0
.end method

.method static synthetic access$2500()Ljavax/swing/ImageIcon;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetSentIcon:Ljavax/swing/ImageIcon;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JTextArea;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messageTextArea:Ljavax/swing/JTextArea;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/table/DefaultTableModel;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messagesTable:Ljavax/swing/table/DefaultTableModel;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JFormattedTextField;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    return-object v0
.end method

.method static synthetic access$700(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Lorg/jivesoftware/smack/ConnectionListener;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    return-object v0
.end method

.method static synthetic access$808(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I
    .locals 2
    .param p0, "x0"    # Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .prologue
    .line 65
    iget v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPackets:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPackets:I

    return v0
.end method

.method static synthetic access$900()Ljavax/swing/ImageIcon;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->iqPacketIcon:Ljavax/swing/ImageIcon;

    return-object v0
.end method

.method private addAdhocPacketPanel()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 490
    new-instance v0, Ljavax/swing/JTextArea;

    invoke-direct {v0}, Ljavax/swing/JTextArea;-><init>()V

    .line 491
    .local v0, "adhocMessages":Ljavax/swing/JTextArea;
    invoke-virtual {v0, v6}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 492
    new-instance v3, Ljava/awt/Color;

    const/16 v4, 0x5e

    const/16 v5, 0x23

    invoke-direct {v3, v6, v4, v5}, Ljava/awt/Color;-><init>(III)V

    invoke-virtual {v0, v3}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 493
    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const-string/jumbo v4, "Ad-hoc message"

    new-instance v5, Ljavax/swing/JScrollPane;

    invoke-direct {v5, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v3, v4, v5}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 494
    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const/4 v4, 0x3

    const-string/jumbo v5, "Panel that allows you to send adhoc packets"

    invoke-virtual {v3, v4, v5}, Ljavax/swing/JTabbedPane;->setToolTipTextAt(ILjava/lang/String;)V

    .line 497
    new-instance v1, Ljavax/swing/JPopupMenu;

    invoke-direct {v1}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 498
    .local v1, "menu":Ljavax/swing/JPopupMenu;
    new-instance v2, Ljavax/swing/JMenuItem;

    const-string/jumbo v3, "Message"

    invoke-direct {v2, v3}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 499
    .local v2, "menuItem":Ljavax/swing/JMenuItem;
    new-instance v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$13;

    invoke-direct {v3, p0, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$13;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v2, v3}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 507
    invoke-virtual {v1, v2}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 509
    new-instance v2, Ljavax/swing/JMenuItem;

    .end local v2    # "menuItem":Ljavax/swing/JMenuItem;
    const-string/jumbo v3, "IQ Get"

    invoke-direct {v2, v3}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 510
    .restart local v2    # "menuItem":Ljavax/swing/JMenuItem;
    new-instance v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$14;

    invoke-direct {v3, p0, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$14;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v2, v3}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 518
    invoke-virtual {v1, v2}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 520
    new-instance v2, Ljavax/swing/JMenuItem;

    .end local v2    # "menuItem":Ljavax/swing/JMenuItem;
    const-string/jumbo v3, "IQ Set"

    invoke-direct {v2, v3}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 521
    .restart local v2    # "menuItem":Ljavax/swing/JMenuItem;
    new-instance v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$15;

    invoke-direct {v3, p0, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$15;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v2, v3}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 529
    invoke-virtual {v1, v2}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 531
    new-instance v2, Ljavax/swing/JMenuItem;

    .end local v2    # "menuItem":Ljavax/swing/JMenuItem;
    const-string/jumbo v3, "Presence"

    invoke-direct {v2, v3}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 532
    .restart local v2    # "menuItem":Ljavax/swing/JMenuItem;
    new-instance v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$16;

    invoke-direct {v3, p0, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$16;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v2, v3}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 538
    invoke-virtual {v1, v2}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 539
    invoke-virtual {v1}, Ljavax/swing/JPopupMenu;->addSeparator()V

    .line 541
    new-instance v2, Ljavax/swing/JMenuItem;

    .end local v2    # "menuItem":Ljavax/swing/JMenuItem;
    const-string/jumbo v3, "Send"

    invoke-direct {v2, v3}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 542
    .restart local v2    # "menuItem":Ljavax/swing/JMenuItem;
    new-instance v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;

    invoke-direct {v3, p0, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v2, v3}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 550
    invoke-virtual {v1, v2}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 552
    new-instance v2, Ljavax/swing/JMenuItem;

    .end local v2    # "menuItem":Ljavax/swing/JMenuItem;
    const-string/jumbo v3, "Clear"

    invoke-direct {v2, v3}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 553
    .restart local v2    # "menuItem":Ljavax/swing/JMenuItem;
    new-instance v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$18;

    invoke-direct {v3, p0, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$18;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v2, v3}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 558
    invoke-virtual {v1, v2}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 561
    new-instance v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;

    invoke-direct {v3, p0, v1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JPopupMenu;)V

    invoke-virtual {v0, v3}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 562
    return-void
.end method

.method private addBasicPanels()V
    .locals 17

    .prologue
    .line 249
    new-instance v1, Ljavax/swing/JSplitPane;

    const/4 v13, 0x0

    invoke-direct {v1, v13}, Ljavax/swing/JSplitPane;-><init>(I)V

    .line 250
    .local v1, "allPane":Ljavax/swing/JSplitPane;
    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Ljavax/swing/JSplitPane;->setOneTouchExpandable(Z)V

    .line 252
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$4;

    const/16 v14, 0x9

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string/jumbo v16, "Hide"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const-string/jumbo v16, "Timestamp"

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string/jumbo v16, ""

    aput-object v16, v14, v15

    const/4 v15, 0x3

    const-string/jumbo v16, ""

    aput-object v16, v14, v15

    const/4 v15, 0x4

    const-string/jumbo v16, "Message"

    aput-object v16, v14, v15

    const/4 v15, 0x5

    const-string/jumbo v16, "Id"

    aput-object v16, v14, v15

    const/4 v15, 0x6

    const-string/jumbo v16, "Type"

    aput-object v16, v14, v15

    const/4 v15, 0x7

    const-string/jumbo v16, "To"

    aput-object v16, v14, v15

    const/16 v15, 0x8

    const-string/jumbo v16, "From"

    aput-object v16, v14, v15

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v14, v15}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$4;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;[Ljava/lang/Object;I)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messagesTable:Ljavax/swing/table/DefaultTableModel;

    .line 269
    new-instance v12, Ljavax/swing/JTable;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messagesTable:Ljavax/swing/table/DefaultTableModel;

    invoke-direct {v12, v13}, Ljavax/swing/JTable;-><init>(Ljavax/swing/table/TableModel;)V

    .line 271
    .local v12, "table":Ljavax/swing/JTable;
    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljavax/swing/JTable;->setSelectionMode(I)V

    .line 273
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 274
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMinWidth(I)V

    .line 275
    invoke-virtual {v12}, Ljavax/swing/JTable;->getTableHeader()Ljavax/swing/table/JTableHeader;

    move-result-object v13

    invoke-virtual {v13}, Ljavax/swing/table/JTableHeader;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 276
    invoke-virtual {v12}, Ljavax/swing/JTable;->getTableHeader()Ljavax/swing/table/JTableHeader;

    move-result-object v13

    invoke-virtual {v13}, Ljavax/swing/table/JTableHeader;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMinWidth(I)V

    .line 278
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x1

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x12c

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 279
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x1

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x5a

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 281
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x2

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x32

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 282
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x2

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x1e

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 284
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x3

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x32

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 285
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x3

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x1e

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 287
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x5

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x64

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 288
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x5

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x37

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 290
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x6

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0xc8

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 291
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x6

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x32

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 293
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x7

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x12c

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 294
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/4 v14, 0x7

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x5a

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 296
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/16 v14, 0x8

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x12c

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setMaxWidth(I)V

    .line 297
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    const/16 v14, 0x8

    invoke-interface {v13, v14}, Ljavax/swing/table/TableColumnModel;->getColumn(I)Ljavax/swing/table/TableColumn;

    move-result-object v13

    const/16 v14, 0x5a

    invoke-virtual {v13, v14}, Ljavax/swing/table/TableColumn;->setPreferredWidth(I)V

    .line 299
    new-instance v9, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;

    move-object/from16 v0, p0

    invoke-direct {v9, v0, v12}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTable;)V

    .line 300
    .local v9, "selectionListener":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;
    invoke-virtual {v12}, Ljavax/swing/JTable;->getSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v13

    invoke-interface {v13, v9}, Ljavax/swing/ListSelectionModel;->addListSelectionListener(Ljavax/swing/event/ListSelectionListener;)V

    .line 301
    invoke-virtual {v12}, Ljavax/swing/JTable;->getColumnModel()Ljavax/swing/table/TableColumnModel;

    move-result-object v13

    invoke-interface {v13}, Ljavax/swing/table/TableColumnModel;->getSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v13

    invoke-interface {v13, v9}, Ljavax/swing/ListSelectionModel;->addListSelectionListener(Ljavax/swing/event/ListSelectionListener;)V

    .line 302
    new-instance v13, Ljavax/swing/JScrollPane;

    invoke-direct {v13, v12}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v1, v13}, Ljavax/swing/JSplitPane;->setTopComponent(Ljava/awt/Component;)V

    .line 303
    new-instance v13, Ljavax/swing/JTextArea;

    invoke-direct {v13}, Ljavax/swing/JTextArea;-><init>()V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messageTextArea:Ljavax/swing/JTextArea;

    .line 304
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messageTextArea:Ljavax/swing/JTextArea;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 306
    new-instance v5, Ljavax/swing/JPopupMenu;

    invoke-direct {v5}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 307
    .local v5, "menu":Ljavax/swing/JPopupMenu;
    new-instance v6, Ljavax/swing/JMenuItem;

    const-string/jumbo v13, "Copy"

    invoke-direct {v6, v13}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 308
    .local v6, "menuItem1":Ljavax/swing/JMenuItem;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$5;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$5;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    invoke-virtual {v6, v13}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 316
    invoke-virtual {v5, v6}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 318
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messageTextArea:Ljavax/swing/JTextArea;

    new-instance v14, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v5}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JPopupMenu;)V

    invoke-virtual {v13, v14}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 319
    new-instance v11, Ljavax/swing/JPanel;

    new-instance v13, Ljava/awt/BorderLayout;

    invoke-direct {v13}, Ljava/awt/BorderLayout;-><init>()V

    invoke-direct {v11, v13}, Ljavax/swing/JPanel;-><init>(Ljava/awt/LayoutManager;)V

    .line 320
    .local v11, "sublayout":Ljavax/swing/JPanel;
    new-instance v13, Ljavax/swing/JScrollPane;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messageTextArea:Ljavax/swing/JTextArea;

    invoke-direct {v13, v14}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    const-string/jumbo v14, "Center"

    invoke-virtual {v11, v13, v14}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 322
    new-instance v2, Ljavax/swing/JButton;

    const-string/jumbo v13, "Clear All Packets"

    invoke-direct {v2, v13}, Ljavax/swing/JButton;-><init>(Ljava/lang/String;)V

    .line 324
    .local v2, "clearb":Ljavax/swing/JButton;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$6;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$6;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    invoke-virtual {v2, v13}, Ljavax/swing/JButton;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 334
    const-string/jumbo v13, "North"

    invoke-virtual {v11, v2, v13}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 335
    invoke-virtual {v1, v11}, Ljavax/swing/JSplitPane;->setBottomComponent(Ljava/awt/Component;)V

    .line 337
    const/16 v13, 0x96

    invoke-virtual {v1, v13}, Ljavax/swing/JSplitPane;->setDividerLocation(I)V

    .line 339
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const-string/jumbo v14, "All Packets"

    invoke-virtual {v13, v14, v1}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 340
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const/4 v14, 0x0

    const-string/jumbo v15, "Sent and received packets processed by Smack"

    invoke-virtual {v13, v14, v15}, Ljavax/swing/JTabbedPane;->setToolTipTextAt(ILjava/lang/String;)V

    .line 343
    new-instance v10, Ljavax/swing/JTextArea;

    invoke-direct {v10}, Ljavax/swing/JTextArea;-><init>()V

    .line 344
    .local v10, "sentText":Ljavax/swing/JTextArea;
    const/4 v13, 0x1

    invoke-virtual {v10, v13}, Ljavax/swing/JTextArea;->setWrapStyleWord(Z)V

    .line 345
    const/4 v13, 0x1

    invoke-virtual {v10, v13}, Ljavax/swing/JTextArea;->setLineWrap(Z)V

    .line 346
    const/4 v13, 0x0

    invoke-virtual {v10, v13}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 347
    new-instance v13, Ljava/awt/Color;

    const/16 v14, 0x70

    const/4 v15, 0x3

    const/16 v16, 0x3

    invoke-direct/range {v13 .. v16}, Ljava/awt/Color;-><init>(III)V

    invoke-virtual {v10, v13}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 348
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const-string/jumbo v14, "Raw Sent Packets"

    new-instance v15, Ljavax/swing/JScrollPane;

    invoke-direct {v15, v10}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v13, v14, v15}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 349
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const/4 v14, 0x1

    const-string/jumbo v15, "Raw text of the sent packets"

    invoke-virtual {v13, v14, v15}, Ljavax/swing/JTabbedPane;->setToolTipTextAt(ILjava/lang/String;)V

    .line 352
    new-instance v5, Ljavax/swing/JPopupMenu;

    .end local v5    # "menu":Ljavax/swing/JPopupMenu;
    invoke-direct {v5}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 353
    .restart local v5    # "menu":Ljavax/swing/JPopupMenu;
    new-instance v6, Ljavax/swing/JMenuItem;

    .end local v6    # "menuItem1":Ljavax/swing/JMenuItem;
    const-string/jumbo v13, "Copy"

    invoke-direct {v6, v13}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 354
    .restart local v6    # "menuItem1":Ljavax/swing/JMenuItem;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$7;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v10}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$7;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v6, v13}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 363
    new-instance v7, Ljavax/swing/JMenuItem;

    const-string/jumbo v13, "Clear"

    invoke-direct {v7, v13}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 364
    .local v7, "menuItem2":Ljavax/swing/JMenuItem;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$8;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v10}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$8;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v7, v13}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 371
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v5}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JPopupMenu;)V

    invoke-virtual {v10, v13}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 372
    invoke-virtual {v5, v6}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 373
    invoke-virtual {v5, v7}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 376
    new-instance v8, Ljavax/swing/JTextArea;

    invoke-direct {v8}, Ljavax/swing/JTextArea;-><init>()V

    .line 377
    .local v8, "receivedText":Ljavax/swing/JTextArea;
    const/4 v13, 0x1

    invoke-virtual {v8, v13}, Ljavax/swing/JTextArea;->setWrapStyleWord(Z)V

    .line 378
    const/4 v13, 0x1

    invoke-virtual {v8, v13}, Ljavax/swing/JTextArea;->setLineWrap(Z)V

    .line 379
    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 380
    new-instance v13, Ljava/awt/Color;

    const/4 v14, 0x6

    const/16 v15, 0x4c

    const/16 v16, 0x85

    invoke-direct/range {v13 .. v16}, Ljava/awt/Color;-><init>(III)V

    invoke-virtual {v8, v13}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 381
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const-string/jumbo v14, "Raw Received Packets"

    new-instance v15, Ljavax/swing/JScrollPane;

    invoke-direct {v15, v8}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v13, v14, v15}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 382
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const/4 v14, 0x2

    const-string/jumbo v15, "Raw text of the received packets before Smack process them"

    invoke-virtual {v13, v14, v15}, Ljavax/swing/JTabbedPane;->setToolTipTextAt(ILjava/lang/String;)V

    .line 387
    new-instance v5, Ljavax/swing/JPopupMenu;

    .end local v5    # "menu":Ljavax/swing/JPopupMenu;
    invoke-direct {v5}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 388
    .restart local v5    # "menu":Ljavax/swing/JPopupMenu;
    new-instance v6, Ljavax/swing/JMenuItem;

    .end local v6    # "menuItem1":Ljavax/swing/JMenuItem;
    const-string/jumbo v13, "Copy"

    invoke-direct {v6, v13}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 389
    .restart local v6    # "menuItem1":Ljavax/swing/JMenuItem;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$9;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v8}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$9;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v6, v13}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 398
    new-instance v7, Ljavax/swing/JMenuItem;

    .end local v7    # "menuItem2":Ljavax/swing/JMenuItem;
    const-string/jumbo v13, "Clear"

    invoke-direct {v7, v13}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 399
    .restart local v7    # "menuItem2":Ljavax/swing/JMenuItem;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$10;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v8}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$10;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    invoke-virtual {v7, v13}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 406
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v5}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JPopupMenu;)V

    invoke-virtual {v8, v13}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 407
    invoke-virtual {v5, v6}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 408
    invoke-virtual {v5, v7}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 411
    new-instance v3, Lorg/jivesoftware/smack/util/ObservableReader;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    invoke-direct {v3, v13}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 412
    .local v3, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v8}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    .line 446
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v3, v13}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 449
    new-instance v4, Lorg/jivesoftware/smack/util/ObservableWriter;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    invoke-direct {v4, v13}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 450
    .local v4, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    new-instance v13, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v10}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    .line 479
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v4, v13}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 483
    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    .line 484
    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    .line 486
    return-void
.end method

.method private addInformationPanel()V
    .locals 29

    .prologue
    .line 566
    new-instance v22, Ljavax/swing/JPanel;

    invoke-direct/range {v22 .. v22}, Ljavax/swing/JPanel;-><init>()V

    .line 567
    .local v22, "informationPanel":Ljavax/swing/JPanel;
    new-instance v7, Ljava/awt/BorderLayout;

    invoke-direct {v7}, Ljava/awt/BorderLayout;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 570
    new-instance v6, Ljavax/swing/JPanel;

    invoke-direct {v6}, Ljavax/swing/JPanel;-><init>()V

    .line 571
    .local v6, "connPanel":Ljavax/swing/JPanel;
    new-instance v7, Ljava/awt/GridBagLayout;

    invoke-direct {v7}, Ljava/awt/GridBagLayout;-><init>()V

    invoke-virtual {v6, v7}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 572
    const-string/jumbo v7, "Connection information"

    invoke-static {v7}, Ljavax/swing/BorderFactory;->createTitledBorder(Ljava/lang/String;)Ljavax/swing/border/TitledBorder;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 574
    new-instance v23, Ljavax/swing/JLabel;

    const-string/jumbo v7, "Host: "

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 575
    .local v23, "label":Ljavax/swing/JLabel;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 576
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 577
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x15

    const/16 v17, 0x0

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v23

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 580
    new-instance v21, Ljavax/swing/JFormattedTextField;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Ljavax/swing/JFormattedTextField;-><init>(Ljava/lang/Object;)V

    .line 581
    .local v21, "field":Ljavax/swing/JFormattedTextField;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0x14

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 582
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0x14

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 583
    const/4 v7, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setEditable(Z)V

    .line 584
    const/4 v7, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setBorder(Ljavax/swing/border/Border;)V

    .line 585
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    const-wide/16 v14, 0x0

    const/16 v16, 0xa

    const/16 v17, 0x2

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v21

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 590
    new-instance v23, Ljavax/swing/JLabel;

    .end local v23    # "label":Ljavax/swing/JLabel;
    const-string/jumbo v7, "Port: "

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 591
    .restart local v23    # "label":Ljavax/swing/JLabel;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 592
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 593
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x15

    const/16 v17, 0x0

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v23

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 596
    new-instance v21, Ljavax/swing/JFormattedTextField;

    .end local v21    # "field":Ljavax/swing/JFormattedTextField;
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getPort()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Ljavax/swing/JFormattedTextField;-><init>(Ljava/lang/Object;)V

    .line 597
    .restart local v21    # "field":Ljavax/swing/JFormattedTextField;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0x14

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 598
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0x14

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 599
    const/4 v7, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setEditable(Z)V

    .line 600
    const/4 v7, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setBorder(Ljavax/swing/border/Border;)V

    .line 601
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0xa

    const/16 v17, 0x2

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v21

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 606
    new-instance v23, Ljavax/swing/JLabel;

    .end local v23    # "label":Ljavax/swing/JLabel;
    const-string/jumbo v7, "User: "

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 607
    .restart local v23    # "label":Ljavax/swing/JLabel;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 608
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 609
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x0

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x15

    const/16 v17, 0x0

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v23

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 612
    new-instance v7, Ljavax/swing/JFormattedTextField;

    invoke-direct {v7}, Ljavax/swing/JFormattedTextField;-><init>()V

    move-object/from16 v0, p0

    iput-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    .line 613
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    new-instance v8, Ljava/awt/Dimension;

    const/16 v9, 0x96

    const/16 v10, 0x14

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 614
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    new-instance v8, Ljava/awt/Dimension;

    const/16 v9, 0x96

    const/16 v10, 0x14

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 615
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setEditable(Z)V

    .line 616
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setBorder(Ljavax/swing/border/Border;)V

    .line 617
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userField:Ljavax/swing/JFormattedTextField;

    move-object/from16 v26, v0

    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x1

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0xa

    const/16 v17, 0x2

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v27

    move/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v26

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 622
    new-instance v23, Ljavax/swing/JLabel;

    .end local v23    # "label":Ljavax/swing/JLabel;
    const-string/jumbo v7, "Creation time: "

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 623
    .restart local v23    # "label":Ljavax/swing/JLabel;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 624
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 625
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x0

    const/4 v9, 0x3

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x15

    const/16 v17, 0x0

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v23

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 628
    new-instance v21, Ljavax/swing/JFormattedTextField;

    .end local v21    # "field":Ljavax/swing/JFormattedTextField;
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string/jumbo v8, "yyyy.MM.dd hh:mm:ss:SS aaa"

    invoke-direct {v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Ljavax/swing/JFormattedTextField;-><init>(Ljava/text/Format;)V

    .line 629
    .restart local v21    # "field":Ljavax/swing/JFormattedTextField;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0x14

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 630
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0x14

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 631
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->creationTime:Ljava/util/Date;

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setValue(Ljava/lang/Object;)V

    .line 632
    const/4 v7, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setEditable(Z)V

    .line 633
    const/4 v7, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Ljavax/swing/JFormattedTextField;->setBorder(Ljavax/swing/border/Border;)V

    .line 634
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x1

    const/4 v9, 0x3

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0xa

    const/16 v17, 0x2

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v21

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 639
    new-instance v23, Ljavax/swing/JLabel;

    .end local v23    # "label":Ljavax/swing/JLabel;
    const-string/jumbo v7, "Status: "

    move-object/from16 v0, v23

    invoke-direct {v0, v7}, Ljavax/swing/JLabel;-><init>(Ljava/lang/String;)V

    .line 640
    .restart local v23    # "label":Ljavax/swing/JLabel;
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 641
    new-instance v7, Ljava/awt/Dimension;

    const/16 v8, 0x96

    const/16 v9, 0xe

    invoke-direct {v7, v8, v9}, Ljava/awt/Dimension;-><init>(II)V

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Ljavax/swing/JLabel;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 642
    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x0

    const/4 v9, 0x4

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x15

    const/16 v17, 0x0

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v26

    move/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v23

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 645
    new-instance v7, Ljavax/swing/JFormattedTextField;

    invoke-direct {v7}, Ljavax/swing/JFormattedTextField;-><init>()V

    move-object/from16 v0, p0

    iput-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    .line 646
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    new-instance v8, Ljava/awt/Dimension;

    const/16 v9, 0x96

    const/16 v10, 0x14

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setMinimumSize(Ljava/awt/Dimension;)V

    .line 647
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    new-instance v8, Ljava/awt/Dimension;

    const/16 v9, 0x96

    const/16 v10, 0x14

    invoke-direct {v8, v9, v10}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setMaximumSize(Ljava/awt/Dimension;)V

    .line 648
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    const-string/jumbo v8, "Active"

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setValue(Ljava/lang/Object;)V

    .line 649
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setEditable(Z)V

    .line 650
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljavax/swing/JFormattedTextField;->setBorder(Ljavax/swing/border/Border;)V

    .line 651
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statusField:Ljavax/swing/JFormattedTextField;

    move-object/from16 v26, v0

    new-instance v7, Ljava/awt/GridBagConstraints;

    const/4 v8, 0x1

    const/4 v9, 0x4

    const/4 v10, 0x1

    const/4 v11, 0x1

    const-wide/16 v12, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0xa

    const/16 v17, 0x2

    new-instance v18, Ljava/awt/Insets;

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v27

    move/from16 v4, v28

    invoke-direct {v0, v1, v2, v3, v4}, Ljava/awt/Insets;-><init>(IIII)V

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v7 .. v20}, Ljava/awt/GridBagConstraints;-><init>(IIIIDDIILjava/awt/Insets;II)V

    move-object/from16 v0, v26

    invoke-virtual {v6, v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 655
    const-string/jumbo v7, "North"

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 658
    new-instance v24, Ljavax/swing/JPanel;

    invoke-direct/range {v24 .. v24}, Ljavax/swing/JPanel;-><init>()V

    .line 659
    .local v24, "packetsPanel":Ljavax/swing/JPanel;
    new-instance v7, Ljava/awt/GridLayout;

    const/4 v8, 0x1

    const/4 v9, 0x1

    invoke-direct {v7, v8, v9}, Ljava/awt/GridLayout;-><init>(II)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 660
    const-string/jumbo v7, "Transmitted Packets"

    invoke-static {v7}, Ljavax/swing/BorderFactory;->createTitledBorder(Ljava/lang/String;)Ljavax/swing/border/TitledBorder;

    move-result-object v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljavax/swing/JPanel;->setBorder(Ljavax/swing/border/Border;)V

    .line 662
    new-instance v7, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$19;

    const/4 v8, 0x5

    new-array v8, v8, [[Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v12, "IQ"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    aput-object v10, v8, v9

    const/4 v9, 0x1

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v12, "Message"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    aput-object v10, v8, v9

    const/4 v9, 0x2

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v12, "Presence"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v12, "Other"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    aput-object v10, v8, v9

    const/4 v9, 0x4

    const/4 v10, 0x3

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string/jumbo v12, "Total"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    aput-object v10, v8, v9

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "Type"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    const-string/jumbo v11, "Received"

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-string/jumbo v11, "Sent"

    aput-object v11, v9, v10

    move-object/from16 v0, p0

    invoke-direct {v7, v0, v8, v9}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$19;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;[[Ljava/lang/Object;[Ljava/lang/Object;)V

    move-object/from16 v0, p0

    iput-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    .line 671
    new-instance v25, Ljavax/swing/JTable;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    move-object/from16 v0, v25

    invoke-direct {v0, v7}, Ljavax/swing/JTable;-><init>(Ljavax/swing/table/TableModel;)V

    .line 673
    .local v25, "table":Ljavax/swing/JTable;
    const/4 v7, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0, v7}, Ljavax/swing/JTable;->setSelectionMode(I)V

    .line 674
    new-instance v7, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v25

    invoke-direct {v7, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 677
    const-string/jumbo v7, "Center"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1, v7}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;Ljava/lang/Object;)V

    .line 679
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const-string/jumbo v8, "Information"

    new-instance v9, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v22

    invoke-direct {v9, v0}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual {v7, v8, v9}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 680
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    const/4 v8, 0x4

    const-string/jumbo v9, "Information and statistics about the debugged connection"

    invoke-virtual {v7, v8, v9}, Ljavax/swing/JTabbedPane;->setToolTipTextAt(ILjava/lang/String;)V

    .line 681
    return-void
.end method

.method private addReadPacketToTable(Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "dateFormatter"    # Ljava/text/SimpleDateFormat;
    .param p2, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 756
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$21;

    invoke-direct {v0, p0, p2, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$21;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Lorg/jivesoftware/smack/packet/Packet;Ljava/text/SimpleDateFormat;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 808
    return-void
.end method

.method private addSentPacketToTable(Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "dateFormatter"    # Ljava/text/SimpleDateFormat;
    .param p2, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 817
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;

    invoke-direct {v0, p0, p2, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Lorg/jivesoftware/smack/packet/Packet;Ljava/text/SimpleDateFormat;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 870
    return-void
.end method

.method private createDebug()V
    .locals 1

    .prologue
    .line 158
    new-instance v0, Ljavax/swing/JTabbedPane;

    invoke-direct {v0}, Ljavax/swing/JTabbedPane;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    .line 161
    invoke-direct {p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addBasicPanels()V

    .line 164
    invoke-direct {p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addAdhocPacketPanel()V

    .line 167
    invoke-direct {p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addInformationPanel()V

    .line 172
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetReaderListener:Lorg/jivesoftware/smack/PacketListener;

    .line 187
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetWriterListener:Lorg/jivesoftware/smack/PacketListener;

    .line 201
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    .line 246
    return-void
.end method

.method private formatXML(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 875
    :try_start_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;
    :try_end_0
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v3

    .line 879
    .local v3, "tFactory":Ljavax/xml/transform/TransformerFactory;
    :try_start_1
    const-string/jumbo v8, "indent-number"

    const/4 v9, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v3, v8, v9}, Ljavax/xml/transform/TransformerFactory;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_1 .. :try_end_1} :catch_1

    .line 884
    :goto_0
    :try_start_2
    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v6

    .line 885
    .local v6, "transformer":Ljavax/xml/transform/Transformer;
    const-string/jumbo v8, "omit-xml-declaration"

    const-string/jumbo v9, "yes"

    invoke-virtual {v6, v8, v9}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 886
    const-string/jumbo v8, "indent"

    const-string/jumbo v9, "yes"

    invoke-virtual {v6, v8, v9}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    const-string/jumbo v8, "{http://xml.apache.org/xslt}indent-amount"

    const-string/jumbo v9, "2"

    invoke-virtual {v6, v8, v9}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 890
    new-instance v1, Ljavax/xml/transform/stream/StreamSource;

    new-instance v8, Ljava/io/StringReader;

    invoke-direct {v8, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v8}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/Reader;)V

    .line 891
    .local v1, "source":Ljavax/xml/transform/stream/StreamSource;
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 892
    .local v2, "sw":Ljava/io/StringWriter;
    new-instance v0, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v0, v2}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 893
    .local v0, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-virtual {v6, v1, v0}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 894
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object p1

    .line 921
    .end local v0    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v1    # "source":Ljavax/xml/transform/stream/StreamSource;
    .end local v2    # "sw":Ljava/io/StringWriter;
    .end local v3    # "tFactory":Ljavax/xml/transform/TransformerFactory;
    .end local v6    # "transformer":Ljavax/xml/transform/Transformer;
    .end local p1    # "str":Ljava/lang/String;
    :goto_1
    return-object p1

    .line 897
    .restart local p1    # "str":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 899
    .local v4, "tce":Ljavax/xml/transform/TransformerConfigurationException;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v9, "\n** Transformer Factory error"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 900
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "   "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v4}, Ljavax/xml/transform/TransformerConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 903
    move-object v7, v4

    .line 904
    .local v7, "x":Ljava/lang/Throwable;
    invoke-virtual {v4}, Ljavax/xml/transform/TransformerConfigurationException;->getException()Ljava/lang/Throwable;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 905
    invoke-virtual {v4}, Ljavax/xml/transform/TransformerConfigurationException;->getException()Ljava/lang/Throwable;

    move-result-object v7

    .line 906
    :cond_0
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 909
    .end local v4    # "tce":Ljavax/xml/transform/TransformerConfigurationException;
    .end local v7    # "x":Ljava/lang/Throwable;
    :catch_1
    move-exception v5

    .line 911
    .local v5, "te":Ljavax/xml/transform/TransformerException;
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v9, "\n** Transformation error"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 912
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "   "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljavax/xml/transform/TransformerException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 915
    move-object v7, v5

    .line 916
    .restart local v7    # "x":Ljava/lang/Throwable;
    invoke-virtual {v5}, Ljavax/xml/transform/TransformerException;->getException()Ljava/lang/Throwable;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 917
    invoke-virtual {v5}, Ljavax/xml/transform/TransformerException;->getException()Ljava/lang/Throwable;

    move-result-object v7

    .line 918
    :cond_1
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    .line 881
    .end local v5    # "te":Ljavax/xml/transform/TransformerException;
    .end local v7    # "x":Ljava/lang/Throwable;
    .restart local v3    # "tFactory":Ljavax/xml/transform/TransformerFactory;
    :catch_2
    move-exception v8

    goto/16 :goto_0
.end method

.method private updateStatistics()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x0

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 733
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedIQPackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v4, v2}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 734
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentIQPackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v4, v3}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 736
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedMessagePackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v2}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 737
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentMessagePackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 739
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPresencePackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v3, v2}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 740
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPresencePackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v3, v3}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 742
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedOtherPackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v5, v2}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 743
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentOtherPackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v5, v3}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 745
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->receivedPackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v6, v2}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 746
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->statisticsTable:Ljavax/swing/table/DefaultTableModel;

    iget v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->sentPackets:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v6, v3}, Ljavax/swing/table/DefaultTableModel;->setValueAt(Ljava/lang/Object;II)V

    .line 747
    return-void
.end method


# virtual methods
.method cancel()V
    .locals 2

    .prologue
    .line 937
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 938
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetReaderListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 939
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetWriterListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketSendingListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 940
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    check-cast v0, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableReader;->removeReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 941
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    check-cast v0, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableWriter;->removeWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 942
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->messagesTable:Ljavax/swing/table/DefaultTableModel;

    .line 943
    return-void
.end method

.method public getReader()Ljava/io/Reader;
    .locals 1

    .prologue
    .line 714
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    return-object v0
.end method

.method public getReaderListener()Lorg/jivesoftware/smack/PacketListener;
    .locals 1

    .prologue
    .line 722
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetReaderListener:Lorg/jivesoftware/smack/PacketListener;

    return-object v0
.end method

.method public getWriter()Ljava/io/Writer;
    .locals 1

    .prologue
    .line 718
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    return-object v0
.end method

.method public getWriterListener()Lorg/jivesoftware/smack/PacketListener;
    .locals 1

    .prologue
    .line 726
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->packetWriterListener:Lorg/jivesoftware/smack/PacketListener;

    return-object v0
.end method

.method isConnectionActive()Z
    .locals 1

    .prologue
    .line 930
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v0

    return v0
.end method

.method public newConnectionReader(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 3
    .param p1, "newReader"    # Ljava/io/Reader;

    .prologue
    .line 684
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableReader;->removeReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 685
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableReader;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 686
    .local v0, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 687
    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    .line 688
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->reader:Ljava/io/Reader;

    return-object v1
.end method

.method public newConnectionWriter(Ljava/io/Writer;)Ljava/io/Writer;
    .locals 3
    .param p1, "newWriter"    # Ljava/io/Writer;

    .prologue
    .line 692
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;->removeWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 693
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableWriter;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 694
    .local v0, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 695
    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    .line 696
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->writer:Ljava/io/Writer;

    return-object v1
.end method

.method public userHasLogged(Ljava/lang/String;)V
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 700
    move-object v0, p0

    .line 701
    .local v0, "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    new-instance v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;

    invoke-direct {v1, p0, p1, v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    invoke-static {v1}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 711
    return-void
.end method
