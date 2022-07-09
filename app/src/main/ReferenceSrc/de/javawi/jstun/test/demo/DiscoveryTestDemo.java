package de.javawi.jstun.test.demo;

import de.javawi.jstun.test.DiscoveryTest;
import java.net.BindException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/* loaded from: classes.jar:de/javawi/jstun/test/demo/DiscoveryTestDemo.class */
public class DiscoveryTestDemo implements Runnable {
    InetAddress iaddress;

    public DiscoveryTestDemo(InetAddress inetAddress) {
        this.iaddress = inetAddress;
    }

    public static void main(String[] strArr) {
        try {
            FileHandler fileHandler = new FileHandler("logging.txt");
            fileHandler.setFormatter(new SimpleFormatter());
            Logger.getLogger("de.javawi.stun").addHandler(fileHandler);
            Logger.getLogger("de.javawi.stun").setLevel(Level.ALL);
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                Enumeration<InetAddress> inetAddresses = networkInterfaces.nextElement().getInetAddresses();
                while (inetAddresses.hasMoreElements()) {
                    InetAddress nextElement = inetAddresses.nextElement();
                    if (Class.forName("java.net.Inet4Address").isInstance(nextElement) && !nextElement.isLoopbackAddress() && !nextElement.isLinkLocalAddress()) {
                        new Thread(new DiscoveryTestDemo(nextElement)).start();
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            System.out.println(new DiscoveryTest(this.iaddress, "jstun.javawi.de", 3478).test());
        } catch (BindException e) {
            System.out.println(this.iaddress.toString() + ": " + e.getMessage());
        } catch (Exception e2) {
            System.out.println(e2.getMessage());
            e2.printStackTrace();
        }
    }
}
