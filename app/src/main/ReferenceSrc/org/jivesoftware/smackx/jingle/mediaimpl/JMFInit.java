package org.jivesoftware.smackx.jingle.mediaimpl;

import com.sun.media.ExclusiveUse;
import com.sun.media.util.Registry;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.Toolkit;
import java.util.Vector;
import javax.media.Format;
import javax.media.PlugInManager;
import javax.media.Renderer;
import javax.media.format.AudioFormat;
import org.jivesoftware.smackx.jingle.SmackLogger;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/JMFInit.class */
public class JMFInit extends Frame implements Runnable {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JMFInit.class);
    private static final long serialVersionUID = 6476412003260641680L;
    private String userHome;
    private boolean visible;
    private String tempDir = "/tmp";
    private boolean done = false;

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:8:0x0045 -> B:4:0x0038). Please submit an issue!!! */
    public JMFInit(String[] strArr, boolean z) {
        super("Initializing JMF...");
        this.visible = false;
        this.visible = z;
        Registry.set("secure.allowCaptureFromApplets", true);
        Registry.set("secure.allowSaveFileFromApplets", true);
        updateTemp(strArr);
        try {
            Registry.commit();
        } catch (Exception e) {
            message("Failed to commit to JMFRegistry!");
        }
        new Thread(this).run();
    }

    private void createGUI() {
        TextArea textArea = new TextArea(5, 50);
        add("Center", textArea);
        textArea.setEditable(false);
        addNotify();
        pack();
        setLocation((((int) Toolkit.getDefaultToolkit().getScreenSize().getWidth()) - getWidth()) / 2, (((int) Toolkit.getDefaultToolkit().getScreenSize().getHeight()) - getHeight()) / 2);
        setVisible(this.visible);
    }

    private void detectCaptureDevices() {
        message("Looking for Audio capturer");
        try {
            Class.forName("DirectSoundAuto").newInstance();
            message("Finished detecting DirectSound capturer");
        } catch (ThreadDeath e) {
            throw e;
        } catch (Throwable th) {
        }
        try {
            Class.forName("JavaSoundAuto").newInstance();
            message("Finished detecting javasound capturer");
        } catch (ThreadDeath e2) {
            throw e2;
        } catch (Throwable th2) {
            message("JavaSound capturer detection failed!");
        }
    }

    private void detectDirectAudio() {
        try {
            Class.forName("VFWAuto");
            Class.forName("com.sun.media.protocol.dsound.DSound");
            Renderer renderer = (Renderer) Class.forName("com.sun.media.renderer.audio.DirectAudioRenderer").newInstance();
            try {
                renderer.setInputFormat(new AudioFormat("LINEAR", 44100.0d, 16, 2));
                renderer.open();
                PlugInManager.addPlugIn("com.sun.media.renderer.audio.DirectAudioRenderer", renderer.getSupportedInputFormats(), new Format[0], 4);
                Vector plugInList = PlugInManager.getPlugInList((Format) null, (Format) null, 4);
                int size = plugInList.size();
                if (((String) plugInList.elementAt(size - 1)).equals("com.sun.media.renderer.audio.DirectAudioRenderer")) {
                    plugInList.removeElementAt(size - 1);
                    plugInList.insertElementAt("com.sun.media.renderer.audio.DirectAudioRenderer", 0);
                    PlugInManager.setPlugInList(plugInList, 4);
                    PlugInManager.commit();
                }
                renderer.close();
            } catch (Throwable th) {
            }
        } catch (Throwable th2) {
        }
    }

    private void detectS8DirectAudio() {
        boolean z;
        try {
            Class.forName("SunVideoAuto");
            ExclusiveUse exclusiveUse = (Renderer) Class.forName("com.sun.media.renderer.audio.DirectAudioRenderer").newInstance();
            if (!(exclusiveUse instanceof ExclusiveUse) || exclusiveUse.isExclusive()) {
                return;
            }
            Vector plugInList = PlugInManager.getPlugInList((Format) null, (Format) null, 4);
            int size = plugInList.size();
            int i = 0;
            while (true) {
                z = false;
                if (i >= size) {
                    break;
                } else if (((String) plugInList.elementAt(i)).equals("com.sun.media.renderer.audio.DirectAudioRenderer")) {
                    z = true;
                    plugInList.removeElementAt(i);
                    break;
                } else {
                    i++;
                }
            }
            if (!z) {
                return;
            }
            plugInList.insertElementAt("com.sun.media.renderer.audio.DirectAudioRenderer", 0);
            PlugInManager.setPlugInList(plugInList, 4);
            PlugInManager.commit();
        } catch (Throwable th) {
        }
    }

    private void message(String str) {
        LOGGER.debug(str);
    }

    public static void start(boolean z) {
        new JMFInit(null, z);
    }

    private void updateTemp(String[] strArr) {
        if (strArr == null || strArr.length <= 0) {
            return;
        }
        this.tempDir = strArr[0];
        message("Setting cache directory to " + this.tempDir);
        new Registry();
        try {
            Registry.set("secure.cacheDir", this.tempDir);
            Registry.commit();
            message("Updated registry");
        } catch (Exception e) {
            message("Couldn't update registry!");
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        detectDirectAudio();
        detectS8DirectAudio();
        detectCaptureDevices();
        this.done = true;
    }
}
