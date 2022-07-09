package org.jivesoftware.smack;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.Principal;
import java.security.cert.CertificateException;
import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.X509TrustManager;

/* loaded from: classes.jar:org/jivesoftware/smack/ServerTrustManager.class */
class ServerTrustManager implements X509TrustManager {
    private static Pattern cnPattern = Pattern.compile("(?i)(cn=)([^,]*)");
    private static Map<KeyStoreOptions, KeyStore> stores = new HashMap();
    private ConnectionConfiguration configuration;
    private String server;
    private KeyStore trustStore;

    /* loaded from: classes.jar:org/jivesoftware/smack/ServerTrustManager$KeyStoreOptions.class */
    private static class KeyStoreOptions {
        private final String password;
        private final String path;
        private final String type;

        public KeyStoreOptions(String str, String str2, String str3) {
            this.type = str;
            this.path = str2;
            this.password = str3;
        }

        /* JADX WARN: Removed duplicated region for block: B:22:0x0054  */
        /* JADX WARN: Removed duplicated region for block: B:25:0x0060  */
        /* JADX WARN: Removed duplicated region for block: B:30:0x007a  */
        /* JADX WARN: Removed duplicated region for block: B:33:0x0086  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public boolean equals(Object obj) {
            boolean z = true;
            if (this != obj) {
                if (obj == null) {
                    z = false;
                } else if (getClass() != obj.getClass()) {
                    z = false;
                } else {
                    KeyStoreOptions keyStoreOptions = (KeyStoreOptions) obj;
                    if (this.password == null) {
                        if (keyStoreOptions.password != null) {
                            z = false;
                        }
                        if (this.path != null) {
                            if (keyStoreOptions.path != null) {
                                z = false;
                            }
                            if (this.type != null) {
                                if (keyStoreOptions.type != null) {
                                    z = false;
                                }
                            } else if (!this.type.equals(keyStoreOptions.type)) {
                                z = false;
                            }
                        } else {
                            if (!this.path.equals(keyStoreOptions.path)) {
                                z = false;
                            }
                            if (this.type != null) {
                            }
                        }
                    } else {
                        if (!this.password.equals(keyStoreOptions.password)) {
                            z = false;
                        }
                        if (this.path != null) {
                        }
                    }
                }
            }
            return z;
        }

        public String getPassword() {
            return this.password;
        }

        public String getPath() {
            return this.path;
        }

        public String getType() {
            return this.type;
        }

        public int hashCode() {
            int i = 0;
            int hashCode = this.password == null ? 0 : this.password.hashCode();
            int hashCode2 = this.path == null ? 0 : this.path.hashCode();
            if (this.type != null) {
                i = this.type.hashCode();
            }
            return ((((hashCode + 31) * 31) + hashCode2) * 31) + i;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0056 A[Catch: all -> 0x00ad, TryCatch #7 {all -> 0x00ad, blocks: (B:4:0x001b, B:6:0x003e, B:8:0x0050, B:10:0x0056, B:12:0x005d, B:24:0x009b, B:25:0x009e, B:28:0x00b0, B:39:0x00d0, B:44:0x00e1, B:46:0x00e6), top: B:59:0x001b }] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x00b3 -> B:24:0x009b). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ServerTrustManager(String str, ConnectionConfiguration connectionConfiguration) {
        Throwable th;
        Throwable th2;
        FileInputStream fileInputStream;
        Exception e;
        this.configuration = connectionConfiguration;
        this.server = str;
        synchronized (stores) {
            try {
                KeyStoreOptions keyStoreOptions = new KeyStoreOptions(connectionConfiguration.getTruststoreType(), connectionConfiguration.getTruststorePath(), connectionConfiguration.getTruststorePassword());
                if (stores.containsKey(keyStoreOptions)) {
                    this.trustStore = stores.get(keyStoreOptions);
                } else {
                    FileInputStream fileInputStream2 = null;
                    try {
                        try {
                            this.trustStore = KeyStore.getInstance(keyStoreOptions.getType());
                            fileInputStream = new FileInputStream(keyStoreOptions.getPath());
                        } catch (Exception e2) {
                            e = e2;
                            fileInputStream = null;
                        }
                    } catch (Throwable th3) {
                        th2 = th3;
                    }
                    try {
                        this.trustStore.load(fileInputStream, keyStoreOptions.getPassword().toCharArray());
                        if (fileInputStream != null) {
                            try {
                                fileInputStream.close();
                            } catch (IOException e3) {
                            } catch (Throwable th4) {
                                th = th4;
                                throw th;
                            }
                        }
                    } catch (Exception e4) {
                        e = e4;
                        this.trustStore = null;
                        fileInputStream2 = fileInputStream;
                        e.printStackTrace();
                        if (fileInputStream != null) {
                            try {
                                fileInputStream.close();
                            } catch (IOException e5) {
                            }
                        }
                        stores.put(keyStoreOptions, this.trustStore);
                        if (this.trustStore == null) {
                        }
                    } catch (Throwable th5) {
                        th2 = th5;
                        fileInputStream2 = fileInputStream;
                        if (fileInputStream2 != null) {
                            try {
                                fileInputStream2.close();
                            } catch (IOException e6) {
                            }
                        }
                        throw th2;
                    }
                    stores.put(keyStoreOptions, this.trustStore);
                }
                if (this.trustStore == null) {
                    connectionConfiguration.setVerifyRootCAEnabled(false);
                }
            } catch (Throwable th6) {
                th = th6;
            }
        }
    }

    public static List<String> getPeerIdentity(X509Certificate x509Certificate) {
        List<String> subjectAlternativeNames = getSubjectAlternativeNames(x509Certificate);
        ArrayList arrayList = subjectAlternativeNames;
        if (subjectAlternativeNames.isEmpty()) {
            String name = x509Certificate.getSubjectDN().getName();
            Matcher matcher = cnPattern.matcher(name);
            if (matcher.find()) {
                name = matcher.group(2);
            }
            arrayList = new ArrayList();
            arrayList.add(name);
        }
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.util.List] */
    private static List<String> getSubjectAlternativeNames(X509Certificate x509Certificate) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = arrayList;
        try {
            if (x509Certificate.getSubjectAlternativeNames() == null) {
                arrayList2 = Collections.emptyList();
            }
        } catch (CertificateParsingException e) {
            e.printStackTrace();
            arrayList2 = arrayList;
        }
        return arrayList2;
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
        boolean z;
        int length = x509CertificateArr.length;
        List<String> peerIdentity = getPeerIdentity(x509CertificateArr[0]);
        if (this.configuration.isVerifyChainEnabled()) {
            Principal principal = null;
            for (int i = length - 1; i >= 0; i--) {
                X509Certificate x509Certificate = x509CertificateArr[i];
                Principal issuerDN = x509Certificate.getIssuerDN();
                Principal subjectDN = x509Certificate.getSubjectDN();
                if (principal != null) {
                    if (!issuerDN.equals(principal)) {
                        throw new CertificateException("subject/issuer verification failed of " + peerIdentity);
                    }
                    try {
                        x509CertificateArr[i].verify(x509CertificateArr[i + 1].getPublicKey());
                    } catch (GeneralSecurityException e) {
                        throw new CertificateException("signature verification failed of " + peerIdentity);
                    }
                }
                principal = subjectDN;
            }
        }
        if (this.configuration.isVerifyRootCAEnabled()) {
            boolean z2 = false;
            try {
                boolean z3 = this.trustStore.getCertificateAlias(x509CertificateArr[length - 1]) != null;
                z = z3;
                if (!z3) {
                    z = z3;
                    if (length == 1) {
                        z = z3;
                        if (this.configuration.isSelfSignedCertificateEnabled()) {
                            boolean z4 = z3;
                            boolean z5 = z3;
                            boolean z6 = z3;
                            z2 = z3;
                            System.out.println("Accepting self-signed certificate of remote server: " + peerIdentity);
                            z = true;
                        }
                    }
                }
            } catch (KeyStoreException e2) {
                e2.printStackTrace();
                z = z2;
            }
            if (!z) {
                throw new CertificateException("root certificate not trusted of " + peerIdentity);
            }
        }
        if (this.configuration.isNotMatchingDomainCheckEnabled()) {
            if (peerIdentity.size() == 1 && peerIdentity.get(0).startsWith("*.")) {
                if (!this.server.endsWith(peerIdentity.get(0).replace("*.", ""))) {
                    throw new CertificateException("target verification failed of " + peerIdentity);
                }
            } else if (!peerIdentity.contains(this.server)) {
                throw new CertificateException("target verification failed of " + peerIdentity);
            }
        }
        if (this.configuration.isExpiredCertificatesCheckEnabled()) {
            Date date = new Date();
            for (X509Certificate x509Certificate2 : x509CertificateArr) {
                try {
                    x509Certificate2.checkValidity(date);
                } catch (GeneralSecurityException e3) {
                    throw new CertificateException("invalid date of " + this.server);
                }
            }
        }
    }

    @Override // javax.net.ssl.X509TrustManager
    public X509Certificate[] getAcceptedIssuers() {
        return new X509Certificate[0];
    }
}
