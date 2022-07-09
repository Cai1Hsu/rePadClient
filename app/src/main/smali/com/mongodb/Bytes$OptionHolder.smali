.class Lcom/mongodb/Bytes$OptionHolder;
.super Ljava/lang/Object;
.source "Bytes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/Bytes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OptionHolder"
.end annotation


# instance fields
.field _hasOptions:Z

.field _options:I

.field final _parent:Lcom/mongodb/Bytes$OptionHolder;


# direct methods
.method constructor <init>(Lcom/mongodb/Bytes$OptionHolder;)V
    .locals 1
    .param p1, "parent"    # Lcom/mongodb/Bytes$OptionHolder;

    .prologue
    const/4 v0, 0x0

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    iput v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_options:I

    .line 160
    iput-boolean v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_hasOptions:Z

    .line 133
    iput-object p1, p0, Lcom/mongodb/Bytes$OptionHolder;->_parent:Lcom/mongodb/Bytes$OptionHolder;

    .line 134
    return-void
.end method


# virtual methods
.method add(I)V
    .locals 1
    .param p1, "option"    # I

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/mongodb/Bytes$OptionHolder;->get()I

    move-result v0

    or-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/mongodb/Bytes$OptionHolder;->set(I)V

    .line 151
    return-void
.end method

.method get()I
    .locals 1

    .prologue
    .line 142
    iget-boolean v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_hasOptions:Z

    if-eqz v0, :cond_0

    .line 143
    iget v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_options:I

    .line 146
    :goto_0
    return v0

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_parent:Lcom/mongodb/Bytes$OptionHolder;

    if-nez v0, :cond_1

    .line 145
    const/4 v0, 0x0

    goto :goto_0

    .line 146
    :cond_1
    iget-object v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_parent:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0}, Lcom/mongodb/Bytes$OptionHolder;->get()I

    move-result v0

    goto :goto_0
.end method

.method reset()V
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_hasOptions:Z

    .line 155
    return-void
.end method

.method set(I)V
    .locals 1
    .param p1, "options"    # I

    .prologue
    .line 137
    iput p1, p0, Lcom/mongodb/Bytes$OptionHolder;->_options:I

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/Bytes$OptionHolder;->_hasOptions:Z

    .line 139
    return-void
.end method
