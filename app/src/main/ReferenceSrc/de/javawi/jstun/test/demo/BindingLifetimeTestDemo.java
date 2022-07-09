package de.javawi.jstun.test.demo;

import de.javawi.jstun.test.BindingLifetimeTest;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

/* loaded from: classes.jar:de/javawi/jstun/test/demo/BindingLifetimeTestDemo.class */
public class BindingLifetimeTestDemo {
    public static void main(String[] strArr) {
        try {
            FileHandler fileHandler = new FileHandler("logging.txt");
            fileHandler.setFormatter(new SimpleFormatter());
            Logger.getLogger("de.javawi.stun").addHandler(fileHandler);
            Logger.getLogger("de.javawi.stun").setLevel(Level.ALL);
            BindingLifetimeTest bindingLifetimeTest = new BindingLifetimeTest("iphone-stun.freenet.de", 3478);
            bindingLifetimeTest.test();
            boolean z = true;
            while (z) {
                Thread.sleep(5000L);
                if (bindingLifetimeTest.getLifetime() != -1) {
                    System.out.println("Lifetime: " + bindingLifetimeTest.getLifetime() + " Finished: " + bindingLifetimeTest.isCompleted());
                    if (bindingLifetimeTest.isCompleted()) {
                        z = false;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
