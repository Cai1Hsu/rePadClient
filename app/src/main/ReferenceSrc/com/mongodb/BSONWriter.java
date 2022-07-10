package com.mongodb;

import java.io.Closeable;
import java.util.Arrays;
import org.bson.BSONException;
import org.bson.types.BSONTimestamp;
import org.bson.types.Binary;
import org.bson.types.ObjectId;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class BSONWriter implements Closeable {
    private boolean closed;
    private Context context;
    private String currentName;
    private int serializationDepth;
    private final BSONWriterSettings settings;
    private State state = State.INITIAL;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    enum State {
        INITIAL,
        NAME,
        VALUE,
        SCOPE_DOCUMENT,
        DONE,
        CLOSED
    }

    public abstract void flush();

    public abstract void writeBinaryData(Binary binary);

    public abstract void writeBoolean(boolean z);

    public abstract void writeDateTime(long j);

    public abstract void writeDouble(double d);

    public abstract void writeInt32(int i);

    public abstract void writeInt64(long j);

    public abstract void writeJavaScript(String str);

    public abstract void writeJavaScriptWithScope(String str);

    public abstract void writeMaxKey();

    public abstract void writeMinKey();

    public abstract void writeNull();

    public abstract void writeObjectId(ObjectId objectId);

    public abstract void writeString(String str);

    public abstract void writeSymbol(String str);

    public abstract void writeTimestamp(BSONTimestamp bSONTimestamp);

    public abstract void writeUndefined();

    static /* synthetic */ Context access$000(BSONWriter x0) {
        return x0.context;
    }

    static /* synthetic */ State access$100(BSONWriter x0) {
        return x0.state;
    }

    static /* synthetic */ String access$200(BSONWriter x0) {
        return x0.currentName;
    }

    static /* synthetic */ String access$202(BSONWriter x0, String x1) {
        x0.currentName = x1;
        return x1;
    }

    static /* synthetic */ int access$300(BSONWriter x0) {
        return x0.serializationDepth;
    }

    static /* synthetic */ int access$302(BSONWriter x0, int x1) {
        x0.serializationDepth = x1;
        return x1;
    }

    public BSONWriter(BSONWriterSettings settings) {
        this.settings = settings;
    }

    public String getName() {
        return this.currentName;
    }

    protected boolean isClosed() {
        return this.closed;
    }

    public void setState(State state) {
        this.state = state;
    }

    public State getState() {
        return this.state;
    }

    public Context getContext() {
        return this.context;
    }

    public void setContext(Context context) {
        this.context = context;
    }

    public void writeBinaryData(String name, Binary binary) {
        writeName(name);
        writeBinaryData(binary);
    }

    public void writeBoolean(String name, boolean value) {
        writeName(name);
        writeBoolean(value);
    }

    public void writeDateTime(String name, long value) {
        writeName(name);
        writeDateTime(value);
    }

    public void writeDouble(String name, double value) {
        writeName(name);
        writeDouble(value);
    }

    public void writeEndArray() {
        this.serializationDepth--;
    }

    public void writeEndDocument() {
        this.serializationDepth--;
    }

    public void writeInt32(String name, int value) {
        writeName(name);
        writeInt32(value);
    }

    public void writeInt64(String name, long value) {
        writeName(name);
        writeInt64(value);
    }

    public void writeJavaScript(String name, String code) {
        writeName(name);
        writeJavaScript(code);
    }

    public void writeJavaScriptWithScope(String name, String code) {
        writeName(name);
        writeJavaScriptWithScope(code);
    }

    public void writeMaxKey(String name) {
        writeName(name);
        writeMaxKey();
    }

    public void writeMinKey(String name) {
        writeName(name);
        writeMinKey();
    }

    public void writeName(String name) {
        if (this.state != State.NAME) {
            throwInvalidState("WriteName", State.NAME);
        }
        this.currentName = name;
        this.state = State.VALUE;
    }

    public void writeNull(String name) {
        writeName(name);
        writeNull();
    }

    public void writeObjectId(String name, ObjectId objectId) {
        writeName(name);
        writeObjectId(objectId);
    }

    public void writeStartArray() {
        this.serializationDepth++;
        if (this.serializationDepth > this.settings.getMaxSerializationDepth()) {
            throw new BSONException("Maximum serialization depth exceeded (does the object being serialized have a circular reference?).");
        }
    }

    public void writeStartArray(String name) {
        writeName(name);
        writeStartArray();
    }

    public void writeStartDocument() {
        this.serializationDepth++;
        if (this.serializationDepth > this.settings.getMaxSerializationDepth()) {
            throw new BSONException("Maximum serialization depth exceeded (does the object being serialized have a circular reference?).");
        }
    }

    public void writeStartDocument(String name) {
        writeName(name);
        writeStartDocument();
    }

    public void writeString(String name, String value) {
        writeName(name);
        writeString(value);
    }

    public void writeSymbol(String name, String value) {
        writeName(name);
        writeSymbol(value);
    }

    public void writeTimestamp(String name, BSONTimestamp value) {
        writeName(name);
        writeTimestamp(value);
    }

    public void writeUndefined(String name) {
        writeName(name);
        writeUndefined();
    }

    public State getNextState() {
        return getContext().getContextType() == BSONContextType.ARRAY ? State.VALUE : State.NAME;
    }

    protected boolean checkState(State[] validStates) {
        for (State cur : validStates) {
            if (cur == getState()) {
                return true;
            }
        }
        return false;
    }

    public void checkPreconditions(String methodName, State... validStates) {
        if (isClosed()) {
            throw new IllegalStateException("BSONWriter");
        }
        if (!checkState(validStates)) {
            throwInvalidState(methodName, validStates);
        }
    }

    public void throwInvalidContextType(String methodName, BSONContextType actualContextType, BSONContextType... validContextTypes) {
        String validContextTypesString = StringUtils.join(" or ", Arrays.asList(validContextTypes));
        String message = String.format("%s can only be called when ContextType is %s, not when ContextType is %s.", methodName, validContextTypesString, actualContextType);
        throw new BSONException(message);
    }

    protected void throwInvalidState(String methodName, State... validStates) {
        if ((this.state == State.INITIAL || this.state == State.SCOPE_DOCUMENT || this.state == State.DONE) && !methodName.startsWith("end") && !methodName.equals("writeName")) {
            String typeName = methodName.substring(5);
            if (typeName.startsWith("start")) {
                typeName = typeName.substring(5);
            }
            String article = "A";
            if (Arrays.asList('A', 'E', 'I', 'O', 'U').contains(Character.valueOf(typeName.charAt(0)))) {
                article = "An";
            }
            String message = String.format("%s %s value cannot be written to the root level of a BSON document.", article, typeName);
            throw new BSONException(message);
        }
        String validStatesString = StringUtils.join(" or ", Arrays.asList(validStates));
        String message2 = String.format("%s can only be called when State is %s, not when State is %s", methodName, validStatesString, this.state);
        throw new BSONException(message2);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.closed = true;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class Context {
        private final BSONContextType contextType;
        private final Context parentContext;

        public Context(Context from) {
            BSONWriter.this = r2;
            this.parentContext = from.parentContext;
            this.contextType = from.contextType;
        }

        public Context(Context parentContext, BSONContextType contextType) {
            BSONWriter.this = r1;
            this.parentContext = parentContext;
            this.contextType = contextType;
        }

        public Context getParentContext() {
            return this.parentContext;
        }

        public BSONContextType getContextType() {
            return this.contextType;
        }

        public Context copy() {
            return new Context(this);
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class Mark {
        private final String currentName;
        private final Context markedContext;
        private final State markedState;
        private final int serializationDepth;

        public Mark() {
            BSONWriter.this = r2;
            this.markedContext = BSONWriter.access$000(r2).copy();
            this.markedState = BSONWriter.access$100(r2);
            this.currentName = BSONWriter.access$200(r2);
            this.serializationDepth = BSONWriter.access$300(r2);
        }

        public void reset() {
            BSONWriter.this.setContext(this.markedContext);
            BSONWriter.this.setState(this.markedState);
            BSONWriter.access$202(BSONWriter.this, this.currentName);
            BSONWriter.access$302(BSONWriter.this, this.serializationDepth);
        }
    }
}
