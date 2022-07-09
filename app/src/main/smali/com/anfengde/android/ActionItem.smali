.class public Lcom/anfengde/android/ActionItem;
.super Ljava/lang/Object;
.source "ActionItem.java"


# instance fields
.field private actionId:I

.field private icon:Landroid/graphics/drawable/Drawable;

.field private selected:Z

.field private sticky:Z

.field private thumb:Landroid/graphics/Bitmap;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 40
    const/4 v0, -0x1

    invoke-direct {p0, v0, v1, v1}, Lcom/anfengde/android/ActionItem;-><init>(ILjava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 41
    return-void
.end method

.method public constructor <init>(ILandroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "actionId"    # I
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/anfengde/android/ActionItem;-><init>(ILjava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 70
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "actionId"    # I
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/anfengde/android/ActionItem;-><init>(ILjava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 51
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "actionId"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, -0x1

    iput v0, p0, Lcom/anfengde/android/ActionItem;->actionId:I

    .line 31
    iput-object p2, p0, Lcom/anfengde/android/ActionItem;->title:Ljava/lang/String;

    .line 32
    iput-object p3, p0, Lcom/anfengde/android/ActionItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 33
    iput p1, p0, Lcom/anfengde/android/ActionItem;->actionId:I

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 59
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/anfengde/android/ActionItem;-><init>(ILjava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 60
    return-void
.end method


# virtual methods
.method public getActionId()I
    .locals 1

    .prologue
    .line 120
    iget v0, p0, Lcom/anfengde/android/ActionItem;->actionId:I

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/anfengde/android/ActionItem;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getThumb()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/anfengde/android/ActionItem;->thumb:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/anfengde/android/ActionItem;->title:Ljava/lang/String;

    return-object v0
.end method

.method public isSelected()Z
    .locals 1

    .prologue
    .line 154
    iget-boolean v0, p0, Lcom/anfengde/android/ActionItem;->selected:Z

    return v0
.end method

.method public isSticky()Z
    .locals 1

    .prologue
    .line 136
    iget-boolean v0, p0, Lcom/anfengde/android/ActionItem;->sticky:Z

    return v0
.end method

.method public setActionId(I)V
    .locals 0
    .param p1, "actionId"    # I

    .prologue
    .line 113
    iput p1, p0, Lcom/anfengde/android/ActionItem;->actionId:I

    .line 114
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/anfengde/android/ActionItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 97
    return-void
.end method

.method public setSelected(Z)V
    .locals 0
    .param p1, "selected"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/anfengde/android/ActionItem;->selected:Z

    .line 146
    return-void
.end method

.method public setSticky(Z)V
    .locals 0
    .param p1, "sticky"    # Z

    .prologue
    .line 129
    iput-boolean p1, p0, Lcom/anfengde/android/ActionItem;->sticky:Z

    .line 130
    return-void
.end method

.method public setThumb(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "thumb"    # Landroid/graphics/Bitmap;

    .prologue
    .line 163
    iput-object p1, p0, Lcom/anfengde/android/ActionItem;->thumb:Landroid/graphics/Bitmap;

    .line 164
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/anfengde/android/ActionItem;->title:Ljava/lang/String;

    .line 79
    return-void
.end method
