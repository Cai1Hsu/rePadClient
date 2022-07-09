.class public Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
.super Ljava/lang/Object;
.source "Macro.java"


# static fields
.field public static final IMAGE:I = 0x2

.field public static final TEXT:I = 0x0

.field public static final URL:I = 0x1


# instance fields
.field private description:Ljava/lang/String;

.field private response:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getResponse()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->response:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->type:I

    return v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->description:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setResponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->response:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->title:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 65
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->type:I

    .line 66
    return-void
.end method
