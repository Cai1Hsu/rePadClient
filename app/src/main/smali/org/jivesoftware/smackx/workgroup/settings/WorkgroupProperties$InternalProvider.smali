.class public Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties$InternalProvider;
.super Ljava/lang/Object;
.source "WorkgroupProperties.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/IQProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InternalProvider"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    .line 97
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    if-eq v3, v5, :cond_0

    .line 98
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Parser not in proper position, or bad XML."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 101
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;

    invoke-direct {v2}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;-><init>()V

    .line 103
    .local v2, "props":Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;
    const/4 v0, 0x0

    .line 106
    .local v0, "done":Z
    :cond_1
    :goto_0
    if-nez v0, :cond_5

    .line 107
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 108
    .local v1, "eventType":I
    if-ne v1, v5, :cond_2

    const-string/jumbo v3, "authRequired"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 109
    new-instance v3, Ljava/lang/Boolean;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Boolean;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setAuthRequired(Z)V

    goto :goto_0

    .line 111
    :cond_2
    if-ne v1, v5, :cond_3

    const-string/jumbo v3, "email"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 112
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setEmail(Ljava/lang/String;)V

    goto :goto_0

    .line 114
    :cond_3
    if-ne v1, v5, :cond_4

    const-string/jumbo v3, "name"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 115
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/workgroup/settings/WorkgroupProperties;->setFullName(Ljava/lang/String;)V

    goto :goto_0

    .line 117
    :cond_4
    const/4 v3, 0x3

    if-ne v1, v3, :cond_1

    const-string/jumbo v3, "workgroup-properties"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 118
    const/4 v0, 0x1

    goto :goto_0

    .line 122
    .end local v1    # "eventType":I
    :cond_5
    return-object v2
.end method
