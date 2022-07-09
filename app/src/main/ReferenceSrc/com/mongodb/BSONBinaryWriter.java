package com.mongodb;

import com.mongodb.BSONWriter;
import java.util.Stack;
import org.bson.io.OutputBuffer;
import org.bson.types.BSONTimestamp;
import org.bson.types.Binary;
import org.bson.types.ObjectId;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
class BSONBinaryWriter extends BSONWriter {
    private final BSONBinaryWriterSettings binaryWriterSettings;
    private final OutputBuffer buffer;
    private Mark mark;
    private final Stack<Integer> maxDocumentSizeStack;

    public BSONBinaryWriter(OutputBuffer buffer) {
        this(new BSONWriterSettings(), new BSONBinaryWriterSettings(), buffer);
    }

    public BSONBinaryWriter(BSONWriterSettings settings, BSONBinaryWriterSettings binaryWriterSettings, OutputBuffer buffer) {
        super(settings);
        this.maxDocumentSizeStack = new Stack<>();
        this.binaryWriterSettings = binaryWriterSettings;
        this.buffer = buffer;
        this.maxDocumentSizeStack.push(Integer.valueOf(binaryWriterSettings.getMaxDocumentSize()));
    }

    @Override // com.mongodb.BSONWriter, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        super.close();
    }

    public OutputBuffer getBuffer() {
        return this.buffer;
    }

    @Override // com.mongodb.BSONWriter
    public void flush() {
    }

    @Override // com.mongodb.BSONWriter
    public Context getContext() {
        return (Context) super.getContext();
    }

    @Override // com.mongodb.BSONWriter
    public void writeBinaryData(Binary binary) {
        checkPreconditions("writeBinaryData", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.BINARY.getValue());
        writeCurrentName();
        int totalLen = binary.length();
        if (binary.getType() == BSONBinarySubType.OldBinary.getValue()) {
            totalLen += 4;
        }
        this.buffer.writeInt(totalLen);
        this.buffer.write(binary.getType());
        if (binary.getType() == BSONBinarySubType.OldBinary.getValue()) {
            this.buffer.writeInt(totalLen - 4);
        }
        this.buffer.write(binary.getData());
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeBoolean(boolean value) {
        int i = 1;
        checkPreconditions("writeBoolean", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.BOOLEAN.getValue());
        writeCurrentName();
        OutputBuffer outputBuffer = this.buffer;
        if (!value) {
            i = 0;
        }
        outputBuffer.write(i);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeDateTime(long value) {
        checkPreconditions("writeDateTime", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.DATE_TIME.getValue());
        writeCurrentName();
        this.buffer.writeLong(value);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeDouble(double value) {
        checkPreconditions("writeDouble", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.DOUBLE.getValue());
        writeCurrentName();
        this.buffer.writeDouble(value);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeInt32(int value) {
        checkPreconditions("writeInt32", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.INT32.getValue());
        writeCurrentName();
        this.buffer.writeInt(value);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeInt64(long value) {
        checkPreconditions("writeInt64", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.INT64.getValue());
        writeCurrentName();
        this.buffer.writeLong(value);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeJavaScript(String code) {
        checkPreconditions("writeJavaScript", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.JAVASCRIPT.getValue());
        writeCurrentName();
        this.buffer.writeString(code);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeJavaScriptWithScope(String code) {
        checkPreconditions("writeJavaScriptWithScope", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.JAVASCRIPT_WITH_SCOPE.getValue());
        writeCurrentName();
        setContext(new Context(getContext(), BSONContextType.JAVASCRIPT_WITH_SCOPE, this.buffer.getPosition()));
        this.buffer.writeInt(0);
        this.buffer.writeString(code);
        setState(BSONWriter.State.SCOPE_DOCUMENT);
    }

    @Override // com.mongodb.BSONWriter
    public void writeMaxKey() {
        checkPreconditions("writeMaxKey", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.MAX_KEY.getValue());
        writeCurrentName();
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeMinKey() {
        checkPreconditions("writeMinKey", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.MIN_KEY.getValue());
        writeCurrentName();
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeNull() {
        checkPreconditions("writeNull", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.NULL.getValue());
        writeCurrentName();
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeObjectId(ObjectId objectId) {
        checkPreconditions("writeObjectId", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.OBJECT_ID.getValue());
        writeCurrentName();
        this.buffer.write(objectId.toByteArray());
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeString(String value) {
        checkPreconditions("writeString", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.STRING.getValue());
        writeCurrentName();
        this.buffer.writeString(value);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeSymbol(String value) {
        checkPreconditions("writeSymbol", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.SYMBOL.getValue());
        writeCurrentName();
        this.buffer.writeString(value);
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeTimestamp(BSONTimestamp value) {
        checkPreconditions("writeTimestamp", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.TIMESTAMP.getValue());
        writeCurrentName();
        this.buffer.writeInt(value.getInc());
        this.buffer.writeInt(value.getTime());
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeUndefined() {
        checkPreconditions("writeUndefined", BSONWriter.State.VALUE);
        this.buffer.write(BSONType.UNDEFINED.getValue());
        writeCurrentName();
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeStartArray() {
        checkPreconditions("writeStartArray", BSONWriter.State.VALUE);
        super.writeStartArray();
        this.buffer.write(BSONType.ARRAY.getValue());
        writeCurrentName();
        setContext(new Context(getContext(), BSONContextType.ARRAY, this.buffer.getPosition()));
        this.buffer.writeInt(0);
        setState(BSONWriter.State.VALUE);
    }

    @Override // com.mongodb.BSONWriter
    public void writeStartDocument() {
        checkPreconditions("writeStartDocument", BSONWriter.State.INITIAL, BSONWriter.State.VALUE, BSONWriter.State.SCOPE_DOCUMENT, BSONWriter.State.DONE);
        super.writeStartDocument();
        if (getState() == BSONWriter.State.VALUE) {
            this.buffer.write(BSONType.DOCUMENT.getValue());
            writeCurrentName();
        }
        setContext(new Context(getContext(), BSONContextType.DOCUMENT, this.buffer.getPosition()));
        this.buffer.writeInt(0);
        setState(BSONWriter.State.NAME);
    }

    @Override // com.mongodb.BSONWriter
    public void writeEndArray() {
        checkPreconditions("writeEndArray", BSONWriter.State.VALUE);
        if (getContext().getContextType() != BSONContextType.ARRAY) {
            throwInvalidContextType("WriteEndArray", getContext().getContextType(), BSONContextType.ARRAY);
        }
        super.writeEndArray();
        this.buffer.write(0);
        backpatchSize();
        setContext(getContext().getParentContext());
        setState(getNextState());
    }

    @Override // com.mongodb.BSONWriter
    public void writeEndDocument() {
        checkPreconditions("writeEndDocument", BSONWriter.State.NAME);
        BSONContextType contextType = getContext().getContextType();
        if (contextType != BSONContextType.DOCUMENT && contextType != BSONContextType.SCOPE_DOCUMENT) {
            throwInvalidContextType("WriteEndDocument", contextType, BSONContextType.DOCUMENT, BSONContextType.SCOPE_DOCUMENT);
        }
        super.writeEndDocument();
        this.buffer.write(0);
        backpatchSize();
        setContext(getContext().getParentContext());
        if (getContext() == null) {
            setState(BSONWriter.State.DONE);
            return;
        }
        if (getContext().getContextType() == BSONContextType.JAVASCRIPT_WITH_SCOPE) {
            backpatchSize();
            setContext(getContext().getParentContext());
        }
        setState(getNextState());
    }

    public void encodeDocument(DBEncoder encoder, DBObject dbObject) {
        boolean z = true;
        checkPreconditions("writeStartDocument", BSONWriter.State.INITIAL, BSONWriter.State.VALUE, BSONWriter.State.SCOPE_DOCUMENT, BSONWriter.State.DONE);
        Assertions.isTrue("state is VALUE", getState() == BSONWriter.State.VALUE);
        Assertions.isTrue("context not null", getContext() != null);
        if (getContext().getContextType() == BSONContextType.JAVASCRIPT_WITH_SCOPE) {
            z = false;
        }
        Assertions.isTrue("context is not JAVASCRIPT_WITH_SCOPE", z);
        this.buffer.write(BSONType.DOCUMENT.getValue());
        writeCurrentName();
        int startPos = this.buffer.getPosition();
        encoder.writeObject(this.buffer, dbObject);
        throwIfSizeExceedsLimit(this.buffer.getPosition() - startPos);
        setState(getNextState());
    }

    public void pushMaxDocumentSize(int maxDocumentSize) {
        this.maxDocumentSizeStack.push(Integer.valueOf(maxDocumentSize));
    }

    public void popMaxDocumentSize() {
        this.maxDocumentSizeStack.pop();
    }

    public void mark() {
        this.mark = new Mark();
    }

    public void reset() {
        if (this.mark == null) {
            throw new IllegalStateException("Can not reset without first marking");
        }
        this.mark.reset();
        this.mark = null;
    }

    private void writeCurrentName() {
        if (getContext().getContextType() == BSONContextType.ARRAY) {
            this.buffer.writeCString(Integer.toString(Context.access$008(getContext())));
        } else {
            this.buffer.writeCString(getName());
        }
    }

    private void backpatchSize() {
        int size = this.buffer.getPosition() - getContext().startPosition;
        throwIfSizeExceedsLimit(size);
        this.buffer.backpatchSize(size);
    }

    private void throwIfSizeExceedsLimit(int size) {
        if (size > this.maxDocumentSizeStack.peek().intValue()) {
            String message = String.format("Size %d is larger than MaxDocumentSize %d.", Integer.valueOf(this.buffer.getPosition() - getContext().startPosition), Integer.valueOf(this.binaryWriterSettings.getMaxDocumentSize()));
            throw new MongoInternalException(message);
        }
    }

    /* loaded from: classes.dex */
    class Context extends BSONWriter.Context {
        private int index;
        private final int startPosition;

        static /* synthetic */ int access$008(Context x0) {
            int i = x0.index;
            x0.index = i + 1;
            return i;
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Context(Context parentContext, BSONContextType contextType, int startPosition) {
            super(parentContext, contextType);
            BSONBinaryWriter.this = r1;
            this.startPosition = startPosition;
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Context(Context from) {
            super(from);
            BSONBinaryWriter.this = r2;
            this.startPosition = from.startPosition;
            this.index = from.index;
        }

        @Override // com.mongodb.BSONWriter.Context
        public Context getParentContext() {
            return (Context) super.getParentContext();
        }

        @Override // com.mongodb.BSONWriter.Context
        public Context copy() {
            return new Context(this);
        }
    }

    /* loaded from: classes.dex */
    class Mark extends BSONWriter.Mark {
        private final int position;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        protected Mark() {
            super();
            BSONBinaryWriter.this = r2;
            this.position = r2.buffer.getPosition();
        }

        @Override // com.mongodb.BSONWriter.Mark
        protected void reset() {
            super.reset();
            BSONBinaryWriter.this.buffer.truncateToPosition(BSONBinaryWriter.this.mark.position);
        }
    }
}
