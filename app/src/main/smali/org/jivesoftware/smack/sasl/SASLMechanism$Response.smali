.class public Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "SASLMechanism.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/sasl/SASLMechanism;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Response"
.end annotation


# instance fields
.field private final authenticationText:Ljava/lang/String;

.field final synthetic this$0:Lorg/jivesoftware/smack/sasl/SASLMechanism;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;)V
    .locals 1

    .prologue
    .line 328
    iput-object p1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;->this$0:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 329
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;->authenticationText:Ljava/lang/String;

    .line 330
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/sasl/SASLMechanism;Ljava/lang/String;)V
    .locals 1
    .param p2, "authenticationText"    # Ljava/lang/String;

    .prologue
    .line 332
    iput-object p1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;->this$0:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 333
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 334
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;->authenticationText:Ljava/lang/String;

    .line 339
    :goto_0
    return-void

    .line 337
    :cond_1
    iput-object p2, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;->authenticationText:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public toXML()Ljava/lang/String;
    .locals 2

    .prologue
    .line 342
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    .local v0, "stanza":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<response xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    iget-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;->authenticationText:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 345
    iget-object v1, p0, Lorg/jivesoftware/smack/sasl/SASLMechanism$Response;->authenticationText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    :cond_0
    const-string/jumbo v1, "</response>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
