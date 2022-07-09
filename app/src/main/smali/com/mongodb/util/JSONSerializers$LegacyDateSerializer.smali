.class Lcom/mongodb/util/JSONSerializers$LegacyDateSerializer;
.super Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LegacyDateSerializer"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 208
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 209
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 213
    move-object v0, p1

    check-cast v0, Ljava/util/Date;

    .line 214
    .local v0, "d":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 216
    .local v1, "format":Ljava/text/SimpleDateFormat;
    new-instance v2, Ljava/util/GregorianCalendar;

    new-instance v3, Ljava/util/SimpleTimeZone;

    const/4 v4, 0x0

    const-string/jumbo v5, "GMT"

    invoke-direct {v3, v4, v5}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setCalendar(Ljava/util/Calendar;)V

    .line 218
    iget-object v2, p0, Lcom/mongodb/util/JSONSerializers$LegacyDateSerializer;->serializer:Lcom/mongodb/util/ObjectSerializer;

    new-instance v3, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v4, "$date"

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v3, p2}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 221
    return-void
.end method
