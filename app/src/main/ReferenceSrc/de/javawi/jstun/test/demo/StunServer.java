package de.javawi.jstun.test.demo;

import de.javawi.jstun.attribute.ChangeRequest;
import de.javawi.jstun.attribute.ChangedAddress;
import de.javawi.jstun.attribute.MappedAddress;
import de.javawi.jstun.attribute.MessageAttributeException;
import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.attribute.MessageAttributeParsingException;
import de.javawi.jstun.attribute.ResponseAddress;
import de.javawi.jstun.attribute.SourceAddress;
import de.javawi.jstun.attribute.UnknownAttribute;
import de.javawi.jstun.attribute.UnknownMessageAttributeException;
import de.javawi.jstun.header.MessageHeader;
import de.javawi.jstun.header.MessageHeaderInterface;
import de.javawi.jstun.header.MessageHeaderParsingException;
import de.javawi.jstun.util.Address;
import de.javawi.jstun.util.UtilityException;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Iterator;
import java.util.Vector;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/test/demo/StunServer.class */
public class StunServer {
    private static final Log LOGGER = LogFactory.getLog(StunServer.class);
    Vector<DatagramSocket> sockets = new Vector<>();

    /* loaded from: classes.jar:de/javawi/jstun/test/demo/StunServer$StunServerReceiverThread.class */
    class StunServerReceiverThread extends Thread {
        private DatagramSocket changedIP;
        private DatagramSocket changedPort;
        private DatagramSocket changedPortIP;
        private DatagramSocket receiverSocket;

        StunServerReceiverThread(DatagramSocket datagramSocket) {
            StunServer.this = r4;
            this.receiverSocket = datagramSocket;
            Iterator<DatagramSocket> it = r4.sockets.iterator();
            while (it.hasNext()) {
                DatagramSocket next = it.next();
                if (next.getLocalPort() != this.receiverSocket.getLocalPort() && next.getLocalAddress().equals(this.receiverSocket.getLocalAddress())) {
                    this.changedPort = next;
                }
                if (next.getLocalPort() == this.receiverSocket.getLocalPort() && !next.getLocalAddress().equals(this.receiverSocket.getLocalAddress())) {
                    this.changedIP = next;
                }
                if (next.getLocalPort() != this.receiverSocket.getLocalPort() && !next.getLocalAddress().equals(this.receiverSocket.getLocalAddress())) {
                    this.changedPortIP = next;
                }
            }
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            while (true) {
                try {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[200], 200);
                    this.receiverSocket.receive(datagramPacket);
                    StunServer.LOGGER.debug(this.receiverSocket.getLocalAddress().getHostAddress() + ":" + this.receiverSocket.getLocalPort() + " datagram received from " + datagramPacket.getAddress().getHostAddress() + ":" + datagramPacket.getPort());
                    MessageHeader parseHeader = MessageHeader.parseHeader(datagramPacket.getData());
                    try {
                        parseHeader.parseAttributes(datagramPacket.getData());
                        if (parseHeader.getType() == MessageHeaderInterface.MessageHeaderType.BindingRequest) {
                            StunServer.LOGGER.debug(this.receiverSocket.getLocalAddress().getHostAddress() + ":" + this.receiverSocket.getLocalPort() + " Binding Request received from " + datagramPacket.getAddress().getHostAddress() + ":" + datagramPacket.getPort());
                            ChangeRequest changeRequest = (ChangeRequest) parseHeader.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ChangeRequest);
                            if (changeRequest == null) {
                                throw new MessageAttributeException("Message attribute change request is not set.");
                            }
                            ResponseAddress responseAddress = (ResponseAddress) parseHeader.getMessageAttribute(MessageAttributeInterface.MessageAttributeType.ResponseAddress);
                            MessageHeader messageHeader = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingResponse);
                            messageHeader.setTransactionID(parseHeader.getTransactionID());
                            MappedAddress mappedAddress = new MappedAddress();
                            mappedAddress.setAddress(new Address(datagramPacket.getAddress().getAddress()));
                            mappedAddress.setPort(datagramPacket.getPort());
                            messageHeader.addMessageAttribute(mappedAddress);
                            ChangedAddress changedAddress = new ChangedAddress();
                            changedAddress.setAddress(new Address(this.changedPortIP.getLocalAddress().getAddress()));
                            changedAddress.setPort(this.changedPortIP.getLocalPort());
                            messageHeader.addMessageAttribute(changedAddress);
                            if (changeRequest.isChangePort() && !changeRequest.isChangeIP()) {
                                StunServer.LOGGER.debug("Change port received in Change Request attribute");
                                SourceAddress sourceAddress = new SourceAddress();
                                sourceAddress.setAddress(new Address(this.changedPort.getLocalAddress().getAddress()));
                                sourceAddress.setPort(this.changedPort.getLocalPort());
                                messageHeader.addMessageAttribute(sourceAddress);
                                byte[] bytes = messageHeader.getBytes();
                                DatagramPacket datagramPacket2 = new DatagramPacket(bytes, bytes.length);
                                if (responseAddress != null) {
                                    datagramPacket2.setPort(responseAddress.getPort());
                                    datagramPacket2.setAddress(responseAddress.getAddress().getInetAddress());
                                } else {
                                    datagramPacket2.setPort(datagramPacket.getPort());
                                    datagramPacket2.setAddress(datagramPacket.getAddress());
                                }
                                this.changedPort.send(datagramPacket2);
                                StunServer.LOGGER.debug(this.changedPort.getLocalAddress().getHostAddress() + ":" + this.changedPort.getLocalPort() + " send Binding Response to " + datagramPacket2.getAddress().getHostAddress() + ":" + datagramPacket2.getPort());
                            } else if (!changeRequest.isChangePort() && changeRequest.isChangeIP()) {
                                StunServer.LOGGER.debug("Change ip received in Change Request attribute");
                                SourceAddress sourceAddress2 = new SourceAddress();
                                sourceAddress2.setAddress(new Address(this.changedIP.getLocalAddress().getAddress()));
                                sourceAddress2.setPort(this.changedIP.getLocalPort());
                                messageHeader.addMessageAttribute(sourceAddress2);
                                byte[] bytes2 = messageHeader.getBytes();
                                DatagramPacket datagramPacket3 = new DatagramPacket(bytes2, bytes2.length);
                                if (responseAddress != null) {
                                    datagramPacket3.setPort(responseAddress.getPort());
                                    datagramPacket3.setAddress(responseAddress.getAddress().getInetAddress());
                                } else {
                                    datagramPacket3.setPort(datagramPacket.getPort());
                                    datagramPacket3.setAddress(datagramPacket.getAddress());
                                }
                                this.changedIP.send(datagramPacket3);
                                StunServer.LOGGER.debug(this.changedIP.getLocalAddress().getHostAddress() + ":" + this.changedIP.getLocalPort() + " send Binding Response to " + datagramPacket3.getAddress().getHostAddress() + ":" + datagramPacket3.getPort());
                            } else if (!changeRequest.isChangePort() && !changeRequest.isChangeIP()) {
                                StunServer.LOGGER.debug("Nothing received in Change Request attribute");
                                SourceAddress sourceAddress3 = new SourceAddress();
                                sourceAddress3.setAddress(new Address(this.receiverSocket.getLocalAddress().getAddress()));
                                sourceAddress3.setPort(this.receiverSocket.getLocalPort());
                                messageHeader.addMessageAttribute(sourceAddress3);
                                byte[] bytes3 = messageHeader.getBytes();
                                DatagramPacket datagramPacket4 = new DatagramPacket(bytes3, bytes3.length);
                                if (responseAddress != null) {
                                    datagramPacket4.setPort(responseAddress.getPort());
                                    datagramPacket4.setAddress(responseAddress.getAddress().getInetAddress());
                                } else {
                                    datagramPacket4.setPort(datagramPacket.getPort());
                                    datagramPacket4.setAddress(datagramPacket.getAddress());
                                }
                                this.receiverSocket.send(datagramPacket4);
                                StunServer.LOGGER.debug(this.receiverSocket.getLocalAddress().getHostAddress() + ":" + this.receiverSocket.getLocalPort() + " send Binding Response to " + datagramPacket4.getAddress().getHostAddress() + ":" + datagramPacket4.getPort());
                            } else if (changeRequest.isChangePort() && changeRequest.isChangeIP()) {
                                StunServer.LOGGER.debug("Change port and ip received in Change Request attribute");
                                SourceAddress sourceAddress4 = new SourceAddress();
                                sourceAddress4.setAddress(new Address(this.changedPortIP.getLocalAddress().getAddress()));
                                sourceAddress4.setPort(this.changedPortIP.getLocalPort());
                                messageHeader.addMessageAttribute(sourceAddress4);
                                byte[] bytes4 = messageHeader.getBytes();
                                DatagramPacket datagramPacket5 = new DatagramPacket(bytes4, bytes4.length);
                                if (responseAddress != null) {
                                    datagramPacket5.setPort(responseAddress.getPort());
                                    datagramPacket5.setAddress(responseAddress.getAddress().getInetAddress());
                                } else {
                                    datagramPacket5.setPort(datagramPacket.getPort());
                                    datagramPacket5.setAddress(datagramPacket.getAddress());
                                }
                                this.changedPortIP.send(datagramPacket5);
                                StunServer.LOGGER.debug(this.changedPortIP.getLocalAddress().getHostAddress() + ":" + this.changedPortIP.getLocalPort() + " send Binding Response to " + datagramPacket5.getAddress().getHostAddress() + ":" + datagramPacket5.getPort());
                            }
                        } else {
                            continue;
                        }
                    } catch (UnknownMessageAttributeException e) {
                        e.printStackTrace();
                        MessageHeader messageHeader2 = new MessageHeader(MessageHeaderInterface.MessageHeaderType.BindingErrorResponse);
                        messageHeader2.setTransactionID(parseHeader.getTransactionID());
                        UnknownAttribute unknownAttribute = new UnknownAttribute();
                        unknownAttribute.addAttribute(e.getType());
                        messageHeader2.addMessageAttribute(unknownAttribute);
                        byte[] bytes5 = messageHeader2.getBytes();
                        DatagramPacket datagramPacket6 = new DatagramPacket(bytes5, bytes5.length);
                        datagramPacket6.setPort(datagramPacket.getPort());
                        datagramPacket6.setAddress(datagramPacket.getAddress());
                        this.receiverSocket.send(datagramPacket6);
                        StunServer.LOGGER.debug(this.changedPortIP.getLocalAddress().getHostAddress() + ":" + this.changedPortIP.getLocalPort() + " send Binding Error Response to " + datagramPacket6.getAddress().getHostAddress() + ":" + datagramPacket6.getPort());
                    }
                } catch (MessageAttributeParsingException e2) {
                    e2.printStackTrace();
                } catch (MessageAttributeException e3) {
                    e3.printStackTrace();
                } catch (MessageHeaderParsingException e4) {
                    e4.printStackTrace();
                } catch (UtilityException e5) {
                    e5.printStackTrace();
                } catch (IOException e6) {
                    e6.printStackTrace();
                } catch (ArrayIndexOutOfBoundsException e7) {
                    e7.printStackTrace();
                }
            }
        }
    }

    public StunServer(int i, InetAddress inetAddress, int i2, InetAddress inetAddress2) throws SocketException {
        this.sockets.add(new DatagramSocket(i, inetAddress));
        this.sockets.add(new DatagramSocket(i2, inetAddress));
        this.sockets.add(new DatagramSocket(i, inetAddress2));
        this.sockets.add(new DatagramSocket(i2, inetAddress2));
    }

    public static void main(String[] strArr) {
        try {
            if (strArr.length != 4) {
                System.out.println("usage: java de.javawi.jstun.test.demo.StunServer PORT1 IP1 PORT2 IP2");
                System.out.println();
                System.out.println(" PORT1 - the first port that should be used by the server");
                System.out.println("   IP1 - the first ip address that should be used by the server");
                System.out.println(" PORT2 - the second port that should be used by the server");
                System.out.println("   IP2 - the second ip address that should be used by the server");
                System.exit(0);
            }
            FileHandler fileHandler = new FileHandler("logging_server.txt");
            fileHandler.setFormatter(new SimpleFormatter());
            Logger.getLogger("de.javawi.stun").addHandler(fileHandler);
            Logger.getLogger("de.javawi.stun").setLevel(Level.ALL);
            new StunServer(Integer.parseInt(strArr[0]), InetAddress.getByName(strArr[1]), Integer.parseInt(strArr[2]), InetAddress.getByName(strArr[3])).start();
        } catch (SocketException e) {
            e.printStackTrace();
        } catch (UnknownHostException e2) {
            e2.printStackTrace();
        } catch (IOException e3) {
            e3.printStackTrace();
        }
    }

    public void start() throws SocketException {
        Iterator<DatagramSocket> it = this.sockets.iterator();
        while (it.hasNext()) {
            DatagramSocket next = it.next();
            next.setReceiveBufferSize(2000);
            new StunServerReceiverThread(next).start();
        }
    }
}
