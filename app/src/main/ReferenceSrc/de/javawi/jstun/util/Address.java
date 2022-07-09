package de.javawi.jstun.util;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.StringTokenizer;

/* loaded from: classes.jar:de/javawi/jstun/util/Address.class */
public class Address {
    int firstOctet;
    int fourthOctet;
    int secondOctet;
    int thirdOctet;

    public Address(int i, int i2, int i3, int i4) throws UtilityException {
        if (i < 0 || i > 255 || i2 < 0 || i2 > 255 || i3 < 0 || i3 > 255 || i4 < 0 || i4 > 255) {
            throw new UtilityException("Address is malformed.");
        }
        this.firstOctet = i;
        this.secondOctet = i2;
        this.thirdOctet = i3;
        this.fourthOctet = i4;
    }

    public Address(String str) throws UtilityException {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ".");
        if (stringTokenizer.countTokens() != 4) {
            throw new UtilityException("4 octets in address string are required.");
        }
        int i = 0;
        while (stringTokenizer.hasMoreTokens()) {
            int parseInt = Integer.parseInt(stringTokenizer.nextToken());
            if (parseInt >= 0 && parseInt <= 255) {
                switch (i) {
                    case 0:
                        this.firstOctet = parseInt;
                        i++;
                        break;
                    case 1:
                        this.secondOctet = parseInt;
                        i++;
                        break;
                    case 2:
                        this.thirdOctet = parseInt;
                        i++;
                        break;
                    case 3:
                        this.fourthOctet = parseInt;
                        i++;
                        break;
                }
            } else {
                throw new UtilityException("Address is in incorrect format.");
            }
        }
    }

    public Address(byte[] bArr) throws UtilityException {
        if (bArr.length < 4) {
            throw new UtilityException("4 bytes are required.");
        }
        this.firstOctet = Utility.oneByteToInteger(bArr[0]);
        this.secondOctet = Utility.oneByteToInteger(bArr[1]);
        this.thirdOctet = Utility.oneByteToInteger(bArr[2]);
        this.fourthOctet = Utility.oneByteToInteger(bArr[3]);
    }

    public boolean equals(Object obj) {
        boolean z;
        if (obj == null) {
            z = false;
        } else {
            try {
                byte[] bytes = getBytes();
                byte[] bytes2 = ((Address) obj).getBytes();
                z = false;
                if (bytes[0] == bytes2[0]) {
                    z = false;
                    if (bytes[1] == bytes2[1]) {
                        z = false;
                        if (bytes[2] == bytes2[2]) {
                            z = false;
                            if (bytes[3] == bytes2[3]) {
                                z = true;
                            }
                        }
                    }
                }
            } catch (UtilityException e) {
                z = false;
            }
        }
        return z;
    }

    public byte[] getBytes() throws UtilityException {
        return new byte[]{Utility.integerToOneByte(this.firstOctet), Utility.integerToOneByte(this.secondOctet), Utility.integerToOneByte(this.thirdOctet), Utility.integerToOneByte(this.fourthOctet)};
    }

    public InetAddress getInetAddress() throws UtilityException, UnknownHostException {
        return InetAddress.getByAddress(new byte[]{Utility.integerToOneByte(this.firstOctet), Utility.integerToOneByte(this.secondOctet), Utility.integerToOneByte(this.thirdOctet), Utility.integerToOneByte(this.fourthOctet)});
    }

    public int hashCode() {
        return (this.firstOctet << 24) + (this.secondOctet << 16) + (this.thirdOctet << 8) + this.fourthOctet;
    }

    public String toString() {
        return this.firstOctet + "." + this.secondOctet + "." + this.thirdOctet + "." + this.fourthOctet;
    }
}
