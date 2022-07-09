package org.jivesoftware.smackx.workgroup.util;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.ListIterator;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher.class */
public class ListenerEventDispatcher implements Runnable {
    protected transient ArrayList<TripletContainer> triplets = new ArrayList<>();
    protected transient boolean hasFinishedDispatching = false;
    protected transient boolean isRunning = false;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/util/ListenerEventDispatcher$TripletContainer.class */
    protected class TripletContainer {
        protected Object listenerInstance;
        protected Method listenerMethod;
        protected Object[] methodArguments;

        protected TripletContainer(Object obj, Method method, Object[] objArr) {
            ListenerEventDispatcher.this = r4;
            this.listenerInstance = obj;
            this.listenerMethod = method;
            this.methodArguments = objArr;
        }

        protected Object getListenerInstance() {
            return this.listenerInstance;
        }

        protected Method getListenerMethod() {
            return this.listenerMethod;
        }

        protected Object[] getMethodArguments() {
            return this.methodArguments;
        }
    }

    public void addListenerTriplet(Object obj, Method method, Object[] objArr) {
        if (!this.isRunning) {
            this.triplets.add(new TripletContainer(obj, method, objArr));
        }
    }

    public boolean hasFinished() {
        return this.hasFinishedDispatching;
    }

    @Override // java.lang.Runnable
    public void run() {
        this.isRunning = true;
        ListIterator<TripletContainer> listIterator = this.triplets.listIterator();
        while (listIterator.hasNext()) {
            TripletContainer next = listIterator.next();
            try {
                next.getListenerMethod().invoke(next.getListenerInstance(), next.getMethodArguments());
            } catch (Exception e) {
                System.err.println("Exception dispatching an event: " + e);
                e.printStackTrace();
            }
        }
        this.hasFinishedDispatching = true;
    }
}
