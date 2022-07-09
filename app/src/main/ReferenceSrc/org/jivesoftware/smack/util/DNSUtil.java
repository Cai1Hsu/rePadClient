package org.jivesoftware.smack.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.jivesoftware.smack.util.dns.DNSResolver;
import org.jivesoftware.smack.util.dns.HostAddress;
import org.jivesoftware.smack.util.dns.SRVRecord;

/* loaded from: classes.jar:org/jivesoftware/smack/util/DNSUtil.class */
public class DNSUtil {
    private static Map<String, List<HostAddress>> cache = new Cache(100, 600000);
    private static DNSResolver dnsResolver = null;

    private static int bisect(int[] iArr, double d) {
        int i = 0;
        int length = iArr.length;
        for (int i2 = 0; i2 < length && d >= iArr[i2]; i2++) {
            i++;
        }
        return i;
    }

    public static DNSResolver getDNSResolver() {
        return dnsResolver;
    }

    private static List<HostAddress> resolveDomain(String str, char c) {
        ArrayList arrayList;
        List<HostAddress> list;
        String str2 = c + str;
        if (!cache.containsKey(str2) || (list = cache.get(str2)) == null) {
            ArrayList arrayList2 = new ArrayList();
            List<HostAddress> sortSRVRecords = sortSRVRecords(dnsResolver.lookupSRVRecords(c == 's' ? "_xmpp-server._tcp." + str : c == 'c' ? "_xmpp-client._tcp." + str : str));
            if (sortSRVRecords != null) {
                arrayList2.addAll(sortSRVRecords);
            }
            arrayList2.add(new HostAddress(str));
            cache.put(str2, arrayList2);
            arrayList = arrayList2;
        } else {
            arrayList = list;
        }
        return arrayList;
    }

    public static List<HostAddress> resolveXMPPDomain(String str) {
        ArrayList resolveDomain;
        if (dnsResolver == null) {
            ArrayList arrayList = new ArrayList(1);
            arrayList.add(new HostAddress(str, 5222));
            resolveDomain = arrayList;
        } else {
            resolveDomain = resolveDomain(str, 'c');
        }
        return resolveDomain;
    }

    public static List<HostAddress> resolveXMPPServerDomain(String str) {
        ArrayList resolveDomain;
        if (dnsResolver == null) {
            ArrayList arrayList = new ArrayList(1);
            arrayList.add(new HostAddress(str, 5269));
            resolveDomain = arrayList;
        } else {
            resolveDomain = resolveDomain(str, 's');
        }
        return resolveDomain;
    }

    public static void setDNSResolver(DNSResolver dNSResolver) {
        dnsResolver = dNSResolver;
    }

    protected static List<HostAddress> sortSRVRecords(List<SRVRecord> list) {
        ArrayList arrayList;
        if (list.size() != 1 || !list.get(0).getFQDN().equals(".")) {
            Collections.sort(list);
            TreeMap treeMap = new TreeMap();
            for (SRVRecord sRVRecord : list) {
                Integer valueOf = Integer.valueOf(sRVRecord.getPriority());
                List list2 = (List) treeMap.get(valueOf);
                LinkedList linkedList = list2;
                if (list2 == null) {
                    linkedList = new LinkedList();
                    treeMap.put(valueOf, linkedList);
                }
                linkedList.add(sRVRecord);
            }
            ArrayList arrayList2 = new ArrayList(list.size());
            Iterator it = treeMap.keySet().iterator();
            while (true) {
                arrayList = arrayList2;
                if (!it.hasNext()) {
                    break;
                }
                List<SRVRecord> list3 = (List) treeMap.get((Integer) it.next());
                while (true) {
                    int size = list3.size();
                    if (size > 0) {
                        int[] iArr = new int[list3.size()];
                        int i = 0;
                        int i2 = 0;
                        int i3 = 1;
                        for (SRVRecord sRVRecord2 : list3) {
                            if (sRVRecord2.getWeight() > 0) {
                                i3 = 0;
                            }
                        }
                        for (SRVRecord sRVRecord3 : list3) {
                            i += sRVRecord3.getWeight() + i3;
                            iArr[i2] = i;
                            i2++;
                        }
                        arrayList2.add((SRVRecord) list3.remove(i == 0 ? (int) (Math.random() * size) : bisect(iArr, Math.random() * i)));
                    }
                }
            }
        } else {
            arrayList = null;
        }
        return arrayList;
    }
}
