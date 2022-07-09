package org.jivesoftware.smackx.entitycaps.cache;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smack.util.Base32Encoder;
import org.jivesoftware.smack.util.StringEncoder;
import org.jivesoftware.smackx.entitycaps.EntityCapsManager;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.provider.DiscoverInfoProvider;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smackx/entitycaps/cache/SimpleDirectoryPersistentCache.class */
public class SimpleDirectoryPersistentCache implements EntityCapsPersistentCache {
    private File cacheDir;
    private StringEncoder filenameEncoder;

    public SimpleDirectoryPersistentCache(File file) {
        this(file, Base32Encoder.getInstance());
    }

    public SimpleDirectoryPersistentCache(File file, StringEncoder stringEncoder) {
        if (!file.exists()) {
            throw new IllegalStateException("Cache directory \"" + file + "\" does not exist");
        }
        if (!file.isDirectory()) {
            throw new IllegalStateException("Cache directory \"" + file + "\" is not a directory");
        }
        this.cacheDir = file;
        this.filenameEncoder = stringEncoder;
    }

    private static DiscoverInfo restoreInfoFromFile(File file) throws IOException {
        DiscoverInfo discoverInfo;
        DataInputStream dataInputStream = new DataInputStream(new FileInputStream(file));
        try {
            String readUTF = dataInputStream.readUTF();
            if (readUTF == null) {
                discoverInfo = null;
            } else {
                StringReader stringReader = new StringReader(readUTF);
                try {
                    MXParser mXParser = new MXParser();
                    mXParser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
                    mXParser.setInput(stringReader);
                    DiscoverInfoProvider discoverInfoProvider = new DiscoverInfoProvider();
                    try {
                        mXParser.next();
                        String attributeValue = mXParser.getAttributeValue("", "id");
                        String attributeValue2 = mXParser.getAttributeValue("", PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM);
                        String attributeValue3 = mXParser.getAttributeValue("", "to");
                        mXParser.next();
                        try {
                            discoverInfo = (DiscoverInfo) discoverInfoProvider.parseIQ(mXParser);
                            discoverInfo.setPacketID(attributeValue);
                            discoverInfo.setFrom(attributeValue2);
                            discoverInfo.setTo(attributeValue3);
                            discoverInfo.setType(IQ.Type.RESULT);
                        } catch (Exception e) {
                            discoverInfo = null;
                        }
                    } catch (XmlPullParserException e2) {
                        discoverInfo = null;
                    }
                } catch (XmlPullParserException e3) {
                    e3.printStackTrace();
                    discoverInfo = null;
                }
            }
            return discoverInfo;
        } finally {
            dataInputStream.close();
        }
    }

    private static void writeInfoToFile(File file, DiscoverInfo discoverInfo) throws IOException {
        DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(file));
        try {
            dataOutputStream.writeUTF(discoverInfo.toXML());
        } finally {
            dataOutputStream.close();
        }
    }

    @Override // org.jivesoftware.smackx.entitycaps.cache.EntityCapsPersistentCache
    public void addDiscoverInfoByNodePersistent(String str, DiscoverInfo discoverInfo) {
        File file = new File(this.cacheDir, this.filenameEncoder.encode(str));
        try {
            if (!file.createNewFile()) {
                return;
            }
            writeInfoToFile(file, discoverInfo);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override // org.jivesoftware.smackx.entitycaps.cache.EntityCapsPersistentCache
    public void emptyCache() {
        for (File file : this.cacheDir.listFiles()) {
            file.delete();
        }
    }

    @Override // org.jivesoftware.smackx.entitycaps.cache.EntityCapsPersistentCache
    public void replay() throws IOException {
        File[] listFiles;
        for (File file : this.cacheDir.listFiles()) {
            String decode = this.filenameEncoder.decode(file.getName());
            DiscoverInfo restoreInfoFromFile = restoreInfoFromFile(file);
            if (restoreInfoFromFile != null) {
                EntityCapsManager.addDiscoverInfoByNode(decode, restoreInfoFromFile);
            }
        }
    }
}
