.class public Lcom/edutech/mobilestudyclient/activity/AppBean;
.super Ljava/lang/Object;
.source "AppBean.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/edutech/mobilestudyclient/activity/AppBean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private code:Ljava/lang/String;

.field private color:Ljava/lang/String;

.field private config:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private enable:I

.field private icon:Ljava/lang/String;

.field private iconLocal:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 103
    new-instance v0, Lcom/edutech/mobilestudyclient/activity/AppBean$1;

    invoke-direct {v0}, Lcom/edutech/mobilestudyclient/activity/AppBean$1;-><init>()V

    sput-object v0, Lcom/edutech/mobilestudyclient/activity/AppBean;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 113
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->code:Ljava/lang/String;

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->name:Ljava/lang/String;

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->color:Ljava/lang/String;

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->icon:Ljava/lang/String;

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->enable:I

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "color"    # Ljava/lang/String;
    .param p4, "icon"    # Ljava/lang/String;
    .param p5, "enable"    # I
    .param p7, "iconLocal"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 17
    .local p6, "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->code:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->name:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->color:Ljava/lang/String;

    .line 21
    iput-object p4, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->icon:Ljava/lang/String;

    .line 22
    iput p5, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->enable:I

    .line 23
    iput-object p7, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->iconLocal:Ljava/lang/String;

    .line 24
    iput-object p6, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->config:Ljava/util/HashMap;

    .line 25
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x0

    return v0
.end method

.method public getCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->code:Ljava/lang/String;

    return-object v0
.end method

.method public getColor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->color:Ljava/lang/String;

    return-object v0
.end method

.method public getConfig()Ljava/util/HashMap;
    .locals 1
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
    .line 90
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->config:Ljava/util/HashMap;

    return-object v0
.end method

.method public getEnable()I
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->enable:I

    return v0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->icon:Ljava/lang/String;

    return-object v0
.end method

.method public getIconLocal()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->iconLocal:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->code:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public setColor(Ljava/lang/String;)V
    .locals 0
    .param p1, "color"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->color:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setConfig(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p1, "config":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->config:Ljava/util/HashMap;

    .line 94
    return-void
.end method

.method public setEnable(I)V
    .locals 0
    .param p1, "enable"    # I

    .prologue
    .line 64
    iput p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->enable:I

    .line 65
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 0
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->icon:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setIconLocal(Ljava/lang/String;)V
    .locals 0
    .param p1, "iconLocal"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->iconLocal:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->name:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 74
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->code:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 76
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->color:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->icon:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 78
    iget v0, p0, Lcom/edutech/mobilestudyclient/activity/AppBean;->enable:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 79
    return-void
.end method
