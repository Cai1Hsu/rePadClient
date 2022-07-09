.class public Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;
.super Ljava/lang/Object;
.source "PropertiesfileCache.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;


# instance fields
.field private cache:Ljava/util/Properties;

.field private cacheDirty:Z

.field private cacheLoaded:Z

.field private cachefile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    .line 68
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheLoaded:Z

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheDirty:Z

    .line 86
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "cachefile"    # Ljava/io/File;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    .line 68
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheLoaded:Z

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheDirty:Z

    .line 93
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    .line 94
    return-void
.end method


# virtual methods
.method public delete()V
    .locals 1

    .prologue
    .line 175
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    .line 176
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 177
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheLoaded:Z

    .line 178
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheDirty:Z

    .line 179
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 187
    iget-boolean v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheLoaded:Z

    if-nez v1, :cond_0

    .line 188
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->load()V

    .line 191
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 193
    :goto_0
    return-object v1

    .line 192
    :catch_0
    move-exception v0

    .line 193
    .local v0, "e":Ljava/lang/ClassCastException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getCachefile()Ljava/io/File;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    return-object v0
.end method

.method public isValid()Z
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 212
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 213
    .local v1, "v":Ljava/util/Vector;
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    invoke-virtual {v2}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .line 214
    .local v0, "en":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 215
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 217
    :cond_0
    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    return-object v2
.end method

.method public load()V
    .locals 4

    .prologue
    .line 133
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 135
    :try_start_0
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 137
    .local v0, "bis":Ljava/io/BufferedInputStream;
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    invoke-virtual {v2, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 138
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 144
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    :cond_0
    :goto_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheLoaded:Z

    .line 145
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheDirty:Z

    .line 146
    return-void

    .line 139
    :catch_0
    move-exception v1

    .line 140
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 203
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheDirty:Z

    .line 205
    return-void
.end method

.method public save()V
    .locals 4

    .prologue
    .line 156
    iget-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheDirty:Z

    if-nez v2, :cond_0

    .line 171
    :goto_0
    return-void

    .line 159
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    invoke-virtual {v2}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 161
    :try_start_0
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 163
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 164
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V

    .line 165
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    :cond_1
    :goto_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cacheDirty:Z

    goto :goto_0

    .line 166
    :catch_0
    move-exception v1

    .line 167
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public setCachefile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    .line 106
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 229
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 230
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "<PropertiesfileCache:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 231
    const-string/jumbo v1, "cachefile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cachefile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 232
    const-string/jumbo v1, ";noOfEntries="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;->cache:Ljava/util/Properties;

    invoke-virtual {v2}, Ljava/util/Properties;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 233
    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
