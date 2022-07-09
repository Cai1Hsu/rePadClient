.class public Lcom/edutech/daoxueben/sysconfig/AppEnvironment;
.super Ljava/lang/Object;
.source "AppEnvironment.java"


# static fields
.field public static final ASSETS_DOWNLOAD_DIR:Ljava/lang/String;

.field public static final BOOKPIC:Ljava/lang/String;

.field public static final BOOK_ID:Ljava/lang/String; = "book_id"

.field public static BOOK_ID_LOG:Ljava/lang/String; = null

.field public static final BOOK_ID_NAME:Ljava/lang/String; = "bookid="

.field public static final BOOK_NAME:Ljava/lang/String; = "book_name"

.field public static final CAMERA_CODE:I = 0x2

.field public static final CHAPTER_NAME:Ljava/lang/String; = "chapter_name"

.field public static DOWNFILENAME:Ljava/lang/String; = null

.field public static DX_ID_LOG:Ljava/lang/String; = null

.field public static final DX_ID_NAME:Ljava/lang/String; = "dxid="

.field public static final DaoXueBen:Ljava/lang/String; = "DaoXueBen"

.field public static final DaoXueBenNew:Ljava/lang/String; = "DaoXueBenNew"

.field public static final EXAMID_BACK:Ljava/lang/String; = "BACKEXAMID"

.field public static final EXAM_EXAMID_BACK:I = 0xc

.field public static EXAM_ID:Ljava/lang/String; = null

.field public static final EXAM_URL_BACK:I = 0x2

.field public static EXM_HEIGHT:I = 0x0

.field public static FILENAME:Ljava/lang/String; = null

.field public static final FILE_SELECTED:I = 0x1

.field public static final FOLDER_JSON_TREE:Ljava/lang/String;

.field public static final FOLDER_MAIN:Ljava/lang/String;

.field public static final FOLDER_MAIN_HTML_FOLDER:Ljava/lang/String;

.field public static final HEIGHT:I = 0x190

.field public static final ID:Ljava/lang/String; = "id"

.field public static final JSON_BOOKS_File:Ljava/lang/String;

.field public static final JSON_JSON_File:Ljava/lang/String;

.field public static final LISTTASK_MAXSIZE:I = 0x14

.field public static final OFFLINE_DOWNLOAD:Ljava/lang/String;

.field public static final PREF_DEFAULT_URL:Ljava/lang/String; = "http://192.168.0.88/index/student-pad/method/6/user/02/pass/1"

.field public static final PREF_PREFERENCE_NAME:Ljava/lang/String; = "cloudclientpreference"

.field public static final PREF_SETTING_URL:Ljava/lang/String; = "pref_setting_url"

.field public static final PWDFILEPATH:Ljava/lang/String;

.field public static SCREENHEIGHT:I = 0x0

.field public static SCREENWIDTH:I = 0x0

.field public static final SECTION_NAME:Ljava/lang/String; = "section_name"

.field public static final SECTION_PATH:Ljava/lang/String; = "section_path"

.field public static final SECTION_PROGRESS:Ljava/lang/String; = "section_progress"

.field public static final SECTION_TAG:Ljava/lang/String; = "section_tag"

.field public static final SECTION_UPDATETIME:Ljava/lang/String; = "section_updatetime"

.field public static final SECTION_WEBPATH:Ljava/lang/String; = "section_webpath"

.field public static final SIZE:Ljava/lang/String; = "size"

.field public static final SOURCE_ID:Ljava/lang/String; = "source_id"

.field public static final SOURCE_ISDOWN:Ljava/lang/String; = "source_isdown"

.field public static final SOURCE_PATH:Ljava/lang/String; = "source_path"

.field public static final SOURCE_PROGRESS:Ljava/lang/String; = "source_progress"

.field public static final SOURCE_SIZE:Ljava/lang/String; = "source_size"

.field public static final SOURCE_WEBPATH:Ljava/lang/String; = "source_webpath"

.field public static final STBFILEPATH:Ljava/lang/String;

.field public static STUDENT_ID:Ljava/lang/String; = null

.field public static SUBJECT_ID:Ljava/lang/String; = null

.field public static SUCCESS_EXAM_ID:Ljava/lang/String; = null

.field public static SUCCESS_SUBJECT_ID:Ljava/lang/String; = null

.field public static ShowExist:Z = false

.field public static StudentId:Ljava/lang/String; = null

.field public static TEMP_FILENAME:Ljava/lang/String; = null

.field public static final URLFILEPATH:Ljava/lang/String;

.field public static final URL_BACK:Ljava/lang/String; = "BACKURL"

.field public static final VIDEO_BACK:I = 0x400

.field public static WEB_EX_FILENAME:Ljava/lang/String; = null

.field public static WEB_EX_URL:Ljava/lang/String; = null

.field public static WIDTH:I = 0x0

.field public static final WrongQuestionSet:Ljava/lang/String; = "WrongQuestionSet"

.field public static final ZuoYeFuDao:Ljava/lang/String; = "ZuoYeFuDao"

.field public static is_PRO_END_EXAM:Z

.field public static mediaPlayer:Landroid/media/MediaPlayer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    const-string/jumbo v1, "/MobileStudyClient/.System/bookpics/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->BOOKPIC:Ljava/lang/String;

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    const-string/jumbo v1, "/MobileStudyClient/.System/setting.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->URLFILEPATH:Ljava/lang/String;

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    const-string/jumbo v1, "/MobileStudyClient/.System/pwd.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->PWDFILEPATH:Ljava/lang/String;

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 31
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 32
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 33
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 34
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 35
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->FOLDER_MAIN:Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 40
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 41
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 42
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 43
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->ASSETS_DOWNLOAD_DIR:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 48
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 49
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 50
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 51
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 52
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "Books.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_BOOKS_File:Ljava/lang/String;

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 69
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 70
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 71
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 72
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 73
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "json.txt"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->JSON_JSON_File:Ljava/lang/String;

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 77
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 78
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 79
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 80
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 81
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 82
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 83
    const-string/jumbo v1, "HTML"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 84
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 85
    const-string/jumbo v1, "index.html"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->FOLDER_MAIN_HTML_FOLDER:Ljava/lang/String;

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    .line 87
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 89
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 90
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 91
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 92
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 93
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 94
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 95
    const-string/jumbo v1, "offlineDownload"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 96
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->OFFLINE_DOWNLOAD:Ljava/lang/String;

    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 100
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 101
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 102
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 103
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "jsonTree"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->FOLDER_JSON_TREE:Ljava/lang/String;

    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 107
    const-string/jumbo v1, "MobileStudyClient"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 108
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 109
    const-string/jumbo v1, ".System"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 110
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 111
    const-string/jumbo v1, "DaoXueBen"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 112
    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 113
    const-string/jumbo v1, "offlineDownload"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-char v1, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "stb.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->STBFILEPATH:Ljava/lang/String;

    .line 128
    const-string/jumbo v0, "-1"

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->StudentId:Ljava/lang/String;

    .line 129
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DOWNFILENAME:Ljava/lang/String;

    .line 132
    sput-boolean v2, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->is_PRO_END_EXAM:Z

    .line 173
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->DX_ID_LOG:Ljava/lang/String;

    .line 174
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->BOOK_ID_LOG:Ljava/lang/String;

    .line 175
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->EXAM_ID:Ljava/lang/String;

    .line 177
    const/16 v0, 0x400

    sput v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->SCREENWIDTH:I

    .line 178
    const/16 v0, 0x2d0

    sput v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->SCREENHEIGHT:I

    .line 181
    sget v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->SCREENWIDTH:I

    add-int/lit8 v0, v0, -0x14

    sput v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->WIDTH:I

    .line 184
    sget v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->WIDTH:I

    mul-int/lit16 v0, v0, 0x8c

    div-int/lit16 v0, v0, 0x1f4

    sput v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->EXM_HEIGHT:I

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->EXAM_ID:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "userinfo.exm"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->FILENAME:Ljava/lang/String;

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->EXAM_ID:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "temp_userinfo.exm"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->TEMP_FILENAME:Ljava/lang/String;

    .line 192
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->SUBJECT_ID:Ljava/lang/String;

    .line 193
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->STUDENT_ID:Ljava/lang/String;

    .line 194
    sput-boolean v2, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->ShowExist:Z

    .line 195
    const-string/jumbo v0, "http://10.10.10.111"

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->WEB_EX_URL:Ljava/lang/String;

    .line 196
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->WEB_EX_FILENAME:Ljava/lang/String;

    .line 197
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->SUCCESS_EXAM_ID:Ljava/lang/String;

    .line 198
    const-string/jumbo v0, ""

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->SUCCESS_SUBJECT_ID:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static GET_JSON_LOG_File(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "userId"    # Ljava/lang/String;

    .prologue
    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->FOLDER_MAIN:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "Log.json"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static GET_SETTING_URL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "ip"    # Ljava/lang/String;

    .prologue
    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "http://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static LOGJSON_HTTPPOST_URL(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "ip"    # Ljava/lang/String;

    .prologue
    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "http://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/api/padlog"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static UPDATEJSON_HTTPPOST_URL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "ip"    # Ljava/lang/String;
    .param p1, "stuid"    # Ljava/lang/String;

    .prologue
    .line 155
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "http://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/default/index/check-update/studentid/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMedia()Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 203
    sget-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->mediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    .line 205
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    sput-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 207
    :cond_0
    sget-object v0, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->mediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method
