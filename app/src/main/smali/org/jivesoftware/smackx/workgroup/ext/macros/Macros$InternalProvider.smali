.class public Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros$InternalProvider;
.super Ljava/lang/Object;
.source "Macros.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 104
    new-instance v3, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;

    invoke-direct {v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;-><init>()V

    .line 106
    .local v3, "macroGroup":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;
    const/4 v0, 0x0

    .line 107
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 108
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 109
    .local v1, "eventType":I
    const/4 v5, 0x2

    if-ne v1, v5, :cond_1

    .line 110
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "model"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 111
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    .line 112
    .local v4, "macros":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros$InternalProvider;->parseMacroGroups(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    move-result-object v2

    .line 113
    .local v2, "group":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros;->setRootGroup(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V

    goto :goto_0

    .line 116
    .end local v2    # "group":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .end local v4    # "macros":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x3

    if-ne v1, v5, :cond_0

    .line 117
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "macros"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 118
    const/4 v0, 0x1

    goto :goto_0

    .line 123
    .end local v1    # "eventType":I
    :cond_2
    return-object v3
.end method

.method public parseMacro(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;-><init>()V

    .line 128
    .local v2, "macro":Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;
    const/4 v0, 0x0

    .line 129
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_5

    .line 130
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 131
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_4

    .line 132
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "title"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 133
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 134
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->setTitle(Ljava/lang/String;)V

    goto :goto_0

    .line 136
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "description"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 137
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->setDescription(Ljava/lang/String;)V

    goto :goto_0

    .line 139
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "response"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 140
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->setResponse(Ljava/lang/String;)V

    goto :goto_0

    .line 142
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "type"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 143
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;->setType(I)V

    goto :goto_0

    .line 146
    :cond_4
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 147
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "macro"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 148
    const/4 v0, 0x1

    goto :goto_0

    .line 152
    .end local v1    # "eventType":I
    :cond_5
    return-object v2
.end method

.method public parseMacroGroup(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 156
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;-><init>()V

    .line 158
    .local v2, "group":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    const/4 v0, 0x0

    .line 159
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_4

    .line 160
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 161
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_3

    .line 162
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "macrogroup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 163
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros$InternalProvider;->parseMacroGroup(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->addMacroGroup(Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;)V

    .line 165
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "title"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 166
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->setTitle(Ljava/lang/String;)V

    .line 168
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "macro"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 169
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros$InternalProvider;->parseMacro(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;->addMacro(Lorg/jivesoftware/smackx/workgroup/ext/macros/Macro;)V

    goto :goto_0

    .line 172
    :cond_3
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 173
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "macrogroup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 174
    const/4 v0, 0x1

    goto :goto_0

    .line 178
    .end local v1    # "eventType":I
    :cond_4
    return-object v2
.end method

.method public parseMacroGroups(Ljava/lang/String;)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    .locals 5
    .param p1, "macros"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 183
    const/4 v1, 0x0

    .line 184
    .local v1, "group":Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;
    new-instance v2, Lorg/xmlpull/mxp1/MXParser;

    invoke-direct {v2}, Lorg/xmlpull/mxp1/MXParser;-><init>()V

    .line 185
    .local v2, "parser":Lorg/xmlpull/v1/XmlPullParser;
    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 186
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    .line 187
    .local v0, "eventType":I
    :cond_0
    :goto_0
    const/4 v3, 0x1

    if-eq v0, v3, :cond_1

    .line 188
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    .line 189
    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 190
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "macrogroup"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 191
    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/workgroup/ext/macros/Macros$InternalProvider;->parseMacroGroup(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/workgroup/ext/macros/MacroGroup;

    move-result-object v1

    goto :goto_0

    .line 195
    :cond_1
    return-object v1
.end method
