.class public Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
.super Ljava/lang/Object;
.source "Replace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Replace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Replacefilter"
.end annotation


# instance fields
.field private inputBuffer:Ljava/lang/StringBuffer;

.field private outputBuffer:Ljava/lang/StringBuffer;

.field private property:Ljava/lang/String;

.field private replaceValue:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Replace;

.field private token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

.field private value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Replace;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Replace;

    .prologue
    .line 129
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->outputBuffer:Ljava/lang/StringBuffer;

    return-void
.end method

.method private replace()I
    .locals 8

    .prologue
    .line 334
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->getToken()Ljava/lang/String;

    move-result-object v3

    .line 335
    .local v3, "t":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 336
    .local v0, "found":I
    const/4 v1, -0x1

    .line 337
    .local v1, "pos":I
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    .line 338
    .local v4, "tokenLength":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->replaceValue:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    .line 339
    .local v2, "replaceValueLength":I
    :goto_0
    if-ltz v0, :cond_0

    .line 340
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    add-int v6, v0, v4

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->replaceValue:Ljava/lang/String;

    invoke-virtual {v5, v0, v6, v7}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 341
    add-int v1, v0, v2

    .line 342
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v5, v3, v1}, Ljava/lang/StringBuffer;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 343
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/Replace;->access$304(Lorg/apache/tools/ant/taskdefs/Replace;)I

    goto :goto_0

    .line 345
    :cond_0
    return v1
.end method


# virtual methods
.method public createReplaceToken()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;
    .locals 2

    .prologue
    .line 258
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-nez v0, :cond_0

    .line 259
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    .line 261
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    return-object v0
.end method

.method public createReplaceValue()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;
    .locals 2

    .prologue
    .line 270
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-nez v0, :cond_0

    .line 271
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    .line 273
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    return-object v0
.end method

.method flush()V
    .locals 3

    .prologue
    .line 323
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->replace()I

    .line 324
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->outputBuffer:Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    .line 325
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 326
    return-void
.end method

.method getOutputBuffer()Ljava/lang/StringBuffer;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->outputBuffer:Ljava/lang/StringBuffer;

    return-object v0
.end method

.method public getProperty()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    return-object v0
.end method

.method public getReplaceValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 189
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Replace;->access$100(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/util/Properties;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 197
    :goto_0
    return-object v0

    .line 191
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-eqz v0, :cond_1

    .line 192
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 193
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Replace;->access$200(Lorg/apache/tools/ant/taskdefs/Replace;)Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 194
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Replace;->access$200(Lorg/apache/tools/ant/taskdefs/Replace;)Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 197
    :cond_2
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method process()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 306
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->getToken()Ljava/lang/String;

    move-result-object v1

    .line 307
    .local v1, "t":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-le v3, v4, :cond_0

    .line 308
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->replace()I

    move-result v0

    .line 309
    .local v0, "pos":I
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 310
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->outputBuffer:Ljava/lang/StringBuffer;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v4, v2, v0}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 311
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v3, v2, v0}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 312
    const/4 v2, 0x1

    .line 314
    .end local v0    # "pos":I
    :cond_0
    return v2
.end method

.method setInputBuffer(Ljava/lang/StringBuffer;)V
    .locals 0
    .param p1, "input"    # Ljava/lang/StringBuffer;

    .prologue
    .line 294
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->inputBuffer:Ljava/lang/StringBuffer;

    .line 295
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 240
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    .line 241
    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/String;

    .prologue
    .line 206
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->createReplaceToken()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->addText(Ljava/lang/String;)V

    .line 207
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 223
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->createReplaceValue()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->addText(Ljava/lang/String;)V

    .line 224
    return-void
.end method

.method public validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-nez v1, :cond_0

    .line 145
    const-string/jumbo v0, "token is a mandatory for replacefilter."

    .line 146
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 149
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    const-string/jumbo v1, ""

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    const-string/jumbo v0, "The token must not be an empty string."

    .line 152
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 156
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 157
    const-string/jumbo v0, "Either value or property can be specified, but a replacefilter element cannot have both."

    .line 160
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 165
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Replace;->access$000(Lorg/apache/tools/ant/taskdefs/Replace;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v1

    if-nez v1, :cond_3

    .line 166
    const-string/jumbo v0, "The replacefilter\'s property attribute can only be used with the replacetask\'s propertyFile/Resource attribute."

    .line 169
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 173
    .end local v0    # "message":Ljava/lang/String;
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Replace;->access$100(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/util/Properties;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Replace;->access$100(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/util/Properties;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5

    .line 175
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "property \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->property:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\" was not found in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Replace;->access$000(Lorg/apache/tools/ant/taskdefs/Replace;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 177
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 181
    .end local v0    # "message":Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->getReplaceValue()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->replaceValue:Ljava/lang/String;

    .line 182
    return-void
.end method
