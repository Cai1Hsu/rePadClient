package de.javawi.jstun.header;

/* loaded from: classes.jar:de/javawi/jstun/header/MessageHeaderInterface.class */
public interface MessageHeaderInterface {
    public static final int BINDINGERRORRESPONSE = 273;
    public static final int BINDINGREQUEST = 1;
    public static final int BINDINGRESPONSE = 257;
    public static final int SHAREDSECRETERRORRESPONSE = 274;
    public static final int SHAREDSECRETREQUEST = 2;
    public static final int SHAREDSECRETRESPONSE = 258;

    /* loaded from: classes.jar:de/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType.class */
    public enum MessageHeaderType {
        BindingRequest,
        BindingResponse,
        BindingErrorResponse,
        SharedSecretRequest,
        SharedSecretResponse,
        SharedSecretErrorResponse
    }
}
