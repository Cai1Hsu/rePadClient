package org.bson.types;

import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import java.io.Serializable;
import java.lang.management.ManagementFactory;
import java.net.NetworkInterface;
import java.nio.ByteBuffer;
import java.util.Date;
import java.util.Enumeration;
import java.util.Random;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;

/* loaded from: classes.jar:org/bson/types/ObjectId.class */
public class ObjectId implements Comparable<ObjectId>, Serializable {
    private static final int _genmachine;
    private static final long serialVersionUID = -4415279469780082174L;
    final int _inc;
    final int _machine;
    boolean _new;
    final int _time;
    static final Logger LOGGER = Logger.getLogger("org.bson.ObjectId");
    private static AtomicInteger _nextInc = new AtomicInteger(new Random().nextInt());

    static {
        try {
            StringBuilder sb = new StringBuilder();
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                sb.append(networkInterfaces.nextElement().toString());
            }
            int hashCode = sb.toString().hashCode() << 16;
            LOGGER.fine("machine piece post: " + Integer.toHexString(hashCode));
            int nextInt = new Random().nextInt();
            try {
                nextInt = ManagementFactory.getRuntimeMXBean().getName().hashCode();
            } catch (Throwable th) {
            }
            ClassLoader classLoader = ObjectId.class.getClassLoader();
            int identityHashCode = classLoader != null ? System.identityHashCode(classLoader) : 0;
            int hashCode2 = (Integer.toHexString(nextInt) + Integer.toHexString(identityHashCode)).hashCode() & 65535;
            LOGGER.fine(new StringBuilder().append("process piece: ").append(Integer.toHexString(hashCode2)).toString());
            _genmachine = hashCode | hashCode2;
            LOGGER.fine(new StringBuilder().append("machine : ").append(Integer.toHexString(_genmachine)).toString());
        }
    }

    public ObjectId() {
        this._time = (int) (System.currentTimeMillis() / 1000);
        this._machine = _genmachine;
        this._inc = _nextInc.getAndIncrement();
        this._new = true;
    }

    @Deprecated
    public ObjectId(int i, int i2, int i3) {
        this._time = i;
        this._machine = i2;
        this._inc = i3;
        this._new = false;
    }

    public ObjectId(String str) {
        this(str, false);
    }

    @Deprecated
    public ObjectId(String str, boolean z) {
        if (!isValid(str)) {
            throw new IllegalArgumentException("invalid ObjectId [" + str + "]");
        }
        String babbleToMongod = z ? babbleToMongod(str) : str;
        byte[] bArr = new byte[12];
        for (int i = 0; i < bArr.length; i++) {
            bArr[i] = (byte) Integer.parseInt(babbleToMongod.substring(i * 2, (i * 2) + 2), 16);
        }
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        this._time = wrap.getInt();
        this._machine = wrap.getInt();
        this._inc = wrap.getInt();
        this._new = false;
    }

    public ObjectId(Date date) {
        this(date, _genmachine, _nextInc.getAndIncrement());
    }

    public ObjectId(Date date, int i) {
        this(date, _genmachine, i);
    }

    @Deprecated
    public ObjectId(Date date, int i, int i2) {
        this._time = (int) (date.getTime() / 1000);
        this._machine = i;
        this._inc = i2;
        this._new = false;
    }

    public ObjectId(byte[] bArr) {
        if (bArr.length != 12) {
            throw new IllegalArgumentException("need 12 bytes");
        }
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        this._time = wrap.getInt();
        this._machine = wrap.getInt();
        this._inc = wrap.getInt();
        this._new = false;
    }

    @Deprecated
    public static int _flip(int i) {
        return 0 | ((i << 24) & ViewCompat.MEASURED_STATE_MASK) | ((i << 8) & 16711680) | ((i >> 8) & MotionEventCompat.ACTION_POINTER_INDEX_MASK) | ((i >> 24) & 255);
    }

    static String _pos(String str, int i) {
        return str.substring(i * 2, (i * 2) + 2);
    }

    @Deprecated
    public static String babbleToMongod(String str) {
        if (!isValid(str)) {
            throw new IllegalArgumentException("invalid object id: " + str);
        }
        StringBuilder sb = new StringBuilder(24);
        for (int i = 7; i >= 0; i--) {
            sb.append(_pos(str, i));
        }
        for (int i2 = 11; i2 >= 8; i2--) {
            sb.append(_pos(str, i2));
        }
        return sb.toString();
    }

    public static ObjectId createFromLegacyFormat(int i, int i2, int i3) {
        return new ObjectId(i, i2, i3);
    }

    public static ObjectId get() {
        return new ObjectId();
    }

    public static int getCurrentCounter() {
        return _nextInc.get();
    }

    @Deprecated
    public static int getCurrentInc() {
        return _nextInc.get();
    }

    @Deprecated
    public static int getGenMachineId() {
        return _genmachine;
    }

    public static boolean isValid(String str) {
        boolean z;
        if (str == null) {
            z = false;
        } else {
            int length = str.length();
            z = false;
            if (length == 24) {
                int i = 0;
                while (true) {
                    if (i >= length) {
                        z = true;
                        break;
                    }
                    char charAt = str.charAt(i);
                    if ((charAt < '0' || charAt > '9') && (charAt < 'a' || charAt > 'f')) {
                        z = false;
                        if (charAt < 'A') {
                            break;
                        }
                        z = false;
                        if (charAt > 'F') {
                            break;
                        }
                    }
                    i++;
                }
            }
        }
        return z;
    }

    @Deprecated
    public static ObjectId massageToObjectId(Object obj) {
        ObjectId objectId;
        if (obj == null) {
            objectId = null;
        } else if (obj instanceof ObjectId) {
            objectId = (ObjectId) obj;
        } else {
            if (obj instanceof String) {
                String obj2 = obj.toString();
                if (isValid(obj2)) {
                    objectId = new ObjectId(obj2);
                }
            }
            objectId = null;
        }
        return objectId;
    }

    int _compareUnsigned(int i, int i2) {
        long j = (4294967295L & i) - (4294967295L & i2);
        return j < -2147483648L ? Integer.MIN_VALUE : j > 2147483647L ? Integer.MAX_VALUE : (int) j;
    }

    @Deprecated
    public int _inc() {
        return this._inc;
    }

    @Deprecated
    public int _machine() {
        return this._machine;
    }

    @Deprecated
    public int _time() {
        return this._time;
    }

    public int compareTo(ObjectId objectId) {
        int i;
        if (objectId == null) {
            i = -1;
        } else {
            int _compareUnsigned = _compareUnsigned(this._time, objectId._time);
            i = _compareUnsigned;
            if (_compareUnsigned == 0) {
                int _compareUnsigned2 = _compareUnsigned(this._machine, objectId._machine);
                i = _compareUnsigned2;
                if (_compareUnsigned2 == 0) {
                    i = _compareUnsigned(this._inc, objectId._inc);
                }
            }
        }
        return i;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            ObjectId massageToObjectId = massageToObjectId(obj);
            if (massageToObjectId == null) {
                z = false;
            } else if (this._time != massageToObjectId._time || this._machine != massageToObjectId._machine || this._inc != massageToObjectId._inc) {
                z = false;
            }
        }
        return z;
    }

    public Date getDate() {
        return new Date(this._time * 1000);
    }

    @Deprecated
    public int getInc() {
        return this._inc;
    }

    @Deprecated
    public int getMachine() {
        return this._machine;
    }

    @Deprecated
    public long getTime() {
        return this._time * 1000;
    }

    @Deprecated
    public int getTimeSecond() {
        return this._time;
    }

    public int getTimestamp() {
        return this._time;
    }

    public int hashCode() {
        return this._time + (this._machine * 111) + (this._inc * 17);
    }

    @Deprecated
    public boolean isNew() {
        return this._new;
    }

    @Deprecated
    public void notNew() {
        this._new = false;
    }

    public byte[] toByteArray() {
        byte[] bArr = new byte[12];
        ByteBuffer wrap = ByteBuffer.wrap(bArr);
        wrap.putInt(this._time);
        wrap.putInt(this._machine);
        wrap.putInt(this._inc);
        return bArr;
    }

    public String toHexString() {
        StringBuilder sb = new StringBuilder(24);
        byte[] byteArray = toByteArray();
        int length = byteArray.length;
        for (int i = 0; i < length; i++) {
            sb.append(String.format("%02x", Integer.valueOf(byteArray[i] & 255)));
        }
        return sb.toString();
    }

    public String toString() {
        return toStringMongod();
    }

    @Deprecated
    public String toStringBabble() {
        return babbleToMongod(toStringMongod());
    }

    @Deprecated
    public String toStringMongod() {
        byte[] byteArray = toByteArray();
        StringBuilder sb = new StringBuilder(24);
        for (byte b : byteArray) {
            String hexString = Integer.toHexString(b & 255);
            if (hexString.length() == 1) {
                sb.append("0");
            }
            sb.append(hexString);
        }
        return sb.toString();
    }
}
