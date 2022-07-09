.class public Lorg/apache/tools/ant/types/selectors/SizeSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "SizeSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;,
        Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;
    }
.end annotation


# static fields
.field private static final END_POS:I = 0x24

.field private static final GIBI:J = 0x40000000L

.field private static final GIBI_POS:I = 0x16

.field private static final GIGA:J = 0x3b9aca00L

.field private static final GIGA_POS:I = 0x12

.field private static final KIBI:I = 0x400

.field private static final KIBI_POS:I = 0x4

.field private static final KILO:I = 0x3e8

.field private static final MEBI:I = 0x100000

.field private static final MEBI_POS:I = 0xd

.field private static final MEGA:I = 0xf4240

.field private static final MEGA_POS:I = 0x9

.field public static final SIZE_KEY:Ljava/lang/String; = "value"

.field private static final TEBI:J = 0x10000000000L

.field private static final TEBI_POS:I = 0x1f

.field private static final TERA:J = 0xe8d4a51000L

.field private static final TERA_POS:I = 0x1b

.field public static final UNITS_KEY:Ljava/lang/String; = "units"

.field public static final WHEN_KEY:Ljava/lang/String; = "when"


# instance fields
.field private multiplier:J

.field private size:J

.field private sizelimit:J

.field private when:Lorg/apache/tools/ant/types/Comparison;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    .line 68
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 59
    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->size:J

    .line 60
    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    .line 61
    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->sizelimit:J

    .line 62
    sget-object v0, Lorg/apache/tools/ant/types/Comparison;->EQUAL:Lorg/apache/tools/ant/types/Comparison;

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->when:Lorg/apache/tools/ant/types/Comparison;

    .line 69
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 6
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 226
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->validate()V

    .line 229
    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 230
    const/4 v2, 0x1

    .line 233
    :goto_0
    return v2

    .line 232
    :cond_0
    invoke-virtual {p3}, Ljava/io/File;->length()J

    move-result-wide v2

    iget-wide v4, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->sizelimit:J

    sub-long v0, v2, v4

    .line 233
    .local v0, "diff":J
    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->when:Lorg/apache/tools/ant/types/Comparison;

    const-wide/16 v4, 0x0

    cmp-long v2, v0, v4

    if-nez v2, :cond_1

    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/types/Comparison;->evaluate(I)Z

    move-result v2

    goto :goto_0

    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    div-long v4, v0, v4

    long-to-int v2, v4

    goto :goto_1
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 8
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 168
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 169
    if-eqz p1, :cond_3

    .line 170
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, p1

    if-ge v0, v5, :cond_3

    .line 171
    aget-object v5, p1, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v2

    .line 172
    .local v2, "paramname":Ljava/lang/String;
    const-string/jumbo v5, "value"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 174
    :try_start_0
    aget-object v5, p1, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setValue(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 175
    :catch_0
    move-exception v1

    .line 176
    .local v1, "nfe":Ljava/lang/NumberFormatException;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Invalid size setting "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    aget-object v6, p1, v0

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 179
    .end local v1    # "nfe":Ljava/lang/NumberFormatException;
    :cond_0
    const-string/jumbo v5, "units"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 180
    new-instance v4, Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;

    invoke-direct {v4}, Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;-><init>()V

    .line 181
    .local v4, "units":Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;
    aget-object v5, p1, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;->setValue(Ljava/lang/String;)V

    .line 182
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setUnits(Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;)V

    goto :goto_1

    .line 183
    .end local v4    # "units":Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;
    :cond_1
    const-string/jumbo v5, "when"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 184
    new-instance v3, Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;-><init>()V

    .line 185
    .local v3, "scmp":Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;
    aget-object v5, p1, v0

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;->setValue(Ljava/lang/String;)V

    .line 186
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setWhen(Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;)V

    goto :goto_1

    .line 188
    .end local v3    # "scmp":Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;
    :cond_2
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Invalid parameter "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 192
    .end local v0    # "i":I
    .end local v2    # "paramname":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method public setUnits(Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;)V
    .locals 6
    .param p1, "units"    # Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;

    .prologue
    const-wide/16 v4, 0x0

    .line 126
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/SizeSelector$ByteUnits;->getIndex()I

    move-result v0

    .line 127
    .local v0, "i":I
    iput-wide v4, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    .line 128
    const/4 v1, -0x1

    if-le v0, v1, :cond_2

    const/4 v1, 0x4

    if-ge v0, v1, :cond_2

    .line 129
    const-wide/16 v2, 0x3e8

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    .line 145
    :cond_0
    :goto_0
    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->size:J

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 146
    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->size:J

    iget-wide v4, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    mul-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->sizelimit:J

    .line 148
    :cond_1
    return-void

    .line 130
    :cond_2
    const/16 v1, 0x9

    if-ge v0, v1, :cond_3

    .line 131
    const-wide/16 v2, 0x400

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    goto :goto_0

    .line 132
    :cond_3
    const/16 v1, 0xd

    if-ge v0, v1, :cond_4

    .line 133
    const-wide/32 v2, 0xf4240

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    goto :goto_0

    .line 134
    :cond_4
    const/16 v1, 0x12

    if-ge v0, v1, :cond_5

    .line 135
    const-wide/32 v2, 0x100000

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    goto :goto_0

    .line 136
    :cond_5
    const/16 v1, 0x16

    if-ge v0, v1, :cond_6

    .line 137
    const-wide/32 v2, 0x3b9aca00

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    goto :goto_0

    .line 138
    :cond_6
    const/16 v1, 0x1b

    if-ge v0, v1, :cond_7

    .line 139
    const-wide/32 v2, 0x40000000

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    goto :goto_0

    .line 140
    :cond_7
    const/16 v1, 0x1f

    if-ge v0, v1, :cond_8

    .line 141
    const-wide v2, 0xe8d4a51000L

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    goto :goto_0

    .line 142
    :cond_8
    const/16 v1, 0x24

    if-ge v0, v1, :cond_0

    .line 143
    const-wide v2, 0x10000000000L

    iput-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    goto :goto_0
.end method

.method public setValue(J)V
    .locals 5
    .param p1, "size"    # J

    .prologue
    .line 93
    iput-wide p1, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->size:J

    .line 94
    iget-wide v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 95
    iget-wide v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    mul-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->sizelimit:J

    .line 97
    :cond_0
    return-void
.end method

.method public setWhen(Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;)V
    .locals 0
    .param p1, "when"    # Lorg/apache/tools/ant/types/selectors/SizeSelector$SizeComparisons;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->when:Lorg/apache/tools/ant/types/Comparison;

    .line 159
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 78
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{sizeselector value: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 79
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-wide v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->sizelimit:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 80
    const-string/jumbo v1, "compare: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->when:Lorg/apache/tools/ant/types/Comparison;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Comparison;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 81
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 205
    iget-wide v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->size:J

    cmp-long v0, v0, v4

    if-gez v0, :cond_1

    .line 206
    const-string/jumbo v0, "The value attribute is required, and must be positive"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setError(Ljava/lang/String;)V

    .line 212
    :cond_0
    :goto_0
    return-void

    .line 207
    :cond_1
    iget-wide v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->multiplier:J

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-gez v0, :cond_2

    .line 208
    const-string/jumbo v0, "Invalid Units supplied, must be K,Ki,M,Mi,G,Gi,T,or Ti"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setError(Ljava/lang/String;)V

    goto :goto_0

    .line 209
    :cond_2
    iget-wide v0, p0, Lorg/apache/tools/ant/types/selectors/SizeSelector;->sizelimit:J

    cmp-long v0, v0, v4

    if-gez v0, :cond_0

    .line 210
    const-string/jumbo v0, "Internal error: Code is not setting sizelimit correctly"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/SizeSelector;->setError(Ljava/lang/String;)V

    goto :goto_0
.end method
