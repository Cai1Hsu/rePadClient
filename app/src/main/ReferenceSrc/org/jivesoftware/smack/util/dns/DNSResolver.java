package org.jivesoftware.smack.util.dns;

import java.util.List;

/* loaded from: classes.jar:org/jivesoftware/smack/util/dns/DNSResolver.class */
public interface DNSResolver {
    List<SRVRecord> lookupSRVRecords(String str);
}
