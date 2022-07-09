package org.jivesoftware.smackx.filetransfer;

import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamManager;
import org.jivesoftware.smackx.bytestreams.socks5.Socks5BytestreamManager;
import org.jivesoftware.smackx.packet.DataForm;
import org.jivesoftware.smackx.packet.StreamInitiation;

/* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/FileTransferNegotiator.class */
public class FileTransferNegotiator {
    public static boolean IBB_ONLY = false;
    protected static final String STREAM_DATA_FIELD_NAME = "stream-method";
    private static final String STREAM_INIT_PREFIX = "jsi_";
    private final StreamNegotiator byteStreamTransferManager;
    private final Connection connection;
    private final StreamNegotiator inbandTransferManager;
    private static final String[] NAMESPACE = {"http://jabber.org/protocol/si/profile/file-transfer", "http://jabber.org/protocol/si"};
    private static final Map<Connection, FileTransferNegotiator> transferObject = new ConcurrentHashMap();
    private static final Random randomGenerator = new Random();

    static {
        boolean z = true;
        if (System.getProperty("ibb") == null) {
            z = false;
        }
        IBB_ONLY = z;
    }

    private FileTransferNegotiator(Connection connection) {
        configureConnection(connection);
        this.connection = connection;
        this.byteStreamTransferManager = new Socks5TransferNegotiator(connection);
        this.inbandTransferManager = new IBBTransferNegotiator(connection);
    }

    public void cleanup(Connection connection) {
        if (transferObject.remove(connection) != null) {
            this.inbandTransferManager.cleanup();
        }
    }

    private void configureConnection(final Connection connection) {
        connection.addConnectionListener(new ConnectionListener() { // from class: org.jivesoftware.smackx.filetransfer.FileTransferNegotiator.2
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                FileTransferNegotiator.this.cleanup(connection);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception exc) {
                FileTransferNegotiator.this.cleanup(connection);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectingIn(int i) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionFailed(Exception exc) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionSuccessful() {
            }
        });
    }

    private DataForm createDefaultInitiationForm() {
        DataForm dataForm = new DataForm(Form.TYPE_FORM);
        FormField formField = new FormField(STREAM_DATA_FIELD_NAME);
        formField.setType(FormField.TYPE_LIST_SINGLE);
        if (!IBB_ONLY) {
            formField.addOption(new FormField.Option(Socks5BytestreamManager.NAMESPACE));
        }
        formField.addOption(new FormField.Option(InBandBytestreamManager.NAMESPACE));
        dataForm.addField(formField);
        return dataForm;
    }

    public static IQ createIQ(String str, String str2, String str3, IQ.Type type) {
        IQ iq = new IQ() { // from class: org.jivesoftware.smackx.filetransfer.FileTransferNegotiator.1
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                return null;
            }
        };
        iq.setPacketID(str);
        iq.setTo(str2);
        iq.setFrom(str3);
        iq.setType(type);
        return iq;
    }

    public static FileTransferNegotiator getInstanceFor(Connection connection) {
        FileTransferNegotiator fileTransferNegotiator;
        if (connection == null) {
            throw new IllegalArgumentException("Connection cannot be null");
        }
        if (!connection.isConnected()) {
            fileTransferNegotiator = null;
        } else if (transferObject.containsKey(connection)) {
            fileTransferNegotiator = transferObject.get(connection);
        } else {
            FileTransferNegotiator fileTransferNegotiator2 = new FileTransferNegotiator(connection);
            setServiceEnabled(connection, true);
            transferObject.put(connection, fileTransferNegotiator2);
            fileTransferNegotiator = fileTransferNegotiator2;
        }
        return fileTransferNegotiator;
    }

    private StreamNegotiator getNegotiator(FormField formField) throws XMPPException {
        boolean z = false;
        boolean z2 = false;
        Iterator<FormField.Option> options = formField.getOptions();
        while (options.hasNext()) {
            String value = options.next().getValue();
            if (value.equals(Socks5BytestreamManager.NAMESPACE) && !IBB_ONLY) {
                z = true;
            } else if (value.equals(InBandBytestreamManager.NAMESPACE)) {
                z2 = true;
            }
        }
        if (z || z2) {
            return (!z || !z2) ? z ? this.byteStreamTransferManager : this.inbandTransferManager : new FaultTolerantNegotiator(this.connection, this.byteStreamTransferManager, this.inbandTransferManager);
        }
        XMPPError xMPPError = new XMPPError(XMPPError.Condition.bad_request, "No acceptable transfer mechanism");
        throw new XMPPException(xMPPError.getMessage(), xMPPError);
    }

    private StreamNegotiator getOutgoingNegotiator(FormField formField) throws XMPPException {
        boolean z = false;
        boolean z2 = false;
        Iterator<String> values = formField.getValues();
        while (values.hasNext()) {
            String next = values.next();
            if (next.equals(Socks5BytestreamManager.NAMESPACE) && !IBB_ONLY) {
                z = true;
            } else if (next.equals(InBandBytestreamManager.NAMESPACE)) {
                z2 = true;
            }
        }
        if (z || z2) {
            return (!z || !z2) ? z ? this.byteStreamTransferManager : this.inbandTransferManager : new FaultTolerantNegotiator(this.connection, this.byteStreamTransferManager, this.inbandTransferManager);
        }
        XMPPError xMPPError = new XMPPError(XMPPError.Condition.bad_request, "No acceptable transfer mechanism");
        throw new XMPPException(xMPPError.getMessage(), xMPPError);
    }

    private FormField getStreamMethodField(DataForm dataForm) {
        FormField formField;
        Iterator<FormField> fields = dataForm.getFields();
        do {
            formField = null;
            if (!fields.hasNext()) {
                break;
            }
            formField = fields.next();
        } while (!formField.getVariable().equals(STREAM_DATA_FIELD_NAME));
        return formField;
    }

    public static Collection<String> getSupportedProtocols() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(InBandBytestreamManager.NAMESPACE);
        if (!IBB_ONLY) {
            arrayList.add(Socks5BytestreamManager.NAMESPACE);
        }
        return Collections.unmodifiableList(arrayList);
    }

    public static boolean isServiceEnabled(Connection connection) {
        boolean z;
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(connection);
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(Arrays.asList(NAMESPACE));
        arrayList.add(InBandBytestreamManager.NAMESPACE);
        if (!IBB_ONLY) {
            arrayList.add(Socks5BytestreamManager.NAMESPACE);
        }
        Iterator it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = true;
                break;
            } else if (!instanceFor.includesFeature((String) it.next())) {
                z = false;
                break;
            }
        }
        return z;
    }

    public static void setServiceEnabled(Connection connection, boolean z) {
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(connection);
        ArrayList<String> arrayList = new ArrayList();
        arrayList.addAll(Arrays.asList(NAMESPACE));
        arrayList.add(InBandBytestreamManager.NAMESPACE);
        if (!IBB_ONLY) {
            arrayList.add(Socks5BytestreamManager.NAMESPACE);
        }
        for (String str : arrayList) {
            if (!z) {
                instanceFor.removeFeature(str);
            } else if (!instanceFor.includesFeature(str)) {
                instanceFor.addFeature(str);
            }
        }
    }

    public String getNextStreamID() {
        return STREAM_INIT_PREFIX + Math.abs(randomGenerator.nextLong());
    }

    public StreamNegotiator negotiateOutgoingTransfer(String str, String str2, String str3, long j, String str4, int i) throws XMPPException {
        StreamNegotiator streamNegotiator;
        StreamInitiation streamInitiation = new StreamInitiation();
        streamInitiation.setSesssionID(str2);
        streamInitiation.setMimeType(URLConnection.guessContentTypeFromName(str3));
        StreamInitiation.File file = new StreamInitiation.File(str3, j);
        file.setDesc(str4);
        streamInitiation.setFile(file);
        streamInitiation.setFeatureNegotiationForm(createDefaultInitiationForm());
        streamInitiation.setFrom(this.connection.getUser());
        streamInitiation.setTo(str);
        streamInitiation.setType(IQ.Type.SET);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(streamInitiation.getPacketID()));
        this.connection.sendPacket(streamInitiation);
        Packet nextResult = createPacketCollector.nextResult(i);
        createPacketCollector.cancel();
        if (nextResult instanceof IQ) {
            IQ iq = (IQ) nextResult;
            if (!iq.getType().equals(IQ.Type.RESULT)) {
                if (!iq.getType().equals(IQ.Type.ERROR)) {
                    throw new XMPPException("File transfer response unreadable");
                }
                throw new XMPPException(iq.getError());
            }
            streamNegotiator = getOutgoingNegotiator(getStreamMethodField(((StreamInitiation) nextResult).getFeatureNegotiationForm()));
        } else {
            streamNegotiator = null;
        }
        return streamNegotiator;
    }

    public void rejectStream(StreamInitiation streamInitiation) {
        XMPPError xMPPError = new XMPPError(XMPPError.Condition.forbidden, "Offer Declined");
        IQ createIQ = createIQ(streamInitiation.getPacketID(), streamInitiation.getFrom(), streamInitiation.getTo(), IQ.Type.ERROR);
        createIQ.setError(xMPPError);
        this.connection.sendPacket(createIQ);
    }

    public StreamNegotiator selectStreamNegotiator(FileTransferRequest fileTransferRequest) throws XMPPException {
        StreamInitiation streamInitiation = fileTransferRequest.getStreamInitiation();
        FormField streamMethodField = getStreamMethodField(streamInitiation.getFeatureNegotiationForm());
        if (streamMethodField == null) {
            XMPPError xMPPError = new XMPPError(XMPPError.Condition.bad_request, "No stream methods contained in packet.");
            IQ createIQ = createIQ(streamInitiation.getPacketID(), streamInitiation.getFrom(), streamInitiation.getTo(), IQ.Type.ERROR);
            createIQ.setError(xMPPError);
            this.connection.sendPacket(createIQ);
            throw new XMPPException("No stream methods contained in packet.", xMPPError);
        }
        try {
            return getNegotiator(streamMethodField);
        } catch (XMPPException e) {
            IQ createIQ2 = createIQ(streamInitiation.getPacketID(), streamInitiation.getFrom(), streamInitiation.getTo(), IQ.Type.ERROR);
            createIQ2.setError(e.getXMPPError());
            this.connection.sendPacket(createIQ2);
            throw e;
        }
    }
}
