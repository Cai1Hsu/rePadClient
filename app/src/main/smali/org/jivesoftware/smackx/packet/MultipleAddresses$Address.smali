.class public Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
.super Ljava/lang/Object;
.source "MultipleAddresses.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/MultipleAddresses;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Address"
.end annotation


# instance fields
.field private delivered:Z

.field private description:Ljava/lang/String;

.field private jid:Ljava/lang/String;

.field private node:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->type:Ljava/lang/String;

    .line 131
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/MultipleAddresses$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses$1;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->setJid(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->setNode(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->setDescription(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
    .param p1, "x1"    # Z

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->setDelivered(Z)V

    return-void
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->setUri(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;

    .prologue
    .line 120
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->toXML()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private setDelivered(Z)V
    .locals 0
    .param p1, "delivered"    # Z

    .prologue
    .line 166
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->delivered:Z

    .line 167
    return-void
.end method

.method private setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->description:Ljava/lang/String;

    .line 159
    return-void
.end method

.method private setJid(Ljava/lang/String;)V
    .locals 0
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->jid:Ljava/lang/String;

    .line 143
    return-void
.end method

.method private setNode(Ljava/lang/String;)V
    .locals 0
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->node:Ljava/lang/String;

    .line 151
    return-void
.end method

.method private setUri(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 174
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->uri:Ljava/lang/String;

    .line 175
    return-void
.end method

.method private toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<address type=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->jid:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 183
    const-string/jumbo v1, " jid=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->jid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->node:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 187
    const-string/jumbo v1, " node=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->node:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->description:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->description:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 191
    const-string/jumbo v1, " desc=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    :cond_2
    iget-boolean v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->delivered:Z

    if-eqz v1, :cond_3

    .line 195
    const-string/jumbo v1, " delivered=\"true\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    :cond_3
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->uri:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 198
    const-string/jumbo v1, " uri=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    :cond_4
    const-string/jumbo v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getJid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->jid:Ljava/lang/String;

    return-object v0
.end method

.method public getNode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->node:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public isDelivered()Z
    .locals 1

    .prologue
    .line 162
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MultipleAddresses$Address;->delivered:Z

    return v0
.end method
