.class public Lcom/edutech/idauthentication/Aduth;
.super Ljava/lang/Object;
.source "Aduth.java"


# static fields
.field private static filepath:Ljava/lang/String;

.field public static filepathMobileStudyClient_NEW:Ljava/lang/String;

.field private static idfile:Ljava/io/File;

.field private static idfile_new:Ljava/io/File;

.field public static seed:Ljava/lang/String;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/CloudClient/.System/idau.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/idauthentication/Aduth;->filepath:Ljava/lang/String;

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/CloudClient/.System/idau_new.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/idauthentication/Aduth;->filepathMobileStudyClient_NEW:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/edutech/idauthentication/Aduth;->filepath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/idauthentication/Aduth;->idfile:Ljava/io/File;

    .line 33
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/edutech/idauthentication/Aduth;->filepathMobileStudyClient_NEW:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    .line 35
    const-string/jumbo v0, "Edutech@2013"

    sput-object v0, Lcom/edutech/idauthentication/Aduth;->seed:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/edutech/idauthentication/Aduth;->mContext:Landroid/content/Context;

    .line 40
    return-void
.end method

.method public static final readIDFile()Ljava/util/List;
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 170
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 171
    .local v9, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v10, 0x0

    .local v10, "idString":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "machineID":Ljava/lang/String;
    const/4 v15, 0x0

    .local v15, "resultString":Ljava/lang/String;
    const/16 v16, 0x0

    .local v16, "times":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "date":Ljava/lang/String;
    const/16 v17, 0x0

    .line 172
    .local v17, "usedTimes":Ljava/lang/String;
    const/4 v7, 0x0

    .line 173
    .local v7, "filein":Ljava/io/FileInputStream;
    const/16 v18, 0x0

    .line 174
    .local v18, "userNewAuth":Z
    sget-object v20, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 176
    const/16 v18, 0x1

    .line 178
    :cond_0
    const/4 v14, 0x0

    .line 180
    .local v14, "result":I
    if-eqz v18, :cond_8

    .line 182
    :try_start_0
    new-instance v8, Ljava/io/FileInputStream;

    sget-object v20, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    move-object/from16 v0, v20

    invoke-direct {v8, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v7    # "filein":Ljava/io/FileInputStream;
    .local v8, "filein":Ljava/io/FileInputStream;
    move-object v7, v8

    .line 192
    .end local v8    # "filein":Ljava/io/FileInputStream;
    .restart local v7    # "filein":Ljava/io/FileInputStream;
    :goto_0
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v13

    .line 193
    .local v13, "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v13}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v19

    .line 194
    .local v19, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    const-string/jumbo v20, "UTF-8"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v7, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 195
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-result v5

    .line 196
    .local v5, "eventType":I
    :goto_1
    const/16 v20, 0x1

    move/from16 v0, v20

    if-ne v5, v0, :cond_9

    .line 247
    :try_start_2
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 248
    const/4 v7, 0x0

    .line 254
    :goto_2
    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    const-string/jumbo v20, ""

    move-object/from16 v0, v20

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    new-instance v6, Ljava/io/File;

    sget-object v20, Lcom/edutech/idauthentication/Aduth;->filepathMobileStudyClient_NEW:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 262
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v20

    if-eqz v20, :cond_1

    .line 264
    const/16 v18, 0x1

    .line 267
    :cond_1
    const-string/jumbo v20, "idauth"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "readIDFile:"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    const-string/jumbo v20, "idauth"

    new-instance v21, Ljava/lang/StringBuilder;

    const-string/jumbo v22, "readIDFile:"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ","

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ","

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ","

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ","

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ","

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    if-eqz v10, :cond_2

    .line 271
    if-eqz v18, :cond_10

    .line 272
    const/16 v20, 0x0

    .line 273
    :try_start_3
    invoke-static {v10}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 272
    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 279
    :cond_2
    :goto_3
    if-eqz v11, :cond_3

    .line 280
    if-eqz v18, :cond_11

    .line 281
    const/16 v20, 0x1

    .line 282
    invoke-static {v11}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 281
    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 288
    :cond_3
    :goto_4
    if-eqz v15, :cond_4

    .line 289
    if-eqz v18, :cond_12

    .line 290
    const/16 v20, 0x2

    .line 291
    invoke-static {v15}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 290
    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 297
    :cond_4
    :goto_5
    if-eqz v16, :cond_5

    .line 298
    if-eqz v18, :cond_13

    .line 299
    const/16 v20, 0x3

    .line 300
    invoke-static/range {v16 .. v16}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 299
    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 306
    :cond_5
    :goto_6
    if-eqz v2, :cond_6

    .line 307
    if-eqz v18, :cond_14

    .line 308
    const/16 v20, 0x4

    .line 309
    invoke-static {v2}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 308
    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 315
    :cond_6
    :goto_7
    if-eqz v17, :cond_7

    .line 316
    if-eqz v18, :cond_15

    .line 318
    const/16 v20, 0x5

    .line 319
    invoke-static/range {v17 .. v17}, Lcom/edutech/idauthentication/BZip2Utils;->Base64DecodeToString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 318
    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    .line 329
    .end local v5    # "eventType":I
    .end local v6    # "file":Ljava/io/File;
    .end local v13    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v19    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_7
    :goto_8
    return-object v9

    .line 184
    :cond_8
    :try_start_4
    new-instance v8, Ljava/io/FileInputStream;

    sget-object v20, Lcom/edutech/idauthentication/Aduth;->idfile:Ljava/io/File;

    move-object/from16 v0, v20

    invoke-direct {v8, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .end local v7    # "filein":Ljava/io/FileInputStream;
    .restart local v8    # "filein":Ljava/io/FileInputStream;
    move-object v7, v8

    .line 186
    .end local v8    # "filein":Ljava/io/FileInputStream;
    .restart local v7    # "filein":Ljava/io/FileInputStream;
    goto/16 :goto_0

    :catch_0
    move-exception v4

    .line 189
    .local v4, "e1":Ljava/io/FileNotFoundException;
    invoke-virtual {v4}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto/16 :goto_0

    .line 197
    .end local v4    # "e1":Ljava/io/FileNotFoundException;
    .restart local v5    # "eventType":I
    .restart local v13    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v19    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_9
    :try_start_5
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 199
    .local v12, "nodeName":Ljava/lang/String;
    packed-switch v5, :pswitch_data_0

    .line 230
    :cond_a
    :goto_9
    :pswitch_0
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v5

    goto/16 :goto_1

    .line 204
    :pswitch_1
    const-string/jumbo v20, "a1"

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_b

    .line 205
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    .line 207
    :cond_b
    const-string/jumbo v20, "b2"

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_c

    .line 208
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 210
    :cond_c
    const-string/jumbo v20, "c3"

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_d

    .line 211
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v15

    .line 213
    :cond_d
    const-string/jumbo v20, "d4"

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_e

    .line 214
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    .line 216
    :cond_e
    const-string/jumbo v20, "e5"

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_f

    .line 217
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    .line 219
    :cond_f
    const-string/jumbo v20, "f6"

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_a

    .line 220
    invoke-interface/range {v19 .. v19}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;
    :try_end_5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    move-result-object v17

    .line 223
    goto :goto_9

    .line 232
    .end local v5    # "eventType":I
    .end local v12    # "nodeName":Ljava/lang/String;
    .end local v13    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v19    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v3

    .line 234
    .local v3, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_8

    .line 236
    .end local v3    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_2
    move-exception v3

    .line 238
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_8

    .line 240
    .end local v3    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v3

    .line 242
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_8

    .line 249
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v5    # "eventType":I
    .restart local v13    # "pullParserFactory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v19    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_4
    move-exception v4

    .line 251
    .local v4, "e1":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    .line 276
    .end local v4    # "e1":Ljava/io/IOException;
    .restart local v6    # "file":Ljava/io/File;
    :cond_10
    const/16 v20, 0x0

    :try_start_6
    sget-object v21, Lcom/edutech/idauthentication/Aduth;->seed:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-static {v0, v10}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    goto/16 :goto_3

    .line 325
    :catch_5
    move-exception v3

    .line 327
    .restart local v3    # "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_8

    .line 285
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_11
    const/16 v20, 0x1

    :try_start_7
    sget-object v21, Lcom/edutech/idauthentication/Aduth;->seed:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-static {v0, v11}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    .line 294
    :cond_12
    const/16 v20, 0x2

    sget-object v21, Lcom/edutech/idauthentication/Aduth;->seed:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-static {v0, v15}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_5

    .line 303
    :cond_13
    const/16 v20, 0x3

    sget-object v21, Lcom/edutech/idauthentication/Aduth;->seed:Ljava/lang/String;

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_6

    .line 312
    :cond_14
    const/16 v20, 0x4

    sget-object v21, Lcom/edutech/idauthentication/Aduth;->seed:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-static {v0, v2}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_7

    .line 322
    :cond_15
    const/16 v20, 0x5

    sget-object v21, Lcom/edutech/idauthentication/Aduth;->seed:Ljava/lang/String;

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/edutech/idauthentication/AESUtils2;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v9, v0, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_8

    .line 199
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static toHexString([BLjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "bytes"    # [B
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 152
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .local v1, "hexString":Ljava/lang/StringBuilder;
    array-length v3, p0

    const/4 v2, 0x0

    :goto_0
    if-lt v2, v3, :cond_0

    .line 156
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 153
    :cond_0
    aget-byte v0, p0, v2

    .line 154
    .local v0, "b":B
    and-int/lit16 v4, v0, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static toMd5([B)[B
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 160
    :try_start_0
    const-string/jumbo v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 161
    .local v0, "algorithm":Ljava/security/MessageDigest;
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 162
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 163
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 167
    .end local v0    # "algorithm":Ljava/security/MessageDigest;
    :goto_0
    return-object v1

    .line 164
    :catch_0
    move-exception v1

    .line 167
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final GetMachineID()Ljava/lang/String;
    .locals 10

    .prologue
    .line 113
    iget-object v7, p0, Lcom/edutech/idauthentication/Aduth;->mContext:Landroid/content/Context;

    const-string/jumbo v8, "phone"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    .line 114
    .local v5, "tm":Landroid/telephony/TelephonyManager;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .local v4, "sb":Ljava/lang/StringBuilder;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nModel = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nSerialNumber = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nDeviceId(IMEI) = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    iget-object v7, p0, Lcom/edutech/idauthentication/Aduth;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string/jumbo v8, "android_id"

    invoke-static {v7, v8}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "android_id":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nAndroidID = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    iget-object v7, p0, Lcom/edutech/idauthentication/Aduth;->mContext:Landroid/content/Context;

    const-string/jumbo v8, "wifi"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 124
    .local v6, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v3

    .line 125
    .local v3, "m_szWLANMAC":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 127
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v7, 0x5

    if-le v2, v7, :cond_2

    .line 142
    .end local v2    # "i":I
    :cond_0
    if-nez v3, :cond_1

    .line 144
    const-string/jumbo v3, ""

    .line 146
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v8, "\nMACAddress = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    const-string/jumbo v7, "info"

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-static {v8}, Lcom/edutech/idauthentication/Aduth;->toMd5([B)[B

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-static {v8, v9}, Lcom/edutech/idauthentication/Aduth;->toHexString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ":"

    const-string/jumbo v9, ""

    invoke-virtual {v3, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 129
    .restart local v2    # "i":I
    :cond_2
    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;

    move-result-object v3

    .line 130
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-gtz v7, :cond_0

    .line 135
    :cond_3
    const-wide/16 v8, 0x7d0

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 136
    :catch_0
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method public checkIDAuth()I
    .locals 20

    .prologue
    .line 43
    const/4 v1, 0x0

    .local v1, "idString":Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "machineID":Ljava/lang/String;
    const/4 v11, 0x0

    .local v11, "resultString":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "times":Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "usedTimes":Ljava/lang/String;
    const/4 v4, 0x0

    .line 44
    .local v4, "date":Ljava/lang/String;
    const/4 v9, 0x0

    .line 45
    .local v9, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lcom/edutech/idauthentication/Aduth;->idfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/edutech/idauthentication/Aduth;->idfile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v0, v16, v18

    if-gtz v0, :cond_2

    :cond_0
    sget-object v0, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v0, v16, v18

    if-gtz v0, :cond_2

    .line 46
    :cond_1
    const/4 v0, 0x1

    .line 109
    :goto_0
    return v0

    .line 50
    :cond_2
    invoke-static {}, Lcom/edutech/idauthentication/Aduth;->readIDFile()Ljava/util/List;

    move-result-object v9

    .line 51
    if-eqz v9, :cond_4

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 53
    const-string/jumbo v0, "idauth"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "idInfo is"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    const/4 v0, 0x0

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "idString":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 55
    .restart local v1    # "idString":Ljava/lang/String;
    const/4 v0, 0x1

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "machineID":Ljava/lang/String;
    check-cast v10, Ljava/lang/String;

    .line 56
    .restart local v10    # "machineID":Ljava/lang/String;
    const/4 v0, 0x2

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "resultString":Ljava/lang/String;
    check-cast v11, Ljava/lang/String;

    .line 57
    .restart local v11    # "resultString":Ljava/lang/String;
    const/4 v0, 0x3

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "times":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 58
    .restart local v3    # "times":Ljava/lang/String;
    const/4 v0, 0x4

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "date":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 59
    .restart local v4    # "date":Ljava/lang/String;
    const/4 v0, 0x5

    invoke-interface {v9, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "usedTimes":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 61
    .restart local v13    # "usedTimes":Ljava/lang/String;
    const-string/jumbo v0, "idauth"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "idString is"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    const-string/jumbo v0, "idauth"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "machineID is"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const-string/jumbo v0, "idauth"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "resultString is"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const-string/jumbo v0, "idauth"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "times is"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const-string/jumbo v0, "idauth"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "date is"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    const-string/jumbo v0, "idauth"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "usedTimes is"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x10

    if-ge v0, v2, :cond_5

    .line 72
    :cond_3
    const/4 v0, 0x3

    goto/16 :goto_0

    .line 70
    :cond_4
    const/4 v0, 0x2

    goto/16 :goto_0

    .line 73
    :cond_5
    if-eqz v10, :cond_6

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x20

    if-lt v0, v2, :cond_6

    invoke-virtual/range {p0 .. p0}, Lcom/edutech/idauthentication/Aduth;->GetMachineID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 74
    :cond_6
    const/4 v0, 0x4

    goto/16 :goto_0

    .line 75
    :cond_7
    if-eqz v11, :cond_8

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_8

    const-string/jumbo v0, "4"

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    const-string/jumbo v0, "5"

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 76
    :cond_8
    const/4 v0, 0x5

    goto/16 :goto_0

    .line 77
    :cond_9
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    .line 78
    .local v7, "curretDate":Ljava/util/Date;
    new-instance v12, Ljava/text/SimpleDateFormat;

    const-string/jumbo v0, "yyyy-MM-dd"

    invoke-direct {v12, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 79
    .local v12, "sdf":Ljava/text/SimpleDateFormat;
    const/4 v6, 0x0

    .line 81
    .local v6, "authDate":Ljava/util/Date;
    if-eqz v4, :cond_b

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xa

    if-lt v0, v2, :cond_b

    .line 85
    :try_start_0
    invoke-virtual {v12, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 91
    :goto_1
    if-eqz v6, :cond_a

    invoke-virtual {v7, v6}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 92
    :cond_a
    const/4 v0, 0x6

    goto/16 :goto_0

    .line 86
    :catch_0
    move-exception v8

    .line 88
    .local v8, "e":Ljava/text/ParseException;
    invoke-virtual {v8}, Ljava/text/ParseException;->printStackTrace()V

    goto :goto_1

    .line 94
    .end local v8    # "e":Ljava/text/ParseException;
    :cond_b
    if-eqz v3, :cond_d

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_d

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_d

    if-eqz v13, :cond_d

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_d

    .line 96
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    if-gt v0, v2, :cond_c

    .line 97
    const/4 v0, 0x7

    goto/16 :goto_0

    .line 99
    :cond_c
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_d

    .line 102
    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v14, v0, 0x1

    .line 103
    .local v14, "usedTimesInt":I
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/edutech/idauthentication/Aduth;->writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .end local v14    # "usedTimesInt":I
    :cond_d
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public writeidFile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "idString"    # Ljava/lang/String;
    .param p2, "result"    # I
    .param p3, "times"    # Ljava/lang/String;
    .param p4, "date"    # Ljava/lang/String;
    .param p5, "usedTimes"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x5

    .line 343
    const/4 v0, 0x0

    .line 344
    .local v0, "fileos":Ljava/io/FileOutputStream;
    move-object v2, p5

    .line 345
    .local v2, "hasUsedTimes":Ljava/lang/String;
    const/4 v3, 0x0

    .line 348
    .local v3, "idInfo":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v5, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 350
    const-string/jumbo v5, "0"

    invoke-virtual {p5, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 352
    invoke-static {}, Lcom/edutech/idauthentication/Aduth;->readIDFile()Ljava/util/List;

    move-result-object v3

    .line 353
    const/4 v5, 0x0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 355
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "hasUsedTimes":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 359
    .restart local v2    # "hasUsedTimes":Ljava/lang/String;
    :cond_0
    sget-object v5, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 361
    :cond_1
    sget-object v5, Lcom/edutech/idauthentication/Aduth;->filepathMobileStudyClient_NEW:Ljava/lang/String;

    invoke-static {v5}, Lcom/edutech/idauthentication/FileUtils;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    sput-object v5, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    .line 364
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    sget-object v5, Lcom/edutech/idauthentication/Aduth;->idfile_new:Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .end local v0    # "fileos":Ljava/io/FileOutputStream;
    .local v1, "fileos":Ljava/io/FileOutputStream;
    move-object v0, v1

    .line 369
    .end local v1    # "fileos":Ljava/io/FileOutputStream;
    .restart local v0    # "fileos":Ljava/io/FileOutputStream;
    :goto_0
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v4

    .line 371
    .local v4, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_1
    const-string/jumbo v5, "UTF-8"

    invoke-interface {v4, v0, v5}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 372
    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 374
    const-string/jumbo v5, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 375
    const/4 v6, 0x1

    .line 373
    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 378
    const/4 v5, 0x0

    const-string/jumbo v6, "id"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 380
    const/4 v5, 0x0

    const-string/jumbo v6, "a1"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 381
    invoke-static {p1}, Lcom/edutech/idauthentication/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 383
    const/4 v5, 0x0

    const-string/jumbo v6, "a1"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 385
    const/4 v5, 0x0

    const-string/jumbo v6, "b2"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 386
    invoke-virtual {p0}, Lcom/edutech/idauthentication/Aduth;->GetMachineID()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/edutech/idauthentication/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 388
    const/4 v5, 0x0

    const-string/jumbo v6, "b2"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 390
    const/4 v5, 0x0

    const-string/jumbo v6, "c3"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 391
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/edutech/idauthentication/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 393
    const/4 v5, 0x0

    const-string/jumbo v6, "c3"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 396
    const/4 v5, 0x0

    const-string/jumbo v6, "d4"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 397
    invoke-static {p3}, Lcom/edutech/idauthentication/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 399
    const/4 v5, 0x0

    const-string/jumbo v6, "d4"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 401
    const/4 v5, 0x0

    const-string/jumbo v6, "e5"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 402
    invoke-static {p4}, Lcom/edutech/idauthentication/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 404
    const/4 v5, 0x0

    const-string/jumbo v6, "e5"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 406
    const/4 v5, 0x0

    const-string/jumbo v6, "f6"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 407
    invoke-static {v2}, Lcom/edutech/idauthentication/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 409
    const/4 v5, 0x0

    const-string/jumbo v6, "f6"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 412
    const/4 v5, 0x0

    const-string/jumbo v6, "id"

    invoke-interface {v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 414
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 415
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 416
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 421
    :goto_1
    return-void

    .line 418
    :catch_0
    move-exception v5

    goto :goto_1

    .line 365
    .end local v4    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_1
    move-exception v5

    goto/16 :goto_0
.end method
