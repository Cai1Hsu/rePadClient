package org.jivesoftware.smackx.jingle.mediaimpl.jmf;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.media.JingleMediaManager;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.mediaimpl.JMFInit;
import org.jivesoftware.smackx.jingle.nat.JingleTransportManager;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager.class */
public class JmfMediaManager extends JingleMediaManager {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JmfMediaManager.class);
    public static final String MEDIA_NAME = "JMF";
    private String mediaLocator;
    private List<PayloadType> payloads;

    public JmfMediaManager(String str, JingleTransportManager jingleTransportManager) {
        super(jingleTransportManager);
        this.payloads = new ArrayList();
        this.mediaLocator = null;
        this.mediaLocator = str;
        setupPayloads();
    }

    public JmfMediaManager(JingleTransportManager jingleTransportManager) {
        super(jingleTransportManager);
        this.payloads = new ArrayList();
        this.mediaLocator = null;
        setupPayloads();
    }

    private static void runLinuxPreInstall() {
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x006a -> B:8:0x005b). Please submit an issue!!! */
    public static void setupJMF() {
        File file = new File(System.getProperty("user.home"), ".jmf");
        System.setProperty("java.class.path", System.getProperty("java.class.path") + System.getProperty("path.separator") + file.getAbsolutePath());
        if (!file.exists()) {
            file.mkdir();
        }
        File file2 = new File(file, "jmf.properties");
        if (!file2.exists()) {
            try {
                file2.createNewFile();
            } catch (IOException e) {
                LOGGER.debug("Failed to create jmf.properties");
                e.printStackTrace();
            }
        }
        runLinuxPreInstall();
        new JMFInit(null, false);
    }

    private void setupPayloads() {
        this.payloads.add(new PayloadType.Audio(3, "gsm"));
        this.payloads.add(new PayloadType.Audio(4, "g723"));
        this.payloads.add(new PayloadType.Audio(0, "PCMU", 16000));
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public JingleMediaSession createMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
        return new AudioMediaSession(payloadType, transportCandidate, transportCandidate2, this.mediaLocator, jingleSession);
    }

    public String getMediaLocator() {
        return this.mediaLocator;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public String getName() {
        return MEDIA_NAME;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public List<PayloadType> getPayloads() {
        return this.payloads;
    }

    public void setMediaLocator(String str) {
        this.mediaLocator = str;
    }
}
