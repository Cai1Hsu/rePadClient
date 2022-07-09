.class public Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;
.super Lorg/apache/tools/ant/types/DataType;
.source "ExtensionAdapter.java"


# instance fields
.field private extensionName:Ljava/lang/String;

.field private implementationURL:Ljava/lang/String;

.field private implementationVendor:Ljava/lang/String;

.field private implementationVendorID:Ljava/lang/String;

.field private implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

.field private specificationVendor:Ljava/lang/String;

.field private specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    return-void
.end method

.method private verifyNotAReference()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 169
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 172
    :cond_0
    return-void
.end method


# virtual methods
.method public setExtensionName(Ljava/lang/String;)V
    .locals 0
    .param p1, "extensionName"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->verifyNotAReference()V

    .line 80
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->extensionName:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setImplementationUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "implementationURL"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->verifyNotAReference()V

    .line 140
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationURL:Ljava/lang/String;

    .line 141
    return-void
.end method

.method public setImplementationVendor(Ljava/lang/String;)V
    .locals 0
    .param p1, "implementationVendor"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->verifyNotAReference()V

    .line 120
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVendor:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setImplementationVendorId(Ljava/lang/String;)V
    .locals 0
    .param p1, "implementationVendorID"    # Ljava/lang/String;

    .prologue
    .line 109
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->verifyNotAReference()V

    .line 110
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVendorID:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public setImplementationVersion(Ljava/lang/String;)V
    .locals 1
    .param p1, "implementationVersion"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->verifyNotAReference()V

    .line 130
    new-instance v0, Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    .line 131
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "reference"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->extensionName:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->specificationVendor:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVendorID:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVendor:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationURL:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 162
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 164
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 165
    return-void
.end method

.method public setSpecificationVendor(Ljava/lang/String;)V
    .locals 0
    .param p1, "specificationVendor"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->verifyNotAReference()V

    .line 100
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->specificationVendor:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setSpecificationVersion(Ljava/lang/String;)V
    .locals 1
    .param p1, "specificationVersion"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->verifyNotAReference()V

    .line 90
    new-instance v0, Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    .line 91
    return-void
.end method

.method toExtension()Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->toExtension()Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    .line 198
    :goto_0
    return-object v0

    .line 184
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->dieOnCircularReference()V

    .line 185
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->extensionName:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 186
    const-string/jumbo v8, "Extension is missing name."

    .line 187
    .local v8, "message":Ljava/lang/String;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Extension is missing name."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    .end local v8    # "message":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    .line 191
    .local v2, "specificationVersionString":Ljava/lang/String;
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v0, :cond_2

    .line 192
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->specificationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v2

    .line 194
    :cond_2
    const/4 v4, 0x0

    .line 195
    .local v4, "implementationVersionString":Ljava/lang/String;
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    if-eqz v0, :cond_3

    .line 196
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVersion:Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v4

    .line 198
    :cond_3
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->extensionName:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->specificationVendor:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVendor:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationVendorID:Ljava/lang/String;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->implementationURL:Ljava/lang/String;

    invoke-direct/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 213
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->toExtension()Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
