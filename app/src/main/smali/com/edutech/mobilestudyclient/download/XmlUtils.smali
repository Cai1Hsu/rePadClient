.class public Lcom/edutech/mobilestudyclient/download/XmlUtils;
.super Ljava/lang/Object;
.source "XmlUtils.java"


# static fields
.field static TAG:Ljava/lang/String;

.field public static launcherDetail_path:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 35
    const-string/jumbo v0, "xmlUtils"

    sput-object v0, Lcom/edutech/mobilestudyclient/download/XmlUtils;->TAG:Ljava/lang/String;

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "/MobileStudyClient/.System/launcher.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/download/XmlUtils;->launcherDetail_path:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addLauncherIconUrl(Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "sp"    # Landroid/content/SharedPreferences;

    .prologue
    .line 221
    if-nez p2, :cond_1

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 225
    :cond_1
    if-eqz p1, :cond_0

    const-string/jumbo v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 227
    const-string/jumbo v1, ""

    invoke-interface {p2, p0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 228
    .local v0, "tempurl":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 230
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method private static downLoadImage(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/content/Context;)V
    .locals 10
    .param p2, "mcontext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 235
    .local p0, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p1, "codes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-eq v8, v9, :cond_1

    .line 265
    :cond_0
    return-void

    .line 240
    :cond_1
    const-string/jumbo v8, "launcherpicture"

    .line 241
    const/4 v9, 0x0

    .line 240
    invoke-virtual {p2, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 242
    .local v6, "sp":Landroid/content/SharedPreferences;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ge v4, v8, :cond_0

    .line 244
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 245
    .local v1, "codestr":Ljava/lang/String;
    invoke-interface {v6, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 242
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 250
    :cond_2
    :try_start_0
    new-instance v7, Ljava/net/URL;

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 251
    .local v7, "url":Ljava/net/URL;
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    .line 252
    .local v2, "conn":Ljava/net/HttpURLConnection;
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 253
    .local v0, "code":I
    const/16 v8, 0xc8

    if-ne v0, v8, :cond_3

    .line 254
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 255
    .local v5, "in":Ljava/io/InputStream;
    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v5, v8}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->savePic(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 257
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 259
    .end local v5    # "in":Ljava/io/InputStream;
    :cond_3
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 260
    .end local v0    # "code":I
    .end local v2    # "conn":Ljava/net/HttpURLConnection;
    .end local v7    # "url":Ljava/net/URL;
    :catch_0
    move-exception v3

    .line 262
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static saveLauncher(Ljava/lang/String;Landroid/content/Context;)I
    .locals 69
    .param p0, "json_str"    # Ljava/lang/String;
    .param p1, "mcontext"    # Landroid/content/Context;

    .prologue
    .line 45
    if-eqz p0, :cond_0

    const-string/jumbo v3, ""

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    if-nez p1, :cond_1

    .line 46
    :cond_0
    const/4 v3, -0x1

    .line 216
    :goto_0
    return v3

    .line 48
    :cond_1
    const/16 v61, 0x0

    .line 49
    .local v61, "isUpdate":Z
    const/16 v65, 0x0

    .line 50
    .local v65, "status":Ljava/lang/String;
    const/16 v57, 0x0

    .line 51
    .local v57, "errorNum":Ljava/lang/String;
    const/16 v56, 0x0

    .line 52
    .local v56, "errorInfo":Ljava/lang/String;
    const/16 v49, 0x0

    .line 55
    .local v49, "data":Lorg/json/JSONObject;
    :try_start_0
    new-instance v60, Lorg/json/JSONObject;

    move-object/from16 v0, v60

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 56
    .local v60, "info":Lorg/json/JSONObject;
    const-string/jumbo v3, "status"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v65

    .line 57
    const-string/jumbo v3, "errorNum"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    .line 58
    const-string/jumbo v3, "errorInfo"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v56

    .line 59
    const-string/jumbo v3, "0"

    move-object/from16 v0, v57

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 61
    const-string/jumbo v3, "data"

    move-object/from16 v0, v60

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v49

    .line 63
    const/16 v38, 0x0

    .line 64
    .local v38, "privatekey":Ljava/lang/String;
    const/16 v39, 0x0

    .line 65
    .local v39, "encrypt":Ljava/lang/String;
    const/16 v40, 0x0

    .line 66
    .local v40, "apihost":Ljava/lang/String;
    const-string/jumbo v3, "privatekey"

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    .line 67
    const-string/jumbo v3, "encrypt"

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 68
    const-string/jumbo v3, "apihost"

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    .line 71
    const-string/jumbo v3, "user"

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v68

    .line 72
    .local v68, "user":Lorg/json/JSONObject;
    const/16 v62, 0x0

    .line 73
    .local v62, "pubkey":Ljava/lang/String;
    const-string/jumbo v3, "pubkey"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v62

    .line 74
    const-string/jumbo v3, "type"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v66

    .line 75
    .local v66, "type_user":Ljava/lang/String;
    const-string/jumbo v3, "03"

    move-object/from16 v0, v66

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string/jumbo v3, "3"

    move-object/from16 v0, v66

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 76
    const/4 v3, 0x2

    goto/16 :goto_0

    .line 78
    :cond_2
    const-string/jumbo v42, "-1"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 80
    .local v42, "userid":Ljava/lang/String;
    :try_start_1
    const-string/jumbo v3, "id"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v42

    .line 85
    :goto_1
    :try_start_2
    const-string/jumbo v41, "-1"
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 87
    .local v41, "usercode":Ljava/lang/String;
    :try_start_3
    const-string/jumbo v3, "usercode"

    move-object/from16 v0, v68

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v41

    .line 92
    :goto_2
    :try_start_4
    const-string/jumbo v3, "privatekey"

    .line 93
    const/4 v4, 0x0

    .line 92
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v63

    .line 94
    .local v63, "sharePre":Landroid/content/SharedPreferences;
    invoke-interface/range {v63 .. v63}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v55

    .line 96
    .local v55, "editor":Landroid/content/SharedPreferences$Editor;
    const/16 v54, 0x0

    .line 98
    .local v54, "ebag":Lorg/json/JSONObject;
    :try_start_5
    const-string/jumbo v3, "ebag"

    move-object/from16 v0, v49

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v54

    .line 100
    if-eqz v54, :cond_3

    const-string/jumbo v3, "updatetime"

    const-string/jumbo v4, ""

    move-object/from16 v0, v63

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "updatetime"

    move-object/from16 v0, v54

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 101
    const-string/jumbo v3, "liu"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "save time:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "updatetime"

    const-string/jumbo v6, ""

    move-object/from16 v0, v63

    invoke-interface {v0, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    const-string/jumbo v3, "liu"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "request time:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "updatetime"

    move-object/from16 v0, v54

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    const/16 v61, 0x1

    .line 104
    const-string/jumbo v3, "updatetime"

    const-string/jumbo v4, "updatetime"

    move-object/from16 v0, v54

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v55

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1

    .line 110
    :cond_3
    :goto_3
    :try_start_6
    const-string/jumbo v3, "userid"

    move-object/from16 v0, v55

    move-object/from16 v1, v42

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 111
    invoke-interface/range {v55 .. v55}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 112
    const/16 v58, 0x0

    .line 113
    .local v58, "guidelearndownload":Ljava/lang/String;
    const/4 v7, 0x0

    .line 114
    .local v7, "wifi":Ljava/lang/String;
    const/4 v14, 0x0

    .line 115
    .local v14, "setting":Ljava/lang/String;
    const/16 v19, 0x0

    .line 116
    .local v19, "large":Ljava/lang/String;
    const/16 v24, 0x0

    .line 117
    .local v24, "normal":Ljava/lang/String;
    const/16 v29, 0x0

    .line 118
    .local v29, "small":Ljava/lang/String;
    new-instance v43, Ljava/util/ArrayList;

    invoke-direct/range {v43 .. v43}, Ljava/util/ArrayList;-><init>()V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1

    .line 120
    .local v43, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    :try_start_7
    const-string/jumbo v3, "desktopicon"

    move-object/from16 v0, v54

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v50

    .line 121
    .local v50, "desktopicon":Lorg/json/JSONObject;
    const-string/jumbo v3, "wifi"

    move-object/from16 v0, v50

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 122
    const-string/jumbo v3, "setting"

    move-object/from16 v0, v50

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 123
    const-string/jumbo v3, "background"

    move-object/from16 v0, v50

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v46

    .line 124
    .local v46, "background":Lorg/json/JSONObject;
    const-string/jumbo v3, "large"

    move-object/from16 v0, v46

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 125
    const-string/jumbo v3, "normal"

    move-object/from16 v0, v46

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 126
    const-string/jumbo v3, "small"

    move-object/from16 v0, v46

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 128
    const-string/jumbo v3, "launcherpicture"

    .line 129
    const/4 v4, 0x0

    .line 128
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v64

    .line 130
    .local v64, "sp":Landroid/content/SharedPreferences;
    if-eqz v61, :cond_4

    .line 132
    const-string/jumbo v3, "wifi"

    move-object/from16 v0, v64

    invoke-static {v3, v7, v0}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->addLauncherIconUrl(Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 133
    const-string/jumbo v3, "setting"

    move-object/from16 v0, v64

    invoke-static {v3, v14, v0}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->addLauncherIconUrl(Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 134
    const-string/jumbo v3, "large"

    move-object/from16 v0, v19

    move-object/from16 v1, v64

    invoke-static {v3, v0, v1}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->addLauncherIconUrl(Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 135
    const-string/jumbo v3, "normal"

    move-object/from16 v0, v24

    move-object/from16 v1, v64

    invoke-static {v3, v0, v1}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->addLauncherIconUrl(Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 136
    const-string/jumbo v3, "small"

    move-object/from16 v0, v29

    move-object/from16 v1, v64

    invoke-static {v3, v0, v1}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->addLauncherIconUrl(Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_5
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1

    .line 139
    :cond_4
    :try_start_8
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 140
    .local v9, "config2":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v3, "comment"

    const-string/jumbo v4, "-1"

    invoke-virtual {v9, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string/jumbo v3, "download"

    const-string/jumbo v4, "-1"

    invoke-virtual {v9, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    new-instance v3, Lcom/edutech/mobilestudyclient/activity/AppBean;

    const-string/jumbo v4, "wifi"

    const-string/jumbo v5, "wifi"

    const-string/jumbo v6, ""

    const/4 v8, 0x1

    new-instance v10, Ljava/lang/StringBuilder;

    sget-object v11, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "/"

    invoke-virtual {v7, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v11

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v7, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct/range {v3 .. v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object/from16 v0, v43

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    new-instance v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    const-string/jumbo v11, "setting"

    const-string/jumbo v12, "setting"

    const-string/jumbo v13, ""

    const/4 v15, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "/"

    invoke-virtual {v14, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v14, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v16, v9

    invoke-direct/range {v10 .. v17}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object/from16 v0, v43

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v15, Lcom/edutech/mobilestudyclient/activity/AppBean;

    const-string/jumbo v16, "large"

    const-string/jumbo v17, "large"

    const-string/jumbo v18, ""

    const/16 v20, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "/"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v21, v9

    invoke-direct/range {v15 .. v22}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object/from16 v0, v43

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    new-instance v20, Lcom/edutech/mobilestudyclient/activity/AppBean;

    const-string/jumbo v21, "normal"

    const-string/jumbo v22, "normal"

    const-string/jumbo v23, ""

    const/16 v25, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "/"

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v26, v9

    invoke-direct/range {v20 .. v27}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object/from16 v0, v43

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    new-instance v25, Lcom/edutech/mobilestudyclient/activity/AppBean;

    const-string/jumbo v26, "small"

    const-string/jumbo v27, "small"

    const-string/jumbo v28, ""

    const/16 v30, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "/"

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v31, v9

    invoke-direct/range {v25 .. v32}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object/from16 v0, v43

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_1

    .line 150
    .end local v9    # "config2":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_4
    :try_start_9
    const-string/jumbo v3, "app"

    move-object/from16 v0, v54

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v45

    .line 151
    .local v45, "app":Lorg/json/JSONArray;
    const/16 v59, 0x0

    .local v59, "i":I
    :goto_5
    invoke-virtual/range {v45 .. v45}, Lorg/json/JSONArray;->length()I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_1

    move-result v3

    move/from16 v0, v59

    if-lt v0, v3, :cond_5

    .line 182
    .end local v45    # "app":Lorg/json/JSONArray;
    .end local v46    # "background":Lorg/json/JSONObject;
    .end local v50    # "desktopicon":Lorg/json/JSONObject;
    .end local v59    # "i":I
    .end local v64    # "sp":Landroid/content/SharedPreferences;
    :goto_6
    :try_start_a
    sget-object v44, Lcom/edutech/mobilestudyclient/download/XmlUtils;->launcherDetail_path:Ljava/lang/String;

    invoke-static/range {v38 .. v44}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->writeXml_config(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 183
    new-instance v67, Ljava/util/ArrayList;

    invoke-direct/range {v67 .. v67}, Ljava/util/ArrayList;-><init>()V

    .line 184
    .local v67, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v47, Ljava/util/ArrayList;

    invoke-direct/range {v47 .. v47}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v47, "codes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, v67

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    const-string/jumbo v3, "wifi"

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    move-object/from16 v0, v67

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    const-string/jumbo v3, "setting"

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    move-object/from16 v0, v67

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    const-string/jumbo v3, "large"

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    move-object/from16 v0, v67

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    const-string/jumbo v3, "normal"

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    move-object/from16 v0, v67

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    const-string/jumbo v3, "small"

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    const/16 v59, 0x0

    .restart local v59    # "i":I
    :goto_7
    invoke-virtual/range {v43 .. v43}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v59

    if-lt v0, v3, :cond_7

    .line 200
    sget-object v3, Lcom/edutech/mobilestudyclient/download/XmlUtils;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "\u66f4\u65b0icon"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    move-object/from16 v0, v67

    move-object/from16 v1, v47

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->downLoadImage(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/content/Context;)V

    .line 205
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 81
    .end local v7    # "wifi":Ljava/lang/String;
    .end local v14    # "setting":Ljava/lang/String;
    .end local v19    # "large":Ljava/lang/String;
    .end local v24    # "normal":Ljava/lang/String;
    .end local v29    # "small":Ljava/lang/String;
    .end local v41    # "usercode":Ljava/lang/String;
    .end local v43    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    .end local v47    # "codes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v54    # "ebag":Lorg/json/JSONObject;
    .end local v55    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v58    # "guidelearndownload":Ljava/lang/String;
    .end local v59    # "i":I
    .end local v63    # "sharePre":Landroid/content/SharedPreferences;
    .end local v67    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v52

    .line 83
    .local v52, "e":Ljava/lang/Exception;
    invoke-virtual/range {v52 .. v52}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_1

    goto/16 :goto_1

    .line 212
    .end local v38    # "privatekey":Ljava/lang/String;
    .end local v39    # "encrypt":Ljava/lang/String;
    .end local v40    # "apihost":Ljava/lang/String;
    .end local v42    # "userid":Ljava/lang/String;
    .end local v52    # "e":Ljava/lang/Exception;
    .end local v60    # "info":Lorg/json/JSONObject;
    .end local v62    # "pubkey":Ljava/lang/String;
    .end local v66    # "type_user":Ljava/lang/String;
    .end local v68    # "user":Lorg/json/JSONObject;
    :catch_1
    move-exception v52

    .line 214
    .local v52, "e":Lorg/json/JSONException;
    sget-object v3, Lcom/edutech/mobilestudyclient/download/XmlUtils;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "\u914d\u7f6e\u4fe1\u606f json\u6570\u636e  \u8fd4\u56de\u9519\u8bef\u6570\u636e\u3002\u3002\u3002"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v52 .. v52}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    invoke-virtual/range {v52 .. v52}, Lorg/json/JSONException;->printStackTrace()V

    .line 216
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 88
    .end local v52    # "e":Lorg/json/JSONException;
    .restart local v38    # "privatekey":Ljava/lang/String;
    .restart local v39    # "encrypt":Ljava/lang/String;
    .restart local v40    # "apihost":Ljava/lang/String;
    .restart local v41    # "usercode":Ljava/lang/String;
    .restart local v42    # "userid":Ljava/lang/String;
    .restart local v60    # "info":Lorg/json/JSONObject;
    .restart local v62    # "pubkey":Ljava/lang/String;
    .restart local v66    # "type_user":Ljava/lang/String;
    .restart local v68    # "user":Lorg/json/JSONObject;
    :catch_2
    move-exception v52

    .line 90
    .local v52, "e":Ljava/lang/Exception;
    :try_start_b
    invoke-virtual/range {v52 .. v52}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 106
    .end local v52    # "e":Ljava/lang/Exception;
    .restart local v54    # "ebag":Lorg/json/JSONObject;
    .restart local v55    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v63    # "sharePre":Landroid/content/SharedPreferences;
    :catch_3
    move-exception v53

    .line 108
    .local v53, "e1":Ljava/lang/Exception;
    invoke-virtual/range {v53 .. v53}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_1

    goto/16 :goto_3

    .line 152
    .end local v53    # "e1":Ljava/lang/Exception;
    .restart local v7    # "wifi":Ljava/lang/String;
    .restart local v14    # "setting":Ljava/lang/String;
    .restart local v19    # "large":Ljava/lang/String;
    .restart local v24    # "normal":Ljava/lang/String;
    .restart local v29    # "small":Ljava/lang/String;
    .restart local v43    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    .restart local v45    # "app":Lorg/json/JSONArray;
    .restart local v46    # "background":Lorg/json/JSONObject;
    .restart local v50    # "desktopicon":Lorg/json/JSONObject;
    .restart local v58    # "guidelearndownload":Ljava/lang/String;
    .restart local v59    # "i":I
    .restart local v64    # "sp":Landroid/content/SharedPreferences;
    :cond_5
    :try_start_c
    new-instance v36, Ljava/util/HashMap;

    invoke-direct/range {v36 .. v36}, Ljava/util/HashMap;-><init>()V

    .line 153
    .local v36, "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, v45

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "code"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 154
    .local v31, "code":Ljava/lang/String;
    move-object/from16 v0, v45

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "name"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 155
    .local v32, "name":Ljava/lang/String;
    move-object/from16 v0, v45

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "color"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 156
    .local v33, "color":Ljava/lang/String;
    move-object/from16 v0, v45

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "icon"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 157
    .local v34, "icon":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->icon:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, "/"

    move-object/from16 v0, v34

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, v34

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    .line 158
    .local v37, "iconLocal":Ljava/lang/String;
    if-eqz v61, :cond_6

    .line 160
    move-object/from16 v0, v31

    move-object/from16 v1, v34

    move-object/from16 v2, v64

    invoke-static {v0, v1, v2}, Lcom/edutech/mobilestudyclient/download/XmlUtils;->addLauncherIconUrl(Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 162
    :cond_6
    move-object/from16 v0, v45

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string/jumbo v4, "enable"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_1

    move-result v35

    .line 164
    .local v35, "enable":I
    :try_start_d
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, v45

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "config"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "comment"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v48

    .line 165
    .local v48, "comment":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, v45

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "config"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v5, "download"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v51

    .line 166
    .local v51, "download":Ljava/lang/String;
    const-string/jumbo v3, "comment"

    move-object/from16 v0, v36

    move-object/from16 v1, v48

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    const-string/jumbo v3, "download"

    move-object/from16 v0, v36

    move-object/from16 v1, v51

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_1

    .line 174
    .end local v48    # "comment":Ljava/lang/String;
    .end local v51    # "download":Ljava/lang/String;
    :goto_8
    :try_start_e
    new-instance v30, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-direct/range {v30 .. v37}, Lcom/edutech/mobilestudyclient/activity/AppBean;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    move-object/from16 v0, v43

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    add-int/lit8 v59, v59, 0x1

    goto/16 :goto_5

    .line 168
    :catch_4
    move-exception v52

    .line 170
    .restart local v52    # "e":Ljava/lang/Exception;
    const-string/jumbo v3, "comment"

    const-string/jumbo v4, "-1"

    move-object/from16 v0, v36

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    const-string/jumbo v3, "download"

    const-string/jumbo v4, "-1"

    move-object/from16 v0, v36

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-virtual/range {v52 .. v52}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_5
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_1

    goto :goto_8

    .line 176
    .end local v31    # "code":Ljava/lang/String;
    .end local v32    # "name":Ljava/lang/String;
    .end local v33    # "color":Ljava/lang/String;
    .end local v34    # "icon":Ljava/lang/String;
    .end local v35    # "enable":I
    .end local v36    # "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v37    # "iconLocal":Ljava/lang/String;
    .end local v45    # "app":Lorg/json/JSONArray;
    .end local v46    # "background":Lorg/json/JSONObject;
    .end local v50    # "desktopicon":Lorg/json/JSONObject;
    .end local v52    # "e":Ljava/lang/Exception;
    .end local v59    # "i":I
    .end local v64    # "sp":Landroid/content/SharedPreferences;
    :catch_5
    move-exception v52

    .line 178
    .restart local v52    # "e":Ljava/lang/Exception;
    :try_start_f
    invoke-virtual/range {v52 .. v52}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_6

    .line 196
    .end local v52    # "e":Ljava/lang/Exception;
    .restart local v47    # "codes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v59    # "i":I
    .restart local v67    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_7
    move-object/from16 v0, v43

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v67

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    move-object/from16 v0, v43

    move/from16 v1, v59

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v3}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getCode()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    add-int/lit8 v59, v59, 0x1

    goto/16 :goto_7

    .line 208
    .end local v7    # "wifi":Ljava/lang/String;
    .end local v14    # "setting":Ljava/lang/String;
    .end local v19    # "large":Ljava/lang/String;
    .end local v24    # "normal":Ljava/lang/String;
    .end local v29    # "small":Ljava/lang/String;
    .end local v38    # "privatekey":Ljava/lang/String;
    .end local v39    # "encrypt":Ljava/lang/String;
    .end local v40    # "apihost":Ljava/lang/String;
    .end local v41    # "usercode":Ljava/lang/String;
    .end local v42    # "userid":Ljava/lang/String;
    .end local v43    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    .end local v47    # "codes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v54    # "ebag":Lorg/json/JSONObject;
    .end local v55    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v58    # "guidelearndownload":Ljava/lang/String;
    .end local v59    # "i":I
    .end local v62    # "pubkey":Ljava/lang/String;
    .end local v63    # "sharePre":Landroid/content/SharedPreferences;
    .end local v66    # "type_user":Ljava/lang/String;
    .end local v67    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v68    # "user":Lorg/json/JSONObject;
    :cond_8
    sget-object v3, Lcom/edutech/mobilestudyclient/download/XmlUtils;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "\u914d\u7f6e\u4fe1\u606f json\u6570\u636e  \u8fd4\u56de\u9519\u8bef\u6570\u636e\u3002\u3002\u3002"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_1

    .line 209
    const/4 v3, -0x1

    goto/16 :goto_0

    .line 147
    .restart local v7    # "wifi":Ljava/lang/String;
    .restart local v14    # "setting":Ljava/lang/String;
    .restart local v19    # "large":Ljava/lang/String;
    .restart local v24    # "normal":Ljava/lang/String;
    .restart local v29    # "small":Ljava/lang/String;
    .restart local v38    # "privatekey":Ljava/lang/String;
    .restart local v39    # "encrypt":Ljava/lang/String;
    .restart local v40    # "apihost":Ljava/lang/String;
    .restart local v41    # "usercode":Ljava/lang/String;
    .restart local v42    # "userid":Ljava/lang/String;
    .restart local v43    # "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    .restart local v46    # "background":Lorg/json/JSONObject;
    .restart local v50    # "desktopicon":Lorg/json/JSONObject;
    .restart local v54    # "ebag":Lorg/json/JSONObject;
    .restart local v55    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v58    # "guidelearndownload":Ljava/lang/String;
    .restart local v62    # "pubkey":Ljava/lang/String;
    .restart local v63    # "sharePre":Landroid/content/SharedPreferences;
    .restart local v64    # "sp":Landroid/content/SharedPreferences;
    .restart local v66    # "type_user":Ljava/lang/String;
    .restart local v68    # "user":Lorg/json/JSONObject;
    :catch_6
    move-exception v3

    goto/16 :goto_4
.end method

.method private static savePic(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 11
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 268
    if-nez p0, :cond_0

    .line 301
    :goto_0
    return-void

    .line 272
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v9

    .line 273
    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v9, "/MobileStudyClient/.System/icon"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 272
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 274
    .local v7, "picPath":Ljava/lang/String;
    const-string/jumbo v8, "/"

    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 276
    .local v4, "name":Ljava/lang/String;
    invoke-static {v7, v4}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 277
    .local v2, "file":Ljava/io/File;
    const/4 v5, 0x0

    .line 279
    .local v5, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .local v6, "out":Ljava/io/FileOutputStream;
    const/16 v8, 0x400

    :try_start_1
    new-array v0, v8, [B

    .line 282
    .local v0, "b":[B
    :goto_1
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v3

    .local v3, "length":I
    const/4 v8, -0x1

    if-ne v3, v8, :cond_1

    .line 291
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 292
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-object v5, v6

    .line 293
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 283
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :cond_1
    const/4 v8, 0x0

    :try_start_3
    invoke-virtual {v6, v0, v8, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    .line 285
    .end local v0    # "b":[B
    .end local v3    # "length":I
    :catch_0
    move-exception v1

    move-object v5, v6

    .line 287
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 288
    const-string/jumbo v8, "liu"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "savePic:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 291
    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 292
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0

    .line 293
    :catch_1
    move-exception v1

    .line 295
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 289
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    .line 291
    :goto_3
    :try_start_6
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 292
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 298
    :goto_4
    throw v8

    .line 293
    :catch_2
    move-exception v1

    .line 295
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4

    .line 293
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "b":[B
    .restart local v3    # "length":I
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v1

    .line 295
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto/16 :goto_0

    .line 289
    .end local v0    # "b":[B
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "length":I
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v8

    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 285
    :catch_4
    move-exception v1

    goto :goto_2
.end method

.method private static writeXml_config(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 13
    .param p0, "privatekey"    # Ljava/lang/String;
    .param p1, "encrypt"    # Ljava/lang/String;
    .param p2, "apihost"    # Ljava/lang/String;
    .param p3, "usercode"    # Ljava/lang/String;
    .param p4, "userid"    # Ljava/lang/String;
    .param p6, "urlfilepath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/edutech/mobilestudyclient/activity/AppBean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 308
    .local p5, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/edutech/mobilestudyclient/activity/AppBean;>;"
    sget-object v10, Lcom/edutech/mobilestudyclient/download/XmlUtils;->TAG:Ljava/lang/String;

    const-string/jumbo v11, "writeXml"

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    const-string/jumbo v8, ""

    .line 310
    .local v8, "stuid":Ljava/lang/String;
    const-string/jumbo v6, ""

    .line 313
    .local v6, "ip":Ljava/lang/String;
    :try_start_0
    invoke-static {p0}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 314
    invoke-static {p2}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 315
    invoke-static/range {p3 .. p3}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 316
    invoke-static/range {p4 .. p4}, Lcom/cloudclientsetting/until/BZip2Utils;->StringEncodeToBase64(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 322
    :goto_0
    invoke-static/range {p6 .. p6}, Lcom/cloudclientsetting/until/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    .line 323
    .local v9, "xmlFile":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_0

    .line 325
    :try_start_1
    invoke-virtual {v9}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 331
    :cond_0
    :goto_1
    const/4 v3, 0x0

    .line 333
    .local v3, "fileos":Ljava/io/FileOutputStream;
    :try_start_2
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_a

    .end local v3    # "fileos":Ljava/io/FileOutputStream;
    .local v4, "fileos":Ljava/io/FileOutputStream;
    move-object v3, v4

    .line 339
    .end local v4    # "fileos":Ljava/io/FileOutputStream;
    .restart local v3    # "fileos":Ljava/io/FileOutputStream;
    :goto_2
    if-nez v3, :cond_1

    .line 464
    :goto_3
    return-void

    .line 317
    .end local v3    # "fileos":Ljava/io/FileOutputStream;
    .end local v9    # "xmlFile":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 319
    .local v2, "e1":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 326
    .end local v2    # "e1":Ljava/lang/Exception;
    .restart local v9    # "xmlFile":Ljava/io/File;
    :catch_1
    move-exception v1

    .line 328
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 334
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v3    # "fileos":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v1

    .line 335
    .local v1, "e":Ljava/io/FileNotFoundException;
    const-string/jumbo v10, "FileNotFoundException"

    const-string/jumbo v11, "can\'t create FileOutputStream"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 343
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :cond_1
    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v7

    .line 345
    .local v7, "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_3
    const-string/jumbo v10, "UTF-8"

    invoke-interface {v7, v3, v10}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 346
    const/4 v10, 0x0

    const/4 v11, 0x1

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 348
    const-string/jumbo v10, "http://xmlpull.org/v1/doc/features.html#indent-output"

    .line 349
    const/4 v11, 0x1

    .line 347
    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 351
    const/4 v10, 0x0

    :try_start_4
    const-string/jumbo v11, "urlpath"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    .line 354
    const/4 v10, 0x0

    :try_start_5
    const-string/jumbo v11, "ip"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 355
    invoke-interface {v7, v6}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 356
    const/4 v10, 0x0

    const-string/jumbo v11, "ip"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 362
    :goto_4
    const/4 v10, 0x0

    :try_start_6
    const-string/jumbo v11, "urlpath"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 369
    :goto_5
    const/4 v10, 0x0

    :try_start_7
    const-string/jumbo v11, "student"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 371
    const/4 v10, 0x0

    :try_start_8
    const-string/jumbo v11, "stuid"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 372
    invoke-interface {v7, v8}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 373
    const/4 v10, 0x0

    const-string/jumbo v11, "stuid"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 375
    const/4 v10, 0x0

    const-string/jumbo v11, "usercode"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 376
    move-object/from16 v0, p3

    invoke-interface {v7, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 377
    const/4 v10, 0x0

    const-string/jumbo v11, "usercode"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    .line 386
    :goto_6
    const/4 v10, 0x0

    :try_start_9
    const-string/jumbo v11, "privatekey"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 387
    invoke-interface {v7, p0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 388
    const/4 v10, 0x0

    const-string/jumbo v11, "privatekey"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 391
    const/4 v10, 0x0

    const-string/jumbo v11, "encrypt"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 392
    invoke-interface {v7, p1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 393
    const/4 v10, 0x0

    const-string/jumbo v11, "encrypt"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 396
    const/4 v10, 0x0

    const-string/jumbo v11, "apihost"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 397
    invoke-interface {v7, p2}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 398
    const/4 v10, 0x0

    const-string/jumbo v11, "apihost"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    .line 403
    :goto_7
    const/4 v10, 0x0

    :try_start_a
    const-string/jumbo v11, "student"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7

    .line 409
    :goto_8
    const/4 v10, 0x0

    :try_start_b
    const-string/jumbo v11, "apps"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 410
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9
    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lt v5, v10, :cond_2

    .line 451
    const/4 v10, 0x0

    const-string/jumbo v11, "apps"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9

    .line 457
    .end local v5    # "i":I
    :goto_a
    :try_start_c
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 458
    invoke-interface {v7}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 459
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3

    goto/16 :goto_3

    .line 461
    :catch_3
    move-exception v1

    .line 462
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_3

    .line 357
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v1

    .line 359
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_d
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_5

    goto/16 :goto_4

    .line 363
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_5
    move-exception v1

    .line 365
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_e
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3

    goto/16 :goto_5

    .line 378
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_6
    move-exception v1

    .line 380
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_f
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_7

    goto :goto_6

    .line 404
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_7
    move-exception v1

    .line 406
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_10
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_3

    goto :goto_8

    .line 399
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_8
    move-exception v1

    .line 401
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_11
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_7

    goto :goto_7

    .line 411
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v5    # "i":I
    :cond_2
    const/4 v10, 0x0

    :try_start_12
    const-string/jumbo v11, "app"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 413
    const/4 v10, 0x0

    const-string/jumbo v11, "code"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 414
    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getCode()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 415
    const/4 v10, 0x0

    const-string/jumbo v11, "code"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 417
    const/4 v10, 0x0

    const-string/jumbo v11, "name"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 418
    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 419
    const/4 v10, 0x0

    const-string/jumbo v11, "name"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 421
    const/4 v10, 0x0

    const-string/jumbo v11, "color"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 422
    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getColor()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 423
    const/4 v10, 0x0

    const-string/jumbo v11, "color"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 425
    const/4 v10, 0x0

    const-string/jumbo v11, "icon"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 426
    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIcon()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 427
    const/4 v10, 0x0

    const-string/jumbo v11, "icon"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 429
    const/4 v10, 0x0

    const-string/jumbo v11, "iconLocal"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 430
    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getIconLocal()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 431
    const/4 v10, 0x0

    const-string/jumbo v11, "iconLocal"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 433
    const/4 v10, 0x0

    const-string/jumbo v11, "enable"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 434
    new-instance v11, Ljava/lang/StringBuilder;

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getEnable()I

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v11, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 435
    const/4 v10, 0x0

    const-string/jumbo v11, "enable"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 437
    const/4 v10, 0x0

    const-string/jumbo v11, "config"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 439
    const/4 v10, 0x0

    const-string/jumbo v11, "download"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 440
    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getConfig()Ljava/util/HashMap;

    move-result-object v10

    const-string/jumbo v11, "download"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 441
    const/4 v10, 0x0

    const-string/jumbo v11, "download"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 443
    const/4 v10, 0x0

    const-string/jumbo v11, "comment"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 444
    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/edutech/mobilestudyclient/activity/AppBean;

    invoke-virtual {v10}, Lcom/edutech/mobilestudyclient/activity/AppBean;->getConfig()Ljava/util/HashMap;

    move-result-object v10

    const-string/jumbo v11, "comment"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v7, v10}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 445
    const/4 v10, 0x0

    const-string/jumbo v11, "comment"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 447
    const/4 v10, 0x0

    const-string/jumbo v11, "config"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 449
    const/4 v10, 0x0

    const-string/jumbo v11, "app"

    invoke-interface {v7, v10, v11}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_9

    .line 410
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_9

    .line 452
    .end local v5    # "i":I
    :catch_9
    move-exception v1

    .line 453
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_13
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 454
    sget-object v10, Lcom/edutech/mobilestudyclient/download/XmlUtils;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string/jumbo v12, "write to  xml file"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_3

    goto/16 :goto_a

    .line 336
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v7    # "serializer":Lorg/xmlpull/v1/XmlSerializer;
    :catch_a
    move-exception v10

    goto/16 :goto_2
.end method
