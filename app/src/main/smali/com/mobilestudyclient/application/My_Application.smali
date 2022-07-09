.class public Lcom/mobilestudyclient/application/My_Application;
.super Landroid/app/Application;
.source "My_Application.java"


# static fields
.field private static final AUTH_ON:Ljava/lang/String; = "on"

.field public static Allow_Flag:Z = false

.field public static Archive_Time_S:J = 0x0L

.field public static Class_Type:I = 0x0

.field public static Clound_Flag:Z = false

.field public static Crowded_Dropped:Z = false

.field public static Flag:Z = false

.field public static InfomationActivity:Z = false

.field public static JXHD_activity:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field public static Listener_Flag:Z = false

.field public static LoginName:Ljava/lang/String; = null

.field public static Login_Success:Z = false

.field public static Login_eD:Z = false

.field public static MainActivity_Runing:Z = false

.field public static MyRoomList_JidS:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static Net_System_time_ss:J = 0x0L

.field public static Notice_New:Z = false

.field public static Offline_Chat:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final POLICY_ALWAYS_NEW_CLIENT:Ljava/lang/String; = "always new client"

.field private static final POLICY_SINGLE_SESSION_PER_ACCOUNT:Ljava/lang/String; = "single session per account"

.field public static Room_Not_Exit:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static Setting_Config_infor_Runing:Z

.field private static final TAG:Ljava/lang/String;

.field public static UserName:Ljava/lang/String;

.field public static UserType:I

.field public static WelcomeActivity_Runing:Z

.field public static allfriendsNumber:I

.field public static chat_window_number:I

.field private static mContext:Landroid/content/Context;

.field public static map_file_DBID:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static map_file_DBID_MD5:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static map_weidu:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static muc_query_Over_loading:Z

.field public static net_work_state:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 19
    const-class v0, Lcom/mobilestudyclient/application/My_Application;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->TAG:Ljava/lang/String;

    .line 36
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Listener_Flag:Z

    .line 42
    const/4 v0, 0x0

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->UserName:Ljava/lang/String;

    .line 47
    const/4 v0, -0x1

    sput v0, Lcom/mobilestudyclient/application/My_Application;->UserType:I

    .line 57
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Flag:Z

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->map_weidu:Ljava/util/Map;

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->map_file_DBID:Ljava/util/Map;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->map_file_DBID_MD5:Ljava/util/Map;

    .line 77
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Login_Success:Z

    .line 82
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Login_eD:Z

    .line 87
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->WelcomeActivity_Runing:Z

    .line 97
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Setting_Config_infor_Runing:Z

    .line 102
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->MainActivity_Runing:Z

    .line 107
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->InfomationActivity:Z

    .line 112
    sput v1, Lcom/mobilestudyclient/application/My_Application;->net_work_state:I

    .line 117
    sput v1, Lcom/mobilestudyclient/application/My_Application;->chat_window_number:I

    .line 127
    sput v1, Lcom/mobilestudyclient/application/My_Application;->allfriendsNumber:I

    .line 133
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Clound_Flag:Z

    .line 137
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Notice_New:Z

    .line 142
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->Offline_Chat:Ljava/util/List;

    .line 144
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->JXHD_activity:Ljava/util/List;

    .line 151
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Allow_Flag:Z

    .line 156
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->Room_Not_Exit:Ljava/util/List;

    .line 162
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mobilestudyclient/application/My_Application;->MyRoomList_JidS:Ljava/util/List;

    .line 168
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->Crowded_Dropped:Z

    .line 173
    sput-boolean v1, Lcom/mobilestudyclient/application/My_Application;->muc_query_Over_loading:Z

    .line 178
    sput-wide v2, Lcom/mobilestudyclient/application/My_Application;->Archive_Time_S:J

    .line 184
    sput-wide v2, Lcom/mobilestudyclient/application/My_Application;->Net_System_time_ss:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .prologue
    .line 190
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 193
    const-string/jumbo v0, "20c52e3ae9125e32506e5e813dde3f88"

    .line 194
    .local v0, "appId":Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/pgyersdk/crash/PgyCrashManager;->register(Landroid/content/Context;Ljava/lang/String;)V

    .line 195
    return-void
.end method
