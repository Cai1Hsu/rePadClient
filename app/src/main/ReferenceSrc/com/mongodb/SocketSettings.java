package com.mongodb;

import java.util.concurrent.TimeUnit;
import javax.net.SocketFactory;
import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class SocketSettings {
    private final long connectTimeoutMS;
    private final long readTimeoutMS;
    private final SocketFactory socketFactory;

    public static Builder builder() {
        return new Builder();
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class Builder {
        private long connectTimeoutMS;
        private long readTimeoutMS;
        private SocketFactory socketFactory = SocketFactory.getDefault();

        Builder() {
        }

        static /* synthetic */ long access$000(Builder x0) {
            return x0.connectTimeoutMS;
        }

        static /* synthetic */ long access$100(Builder x0) {
            return x0.readTimeoutMS;
        }

        static /* synthetic */ SocketFactory access$200(Builder x0) {
            return x0.socketFactory;
        }

        public Builder connectTimeout(int connectTimeout, TimeUnit timeUnit) {
            this.connectTimeoutMS = TimeUnit.MILLISECONDS.convert(connectTimeout, timeUnit);
            return this;
        }

        public Builder readTimeout(int readTimeout, TimeUnit timeUnit) {
            this.readTimeoutMS = TimeUnit.MILLISECONDS.convert(readTimeout, timeUnit);
            return this;
        }

        public Builder socketFactory(SocketFactory socketFactory) {
            this.socketFactory = (SocketFactory) Assertions.notNull("socketFactory", socketFactory);
            return this;
        }

        public SocketSettings build() {
            return new SocketSettings(this);
        }
    }

    public int getConnectTimeout(TimeUnit timeUnit) {
        return (int) timeUnit.convert(this.connectTimeoutMS, TimeUnit.MILLISECONDS);
    }

    public int getReadTimeout(TimeUnit timeUnit) {
        return (int) timeUnit.convert(this.readTimeoutMS, TimeUnit.MILLISECONDS);
    }

    public SocketFactory getSocketFactory() {
        return this.socketFactory;
    }

    SocketSettings(Builder builder) {
        this.connectTimeoutMS = Builder.access$000(builder);
        this.readTimeoutMS = Builder.access$100(builder);
        this.socketFactory = Builder.access$200(builder);
    }
}
