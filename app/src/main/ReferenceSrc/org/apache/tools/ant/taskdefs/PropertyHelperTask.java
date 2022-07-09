package org.apache.tools.ant.taskdefs;

import java.util.ArrayList;
import java.util.List;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PropertyHelperTask.class */
public class PropertyHelperTask extends Task {
    private List delegates;
    private PropertyHelper propertyHelper;

    /* renamed from: org.apache.tools.ant.taskdefs.PropertyHelperTask$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PropertyHelperTask$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement.class */
    public final class DelegateElement {
        private String refid;
        private final PropertyHelperTask this$0;

        private DelegateElement(PropertyHelperTask propertyHelperTask) {
            this.this$0 = propertyHelperTask;
        }

        DelegateElement(PropertyHelperTask propertyHelperTask, AnonymousClass1 anonymousClass1) {
            this(propertyHelperTask);
        }

        public PropertyHelper.Delegate resolve() {
            if (this.refid == null) {
                throw new BuildException("refid required for generic delegate");
            }
            return (PropertyHelper.Delegate) this.this$0.getProject().getReference(this.refid);
        }

        public String getRefid() {
            return this.refid;
        }

        public void setRefid(String str) {
            this.refid = str;
        }
    }

    private List getAddDelegateList() {
        List list;
        synchronized (this) {
            if (this.delegates == null) {
                this.delegates = new ArrayList();
            }
            list = this.delegates;
        }
        return list;
    }

    public void addConfigured(PropertyHelper.Delegate delegate) {
        synchronized (this) {
            getAddDelegateList().add(delegate);
        }
    }

    public void addConfigured(PropertyHelper propertyHelper) {
        synchronized (this) {
            if (this.propertyHelper != null) {
                throw new BuildException("Only one PropertyHelper can be installed");
            }
            this.propertyHelper = propertyHelper;
        }
    }

    public DelegateElement createDelegate() {
        DelegateElement delegateElement = new DelegateElement(this, null);
        getAddDelegateList().add(delegateElement);
        return delegateElement;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (getProject() == null) {
            throw new BuildException("Project instance not set");
        }
        if (this.propertyHelper == null && this.delegates == null) {
            throw new BuildException("Either a new PropertyHelper or one or more PropertyHelper delegates are required");
        }
        PropertyHelper propertyHelper = this.propertyHelper == null ? PropertyHelper.getPropertyHelper(getProject()) : this.propertyHelper;
        synchronized (propertyHelper) {
            try {
                if (this.delegates != null) {
                    for (Object obj : this.delegates) {
                        PropertyHelper.Delegate resolve = obj instanceof DelegateElement ? ((DelegateElement) obj).resolve() : (PropertyHelper.Delegate) obj;
                        log(new StringBuffer().append("Adding PropertyHelper delegate ").append(resolve).toString(), 4);
                        propertyHelper.add(resolve);
                    }
                }
            } catch (Throwable th) {
                PropertyHelper propertyHelper2 = propertyHelper;
                throw th;
            }
        }
        if (this.propertyHelper == null) {
            return;
        }
        log(new StringBuffer().append("Installing PropertyHelper ").append(this.propertyHelper).toString(), 4);
        getProject().addReference(MagicNames.REFID_PROPERTY_HELPER, this.propertyHelper);
    }
}
