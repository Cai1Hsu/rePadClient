package org.jivesoftware.smackx.jingle.mediaimpl.jmf;

import com.ibm.media.codec.audio.rc.RCModule;
import com.ibm.media.codec.audio.ulaw.JavaEncoder;
import com.sun.media.codec.audio.ulaw.Packetizer;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import javax.media.ControllerClosedEvent;
import javax.media.ControllerEvent;
import javax.media.ControllerListener;
import javax.media.Format;
import javax.media.Manager;
import javax.media.MediaLocator;
import javax.media.NoProcessorException;
import javax.media.Processor;
import javax.media.UnsupportedPlugInException;
import javax.media.control.BufferControl;
import javax.media.control.PacketSizeControl;
import javax.media.control.TrackControl;
import javax.media.format.AudioFormat;
import javax.media.protocol.ContentDescriptor;
import javax.media.protocol.DataSource;
import javax.media.protocol.PushBufferStream;
import javax.media.rtp.InvalidSessionAddressException;
import javax.media.rtp.RTPManager;
import javax.media.rtp.SendStream;
import javax.media.rtp.SessionAddress;
import org.apache.http.HttpStatus;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel.class */
public class AudioChannel {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(AudioChannel.class);
    private AudioReceiver audioReceiver;
    private Format format;
    private JingleMediaSession jingleMediaSession;
    private String localIpAddress;
    private int localPort;
    private MediaLocator locator;
    private int portBase;
    private String remoteIpAddress;
    private RTPManager[] rtpMgrs;
    private Processor processor = null;
    private DataSource dataOutput = null;
    private List<SendStream> sendStreams = new ArrayList();
    private boolean started = false;
    private Integer stateLock = 0;
    private boolean failed = false;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener.class */
    class StateListener implements ControllerListener {
        StateListener() {
            AudioChannel.this = r4;
        }

        public void controllerUpdate(ControllerEvent controllerEvent) {
            if (controllerEvent instanceof ControllerClosedEvent) {
                AudioChannel.this.setFailed();
            }
            if (controllerEvent != null) {
                synchronized (AudioChannel.this.getStateLock()) {
                    AudioChannel.this.getStateLock().notifyAll();
                }
            }
        }
    }

    public AudioChannel(MediaLocator mediaLocator, String str, String str2, int i, int i2, Format format, JingleMediaSession jingleMediaSession) {
        this.locator = mediaLocator;
        this.localIpAddress = str;
        this.remoteIpAddress = str2;
        this.localPort = i;
        this.portBase = i2;
        this.format = format;
        this.jingleMediaSession = jingleMediaSession;
    }

    private String createProcessor() {
        String str;
        DataSource createDataSource;
        if (this.locator == null) {
            str = "Locator is null";
        } else {
            try {
                createDataSource = Manager.createDataSource(this.locator);
            } catch (Exception e) {
                try {
                    createDataSource = Manager.createDataSource(new MediaLocator("javasound://"));
                } catch (Exception e2) {
                    str = "Couldn't create DataSource";
                }
            }
            try {
                this.processor = Manager.createProcessor(createDataSource);
                if (!waitForState(this.processor, 180)) {
                    str = "Couldn't configure processor";
                } else {
                    TrackControl[] trackControls = this.processor.getTrackControls();
                    if (trackControls == null || trackControls.length < 1) {
                        str = "Couldn't find tracks in processor";
                    } else {
                        this.processor.setContentDescriptor(new ContentDescriptor("raw.rtp"));
                        Format format = null;
                        boolean z = false;
                        int i = 0;
                        while (i < trackControls.length) {
                            boolean z2 = z;
                            Format format2 = format;
                            if (trackControls[i].isEnabled()) {
                                Format[] supportedFormats = trackControls[i].getSupportedFormats();
                                if (supportedFormats.length > 0) {
                                    int length = supportedFormats.length;
                                    int i2 = 0;
                                    while (i2 < length) {
                                        Format format3 = supportedFormats[i2];
                                        Format format4 = format;
                                        if (format3 instanceof AudioFormat) {
                                            format4 = format;
                                            if (this.format.matches(format3)) {
                                                format4 = format3;
                                            }
                                        }
                                        i2++;
                                        format = format4;
                                    }
                                    if (format != null) {
                                        trackControls[i].setFormat(format);
                                        LOGGER.error("Track " + i + " is set to transmit as:");
                                        LOGGER.error("  " + format);
                                        if (trackControls[i].getFormat() instanceof AudioFormat) {
                                            PacketSizeControl control = this.processor.getControl(PacketSizeControl.class.getName());
                                            if (control != null) {
                                                try {
                                                    control.setPacketSize(getPacketSize(trackControls[i].getFormat(), 20));
                                                } catch (IllegalArgumentException e3) {
                                                    control.setPacketSize(80);
                                                }
                                            }
                                            if (trackControls[i].getFormat().getEncoding().equals("ULAW/rtp")) {
                                                Packetizer[] packetizerArr = {new RCModule(), new JavaEncoder(), new Packetizer()};
                                                packetizerArr[2].setPacketSize(160);
                                                try {
                                                    trackControls[i].setCodecChain(packetizerArr);
                                                } catch (UnsupportedPlugInException e4) {
                                                    e4.printStackTrace();
                                                }
                                            }
                                        }
                                        z2 = true;
                                        format2 = format;
                                    } else {
                                        trackControls[i].setEnabled(false);
                                        z2 = z;
                                        format2 = format;
                                    }
                                } else {
                                    trackControls[i].setEnabled(false);
                                    z2 = z;
                                    format2 = format;
                                }
                            }
                            i++;
                            z = z2;
                            format = format2;
                        }
                        if (!z) {
                            str = "Couldn't set any of the tracks to a valid RTP format";
                        } else if (!waitForState(this.processor, HttpStatus.SC_MULTIPLE_CHOICES)) {
                            str = "Couldn't realize processor";
                        } else {
                            this.dataOutput = this.processor.getDataOutput();
                            str = null;
                        }
                    }
                }
            } catch (IOException e5) {
                e5.printStackTrace();
                str = "IOException creating processor";
            } catch (NoProcessorException e6) {
                e6.printStackTrace();
                str = "Couldn't create processor";
            }
        }
        return str;
    }

    private String createTransmitter() {
        String str;
        PushBufferStream[] streams = this.dataOutput.getStreams();
        this.rtpMgrs = new RTPManager[streams.length];
        this.audioReceiver = new AudioReceiver(this, this.jingleMediaSession);
        for (int i = 0; i < streams.length; i++) {
            try {
                this.rtpMgrs[i] = RTPManager.newInstance();
                int i2 = this.portBase + (i * 2);
                InetAddress byName = InetAddress.getByName(this.remoteIpAddress);
                SessionAddress sessionAddress = new SessionAddress(InetAddress.getByName(this.localIpAddress), this.localPort);
                SessionAddress sessionAddress2 = new SessionAddress(byName, i2);
                this.rtpMgrs[i].addReceiveStreamListener(this.audioReceiver);
                this.rtpMgrs[i].addSessionListener(this.audioReceiver);
                BufferControl bufferControl = (BufferControl) this.rtpMgrs[i].getControl("javax.media.control.BufferControl");
                if (bufferControl != null) {
                    bufferControl.setBufferLength(160);
                }
                try {
                    this.rtpMgrs[i].initialize(sessionAddress);
                } catch (InvalidSessionAddressException e) {
                    this.rtpMgrs[i].initialize(new SessionAddress(new SessionAddress().getDataAddress(), this.localPort));
                }
                this.rtpMgrs[i].addTarget(sessionAddress2);
                LOGGER.error("Created RTP session at " + this.localPort + " to: " + this.remoteIpAddress + " " + i2);
                SendStream createSendStream = this.rtpMgrs[i].createSendStream(this.dataOutput, i);
                this.sendStreams.add(createSendStream);
                createSendStream.start();
            } catch (Exception e2) {
                e2.printStackTrace();
                str = e2.getMessage();
            }
        }
        str = null;
        return str;
    }

    private int getPacketSize(Format format, int i) throws IllegalArgumentException {
        int i2;
        String encoding = format.getEncoding();
        if (encoding.equalsIgnoreCase("gsm") || encoding.equalsIgnoreCase("gsm/rtp")) {
            i2 = i * 4;
        } else if (!encoding.equalsIgnoreCase("ULAW") && !encoding.equalsIgnoreCase("ULAW/rtp")) {
            throw new IllegalArgumentException("Unknown codec type");
        } else {
            i2 = i * 8;
        }
        return i2;
    }

    public static void main(String[] strArr) {
        try {
            InetAddress localHost = InetAddress.getLocalHost();
            AudioChannel audioChannel = new AudioChannel(new MediaLocator("javasound://8000"), localHost.getHostAddress(), localHost.getHostAddress(), 7002, 7020, new AudioFormat("gsm/rtp"), null);
            AudioChannel audioChannel2 = new AudioChannel(new MediaLocator("javasound://8000"), localHost.getHostAddress(), localHost.getHostAddress(), 7020, 7002, new AudioFormat("gsm/rtp"), null);
            audioChannel.start();
            audioChannel2.start();
            try {
                Thread.sleep(5000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            audioChannel.setTrasmit(false);
            audioChannel2.setTrasmit(false);
            try {
                Thread.sleep(5000L);
            } catch (InterruptedException e2) {
                e2.printStackTrace();
            }
            audioChannel.setTrasmit(true);
            audioChannel2.setTrasmit(true);
            try {
                Thread.sleep(5000L);
            } catch (InterruptedException e3) {
                e3.printStackTrace();
            }
            audioChannel.stop();
            audioChannel2.stop();
        } catch (UnknownHostException e4) {
            e4.printStackTrace();
        }
    }

    private boolean waitForState(Processor processor, int i) {
        boolean z = false;
        synchronized (this) {
            processor.addControllerListener(new StateListener());
            this.failed = false;
            if (i == 180) {
                processor.configure();
            } else if (i == 300) {
                processor.realize();
            }
            while (processor.getState() < i && !this.failed) {
                synchronized (getStateLock()) {
                    try {
                        getStateLock().wait();
                    } catch (InterruptedException e) {
                    }
                }
            }
            if (!this.failed) {
                z = true;
            }
        }
        return z;
    }

    Integer getStateLock() {
        return this.stateLock;
    }

    void setFailed() {
        this.failed = true;
    }

    public void setTrasmit(boolean z) {
        for (SendStream sendStream : this.sendStreams) {
            if (z) {
                try {
                    sendStream.start();
                    LOGGER.debug("START");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                sendStream.stop();
                LOGGER.debug("STOP");
            }
        }
    }

    public String start() {
        synchronized (this) {
            if (!this.started) {
                if (createProcessor() != null) {
                    this.started = false;
                }
                if (createTransmitter() != null) {
                    this.processor.close();
                    this.processor = null;
                    this.started = false;
                } else {
                    this.started = true;
                }
                this.processor.start();
            }
        }
        return null;
    }

    public void stop() {
        RTPManager[] rTPManagerArr;
        if (!this.started) {
            return;
        }
        synchronized (this) {
            try {
                this.started = false;
                if (this.processor != null) {
                    this.processor.stop();
                    this.processor = null;
                    for (RTPManager rTPManager : this.rtpMgrs) {
                        rTPManager.removeReceiveStreamListener(this.audioReceiver);
                        rTPManager.removeSessionListener(this.audioReceiver);
                        rTPManager.removeTargets("Session ended.");
                        rTPManager.dispose();
                    }
                    this.sendStreams.clear();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
