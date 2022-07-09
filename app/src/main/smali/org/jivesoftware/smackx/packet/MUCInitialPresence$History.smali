.class public Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;
.super Ljava/lang/Object;
.source "MUCInitialPresence.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/MUCInitialPresence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "History"
.end annotation


# instance fields
.field private maxChars:I

.field private maxStanzas:I

.field private seconds:I

.field private since:Ljava/util/Date;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput v0, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->maxChars:I

    .line 117
    iput v0, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->maxStanzas:I

    .line 118
    iput v0, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->seconds:I

    return-void
.end method


# virtual methods
.method public getMaxChars()I
    .locals 1

    .prologue
    .line 127
    iget v0, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->maxChars:I

    return v0
.end method

.method public getMaxStanzas()I
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->maxStanzas:I

    return v0
.end method

.method public getSeconds()I
    .locals 1

    .prologue
    .line 147
    iget v0, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->seconds:I

    return v0
.end method

.method public getSince()Ljava/util/Date;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->since:Ljava/util/Date;

    return-object v0
.end method

.method public setMaxChars(I)V
    .locals 0
    .param p1, "maxChars"    # I

    .prologue
    .line 167
    iput p1, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->maxChars:I

    .line 168
    return-void
.end method

.method public setMaxStanzas(I)V
    .locals 0
    .param p1, "maxStanzas"    # I

    .prologue
    .line 176
    iput p1, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->maxStanzas:I

    .line 177
    return-void
.end method

.method public setSeconds(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 188
    iput p1, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->seconds:I

    .line 189
    return-void
.end method

.method public setSince(Ljava/util/Date;)V
    .locals 0
    .param p1, "since"    # Ljava/util/Date;

    .prologue
    .line 199
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->since:Ljava/util/Date;

    .line 200
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v2, "<history"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getMaxChars()I

    move-result v2

    if-eq v2, v4, :cond_0

    .line 206
    const-string/jumbo v2, " maxchars=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getMaxChars()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getMaxStanzas()I

    move-result v2

    if-eq v2, v4, :cond_1

    .line 209
    const-string/jumbo v2, " maxstanzas=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getMaxStanzas()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getSeconds()I

    move-result v2

    if-eq v2, v4, :cond_2

    .line 212
    const-string/jumbo v2, " seconds=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getSeconds()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getSince()Ljava/util/Date;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 215
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 216
    .local v1, "utcFormat":Ljava/text/SimpleDateFormat;
    const-string/jumbo v2, "UTC"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 217
    const-string/jumbo v2, " since=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCInitialPresence$History;->getSince()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .end local v1    # "utcFormat":Ljava/text/SimpleDateFormat;
    :cond_3
    const-string/jumbo v2, "/>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
