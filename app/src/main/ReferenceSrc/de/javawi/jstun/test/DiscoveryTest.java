package de.javawi.jstun.test;

import de.javawi.jstun.attribute.ChangeRequest;
import de.javawi.jstun.attribute.ChangedAddress;
import de.javawi.jstun.attribute.ErrorCode;
import de.javawi.jstun.attribute.MappedAddress;
import de.javawi.jstun.attribute.MessageAttributeException;
import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.attribute.MessageAttributeParsingException;
import de.javawi.jstun.header.MessageHeader;
import de.javawi.jstun.header.MessageHeaderInterface;
import de.javawi.jstun.header.MessageHeaderParsingException;
import de.javawi.jstun.test.demo.StunServer;
import de.javawi.jstun.util.UtilityException;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:de/javawi/jstun/test/DiscoveryTest.class */
public class DiscoveryTest {
    private static final Log LOGGER = LogFactory.getLog(StunServer.class);
    InetAddress iaddress;
    int port;
    String stunServer;
    int timeoutInitValue = HttpStatus.SC_MULTIPLE_CHOICES;
    MappedAddress ma = null;
    ChangedAddress ca = null;
    boolean nodeNatted = true;
    DatagramSocket socketTest1 = null;
    DiscoveryInfo di = null;

    public DiscoveryTest(InetAddress inetAddress, String str, int i) {
        this.iaddress = inetAddress;
        this.stunServer = str;
        this.port = i;
    }

    private boolean test1() throws UtilityException, SocketException, UnknownHostException, IOException, MessageAttributeParsingException, MessageHeaderParsingException {
        boolean z;
        int i = 0;
        int i2 = this.timeoutInitValue;
        while (true) {
            try {
                this.socketTest1 = new DatagramSocket(new InetSocketAddress(this.iaddress, 0));
                this.socketTest1.setReuseAddress(true);
                this.socketTest1.connect(InetAddress.getByName(this.stunServer), this.port);
                this.socketTest1.setSoTimeout(i2);
                MessageHeader messageHeader = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingRequest);
                messageHeader.generateTransactionID();
                messageHeader.addMessageAttribute(new ChangeRequest());
                byte[] bytes = messageHeader.getBytes();
                this.socketTest1.send(new DatagramPacket(bytes, bytes.length));
                LOGGER.debug("STUN test for " + this.iaddress + ": Test 1: Binding Request sent.");
                MessageHeader messageHeader2 = new MessageHeader();
                while (!messageHeader2.equalTransactionID(messageHeader)) {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[200], 200);
                    this.socketTest1.receive(datagramPacket);
                    messageHeader2 = MessageHeader.parseHeader(datagramPacket.getData());
                    messageHeader2.parseAttributes(datagramPacket.getData());
                }
                this.ma = (MappedAddress) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.MappedAddress);
                this.ca = (ChangedAddress) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ChangedAddress);
                ErrorCode errorCode = (ErrorCode) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ErrorCode);
                if (errorCode != null) {
                    this.di.setError(errorCode.getResponseCode(), errorCode.getReason());
                    LOGGER.debug("STUN test for " + this.iaddress + ": Message header contains an Errorcode message attribute.");
                    z = false;
                } else if (this.ma == null || this.ca == null) {
                    this.di.setError(700, "The server is sending an incomplete response (Mapped Address and Changed Address message attributes are missing). The client should not retry.");
                    LOGGER.debug("STUN test for " + this.iaddress + ": Response does not contain a Mapped Address or Changed Address message attribute.");
                    z = false;
                } else {
                    this.di.setPublicIP(this.ma.getAddress().getInetAddress());
                    if (this.ma.getPort() != this.socketTest1.getLocalPort() || !this.ma.getAddress().getInetAddress().equals(this.socketTest1.getLocalAddress())) {
                        LOGGER.debug("STUN test for " + this.iaddress + ": Node is natted.");
                    } else {
                        LOGGER.debug("STUN test for " + this.iaddress + ": Node is not natted.");
                        this.nodeNatted = false;
                    }
                    z = true;
                }
            } catch (SocketTimeoutException e) {
                if (i >= 7900) {
                    LOGGER.debug("STUN test for " + this.iaddress + ": Test 1: Socket timeout while receiving the response. Maximum retry limit exceed. Give up.");
                    this.di.setBlockedUDP();
                    LOGGER.debug("STUN test for " + this.iaddress + ": Node is not capable of UDP communication.");
                    z = false;
                    break;
                }
                LOGGER.debug("STUN test for " + this.iaddress + ": Test 1: Socket timeout while receiving the response.");
                i += i2;
                int i3 = i * 2;
                i2 = i3;
                if (i3 > 1600) {
                    i2 = 1600;
                }
            }
        }
        return z;
    }

    private boolean test1Redo() throws UtilityException, SocketException, UnknownHostException, IOException, MessageAttributeParsingException, MessageHeaderParsingException {
        boolean z;
        int i = 0;
        int i2 = this.timeoutInitValue;
        while (true) {
            try {
                this.socketTest1.connect(this.ca.getAddress().getInetAddress(), this.ca.getPort());
                this.socketTest1.setSoTimeout(i2);
                MessageHeader messageHeader = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingRequest);
                messageHeader.generateTransactionID();
                messageHeader.addMessageAttribute(new ChangeRequest());
                byte[] bytes = messageHeader.getBytes();
                this.socketTest1.send(new DatagramPacket(bytes, bytes.length));
                LOGGER.debug("STUN test for " + this.iaddress + ": Test 1 redo with changed address: Binding Request sent.");
                MessageHeader messageHeader2 = new MessageHeader();
                while (!messageHeader2.equalTransactionID(messageHeader)) {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[200], 200);
                    this.socketTest1.receive(datagramPacket);
                    messageHeader2 = MessageHeader.parseHeader(datagramPacket.getData());
                    messageHeader2.parseAttributes(datagramPacket.getData());
                }
                MappedAddress mappedAddress = (MappedAddress) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.MappedAddress);
                ErrorCode errorCode = (ErrorCode) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ErrorCode);
                if (errorCode != null) {
                    this.di.setError(errorCode.getResponseCode(), errorCode.getReason());
                    LOGGER.debug("STUN test for " + this.iaddress + ": Message header contains an Errorcode message attribute.");
                    z = false;
                } else if (mappedAddress == null) {
                    this.di.setError(700, "The server is sending an incomplete response (Mapped Address message attribute is missing). The client should not retry.");
                    LOGGER.debug("STUN test for " + this.iaddress + ": Response does not contain a Mapped Address message attribute.");
                    z = false;
                } else if (this.ma.getPort() != mappedAddress.getPort() || !this.ma.getAddress().getInetAddress().equals(mappedAddress.getAddress().getInetAddress())) {
                    this.di.setSymmetric();
                    LOGGER.debug("STUN test for " + this.iaddress + ": Node is behind a symmetric NAT.");
                    z = false;
                } else {
                    z = true;
                }
            } catch (SocketTimeoutException e) {
                if (i >= 7900) {
                    LOGGER.debug("STUN test for " + this.iaddress + ": Test 1 redo with changed address: Socket timeout while receiving the response.  Maximum retry limit exceed. Give up.");
                    z = false;
                    break;
                }
                LOGGER.debug("STUN test for " + this.iaddress + ": Test 1 redo with changed address: Socket timeout while receiving the response.");
                i += i2;
                int i3 = i * 2;
                i2 = i3;
                if (i3 > 1600) {
                    i2 = 1600;
                }
            }
        }
        return z;
    }

    private boolean test2() throws UtilityException, SocketException, UnknownHostException, IOException, MessageAttributeParsingException, MessageAttributeException, MessageHeaderParsingException {
        boolean z;
        int i = 0;
        int i2 = this.timeoutInitValue;
        while (true) {
            try {
                DatagramSocket datagramSocket = new DatagramSocket(new InetSocketAddress(this.iaddress, 0));
                datagramSocket.connect(InetAddress.getByName(this.stunServer), this.port);
                datagramSocket.setSoTimeout(i2);
                MessageHeader messageHeader = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingRequest);
                messageHeader.generateTransactionID();
                ChangeRequest changeRequest = new ChangeRequest();
                changeRequest.setChangeIP();
                changeRequest.setChangePort();
                messageHeader.addMessageAttribute(changeRequest);
                byte[] bytes = messageHeader.getBytes();
                datagramSocket.send(new DatagramPacket(bytes, bytes.length));
                LOGGER.debug("STUN test for " + this.iaddress + ": Test 2: Binding Request sent.");
                int localPort = datagramSocket.getLocalPort();
                InetAddress localAddress = datagramSocket.getLocalAddress();
                datagramSocket.close();
                DatagramSocket datagramSocket2 = new DatagramSocket(localPort, localAddress);
                datagramSocket2.connect(this.ca.getAddress().getInetAddress(), this.ca.getPort());
                datagramSocket2.setSoTimeout(i2);
                MessageHeader messageHeader2 = new MessageHeader();
                while (!messageHeader2.equalTransactionID(messageHeader)) {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[200], 200);
                    datagramSocket2.receive(datagramPacket);
                    messageHeader2 = MessageHeader.parseHeader(datagramPacket.getData());
                    messageHeader2.parseAttributes(datagramPacket.getData());
                }
                ErrorCode errorCode = (ErrorCode) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ErrorCode);
                if (errorCode != null) {
                    this.di.setError(errorCode.getResponseCode(), errorCode.getReason());
                    LOGGER.debug("STUN test for " + this.iaddress + ": Message header contains an Errorcode message attribute.");
                    z = false;
                } else {
                    if (!this.nodeNatted) {
                        this.di.setOpenAccess();
                        LOGGER.debug("STUN test for " + this.iaddress + ": Node has open access to the Internet (or, at least the node is behind a full-cone NAT without translation).");
                    } else {
                        this.di.setFullCone();
                        LOGGER.debug("STUN test for " + this.iaddress + ": Node is behind a full-cone NAT.");
                    }
                    z = false;
                }
            } catch (SocketTimeoutException e) {
                if (i < 7900) {
                    LOGGER.debug("STUN test for " + this.iaddress + ": Test 2: Socket timeout while receiving the response.");
                    i += i2;
                    int i3 = i * 2;
                    i2 = i3;
                    if (i3 > 1600) {
                        i2 = 1600;
                    }
                } else {
                    LOGGER.debug("STUN test for " + this.iaddress + ": Test 2: Socket timeout while receiving the response. Maximum retry limit exceed. Give up.");
                    if (!this.nodeNatted) {
                        this.di.setSymmetricUDPFirewall();
                        LOGGER.debug("STUN test for " + this.iaddress + ": Node is behind a symmetric UDP firewall.");
                        z = false;
                    } else {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    private void test3() throws UtilityException, SocketException, UnknownHostException, IOException, MessageAttributeParsingException, MessageAttributeException, MessageHeaderParsingException {
        ErrorCode errorCode;
        int i = 0;
        int i2 = this.timeoutInitValue;
        while (true) {
            try {
                DatagramSocket datagramSocket = new DatagramSocket(new InetSocketAddress(this.iaddress, 0));
                datagramSocket.connect(InetAddress.getByName(this.stunServer), this.port);
                datagramSocket.setSoTimeout(i2);
                MessageHeader messageHeader = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingRequest);
                messageHeader.generateTransactionID();
                ChangeRequest changeRequest = new ChangeRequest();
                changeRequest.setChangePort();
                messageHeader.addMessageAttribute(changeRequest);
                byte[] bytes = messageHeader.getBytes();
                datagramSocket.send(new DatagramPacket(bytes, bytes.length));
                LOGGER.debug("STUN test for " + this.iaddress + ": Test 3: Binding Request sent.");
                int localPort = datagramSocket.getLocalPort();
                InetAddress localAddress = datagramSocket.getLocalAddress();
                datagramSocket.close();
                DatagramSocket datagramSocket2 = new DatagramSocket(localPort, localAddress);
                datagramSocket2.connect(InetAddress.getByName(this.stunServer), this.ca.getPort());
                datagramSocket2.setSoTimeout(i2);
                MessageHeader messageHeader2 = new MessageHeader();
                while (!messageHeader2.equalTransactionID(messageHeader)) {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[200], 200);
                    datagramSocket2.receive(datagramPacket);
                    messageHeader2 = MessageHeader.parseHeader(datagramPacket.getData());
                    messageHeader2.parseAttributes(datagramPacket.getData());
                }
                errorCode = (ErrorCode) messageHeader2.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ErrorCode);
            } catch (SocketTimeoutException e) {
                if (i >= 7900) {
                    LOGGER.debug("STUN test for " + this.iaddress + ": Test 3: Socket timeout while receiving the response. Maximum retry limit exceed. Give up.");
                    this.di.setPortRestrictedCone();
                    LOGGER.debug("STUN test for " + this.iaddress + ": Node is behind a port restricted NAT.");
                    return;
                }
                LOGGER.debug("STUN test for " + this.iaddress + ": Test 3: Socket timeout while receiving the response.");
                int i3 = i + i2;
                int i4 = i3 * 2;
                int i5 = i4;
                if (i4 > 1600) {
                    i5 = 1600;
                }
                i2 = i5;
                i = i3;
            }
            if (errorCode != null) {
                this.di.setError(errorCode.getResponseCode(), errorCode.getReason());
                LOGGER.debug("STUN test for " + this.iaddress + ": Message header contains an Errorcode message attribute.");
                return;
            } else if (this.nodeNatted) {
                this.di.setRestrictedCone();
                LOGGER.debug("STUN test for " + this.iaddress + ": Node is behind a restricted NAT.");
                return;
            }
        }
    }

    public DiscoveryInfo test() throws UtilityException, SocketException, UnknownHostException, IOException, MessageAttributeParsingException, MessageAttributeException, MessageHeaderParsingException {
        this.ma = null;
        this.ca = null;
        this.nodeNatted = true;
        this.socketTest1 = null;
        this.di = new DiscoveryInfo(this.iaddress);
        LOGGER.debug("JSTUN intf test: addr: " + this.iaddress + " server: " + this.stunServer + ":" + this.port);
        if (test1() && test2() && test1Redo()) {
            test3();
        }
        this.socketTest1.close();
        return this.di;
    }
}
