.class Lorg/apache/tools/ant/listener/MailLogger$Values;
.super Ljava/lang/Object;
.source "MailLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/listener/MailLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Values"
.end annotation


# instance fields
.field private body:Ljava/lang/String;

.field private charset:Ljava/lang/String;

.field private from:Ljava/lang/String;

.field private mailhost:Ljava/lang/String;

.field private mimeType:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private port:I

.field private replytoList:Ljava/lang/String;

.field private ssl:Z

.field private starttls:Z

.field private subject:Ljava/lang/String;

.field private toList:Ljava/lang/String;

.field private user:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/listener/MailLogger$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/listener/MailLogger$1;

    .prologue
    .line 172
    invoke-direct {p0}, Lorg/apache/tools/ant/listener/MailLogger$Values;-><init>()V

    return-void
.end method


# virtual methods
.method public body()Ljava/lang/String;
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->body:Ljava/lang/String;

    return-object v0
.end method

.method public body(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->body:Ljava/lang/String;

    .line 267
    return-object p0
.end method

.method public charset()Ljava/lang/String;
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public charset(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 250
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->charset:Ljava/lang/String;

    .line 251
    return-object p0
.end method

.method public from()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->from:Ljava/lang/String;

    return-object v0
.end method

.method public from(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 218
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->from:Ljava/lang/String;

    .line 219
    return-object p0
.end method

.method public mailhost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->mailhost:Ljava/lang/String;

    return-object v0
.end method

.method public mailhost(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "mailhost"    # Ljava/lang/String;

    .prologue
    .line 178
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->mailhost:Ljava/lang/String;

    .line 179
    return-object p0
.end method

.method public mimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public mimeType(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 258
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->mimeType:Ljava/lang/String;

    .line 259
    return-object p0
.end method

.method public password()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->password:Ljava/lang/String;

    return-object v0
.end method

.method public password(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 202
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->password:Ljava/lang/String;

    .line 203
    return-object p0
.end method

.method public port()I
    .locals 1

    .prologue
    .line 183
    iget v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->port:I

    return v0
.end method

.method public port(I)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 186
    iput p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->port:I

    .line 187
    return-object p0
.end method

.method public replytoList()Ljava/lang/String;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->replytoList:Ljava/lang/String;

    return-object v0
.end method

.method public replytoList(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "replytoList"    # Ljava/lang/String;

    .prologue
    .line 226
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->replytoList:Ljava/lang/String;

    .line 227
    return-object p0
.end method

.method public ssl(Z)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "ssl"    # Z

    .prologue
    .line 210
    iput-boolean p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->ssl:Z

    .line 211
    return-object p0
.end method

.method public ssl()Z
    .locals 1

    .prologue
    .line 207
    iget-boolean v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->ssl:Z

    return v0
.end method

.method public starttls(Z)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "starttls"    # Z

    .prologue
    .line 274
    iput-boolean p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->starttls:Z

    .line 275
    return-object p0
.end method

.method public starttls()Z
    .locals 1

    .prologue
    .line 271
    iget-boolean v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->starttls:Z

    return v0
.end method

.method public subject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->subject:Ljava/lang/String;

    return-object v0
.end method

.method public subject(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 242
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->subject:Ljava/lang/String;

    .line 243
    return-object p0
.end method

.method public toList()Ljava/lang/String;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->toList:Ljava/lang/String;

    return-object v0
.end method

.method public toList(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "toList"    # Ljava/lang/String;

    .prologue
    .line 234
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->toList:Ljava/lang/String;

    .line 235
    return-object p0
.end method

.method public user()Ljava/lang/String;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->user:Ljava/lang/String;

    return-object v0
.end method

.method public user(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 194
    iput-object p1, p0, Lorg/apache/tools/ant/listener/MailLogger$Values;->user:Ljava/lang/String;

    .line 195
    return-object p0
.end method
