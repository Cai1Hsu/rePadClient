.class public Lcom/edutech/utils/XmlLoadHelper;
.super Ljava/lang/Object;
.source "XmlLoadHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getItemData(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/HashMap;
    .locals 4
    .param p0, "xmlPullParser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 138
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 140
    .local v0, "hashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_0
    if-gez v1, :cond_0

    .line 146
    return-object v0

    .line 143
    :cond_0
    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public static loadIpXml()Ljava/util/HashMap;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 151
    sget-object v10, Lcom/edutech/idauthentication/AppEnvironment;->URLFILEPATH:Ljava/lang/String;

    invoke-static {v10}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 152
    .local v8, "xmlFile":Ljava/io/File;
    const/4 v3, 0x0

    .line 153
    .local v3, "filein":Ljava/io/FileInputStream;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 155
    .local v5, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "filein":Ljava/io/FileInputStream;
    .local v4, "filein":Ljava/io/FileInputStream;
    move-object v3, v4

    .line 161
    .end local v4    # "filein":Ljava/io/FileInputStream;
    .restart local v3    # "filein":Ljava/io/FileInputStream;
    :goto_0
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v7

    .line 162
    .local v7, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v7}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 163
    .local v9, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v10, "UTF-8"

    invoke-interface {v9, v3, v10}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 164
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    move-result v2

    .line 165
    .local v2, "eventType":I
    :goto_1
    const/4 v10, 0x1

    if-ne v2, v10, :cond_0

    .line 208
    .end local v2    # "eventType":I
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :goto_2
    return-object v5

    .line 156
    :catch_0
    move-exception v1

    .line 158
    .local v1, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 166
    .end local v1    # "e1":Ljava/io/FileNotFoundException;
    .restart local v2    # "eventType":I
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_0
    :try_start_2
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 168
    .local v6, "nodeName":Ljava/lang/String;
    packed-switch v2, :pswitch_data_0

    .line 199
    :cond_1
    :goto_3
    :pswitch_0
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_1

    .line 173
    :pswitch_1
    const-string/jumbo v10, "ip"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 174
    const-string/jumbo v10, "ip"

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    :cond_2
    const-string/jumbo v10, "username"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    move-result v10

    if-eqz v10, :cond_3

    .line 178
    :try_start_3
    const-string/jumbo v10, "username"

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/edutech/utils/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 184
    :cond_3
    :goto_4
    :try_start_4
    const-string/jumbo v10, "password"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    move-result v10

    if-eqz v10, :cond_1

    .line 186
    :try_start_5
    const-string/jumbo v10, "password"

    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/edutech/utils/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_3

    .line 187
    :catch_1
    move-exception v0

    .line 189
    .local v0, "e":Ljava/lang/Exception;
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_3

    .line 201
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_2
    move-exception v0

    .line 203
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_2

    .line 179
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v2    # "eventType":I
    .restart local v6    # "nodeName":Ljava/lang/String;
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_3
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/Exception;
    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_4

    .line 204
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "eventType":I
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_4
    move-exception v0

    .line 206
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 168
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static loadXml(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "settinginfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    new-instance v3, Ljava/io/File;

    sget-object v10, Lcom/edutech/idauthentication/AppEnvironment;->SETTING_PWD_SAVE_FILEPATH:Ljava/lang/String;

    invoke-direct {v3, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 82
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_1

    .line 135
    :cond_0
    :goto_0
    return-object p0

    .line 86
    :cond_1
    sget-object v10, Lcom/edutech/idauthentication/AppEnvironment;->SETTING_PWD_SAVE_FILEPATH:Ljava/lang/String;

    invoke-static {v10}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 87
    .local v8, "xmlFile":Ljava/io/File;
    const/4 v4, 0x0

    .line 89
    .local v4, "filein":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v4, Ljava/io/FileInputStream;

    .end local v4    # "filein":Ljava/io/FileInputStream;
    invoke-direct {v4, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .restart local v4    # "filein":Ljava/io/FileInputStream;
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v7

    .line 98
    .local v7, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v7}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v9

    .line 99
    .local v9, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v10, "UTF-8"

    invoke-interface {v9, v4, v10}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 100
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    .line 101
    .local v2, "eventType":I
    :goto_1
    const/4 v10, 0x1

    if-eq v2, v10, :cond_0

    .line 102
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 105
    .local v6, "nodeName":Ljava/lang/String;
    packed-switch v2, :pswitch_data_0

    .line 123
    :cond_2
    :goto_2
    :pswitch_0
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v2

    goto :goto_1

    .line 90
    .end local v2    # "eventType":I
    .end local v4    # "filein":Ljava/io/FileInputStream;
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 110
    .end local v1    # "e1":Ljava/io/FileNotFoundException;
    .restart local v2    # "eventType":I
    .restart local v4    # "filein":Ljava/io/FileInputStream;
    .restart local v6    # "nodeName":Ljava/lang/String;
    .restart local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :pswitch_1
    :try_start_2
    const-string/jumbo v10, "pwdinfo"

    invoke-virtual {v10, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 112
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 113
    .local v5, "hashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v9}, Lcom/edutech/utils/XmlLoadHelper;->getItemData(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/HashMap;

    move-result-object v5

    .line 114
    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    .line 125
    .end local v2    # "eventType":I
    .end local v5    # "hashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "nodeName":Ljava/lang/String;
    .end local v7    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v9    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v0

    .line 128
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    .line 129
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_2
    move-exception v0

    .line 132
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 105
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static writeXml(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 12
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "settinginfo":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-nez v9, :cond_0

    .line 77
    :goto_0
    return-void

    .line 30
    :cond_0
    invoke-static {p0}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 31
    .local v8, "xmlFile":Ljava/io/File;
    const/4 v1, 0x0

    .line 33
    .local v1, "fileos":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .end local v1    # "fileos":Ljava/io/FileOutputStream;
    .local v2, "fileos":Ljava/io/FileOutputStream;
    move-object v1, v2

    .line 38
    .end local v2    # "fileos":Ljava/io/FileOutputStream;
    .restart local v1    # "fileos":Ljava/io/FileOutputStream;
    :goto_1
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v5

    .line 40
    .local v5, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_1
    const-string/jumbo v9, "UTF-8"

    invoke-interface {v5, v1, v9}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 41
    const-string/jumbo v9, ""

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    invoke-interface {v5, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 43
    const-string/jumbo v9, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 44
    const/4 v10, 0x1

    .line 42
    invoke-interface {v5, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 45
    const-string/jumbo v9, ""

    const-string/jumbo v10, "setting"

    invoke-interface {v5, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 47
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_1

    .line 69
    const-string/jumbo v9, ""

    const-string/jumbo v10, "setting"

    invoke-interface {v5, v9, v10}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 70
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 71
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 72
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    goto :goto_0

    .line 74
    :catch_0
    move-exception v9

    goto :goto_0

    .line 47
    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    .line 51
    .local v6, "tempsetting":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v10, ""

    const-string/jumbo v11, "pwdinfo"

    invoke-interface {v5, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 52
    const-string/jumbo v10, "type"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 53
    .local v7, "type":Ljava/lang/String;
    const-string/jumbo v10, ""

    const-string/jumbo v11, "type"

    invoke-interface {v5, v10, v11, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 54
    const-string/jumbo v10, "password"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 55
    .local v4, "password":Ljava/lang/String;
    if-nez v4, :cond_2

    .line 56
    const-string/jumbo v4, ""

    .line 57
    :cond_2
    const-string/jumbo v10, ""

    const-string/jumbo v11, "password"

    invoke-interface {v5, v10, v11, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 58
    const-string/jumbo v10, "createtime"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 59
    .local v0, "createtime":Ljava/lang/String;
    if-nez v0, :cond_3

    .line 60
    const-string/jumbo v0, ""

    .line 61
    :cond_3
    const-string/jumbo v10, ""

    const-string/jumbo v11, "createtime"

    invoke-interface {v5, v10, v11, v0}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 62
    const-string/jumbo v10, "isnew"

    invoke-virtual {v6, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 63
    .local v3, "isnew":Ljava/lang/String;
    if-nez v3, :cond_4

    .line 64
    const-string/jumbo v3, "0"

    .line 65
    :cond_4
    const-string/jumbo v10, ""

    const-string/jumbo v11, "isnew"

    invoke-interface {v5, v10, v11, v3}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 67
    const-string/jumbo v10, ""

    const-string/jumbo v11, "pwdinfo"

    invoke-interface {v5, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 34
    .end local v0    # "createtime":Ljava/lang/String;
    .end local v3    # "isnew":Ljava/lang/String;
    .end local v4    # "password":Ljava/lang/String;
    .end local v5    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    .end local v6    # "tempsetting":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v7    # "type":Ljava/lang/String;
    :catch_1
    move-exception v9

    goto/16 :goto_1
.end method
