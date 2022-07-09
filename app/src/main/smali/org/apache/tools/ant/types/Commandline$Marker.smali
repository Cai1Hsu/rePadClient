.class public Lorg/apache/tools/ant/types/Commandline$Marker;
.super Ljava/lang/Object;
.source "Commandline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Commandline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Marker"
.end annotation


# instance fields
.field private position:I

.field private prefix:Ljava/lang/String;

.field private realPos:I

.field private suffix:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/types/Commandline;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/types/Commandline;I)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "position"    # I

    .prologue
    .line 220
    iput-object p1, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->this$0:Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->realPos:I

    .line 213
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->prefix:Ljava/lang/String;

    .line 214
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->suffix:Ljava/lang/String;

    .line 221
    iput p2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->position:I

    .line 222
    return-void
.end method


# virtual methods
.method public getPosition()I
    .locals 4

    .prologue
    .line 232
    iget v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->realPos:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 233
    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->this$0:Lorg/apache/tools/ant/types/Commandline;

    invoke-static {v2}, Lorg/apache/tools/ant/types/Commandline;->access$000(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    iput v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->realPos:I

    .line 234
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->position:I

    if-ge v1, v2, :cond_1

    .line 235
    iget-object v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->this$0:Lorg/apache/tools/ant/types/Commandline;

    invoke-static {v2}, Lorg/apache/tools/ant/types/Commandline;->access$100(Lorg/apache/tools/ant/types/Commandline;)Ljava/util/Vector;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Commandline$Argument;

    .line 236
    .local v0, "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    iget v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->realPos:I

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->getParts()[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    add-int/2addr v2, v3

    iput v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->realPos:I

    .line 234
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 233
    .end local v0    # "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    .end local v1    # "i":I
    :cond_0
    const/4 v2, 0x1

    goto :goto_0

    .line 239
    :cond_1
    iget v2, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->realPos:I

    return v2
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 258
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method public getSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 277
    iget-object v0, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->suffix:Ljava/lang/String;

    return-object v0
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 249
    if-eqz p1, :cond_0

    .end local p1    # "prefix":Ljava/lang/String;
    :goto_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->prefix:Ljava/lang/String;

    .line 250
    return-void

    .line 249
    .restart local p1    # "prefix":Ljava/lang/String;
    :cond_0
    const-string/jumbo p1, ""

    goto :goto_0
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 268
    if-eqz p1, :cond_0

    .end local p1    # "suffix":Ljava/lang/String;
    :goto_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Commandline$Marker;->suffix:Ljava/lang/String;

    .line 269
    return-void

    .line 268
    .restart local p1    # "suffix":Ljava/lang/String;
    :cond_0
    const-string/jumbo p1, ""

    goto :goto_0
.end method
