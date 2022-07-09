package org.jivesoftware.smack.util.dns;

import java.util.ArrayList;
import java.util.List;
import org.xbill.DNS.Lookup;

/* loaded from: classes.jar:org/jivesoftware/smack/util/dns/DNSJavaResolver.class */
public class DNSJavaResolver implements DNSResolver {
    private static DNSJavaResolver instance = new DNSJavaResolver();

    private DNSJavaResolver() {
    }

    public static DNSResolver getInstance() {
        return instance;
    }

    @Override // org.jivesoftware.smack.util.dns.DNSResolver
    public List<SRVRecord> lookupSRVRecords(String str) {
        ArrayList arrayList = new ArrayList();
        try {
            org.xbill.DNS.SRVRecord[] run = new Lookup(str, 33).run();
            if (run != null) {
                for (org.xbill.DNS.SRVRecord sRVRecord : run) {
                    if (sRVRecord != null && sRVRecord.getTarget() != null) {
                        try {
                            arrayList.add(new SRVRecord(sRVRecord.getTarget().toString(), sRVRecord.getPort(), sRVRecord.getPriority(), sRVRecord.getWeight()));
                        } catch (Exception e) {
                        }
                    }
                }
            }
        } catch (Exception e2) {
        }
        return arrayList;
    }
}
