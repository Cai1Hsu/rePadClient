package com.google.gson.internal.bind;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class TimeTypeAdapter extends TypeAdapter<Time> {
    public static final TypeAdapterFactory FACTORY = new AnonymousClass1();
    private final DateFormat format = new SimpleDateFormat("hh:mm:ss a");

    /* renamed from: com.google.gson.internal.bind.TimeTypeAdapter$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass1 implements TypeAdapterFactory {
        AnonymousClass1() {
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            if (typeToken.getRawType() == Time.class) {
                return new TimeTypeAdapter();
            }
            return null;
        }
    }

    @Override // com.google.gson.TypeAdapter
    public synchronized Time read(JsonReader in) throws IOException {
        Time time;
        if (in.peek() == JsonToken.NULL) {
            in.nextNull();
            time = null;
        } else {
            try {
                Date date = this.format.parse(in.nextString());
                time = new Time(date.getTime());
            } catch (ParseException e) {
                throw new JsonSyntaxException(e);
            }
        }
        return time;
    }

    public synchronized void write(JsonWriter out, Time value) throws IOException {
        out.value(value == null ? null : this.format.format((Date) value));
    }
}
