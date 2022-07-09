package org.jivesoftware.smackx.jingle.mediaimpl.jspeex;

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

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jspeex/SpeexMediaManager.class */
public class SpeexMediaManager extends JingleMediaManager {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(SpeexMediaManager.class);
    public static final String MEDIA_NAME = "Speex";
    private List<PayloadType> payloads = new ArrayList();

    public SpeexMediaManager(JingleTransportManager jingleTransportManager) {
        super(jingleTransportManager);
        setupPayloads();
        setupJMF();
    }

    private static void runLinuxPreInstall() {
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x0073 -> B:8:0x005b). Please submit an issue!!! */
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
        if (file2.length() == 0) {
            new JMFInit(null, false);
        }
    }

    private void setupPayloads() {
        this.payloads.add(new PayloadType.Audio(15, "speex"));
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public JingleMediaSession createMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
        return new AudioMediaSession(payloadType, transportCandidate, transportCandidate2, null, null);
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public String getName() {
        return MEDIA_NAME;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public List<PayloadType> getPayloads() {
        return this.payloads;
    }
}
