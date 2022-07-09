package org.jivesoftware.smackx.jingle.mediaimpl.jmf;

import javax.media.ControllerErrorEvent;
import javax.media.ControllerEvent;
import javax.media.ControllerListener;
import javax.media.Manager;
import javax.media.Player;
import javax.media.RealizeCompleteEvent;
import javax.media.protocol.DataSource;
import javax.media.rtp.Participant;
import javax.media.rtp.RTPControl;
import javax.media.rtp.ReceiveStream;
import javax.media.rtp.ReceiveStreamListener;
import javax.media.rtp.SessionListener;
import javax.media.rtp.event.ByeEvent;
import javax.media.rtp.event.NewParticipantEvent;
import javax.media.rtp.event.NewReceiveStreamEvent;
import javax.media.rtp.event.ReceiveStreamEvent;
import javax.media.rtp.event.RemotePayloadChangeEvent;
import javax.media.rtp.event.SessionEvent;
import javax.media.rtp.event.StreamMappedEvent;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver.class */
public class AudioReceiver implements ReceiveStreamListener, SessionListener, ControllerListener {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(AudioReceiver.class);
    boolean dataReceived = false;
    Object dataSync;
    JingleMediaSession jingleMediaSession;

    public AudioReceiver(Object obj, JingleMediaSession jingleMediaSession) {
        this.dataSync = obj;
        this.jingleMediaSession = jingleMediaSession;
    }

    public void controllerUpdate(ControllerEvent controllerEvent) {
        synchronized (this) {
            Player sourceController = controllerEvent.getSourceController();
            if (sourceController != null) {
                if (controllerEvent instanceof RealizeCompleteEvent) {
                    sourceController.start();
                }
                if (controllerEvent instanceof ControllerErrorEvent) {
                    sourceController.removeControllerListener(this);
                    LOGGER.error("Receiver internal error: " + controllerEvent);
                }
            }
        }
    }

    public void update(ReceiveStreamEvent receiveStreamEvent) {
        synchronized (this) {
            Participant participant = receiveStreamEvent.getParticipant();
            ReceiveStream receiveStream = receiveStreamEvent.getReceiveStream();
            if (receiveStreamEvent instanceof RemotePayloadChangeEvent) {
                LOGGER.error("  - Received an RTP PayloadChangeEvent.");
                LOGGER.error("Sorry, cannot handle payload change.");
            } else if (receiveStreamEvent instanceof NewReceiveStreamEvent) {
                try {
                    DataSource dataSource = receiveStreamEvent.getReceiveStream().getDataSource();
                    RTPControl rTPControl = (RTPControl) dataSource.getControl("javax.jmf.rtp.RTPControl");
                    if (rTPControl != null) {
                        LOGGER.error("  - Recevied new RTP stream: " + rTPControl.getFormat());
                    } else {
                        LOGGER.error("  - Recevied new RTP stream");
                    }
                    if (participant == null) {
                        LOGGER.error("      The sender of this stream had yet to be identified.");
                    } else {
                        LOGGER.error("      The stream comes from: " + participant.getCNAME());
                    }
                    Player createPlayer = Manager.createPlayer(dataSource);
                    if (createPlayer != null) {
                        createPlayer.addControllerListener(this);
                        createPlayer.realize();
                        this.jingleMediaSession.mediaReceived(participant != null ? participant.getCNAME() : "");
                        synchronized (this.dataSync) {
                            this.dataReceived = true;
                            this.dataSync.notifyAll();
                        }
                    }
                } catch (Exception e) {
                    LOGGER.error("NewReceiveStreamEvent exception " + e.getMessage());
                }
            } else if (receiveStreamEvent instanceof StreamMappedEvent) {
                if (receiveStream != null && receiveStream.getDataSource() != null) {
                    RTPControl rTPControl2 = (RTPControl) receiveStream.getDataSource().getControl("javax.jmf.rtp.RTPControl");
                    LOGGER.error("  - The previously unidentified stream ");
                    if (rTPControl2 != null) {
                        LOGGER.error("      " + rTPControl2.getFormat());
                    }
                    LOGGER.error("      had now been identified as sent by: " + participant.getCNAME());
                }
            } else if (receiveStreamEvent instanceof ByeEvent) {
                LOGGER.error("  - Got \"bye\" from: " + participant.getCNAME());
            }
        }
    }

    public void update(SessionEvent sessionEvent) {
        synchronized (this) {
            if (sessionEvent instanceof NewParticipantEvent) {
                LOGGER.error("  - A new participant had just joined: " + ((NewParticipantEvent) sessionEvent).getParticipant().getCNAME());
            }
        }
    }
}
