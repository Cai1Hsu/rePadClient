package org.jivesoftware.smack.util.dns;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import javax.naming.NamingEnumeration;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import org.jivesoftware.smack.util.DNSUtil;

/* loaded from: classes.jar:org/jivesoftware/smack/util/dns/JavaxResolver.class */
public class JavaxResolver implements DNSResolver {
    private static DirContext dirContext;
    private static JavaxResolver instance;

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:6:0x0025 -> B:3:0x001e). Please submit an issue!!! */
    static {
        try {
            Hashtable hashtable = new Hashtable();
            hashtable.put("java.naming.factory.initial", "com.sun.jndi.dns.DnsContextFactory");
            dirContext = new InitialDirContext(hashtable);
        } catch (Exception e) {
        }
        DNSUtil.setDNSResolver(getInstance());
    }

    private JavaxResolver() {
    }

    public static DNSResolver getInstance() {
        if (instance == null && isSupported()) {
            instance = new JavaxResolver();
        }
        return instance;
    }

    public static boolean isSupported() {
        return dirContext != null;
    }

    @Override // org.jivesoftware.smack.util.dns.DNSResolver
    public List<SRVRecord> lookupSRVRecords(String str) {
        ArrayList arrayList = new ArrayList();
        try {
            NamingEnumeration all = dirContext.getAttributes(str, new String[]{"SRV"}).get("SRV").getAll();
            while (all.hasMore()) {
                String[] split = ((String) all.next()).split(" ");
                try {
                    arrayList.add(new SRVRecord(split[split.length - 1], Integer.parseInt(split[split.length - 2]), Integer.parseInt(split[split.length - 4]), Integer.parseInt(split[split.length - 3])));
                } catch (Exception e) {
                }
            }
        } catch (Exception e2) {
        }
        return arrayList;
    }
}
