.class public Lorg/jivesoftware/smackx/jingle/media/PayloadType;
.super Ljava/lang/Object;
.source "PayloadType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    }
.end annotation


# static fields
.field public static INVALID_PT:I = 0x0

.field public static MAX_FIXED_PT:I = 0x0

.field public static final NODENAME:Ljava/lang/String; = "payload-type"


# instance fields
.field private channels:I

.field private id:I

.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/16 v0, 0x5f

    sput v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->MAX_FIXED_PT:I

    .line 33
    const v0, 0xffff

    sput v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->INVALID_PT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 59
    sget v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->INVALID_PT:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(ILjava/lang/String;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 69
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(ILjava/lang/String;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "channels"    # I

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->id:I

    .line 51
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->name:Ljava/lang/String;

    .line 52
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->channels:I

    .line 53
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 3
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 78
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v0

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(ILjava/lang/String;I)V

    .line 79
    return-void
.end method

.method public static getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    const-string/jumbo v0, "payload-type"

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 170
    if-ne p0, p1, :cond_1

    .line 199
    :cond_0
    :goto_0
    return v1

    .line 173
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 174
    goto :goto_0

    .line 176
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 177
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 179
    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 180
    .local v0, "other":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v4

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 181
    goto :goto_0

    .line 183
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v4

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 184
    goto :goto_0

    .line 188
    :cond_5
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v3

    sget v4, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->MAX_FIXED_PT:I

    if-le v3, v4, :cond_0

    .line 189
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_6

    .line 190
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    move v1, v2

    .line 191
    goto :goto_0

    .line 194
    :cond_6
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 195
    goto :goto_0
.end method

.method public getChannels()I
    .locals 1

    .prologue
    .line 123
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->channels:I

    return v0
.end method

.method protected getChildAttributes()Ljava/lang/String;
    .locals 4

    .prologue
    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .local v0, "buf":Ljava/lang/StringBuilder;
    instance-of v2, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 237
    check-cast v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 239
    .local v1, "pta":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    const-string/jumbo v2, " clockrate=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->getClockRate()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\" "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .end local v1    # "pta":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->id:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 156
    const/16 v0, 0x1f

    .line 157
    .local v0, "PRIME":I
    const/4 v1, 0x1

    .line 158
    .local v1, "result":I
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v2

    add-int/lit8 v1, v2, 0x1f

    .line 159
    mul-int/lit8 v2, v1, 0x1f

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v3

    add-int v1, v2, v3

    .line 160
    mul-int/lit8 v3, v1, 0x1f

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    add-int v1, v3, v2

    .line 161
    return v1

    .line 160
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0
.end method

.method public isNull()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 141
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v1

    sget v2, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->INVALID_PT:I

    if-ne v1, v2, :cond_1

    .line 147
    :cond_0
    :goto_0
    return v0

    .line 144
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 147
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setChannels(I)V
    .locals 0
    .param p1, "channels"    # I

    .prologue
    .line 132
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->channels:I

    .line 133
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 96
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->id:I

    .line 97
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->name:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v1

    sget v2, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->INVALID_PT:I

    if-eq v1, v2, :cond_0

    .line 218
    const-string/jumbo v1, " id=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 221
    const-string/jumbo v1, " name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v1

    if-eqz v1, :cond_2

    .line 224
    const-string/jumbo v1, " channels=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChildAttributes()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 227
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChildAttributes()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    :cond_3
    const-string/jumbo v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
