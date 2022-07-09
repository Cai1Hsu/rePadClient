.class public Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;
.super Landroid/app/Activity;
.source "PasswdDialogActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;
    }
.end annotation


# static fields
.field public static final PWDFILEPATH:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "PasswordActivity"


# instance fields
.field public PWD:Ljava/lang/String;

.field private errorNum:Ljava/lang/Integer;

.field private hostpwdThread:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;

.field private mAlertDialog:Landroid/app/AlertDialog;

.field private mFinish:Z

.field okButton:Landroid/widget/Button;

.field passwordEditText:Landroid/widget/EditText;

.field private showNumber:I

.field private showWarning:I

.field private totalNumber:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    const-string/jumbo v1, "/MobileStudyClient/.System/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->PWDFILEPATH:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 57
    iput-boolean v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mFinish:Z

    .line 60
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->errorNum:Ljava/lang/Integer;

    .line 64
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->PWD:Ljava/lang/String;

    .line 66
    iput v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showWarning:I

    .line 67
    const/16 v0, 0x9

    iput v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showNumber:I

    .line 68
    const/4 v0, 0x7

    iput v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->totalNumber:I

    .line 52
    return-void
.end method

.method static synthetic access$0(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    invoke-direct {p0, p1}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Ljava/lang/Integer;)V
    .locals 0

    .prologue
    .line 60
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->errorNum:Ljava/lang/Integer;

    return-void
.end method

.method static synthetic access$2(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->errorNum:Ljava/lang/Integer;

    return-object v0
.end method

.method static synthetic access$3(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showWarning:I

    return v0
.end method

.method private getJsonStringFromGZIP(Lorg/apache/http/HttpResponse;)Ljava/lang/String;
    .locals 14
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 150
    const/4 v6, 0x0

    .line 153
    .local v6, "jsonString":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v11

    const/16 v12, 0xc8

    if-ne v11, v12, :cond_2

    .line 155
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v11

    invoke-interface {v11}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    .line 156
    .local v5, "is":Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 157
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/4 v11, 0x2

    invoke-virtual {v0, v11}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 159
    const/4 v11, 0x2

    new-array v3, v11, [B

    .line 160
    .local v3, "header":[B
    invoke-virtual {v0, v3}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v9

    .line 162
    .local v9, "result":I
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V

    .line 164
    invoke-direct {p0, v3}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getShort([B)I

    move-result v4

    .line 166
    .local v4, "headerData":I
    const/4 v11, -0x1

    if-eq v9, v11, :cond_0

    const/16 v11, 0x1f8b

    if-ne v4, v11, :cond_0

    .line 167
    const-string/jumbo v11, "PasswordActivity"

    const-string/jumbo v12, " use GZIPInputStream  "

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    new-instance v5, Ljava/util/zip/GZIPInputStream;

    .end local v5    # "is":Ljava/io/InputStream;
    invoke-direct {v5, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 173
    .restart local v5    # "is":Ljava/io/InputStream;
    :goto_0
    new-instance v8, Ljava/io/InputStreamReader;

    const-string/jumbo v11, "utf-8"

    invoke-direct {v8, v5, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 174
    .local v8, "reader":Ljava/io/InputStreamReader;
    const/16 v11, 0x64

    new-array v1, v11, [C

    .line 176
    .local v1, "data":[C
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    .line 177
    .local v10, "sb":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v8, v1}, Ljava/io/InputStreamReader;->read([C)I

    move-result v7

    .local v7, "readSize":I
    if-gtz v7, :cond_1

    .line 180
    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 181
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 182
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "data":[C
    .end local v3    # "header":[B
    .end local v4    # "headerData":I
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v7    # "readSize":I
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .end local v9    # "result":I
    .end local v10    # "sb":Ljava/lang/StringBuffer;
    :goto_2
    const-string/jumbo v11, "PasswordActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "getJsonStringFromGZIP net output : "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    return-object v6

    .line 170
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "header":[B
    .restart local v4    # "headerData":I
    .restart local v5    # "is":Ljava/io/InputStream;
    .restart local v9    # "result":I
    :cond_0
    :try_start_1
    const-string/jumbo v11, "PasswordActivity"

    const-string/jumbo v12, " not use GZIPInputStream"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    move-object v5, v0

    goto :goto_0

    .line 178
    .restart local v1    # "data":[C
    .restart local v7    # "readSize":I
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v10    # "sb":Ljava/lang/StringBuffer;
    :cond_1
    const/4 v11, 0x0

    invoke-virtual {v10, v1, v11, v7}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 189
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v1    # "data":[C
    .end local v3    # "header":[B
    .end local v4    # "headerData":I
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v7    # "readSize":I
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .end local v9    # "result":I
    .end local v10    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v2

    .line 190
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v11, "PasswordActivity"

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 191
    const-string/jumbo v6, ""

    goto :goto_2

    .line 184
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :try_start_2
    const-string/jumbo v11, "PasswordActivity"

    const-string/jumbo v12, "\u4e0e\u670d\u52a1\u7aef\u8fde\u63a5\u5931\u8d25\u3002\u3002\u3002"

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    const-string/jumbo v11, "PasswordActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "ddddd="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    const-string/jumbo v11, "PasswordActivity"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string/jumbo v13, "ddddd="

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const-string/jumbo v6, ""
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2
.end method

.method private getShort([B)I
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 199
    const/4 v0, 0x0

    aget-byte v0, p1, v0

    shl-int/lit8 v0, v0, 0x8

    const/4 v1, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public getPwd()V
    .locals 17

    .prologue
    .line 203
    const-string/jumbo v14, "privatekey"

    .line 204
    const/4 v15, 0x0

    .line 203
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v12

    .line 205
    .local v12, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v14, "key"

    const-string/jumbo v15, ""

    invoke-interface {v12, v14, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 206
    .local v11, "privatekey":Ljava/lang/String;
    const-string/jumbo v14, "apihost"

    const-string/jumbo v15, ""

    invoke-interface {v12, v14, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 207
    .local v9, "ip":Ljava/lang/String;
    const-string/jumbo v14, "name"

    const-string/jumbo v15, ""

    invoke-interface {v12, v14, v15}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 208
    .local v13, "username":Ljava/lang/String;
    invoke-static {}, Lcom/edutech/mobilestudyclient/util/XmlLoadHelper;->loadXml()Ljava/util/HashMap;

    move-result-object v7

    .line 209
    .local v7, "hashmap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v7, :cond_1

    if-eqz v9, :cond_0

    const-string/jumbo v14, ""

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_0

    const-string/jumbo v14, ""

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 210
    :cond_0
    const-string/jumbo v14, "ip"

    invoke-virtual {v7, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "ip":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 211
    .restart local v9    # "ip":Ljava/lang/String;
    const-string/jumbo v14, "usercode"

    invoke-virtual {v7, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "username":Ljava/lang/String;
    check-cast v13, Ljava/lang/String;

    .line 213
    .restart local v13    # "username":Ljava/lang/String;
    const-string/jumbo v14, "privatekey"

    invoke-virtual {v7, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .end local v11    # "privatekey":Ljava/lang/String;
    check-cast v11, Ljava/lang/String;

    .line 215
    .restart local v11    # "privatekey":Ljava/lang/String;
    :cond_1
    new-instance v6, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    sget-object v15, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->PWDFILEPATH:Ljava/lang/String;

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "pwd.xml"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v6, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 216
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 219
    :try_start_0
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 220
    .local v8, "in":Ljava/io/FileInputStream;
    const/16 v14, 0x400

    new-array v3, v14, [B

    .line 221
    .local v3, "by":[B
    const-string/jumbo v1, ""

    .line 224
    .local v1, "aespwd":Ljava/lang/String;
    :goto_0
    invoke-virtual {v8, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v10

    .line 225
    .local v10, "length":I
    const/4 v14, -0x1

    if-ne v10, v14, :cond_4

    .line 231
    if-eqz v8, :cond_2

    .line 233
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V

    .line 235
    :cond_2
    new-instance v2, Lcom/edutech/idauthentication/AESSet;

    invoke-direct {v2}, Lcom/edutech/idauthentication/AESSet;-><init>()V

    .line 236
    .local v2, "aesset":Lcom/edutech/idauthentication/AESSet;
    invoke-virtual {v2, v1}, Lcom/edutech/idauthentication/AESSet;->decrypt(Ljava/lang/String;)[B

    move-result-object v4

    .line 237
    .local v4, "byaes":[B
    new-instance v14, Ljava/lang/String;

    const/4 v15, 0x0

    array-length v0, v4

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-direct {v14, v4, v15, v0}, Ljava/lang/String;-><init>([BII)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->PWD:Ljava/lang/String;

    .line 247
    .end local v1    # "aespwd":Ljava/lang/String;
    .end local v2    # "aesset":Lcom/edutech/idauthentication/AESSet;
    .end local v3    # "by":[B
    .end local v4    # "byaes":[B
    .end local v8    # "in":Ljava/io/FileInputStream;
    .end local v10    # "length":I
    :cond_3
    :goto_1
    return-void

    .line 229
    .restart local v1    # "aespwd":Ljava/lang/String;
    .restart local v3    # "by":[B
    .restart local v8    # "in":Ljava/io/FileInputStream;
    .restart local v10    # "length":I
    :cond_4
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v15, Ljava/lang/String;

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-direct {v15, v3, v0, v10}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 222
    goto :goto_0

    .line 242
    .end local v1    # "aespwd":Ljava/lang/String;
    .end local v3    # "by":[B
    .end local v8    # "in":Ljava/io/FileInputStream;
    .end local v10    # "length":I
    :catch_0
    move-exception v5

    .line 244
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 72
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getPwd()V

    .line 73
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 74
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 76
    const-string/jumbo v1, "lockwarning"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showWarning:I

    .line 77
    const-string/jumbo v1, "number"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showNumber:I

    .line 81
    :cond_0
    sget-boolean v1, Lcom/edutech/mobilestudyclient/SysConfig/AppEnvironment;->isLJLD:Z

    if-eqz v1, :cond_2

    .line 83
    const/4 v1, 0x7

    iput v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->totalNumber:I

    .line 89
    :goto_0
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->hostpwdThread:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;

    if-nez v1, :cond_1

    .line 91
    new-instance v1, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;

    invoke-direct {v1, p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;-><init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)V

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->hostpwdThread:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;

    .line 92
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->hostpwdThread:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;

    invoke-virtual {v1}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;->start()V

    .line 94
    :cond_1
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showDialog()V

    .line 95
    return-void

    .line 86
    :cond_2
    const/4 v1, 0x5

    iput v1, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->totalNumber:I

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 428
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mAlertDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 430
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 432
    :cond_0
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->hostpwdThread:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;

    if-eqz v0, :cond_1

    .line 434
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->hostpwdThread:Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd;

    .line 436
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 437
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 410
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 416
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 420
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 421
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mFinish:Z

    .line 423
    return-void
.end method

.method public showDialog()V
    .locals 11

    .prologue
    const v10, 0x7f08020c

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 250
    new-instance v0, Landroid/app/AlertDialog$Builder;

    const/4 v4, 0x5

    invoke-direct {v0, p0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 252
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f030076

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 253
    .local v3, "view":Landroid/view/View;
    const v4, 0x7f0a01cc

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 254
    .local v1, "passwdEdit":Landroid/widget/EditText;
    const v4, 0x7f0a01cb

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 255
    .local v2, "tv":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    const-string v4, "Password:"

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 257
    iget v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showWarning:I

    if-eq v4, v8, :cond_0

    iget v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showWarning:I

    if-ne v4, v9, :cond_3

    .line 259
    :cond_0
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 260
    iget v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showWarning:I

    if-ne v4, v9, :cond_2

    .line 262
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08020d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    :goto_0
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080035

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x108009b

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0801a8

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;

    invoke-direct {v6, p0, v1}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$1;-><init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;Landroid/widget/EditText;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 340
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0801a9

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$2;

    invoke-direct {v6, p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$2;-><init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 353
    new-instance v5, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$3;

    invoke-direct {v5, p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$3;-><init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)V

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 367
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mAlertDialog:Landroid/app/AlertDialog;

    .line 368
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    const v5, 0x103000a

    invoke-virtual {v4, v5, v8}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 369
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    .line 370
    const/16 v5, 0x7d3

    .line 369
    invoke-virtual {v4, v5}, Landroid/view/Window;->setType(I)V

    .line 371
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mAlertDialog:Landroid/app/AlertDialog;

    new-instance v5, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$4;

    invoke-direct {v5, p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity$4;-><init>(Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;)V

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 395
    iget-object v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 396
    :cond_1
    return-void

    .line 265
    :cond_2
    invoke-virtual {p0}, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 268
    :cond_3
    iget v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showWarning:I

    if-nez v4, :cond_1

    .line 270
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 271
    iget v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showNumber:I

    if-lez v4, :cond_4

    iget v4, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->totalNumber:I

    add-int/lit8 v4, v4, 0x2

    iget v5, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showNumber:I

    sub-int/2addr v4, v5

    if-lez v4, :cond_4

    .line 273
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "\u5982\u679c\u5bc6\u7801\u6846\u4e00\u76f4\u5f39\uff0c\u8bf7\u957f\u6309\u7535\u6e90\u952e\u5173\u673a\uff0c\u91cd\u542f\u5e73\u677f\u3002\u5269\u4f59\u6b21\u6570\uff1a"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->totalNumber:I

    add-int/lit8 v5, v5, 0x2

    iget v6, p0, Lcom/edutech/mobilestudyclient/activity/PasswdDialogActivity;->showNumber:I

    sub-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 276
    :cond_4
    const/16 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_0
.end method
