package org.apache.http.impl.auth;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/auth/NTLMEngine.class */
public interface NTLMEngine {
    String generateType1Msg(String str, String str2) throws NTLMEngineException;

    String generateType3Msg(String str, String str2, String str3, String str4, String str5) throws NTLMEngineException;
}
