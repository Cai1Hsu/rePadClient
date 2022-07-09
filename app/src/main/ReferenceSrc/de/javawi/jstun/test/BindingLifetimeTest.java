package de.javawi.jstun.test;

import de.javawi.jstun.attribute.ChangeRequest;
import de.javawi.jstun.attribute.ErrorCode;
import de.javawi.jstun.attribute.MappedAddress;
import de.javawi.jstun.attribute.MessageAttributeException;
import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.attribute.MessageAttributeParsingException;
import de.javawi.jstun.attribute.ResponseAddress;
import de.javawi.jstun.header.MessageHeader;
import de.javawi.jstun.header.MessageHeaderInterface;
import de.javawi.jstun.header.MessageHeaderParsingException;
import de.javawi.jstun.util.UtilityException;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:de/javawi/jstun/test/BindingLifetimeTest.class */
public class BindingLifetimeTest {
    private static final Log LOGGER = LogFactory.getLog(BindingLifetimeTest.class);
    DatagramSocket initialSocket;
    MappedAddress ma;
    int port;
    String stunServer;
    int timeout = HttpStatus.SC_MULTIPLE_CHOICES;
    int upperBinarySearchLifetime = 345000;
    int lowerBinarySearchLifetime = 0;
    int binarySearchLifetime = (this.upperBinarySearchLifetime + this.lowerBinarySearchLifetime) / 2;
    int lifetime = -1;
    boolean completed = false;
    Timer timer = new Timer(true);

    /* loaded from: classes.jar:de/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask.class */
    class BindingLifetimeTask extends TimerTask {
        public BindingLifetimeTask() {
            BindingLifetimeTest.this = r4;
        }

        public void lifetimeQuery() throws UtilityException, MessageAttributeException, MessageHeaderParsingException, MessageAttributeParsingException, IOException {
            try {
                DatagramSocket datagramSocket = new DatagramSocket();
                datagramSocket.connect(InetAddress.getByName(BindingLifetimeTest.this.stunServer), BindingLifetimeTest.this.port);
                datagramSocket.setSoTimeout(BindingLifetimeTest.this.timeout);
                MessageHeader messageHeader = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingRequest);
                messageHeader.generateTransactionID();
                ChangeRequest changeRequest = new ChangeRequest();
                ResponseAddress responseAddress = new ResponseAddress();
                responseAddress.setAddress(BindingLifetimeTest.this.ma.getAddress());
                responseAddress.setPort(BindingLifetimeTest.this.ma.getPort());
                messageHeader.addMessageAttribute(changeRequest);
                messageHeader.addMessageAttribute(responseAddress);
                byte[] bytes = messageHeader.getBytes();
                datagramSocket.send(new DatagramPacket(bytes, bytes.length, InetAddress.getByName(BindingLifetimeTest.this.stunServer), BindingLifetimeTest.this.port));
                BindingLifetimeTest.LOGGER.debug("Binding Request sent.");
                MessageHeader messageHeader2 = new MessageHeader();
                while (!messageHeader2.equalTransactionID(messageHeader)) {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[200], 200);
                    BindingLifetimeTest.this.initialSocket.receive(datagramPacket);
                    messageHeader2 = MessageHeader.parseHeader(datagramPacket.getData());
                    messageHeader2.parseAttributes(datagramPacket.getData());
                }
                if (((ErrorCode) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ErrorCode)) != null) {
                    BindingLifetimeTest.LOGGER.debug("Message header contains errorcode message attribute.");
                    return;
                }
                BindingLifetimeTest.LOGGER.debug("Binding Response received.");
                if (BindingLifetimeTest.this.upperBinarySearchLifetime == BindingLifetimeTest.this.lowerBinarySearchLifetime + 1) {
                    BindingLifetimeTest.LOGGER.debug("BindingLifetimeTest completed. UDP binding lifetime: " + BindingLifetimeTest.this.binarySearchLifetime + ".");
                    BindingLifetimeTest.this.completed = true;
                    return;
                }
                BindingLifetimeTest.this.lifetime = BindingLifetimeTest.this.binarySearchLifetime;
                BindingLifetimeTest.LOGGER.debug("Lifetime update: " + BindingLifetimeTest.this.lifetime + ".");
                BindingLifetimeTest.this.lowerBinarySearchLifetime = BindingLifetimeTest.this.binarySearchLifetime;
                BindingLifetimeTest.this.binarySearchLifetime = (BindingLifetimeTest.this.upperBinarySearchLifetime + BindingLifetimeTest.this.lowerBinarySearchLifetime) / 2;
                if (BindingLifetimeTest.this.binarySearchLifetime <= 0) {
                    BindingLifetimeTest.this.completed = true;
                    return;
                }
                BindingLifetimeTest.this.timer.schedule(new BindingLifetimeTask(), BindingLifetimeTest.this.binarySearchLifetime);
                BindingLifetimeTest.LOGGER.debug("Timer scheduled: " + BindingLifetimeTest.this.binarySearchLifetime + ".");
            } catch (SocketTimeoutException e) {
                BindingLifetimeTest.LOGGER.debug("Read operation at query socket timeout.");
                if (BindingLifetimeTest.this.upperBinarySearchLifetime == BindingLifetimeTest.this.lowerBinarySearchLifetime + 1) {
                    BindingLifetimeTest.LOGGER.debug("BindingLifetimeTest completed. UDP binding lifetime: " + BindingLifetimeTest.this.binarySearchLifetime + ".");
                    BindingLifetimeTest.this.completed = true;
                    return;
                }
                BindingLifetimeTest.this.upperBinarySearchLifetime = BindingLifetimeTest.this.binarySearchLifetime;
                BindingLifetimeTest.this.binarySearchLifetime = (BindingLifetimeTest.this.upperBinarySearchLifetime + BindingLifetimeTest.this.lowerBinarySearchLifetime) / 2;
                if (BindingLifetimeTest.this.binarySearchLifetime <= 0) {
                    BindingLifetimeTest.this.completed = true;
                } else if (BindingLifetimeTest.this.bindingCommunicationInitialSocket()) {
                } else {
                    BindingLifetimeTest.this.timer.schedule(new BindingLifetimeTask(), BindingLifetimeTest.this.binarySearchLifetime);
                    BindingLifetimeTest.LOGGER.debug("Timer scheduled: " + BindingLifetimeTest.this.binarySearchLifetime + ".");
                }
            }
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            try {
                lifetimeQuery();
            } catch (Exception e) {
                BindingLifetimeTest.LOGGER.debug("Unhandled Exception. BindLifetimeTasks stopped.");
                e.printStackTrace();
            }
        }
    }

    public BindingLifetimeTest(String str, int i) {
        this.stunServer = str;
        this.port = i;
    }

    public boolean bindingCommunicationInitialSocket() throws UtilityException, IOException, MessageHeaderParsingException, MessageAttributeParsingException {
        boolean z;
        MessageHeader messageHeader = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingRequest);
        messageHeader.generateTransactionID();
        messageHeader.addMessageAttribute(new ChangeRequest());
        byte[] bytes = messageHeader.getBytes();
        this.initialSocket.send(new DatagramPacket(bytes, bytes.length, InetAddress.getByName(this.stunServer), this.port));
        LOGGER.debug("Binding Request sent.");
        MessageHeader messageHeader2 = new MessageHeader();
        while (!messageHeader2.equalTransactionID(messageHeader)) {
            DatagramPacket datagramPacket = new DatagramPacket(new byte[200], 200);
            this.initialSocket.receive(datagramPacket);
            messageHeader2 = MessageHeader.parseHeader(datagramPacket.getData());
            messageHeader2.parseAttributes(datagramPacket.getData());
        }
        this.ma = (MappedAddress) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.MappedAddress);
        if (((ErrorCode) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ErrorCode)) != null) {
            LOGGER.debug("Message header contains an Errorcode message attribute.");
            z = true;
        } else if (this.ma == null) {
            LOGGER.debug("Response does not contain a Mapped Address message attribute.");
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public int getLifetime() {
        return this.lifetime;
    }

    public boolean isCompleted() {
        return this.completed;
    }

    public void setUpperBinarySearchLifetime(int i) {
        this.upperBinarySearchLifetime = i;
        this.binarySearchLifetime = (this.lowerBinarySearchLifetime + i) / 2;
    }

    public void test() throws UtilityException, SocketException, UnknownHostException, IOException, MessageAttributeParsingException, MessageAttributeException, MessageHeaderParsingException {
        this.initialSocket = new DatagramSocket();
        this.initialSocket.connect(InetAddress.getByName(this.stunServer), this.port);
        this.initialSocket.setSoTimeout(this.timeout);
        if (bindingCommunicationInitialSocket()) {
            return;
        }
        this.timer.schedule(new BindingLifetimeTask(), this.binarySearchLifetime);
        LOGGER.debug("Timer scheduled initially: " + this.binarySearchLifetime + ".");
    }
}
