package org.apache.tools.ant.util.java15;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.SocketAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.ListIterator;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/java15/ProxyDiagnostics.class */
public class ProxyDiagnostics {
    public static final String DEFAULT_DESTINATION = "http://ant.apache.org/";
    private URI destURI;
    private String destination;

    public ProxyDiagnostics() {
        this(DEFAULT_DESTINATION);
    }

    public ProxyDiagnostics(String str) {
        this.destination = str;
        try {
            this.destURI = new URI(str);
        } catch (URISyntaxException e) {
            throw new BuildException(e);
        }
    }

    public String toString() {
        List<Proxy> select = ProxySelector.getDefault().select(this.destURI);
        StringBuffer stringBuffer = new StringBuffer();
        ListIterator<Proxy> listIterator = select.listIterator();
        while (listIterator.hasNext()) {
            Proxy next = listIterator.next();
            SocketAddress address = next.address();
            if (address == null) {
                stringBuffer.append("Direct connection\n");
            } else {
                stringBuffer.append(next.toString());
                if (address instanceof InetSocketAddress) {
                    InetSocketAddress inetSocketAddress = (InetSocketAddress) address;
                    stringBuffer.append(' ');
                    stringBuffer.append(inetSocketAddress.getHostName());
                    stringBuffer.append(':');
                    stringBuffer.append(inetSocketAddress.getPort());
                    if (inetSocketAddress.isUnresolved()) {
                        stringBuffer.append(" [unresolved]");
                    } else {
                        InetAddress address2 = inetSocketAddress.getAddress();
                        stringBuffer.append(" [");
                        stringBuffer.append(address2.getHostAddress());
                        stringBuffer.append(']');
                    }
                }
                stringBuffer.append('\n');
            }
        }
        return stringBuffer.toString();
    }
}
