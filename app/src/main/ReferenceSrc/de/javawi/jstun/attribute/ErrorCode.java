package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.nntp.NNTPReply;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:de/javawi/jstun/attribute/ErrorCode.class */
public class ErrorCode extends MessageAttribute {
    String reason;
    int responseCode;

    public ErrorCode() {
        super(MessageAttributeInterface.MessageAttributeType.ErrorCode);
    }

    public static ErrorCode parse(byte[] bArr) throws MessageAttributeParsingException {
        try {
            if (bArr.length < 4) {
                throw new MessageAttributeParsingException("Data array too short");
            }
            int oneByteToInteger = Utility.oneByteToInteger(bArr[3]);
            if (oneByteToInteger < 1 || oneByteToInteger > 6) {
                throw new MessageAttributeParsingException("Class parsing error");
            }
            int oneByteToInteger2 = Utility.oneByteToInteger(bArr[4]);
            if (oneByteToInteger2 < 0 || oneByteToInteger2 > 99) {
                throw new MessageAttributeParsingException("Number parsing error");
            }
            ErrorCode errorCode = new ErrorCode();
            errorCode.setResponseCode((oneByteToInteger * 100) + oneByteToInteger2);
            return errorCode;
        } catch (MessageAttributeException e) {
            throw new MessageAttributeParsingException("Parsing error");
        } catch (UtilityException e2) {
            throw new MessageAttributeParsingException("Parsing error");
        }
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() throws UtilityException {
        int length = this.reason.length();
        int i = length;
        if (length % 4 != 0) {
            i = length + (4 - (length % 4));
        }
        int i2 = i + 4;
        byte[] bArr = new byte[i2];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(i2 - 4), 0, bArr, 2, 2);
        bArr[6] = Utility.integerToOneByte((int) Math.floor(this.responseCode / 100.0d));
        bArr[7] = Utility.integerToOneByte(this.responseCode % 100);
        byte[] bytes = this.reason.getBytes();
        System.arraycopy(bytes, 0, bArr, 8, bytes.length);
        return bArr;
    }

    public String getReason() {
        return this.reason;
    }

    public int getResponseCode() {
        return this.responseCode;
    }

    public void setResponseCode(int i) throws MessageAttributeException {
        switch (i) {
            case 400:
                this.reason = "Bad Request";
                break;
            case HttpStatus.SC_UNAUTHORIZED /* 401 */:
                this.reason = "Unauthorized";
                break;
            case 420:
                this.reason = "Unkown Attribute";
                break;
            case NNTPReply.NO_SUCH_ARTICLE_FOUND /* 430 */:
                this.reason = "Stale Credentials";
                break;
            case FTPReply.UNAVAILABLE_RESOURCE /* 431 */:
                this.reason = "Integrity Check Failure";
                break;
            case 432:
                this.reason = "Missing Username";
                break;
            case 433:
                this.reason = "Use TLS";
                break;
            case 500:
                this.reason = "Server Error";
                break;
            case 600:
                this.reason = "Global Failure";
                break;
            default:
                throw new MessageAttributeException("Response Code is not valid");
        }
        this.responseCode = i;
    }
}
