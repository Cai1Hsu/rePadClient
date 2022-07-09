package de.javawi.jstun.attribute;

/* loaded from: classes.jar:de/javawi/jstun/attribute/MessageAttributeInterface.class */
public interface MessageAttributeInterface {
    public static final int CHANGEDADDRESS = 5;
    public static final int CHANGEREQUEST = 3;
    public static final int DUMMY = 0;
    public static final int ERRORCODE = 9;
    public static final int MAPPEDADDRESS = 1;
    public static final int MESSAGEINTEGRITY = 8;
    public static final int PASSWORD = 7;
    public static final int REFLECTEDFROM = 11;
    public static final int RESPONSEADDRESS = 2;
    public static final int SOURCEADDRESS = 4;
    public static final int UNKNOWNATTRIBUTE = 10;
    public static final int USERNAME = 6;

    /* loaded from: classes.jar:de/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType.class */
    public enum MessageAttributeType {
        MappedAddress,
        ResponseAddress,
        ChangeRequest,
        SourceAddress,
        ChangedAddress,
        Username,
        Password,
        MessageIntegrity,
        ErrorCode,
        UnknownAttribute,
        ReflectedFrom,
        Dummy
    }
}
