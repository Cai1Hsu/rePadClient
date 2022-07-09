package android.support.v4.hardware.fingerprint;

import android.annotation.TargetApi;
import android.content.Context;
import android.hardware.fingerprint.FingerprintManager;
import android.os.CancellationSignal;
import android.os.Handler;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import java.security.Signature;
import javax.crypto.Cipher;
import javax.crypto.Mac;

@RequiresApi(23)
@TargetApi(23)
@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.jar:android/support/v4/hardware/fingerprint/FingerprintManagerCompatApi23.class */
public final class FingerprintManagerCompatApi23 {

    /* loaded from: classes.jar:android/support/v4/hardware/fingerprint/FingerprintManagerCompatApi23$AuthenticationCallback.class */
    public static abstract class AuthenticationCallback {
        public void onAuthenticationError(int i, CharSequence charSequence) {
        }

        public void onAuthenticationFailed() {
        }

        public void onAuthenticationHelp(int i, CharSequence charSequence) {
        }

        public void onAuthenticationSucceeded(AuthenticationResultInternal authenticationResultInternal) {
        }
    }

    /* loaded from: classes.jar:android/support/v4/hardware/fingerprint/FingerprintManagerCompatApi23$AuthenticationResultInternal.class */
    public static final class AuthenticationResultInternal {
        private CryptoObject mCryptoObject;

        public AuthenticationResultInternal(CryptoObject cryptoObject) {
            this.mCryptoObject = cryptoObject;
        }

        public CryptoObject getCryptoObject() {
            return this.mCryptoObject;
        }
    }

    /* loaded from: classes.jar:android/support/v4/hardware/fingerprint/FingerprintManagerCompatApi23$CryptoObject.class */
    public static class CryptoObject {
        private final Cipher mCipher;
        private final Mac mMac;
        private final Signature mSignature;

        public CryptoObject(Signature signature) {
            this.mSignature = signature;
            this.mCipher = null;
            this.mMac = null;
        }

        public CryptoObject(Cipher cipher) {
            this.mCipher = cipher;
            this.mSignature = null;
            this.mMac = null;
        }

        public CryptoObject(Mac mac) {
            this.mMac = mac;
            this.mCipher = null;
            this.mSignature = null;
        }

        public Cipher getCipher() {
            return this.mCipher;
        }

        public Mac getMac() {
            return this.mMac;
        }

        public Signature getSignature() {
            return this.mSignature;
        }
    }

    public static void authenticate(Context context, CryptoObject cryptoObject, int i, Object obj, AuthenticationCallback authenticationCallback, Handler handler) {
        FingerprintManager fingerprintManagerOrNull = getFingerprintManagerOrNull(context);
        if (fingerprintManagerOrNull != null) {
            fingerprintManagerOrNull.authenticate(wrapCryptoObject(cryptoObject), (CancellationSignal) obj, i, wrapCallback(authenticationCallback), handler);
        }
    }

    private static FingerprintManager getFingerprintManagerOrNull(Context context) {
        return context.getPackageManager().hasSystemFeature("android.hardware.fingerprint") ? (FingerprintManager) context.getSystemService(FingerprintManager.class) : null;
    }

    public static boolean hasEnrolledFingerprints(Context context) {
        FingerprintManager fingerprintManagerOrNull = getFingerprintManagerOrNull(context);
        return fingerprintManagerOrNull != null && fingerprintManagerOrNull.hasEnrolledFingerprints();
    }

    public static boolean isHardwareDetected(Context context) {
        FingerprintManager fingerprintManagerOrNull = getFingerprintManagerOrNull(context);
        return fingerprintManagerOrNull != null && fingerprintManagerOrNull.isHardwareDetected();
    }

    public static CryptoObject unwrapCryptoObject(FingerprintManager.CryptoObject cryptoObject) {
        CryptoObject cryptoObject2 = null;
        if (cryptoObject != null) {
            if (cryptoObject.getCipher() != null) {
                cryptoObject2 = new CryptoObject(cryptoObject.getCipher());
            } else if (cryptoObject.getSignature() != null) {
                cryptoObject2 = new CryptoObject(cryptoObject.getSignature());
            } else if (cryptoObject.getMac() != null) {
                cryptoObject2 = new CryptoObject(cryptoObject.getMac());
            }
        }
        return cryptoObject2;
    }

    private static FingerprintManager.AuthenticationCallback wrapCallback(final AuthenticationCallback authenticationCallback) {
        return new FingerprintManager.AuthenticationCallback() { // from class: android.support.v4.hardware.fingerprint.FingerprintManagerCompatApi23.1
            @Override // android.hardware.fingerprint.FingerprintManager.AuthenticationCallback
            public void onAuthenticationError(int i, CharSequence charSequence) {
                authenticationCallback.onAuthenticationError(i, charSequence);
            }

            @Override // android.hardware.fingerprint.FingerprintManager.AuthenticationCallback
            public void onAuthenticationFailed() {
                authenticationCallback.onAuthenticationFailed();
            }

            @Override // android.hardware.fingerprint.FingerprintManager.AuthenticationCallback
            public void onAuthenticationHelp(int i, CharSequence charSequence) {
                authenticationCallback.onAuthenticationHelp(i, charSequence);
            }

            @Override // android.hardware.fingerprint.FingerprintManager.AuthenticationCallback
            public void onAuthenticationSucceeded(FingerprintManager.AuthenticationResult authenticationResult) {
                authenticationCallback.onAuthenticationSucceeded(new AuthenticationResultInternal(FingerprintManagerCompatApi23.unwrapCryptoObject(authenticationResult.getCryptoObject())));
            }
        };
    }

    private static FingerprintManager.CryptoObject wrapCryptoObject(CryptoObject cryptoObject) {
        FingerprintManager.CryptoObject cryptoObject2 = null;
        if (cryptoObject != null) {
            if (cryptoObject.getCipher() != null) {
                cryptoObject2 = new FingerprintManager.CryptoObject(cryptoObject.getCipher());
            } else if (cryptoObject.getSignature() != null) {
                cryptoObject2 = new FingerprintManager.CryptoObject(cryptoObject.getSignature());
            } else if (cryptoObject.getMac() != null) {
                cryptoObject2 = new FingerprintManager.CryptoObject(cryptoObject.getMac());
            }
        }
        return cryptoObject2;
    }
}
