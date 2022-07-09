.class public Lorg/jivesoftware/smack/debugger/LiteDebugger;
.super Ljava/lang/Object;
.source "LiteDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/debugger/SmackDebugger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;
    }
.end annotation


# static fields
.field private static final NEWLINE:Ljava/lang/String; = "\n"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private frame:Ljavax/swing/JFrame;

.field private listener:Lorg/jivesoftware/smack/PacketListener;

.field private reader:Ljava/io/Reader;

.field private readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

.field private writer:Ljava/io/Writer;

.field private writerListener:Lorg/jivesoftware/smack/util/WriterListener;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/io/Writer;Ljava/io/Reader;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "writer"    # Ljava/io/Writer;
    .param p3, "reader"    # Ljava/io/Reader;

    .prologue
    const/4 v0, 0x0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->frame:Ljavax/swing/JFrame;

    .line 45
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    .line 55
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 56
    iput-object p2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    .line 57
    iput-object p3, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    .line 58
    invoke-direct {p0}, Lorg/jivesoftware/smack/debugger/LiteDebugger;->createDebug()V

    .line 59
    return-void
.end method

.method private createDebug()V
    .locals 20

    .prologue
    .line 65
    new-instance v16, Ljavax/swing/JFrame;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Smack Debug Window -- "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, ":"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/Connection;->getPort()I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljavax/swing/JFrame;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/debugger/LiteDebugger;->frame:Ljavax/swing/JFrame;

    .line 69
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->frame:Ljavax/swing/JFrame;

    move-object/from16 v16, v0

    new-instance v17, Lorg/jivesoftware/smack/debugger/LiteDebugger$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/debugger/LiteDebugger$1;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;)V

    invoke-virtual/range {v16 .. v17}, Ljavax/swing/JFrame;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 78
    new-instance v15, Ljavax/swing/JTabbedPane;

    invoke-direct {v15}, Ljavax/swing/JTabbedPane;-><init>()V

    .line 80
    .local v15, "tabbedPane":Ljavax/swing/JTabbedPane;
    new-instance v2, Ljavax/swing/JPanel;

    invoke-direct {v2}, Ljavax/swing/JPanel;-><init>()V

    .line 81
    .local v2, "allPane":Ljavax/swing/JPanel;
    new-instance v16, Ljava/awt/GridLayout;

    const/16 v17, 0x3

    const/16 v18, 0x1

    invoke-direct/range {v16 .. v18}, Ljava/awt/GridLayout;-><init>(II)V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljavax/swing/JPanel;->setLayout(Ljava/awt/LayoutManager;)V

    .line 82
    const-string/jumbo v16, "All"

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v2}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 85
    new-instance v13, Ljavax/swing/JTextArea;

    invoke-direct {v13}, Ljavax/swing/JTextArea;-><init>()V

    .line 86
    .local v13, "sentText1":Ljavax/swing/JTextArea;
    new-instance v14, Ljavax/swing/JTextArea;

    invoke-direct {v14}, Ljavax/swing/JTextArea;-><init>()V

    .line 87
    .local v14, "sentText2":Ljavax/swing/JTextArea;
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 88
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 89
    new-instance v16, Ljava/awt/Color;

    const/16 v17, 0x70

    const/16 v18, 0x3

    const/16 v19, 0x3

    invoke-direct/range {v16 .. v19}, Ljava/awt/Color;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 90
    new-instance v16, Ljava/awt/Color;

    const/16 v17, 0x70

    const/16 v18, 0x3

    const/16 v19, 0x3

    invoke-direct/range {v16 .. v19}, Ljava/awt/Color;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 91
    new-instance v16, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v16

    invoke-direct {v0, v13}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 92
    const-string/jumbo v16, "Sent"

    new-instance v17, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v17

    invoke-direct {v0, v14}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual/range {v15 .. v17}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 95
    new-instance v7, Ljavax/swing/JPopupMenu;

    invoke-direct {v7}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 96
    .local v7, "menu":Ljavax/swing/JPopupMenu;
    new-instance v8, Ljavax/swing/JMenuItem;

    const-string/jumbo v16, "Copy"

    move-object/from16 v0, v16

    invoke-direct {v8, v0}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 97
    .local v8, "menuItem1":Ljavax/swing/JMenuItem;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$2;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13}, Lorg/jivesoftware/smack/debugger/LiteDebugger$2;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 106
    new-instance v9, Ljavax/swing/JMenuItem;

    const-string/jumbo v16, "Clear"

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 107
    .local v9, "menuItem2":Ljavax/swing/JMenuItem;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$3;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13, v14}, Lorg/jivesoftware/smack/debugger/LiteDebugger$3;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 115
    new-instance v10, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v7}, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JPopupMenu;)V

    .line 116
    .local v10, "popupListener":Ljava/awt/event/MouseListener;
    invoke-virtual {v13, v10}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 117
    invoke-virtual {v14, v10}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 118
    invoke-virtual {v7, v8}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 119
    invoke-virtual {v7, v9}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 122
    new-instance v11, Ljavax/swing/JTextArea;

    invoke-direct {v11}, Ljavax/swing/JTextArea;-><init>()V

    .line 123
    .local v11, "receivedText1":Ljavax/swing/JTextArea;
    new-instance v12, Ljavax/swing/JTextArea;

    invoke-direct {v12}, Ljavax/swing/JTextArea;-><init>()V

    .line 124
    .local v12, "receivedText2":Ljavax/swing/JTextArea;
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v11, v0}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 125
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 126
    new-instance v16, Ljava/awt/Color;

    const/16 v17, 0x6

    const/16 v18, 0x4c

    const/16 v19, 0x85

    invoke-direct/range {v16 .. v19}, Ljava/awt/Color;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 127
    new-instance v16, Ljava/awt/Color;

    const/16 v17, 0x6

    const/16 v18, 0x4c

    const/16 v19, 0x85

    invoke-direct/range {v16 .. v19}, Ljava/awt/Color;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 128
    new-instance v16, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v16

    invoke-direct {v0, v11}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 129
    const-string/jumbo v16, "Received"

    new-instance v17, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v17

    invoke-direct {v0, v12}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual/range {v15 .. v17}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 132
    new-instance v7, Ljavax/swing/JPopupMenu;

    .end local v7    # "menu":Ljavax/swing/JPopupMenu;
    invoke-direct {v7}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 133
    .restart local v7    # "menu":Ljavax/swing/JPopupMenu;
    new-instance v8, Ljavax/swing/JMenuItem;

    .end local v8    # "menuItem1":Ljavax/swing/JMenuItem;
    const-string/jumbo v16, "Copy"

    move-object/from16 v0, v16

    invoke-direct {v8, v0}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 134
    .restart local v8    # "menuItem1":Ljavax/swing/JMenuItem;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$4;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lorg/jivesoftware/smack/debugger/LiteDebugger$4;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 143
    new-instance v9, Ljavax/swing/JMenuItem;

    .end local v9    # "menuItem2":Ljavax/swing/JMenuItem;
    const-string/jumbo v16, "Clear"

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 144
    .restart local v9    # "menuItem2":Ljavax/swing/JMenuItem;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$5;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11, v12}, Lorg/jivesoftware/smack/debugger/LiteDebugger$5;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 152
    new-instance v10, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;

    .end local v10    # "popupListener":Ljava/awt/event/MouseListener;
    move-object/from16 v0, p0

    invoke-direct {v10, v0, v7}, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JPopupMenu;)V

    .line 153
    .restart local v10    # "popupListener":Ljava/awt/event/MouseListener;
    invoke-virtual {v11, v10}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 154
    invoke-virtual {v12, v10}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 155
    invoke-virtual {v7, v8}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 156
    invoke-virtual {v7, v9}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 159
    new-instance v5, Ljavax/swing/JTextArea;

    invoke-direct {v5}, Ljavax/swing/JTextArea;-><init>()V

    .line 160
    .local v5, "interpretedText1":Ljavax/swing/JTextArea;
    new-instance v6, Ljavax/swing/JTextArea;

    invoke-direct {v6}, Ljavax/swing/JTextArea;-><init>()V

    .line 161
    .local v6, "interpretedText2":Ljavax/swing/JTextArea;
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 162
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Ljavax/swing/JTextArea;->setEditable(Z)V

    .line 163
    new-instance v16, Ljava/awt/Color;

    const/16 v17, 0x1

    const/16 v18, 0x5e

    const/16 v19, 0x23

    invoke-direct/range {v16 .. v19}, Ljava/awt/Color;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 164
    new-instance v16, Ljava/awt/Color;

    const/16 v17, 0x1

    const/16 v18, 0x5e

    const/16 v19, 0x23

    invoke-direct/range {v16 .. v19}, Ljava/awt/Color;-><init>(III)V

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Ljavax/swing/JTextArea;->setForeground(Ljava/awt/Color;)V

    .line 165
    new-instance v16, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v16

    invoke-direct {v0, v5}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljavax/swing/JPanel;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 166
    const-string/jumbo v16, "Interpreted"

    new-instance v17, Ljavax/swing/JScrollPane;

    move-object/from16 v0, v17

    invoke-direct {v0, v6}, Ljavax/swing/JScrollPane;-><init>(Ljava/awt/Component;)V

    invoke-virtual/range {v15 .. v17}, Ljavax/swing/JTabbedPane;->add(Ljava/lang/String;Ljava/awt/Component;)Ljava/awt/Component;

    .line 169
    new-instance v7, Ljavax/swing/JPopupMenu;

    .end local v7    # "menu":Ljavax/swing/JPopupMenu;
    invoke-direct {v7}, Ljavax/swing/JPopupMenu;-><init>()V

    .line 170
    .restart local v7    # "menu":Ljavax/swing/JPopupMenu;
    new-instance v8, Ljavax/swing/JMenuItem;

    .end local v8    # "menuItem1":Ljavax/swing/JMenuItem;
    const-string/jumbo v16, "Copy"

    move-object/from16 v0, v16

    invoke-direct {v8, v0}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 171
    .restart local v8    # "menuItem1":Ljavax/swing/JMenuItem;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$6;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5}, Lorg/jivesoftware/smack/debugger/LiteDebugger$6;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 180
    new-instance v9, Ljavax/swing/JMenuItem;

    .end local v9    # "menuItem2":Ljavax/swing/JMenuItem;
    const-string/jumbo v16, "Clear"

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Ljavax/swing/JMenuItem;-><init>(Ljava/lang/String;)V

    .line 181
    .restart local v9    # "menuItem2":Ljavax/swing/JMenuItem;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$7;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5, v6}, Lorg/jivesoftware/smack/debugger/LiteDebugger$7;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    invoke-virtual {v9, v0}, Ljavax/swing/JMenuItem;->addActionListener(Ljava/awt/event/ActionListener;)V

    .line 189
    new-instance v10, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;

    .end local v10    # "popupListener":Ljava/awt/event/MouseListener;
    move-object/from16 v0, p0

    invoke-direct {v10, v0, v7}, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JPopupMenu;)V

    .line 190
    .restart local v10    # "popupListener":Ljava/awt/event/MouseListener;
    invoke-virtual {v5, v10}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 191
    invoke-virtual {v6, v10}, Ljavax/swing/JTextArea;->addMouseListener(Ljava/awt/event/MouseListener;)V

    .line 192
    invoke-virtual {v7, v8}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 193
    invoke-virtual {v7, v9}, Ljavax/swing/JPopupMenu;->add(Ljavax/swing/JMenuItem;)Ljavax/swing/JMenuItem;

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->frame:Ljavax/swing/JFrame;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljavax/swing/JFrame;->getContentPane()Ljava/awt/Container;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/awt/Container;->add(Ljava/awt/Component;)Ljava/awt/Component;

    .line 197
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->frame:Ljavax/swing/JFrame;

    move-object/from16 v16, v0

    const/16 v17, 0x226

    const/16 v18, 0x190

    invoke-virtual/range {v16 .. v18}, Ljavax/swing/JFrame;->setSize(II)V

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->frame:Ljavax/swing/JFrame;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Ljavax/swing/JFrame;->setVisible(Z)V

    .line 201
    new-instance v3, Lorg/jivesoftware/smack/util/ObservableReader;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v3, v0}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 202
    .local v3, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11, v12}, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/debugger/LiteDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 224
    new-instance v4, Lorg/jivesoftware/smack/util/ObservableWriter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v4, v0}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 225
    .local v4, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$9;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v13, v14}, Lorg/jivesoftware/smack/debugger/LiteDebugger$9;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 239
    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    .line 240
    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    .line 245
    new-instance v16, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5, v6}, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;-><init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smack/debugger/LiteDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    .line 253
    return-void
.end method


# virtual methods
.method public getReader()Ljava/io/Reader;
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    return-object v0
.end method

.method public getReaderListener()Lorg/jivesoftware/smack/PacketListener;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    return-object v0
.end method

.method public getWriter()Ljava/io/Writer;
    .locals 1

    .prologue
    .line 326
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    return-object v0
.end method

.method public getWriterListener()Lorg/jivesoftware/smack/PacketListener;
    .locals 1

    .prologue
    .line 334
    const/4 v0, 0x0

    return-object v0
.end method

.method public newConnectionReader(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 3
    .param p1, "newReader"    # Ljava/io/Reader;

    .prologue
    .line 293
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableReader;->removeReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 294
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableReader;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 295
    .local v0, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 296
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    .line 297
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    return-object v1
.end method

.method public newConnectionWriter(Ljava/io/Writer;)Ljava/io/Writer;
    .locals 3
    .param p1, "newWriter"    # Ljava/io/Writer;

    .prologue
    .line 301
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;->removeWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 302
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableWriter;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 303
    .local v0, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 304
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    .line 305
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    return-object v1
.end method

.method public rootWindowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 2
    .param p1, "evt"    # Ljava/awt/event/WindowEvent;

    .prologue
    .line 262
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 263
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->reader:Ljava/io/Reader;

    check-cast v0, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableReader;->removeReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 264
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writer:Ljava/io/Writer;

    check-cast v0, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableWriter;->removeWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 265
    return-void
.end method

.method public userHasLogged(Ljava/lang/String;)V
    .locals 4
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 309
    const-string/jumbo v2, ""

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 310
    .local v0, "isAnonymous":Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Smack Debug Window -- "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_0

    const-string/jumbo v2, ""

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 317
    .local v1, "title":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 318
    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger;->frame:Ljavax/swing/JFrame;

    invoke-virtual {v2, v1}, Ljavax/swing/JFrame;->setTitle(Ljava/lang/String;)V

    .line 319
    return-void

    .line 310
    .end local v1    # "title":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
