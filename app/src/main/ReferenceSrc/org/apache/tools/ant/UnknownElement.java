package org.apache.tools.ant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import org.apache.tools.ant.IntrospectionHelper;
import org.apache.tools.ant.taskdefs.PreSetDef;

/* loaded from: classes.jar:org/apache/tools/ant/UnknownElement.class */
public class UnknownElement extends Task {
    private final String elementName;
    private String qname;
    private Object realThing;
    private String namespace = "";
    private List children = null;
    private boolean presetDefed = false;

    public UnknownElement(String str) {
        this.elementName = str;
    }

    private static boolean equalsString(String str, String str2) {
        return str == null ? str2 == null : str.equals(str2);
    }

    private boolean handleChild(String str, IntrospectionHelper introspectionHelper, Object obj, UnknownElement unknownElement, RuntimeConfigurable runtimeConfigurable) {
        boolean z;
        String genComponentName = ProjectHelper.genComponentName(unknownElement.getNamespace(), unknownElement.getTag());
        if (introspectionHelper.supportsNestedElement(str, genComponentName, getProject(), obj)) {
            try {
                IntrospectionHelper.Creator elementCreator = introspectionHelper.getElementCreator(getProject(), str, obj, genComponentName, unknownElement);
                elementCreator.setPolyType(runtimeConfigurable.getPolyType());
                Object create = elementCreator.create();
                Object obj2 = create;
                if (create instanceof PreSetDef.PreSetDefinition) {
                    obj2 = elementCreator.getRealObject();
                    unknownElement.applyPreSet(((PreSetDef.PreSetDefinition) create).getPreSets());
                }
                runtimeConfigurable.setCreator(elementCreator);
                runtimeConfigurable.setProxy(obj2);
                if (obj2 instanceof Task) {
                    Task task = (Task) obj2;
                    task.setRuntimeConfigurableWrapper(runtimeConfigurable);
                    task.setTaskName(genComponentName);
                    task.setTaskType(genComponentName);
                }
                if (obj2 instanceof ProjectComponent) {
                    ((ProjectComponent) obj2).setLocation(unknownElement.getLocation());
                }
                runtimeConfigurable.maybeConfigure(getProject());
                unknownElement.handleChildren(obj2, runtimeConfigurable);
                elementCreator.store();
                z = true;
            } catch (UnsupportedElementException e) {
                if (!introspectionHelper.isDynamic()) {
                    throw e;
                }
                z = false;
            }
        } else {
            z = false;
        }
        return z;
    }

    public void addChild(UnknownElement unknownElement) {
        if (this.children == null) {
            this.children = new ArrayList();
        }
        this.children.add(unknownElement);
    }

    public void applyPreSet(UnknownElement unknownElement) {
        if (this.presetDefed) {
            return;
        }
        getWrapper().applyPreSet(unknownElement.getWrapper());
        if (unknownElement.children != null) {
            ArrayList arrayList = new ArrayList();
            arrayList.addAll(unknownElement.children);
            if (this.children != null) {
                arrayList.addAll(this.children);
            }
            this.children = arrayList;
        }
        this.presetDefed = true;
    }

    public void configure(Object obj) {
        this.realThing = obj;
        getWrapper().setProxy(this.realThing);
        Task task = null;
        if (this.realThing instanceof Task) {
            Task task2 = (Task) this.realThing;
            task2.setRuntimeConfigurableWrapper(getWrapper());
            task = task2;
            if (getWrapper().getId() != null) {
                getOwningTarget().replaceChild(this, (Task) this.realThing);
                task = task2;
            }
        }
        if (task != null) {
            task.maybeConfigure();
        } else {
            getWrapper().maybeConfigure(getProject());
        }
        handleChildren(this.realThing, getWrapper());
    }

    public UnknownElement copy(Project project) {
        UnknownElement unknownElement = new UnknownElement(getTag());
        unknownElement.setNamespace(getNamespace());
        unknownElement.setProject(project);
        unknownElement.setQName(getQName());
        unknownElement.setTaskType(getTaskType());
        unknownElement.setTaskName(getTaskName());
        unknownElement.setLocation(getLocation());
        if (getOwningTarget() == null) {
            Target target = new Target();
            target.setProject(getProject());
            unknownElement.setOwningTarget(target);
        } else {
            unknownElement.setOwningTarget(getOwningTarget());
        }
        RuntimeConfigurable runtimeConfigurable = new RuntimeConfigurable(unknownElement, getTaskName());
        runtimeConfigurable.setPolyType(getWrapper().getPolyType());
        for (Map.Entry entry : getWrapper().getAttributeMap().entrySet()) {
            runtimeConfigurable.setAttribute((String) entry.getKey(), (String) entry.getValue());
        }
        runtimeConfigurable.addText(getWrapper().getText().toString());
        Enumeration children = getWrapper().getChildren();
        while (children.hasMoreElements()) {
            UnknownElement copy = ((UnknownElement) ((RuntimeConfigurable) children.nextElement()).getProxy()).copy(project);
            runtimeConfigurable.addChild(copy.getWrapper());
            unknownElement.addChild(copy);
        }
        return unknownElement;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        if (this.realThing == null) {
            throw new BuildException(new StringBuffer().append("Could not create task of type: ").append(this.elementName).toString(), getLocation());
        }
        try {
            if (this.realThing instanceof Task) {
                ((Task) this.realThing).execute();
            }
        } finally {
            if (getWrapper().getId() == null) {
                this.realThing = null;
                getWrapper().setProxy(null);
            }
        }
    }

    public List getChildren() {
        return this.children;
    }

    protected String getComponentName() {
        return ProjectHelper.genComponentName(getNamespace(), getTag());
    }

    public String getNamespace() {
        return this.namespace;
    }

    protected BuildException getNotFoundException(String str, String str2) {
        return new BuildException(ComponentHelper.getComponentHelper(getProject()).diagnoseCreationFailure(str2, str), getLocation());
    }

    public String getQName() {
        return this.qname;
    }

    public Object getRealThing() {
        return this.realThing;
    }

    public String getTag() {
        return this.elementName;
    }

    public Task getTask() {
        return this.realThing instanceof Task ? (Task) this.realThing : null;
    }

    @Override // org.apache.tools.ant.Task
    public String getTaskName() {
        return (this.realThing == null || !(this.realThing instanceof Task)) ? super.getTaskName() : ((Task) this.realThing).getTaskName();
    }

    @Override // org.apache.tools.ant.Task
    public RuntimeConfigurable getWrapper() {
        return super.getWrapper();
    }

    protected void handleChildren(Object obj, RuntimeConfigurable runtimeConfigurable) throws BuildException {
        Object obj2 = obj;
        if (obj instanceof TypeAdapter) {
            obj2 = ((TypeAdapter) obj).getProxy();
        }
        String namespace = getNamespace();
        IntrospectionHelper helper = IntrospectionHelper.getHelper(getProject(), obj2.getClass());
        if (this.children != null) {
            int i = 0;
            for (UnknownElement unknownElement : this.children) {
                RuntimeConfigurable child = runtimeConfigurable.getChild(i);
                try {
                    if (!handleChild(namespace, helper, obj2, unknownElement, child)) {
                        if (!(obj2 instanceof TaskContainer)) {
                            helper.throwNotSupported(getProject(), obj2, unknownElement.getTag());
                        } else {
                            ((TaskContainer) obj2).addTask(unknownElement);
                        }
                    }
                    i++;
                } catch (UnsupportedElementException e) {
                    throw new BuildException(new StringBuffer().append(runtimeConfigurable.getElementTag()).append(" doesn't support the nested \"").append(e.getElement()).append("\" element.").toString(), e);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    protected void handleErrorFlush(String str) {
        if (this.realThing instanceof Task) {
            ((Task) this.realThing).handleErrorFlush(str);
        } else {
            super.handleErrorFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    protected void handleErrorOutput(String str) {
        if (this.realThing instanceof Task) {
            ((Task) this.realThing).handleErrorOutput(str);
        } else {
            super.handleErrorOutput(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    protected void handleFlush(String str) {
        if (this.realThing instanceof Task) {
            ((Task) this.realThing).handleFlush(str);
        } else {
            super.handleFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    protected int handleInput(byte[] bArr, int i, int i2) throws IOException {
        return this.realThing instanceof Task ? ((Task) this.realThing).handleInput(bArr, i, i2) : super.handleInput(bArr, i, i2);
    }

    @Override // org.apache.tools.ant.Task
    protected void handleOutput(String str) {
        if (this.realThing instanceof Task) {
            ((Task) this.realThing).handleOutput(str);
        } else {
            super.handleOutput(str);
        }
    }

    protected Object makeObject(UnknownElement unknownElement, RuntimeConfigurable runtimeConfigurable) {
        ComponentHelper componentHelper = ComponentHelper.getComponentHelper(getProject());
        String componentName = unknownElement.getComponentName();
        Object createComponent = componentHelper.createComponent(unknownElement, unknownElement.getNamespace(), componentName);
        if (createComponent == null) {
            throw getNotFoundException("task or type", componentName);
        }
        Object obj = createComponent;
        if (createComponent instanceof PreSetDef.PreSetDefinition) {
            PreSetDef.PreSetDefinition preSetDefinition = (PreSetDef.PreSetDefinition) createComponent;
            Object createObject = preSetDefinition.createObject(unknownElement.getProject());
            if (createObject == null) {
                throw getNotFoundException(new StringBuffer().append("preset ").append(componentName).toString(), preSetDefinition.getPreSets().getComponentName());
            }
            unknownElement.applyPreSet(preSetDefinition.getPreSets());
            obj = createObject;
            if (createObject instanceof Task) {
                Task task = (Task) createObject;
                task.setTaskType(unknownElement.getTaskType());
                task.setTaskName(unknownElement.getTaskName());
                task.init();
                obj = createObject;
            }
        }
        Object obj2 = obj;
        if (obj instanceof UnknownElement) {
            obj2 = ((UnknownElement) obj).makeObject((UnknownElement) obj, runtimeConfigurable);
        }
        if (obj2 instanceof Task) {
            ((Task) obj2).setOwningTarget(getOwningTarget());
        }
        if (obj2 instanceof ProjectComponent) {
            ((ProjectComponent) obj2).setLocation(getLocation());
        }
        return obj2;
    }

    protected Task makeTask(UnknownElement unknownElement, RuntimeConfigurable runtimeConfigurable) {
        Task createTask = getProject().createTask(unknownElement.getTag());
        if (createTask != null) {
            createTask.setLocation(getLocation());
            createTask.setOwningTarget(getOwningTarget());
            createTask.init();
        }
        return createTask;
    }

    @Override // org.apache.tools.ant.Task
    public void maybeConfigure() throws BuildException {
        if (this.realThing != null) {
            return;
        }
        configure(makeObject(this, getWrapper()));
    }

    public void setNamespace(String str) {
        String str2 = str;
        if (str.equals(ProjectHelper.ANT_CURRENT_URI)) {
            str2 = ComponentHelper.getComponentHelper(getProject()).getCurrentAntlibUri();
        }
        String str3 = str2;
        if (str2 == null) {
            str3 = "";
        }
        this.namespace = str3;
    }

    public void setQName(String str) {
        this.qname = str;
    }

    public void setRealThing(Object obj) {
        this.realThing = obj;
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a8, code lost:
        if (r0.children.size() == 0) goto L28;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean similar(Object obj) {
        boolean z;
        if (obj == null) {
            z = false;
        } else {
            z = false;
            if (getClass().getName().equals(obj.getClass().getName())) {
                UnknownElement unknownElement = (UnknownElement) obj;
                z = false;
                if (equalsString(this.elementName, unknownElement.elementName)) {
                    z = false;
                    if (this.namespace.equals(unknownElement.namespace)) {
                        z = false;
                        if (this.qname.equals(unknownElement.qname)) {
                            z = false;
                            if (getWrapper().getAttributeMap().equals(unknownElement.getWrapper().getAttributeMap())) {
                                z = false;
                                if (getWrapper().getText().toString().equals(unknownElement.getWrapper().getText().toString())) {
                                    int size = this.children == null ? 0 : this.children.size();
                                    if (size == 0) {
                                        if (unknownElement.children != null) {
                                            z = false;
                                        }
                                        z = true;
                                    } else {
                                        z = false;
                                        if (unknownElement.children != null) {
                                            z = false;
                                            if (size == unknownElement.children.size()) {
                                                int i = 0;
                                                while (true) {
                                                    if (i >= size) {
                                                        z = true;
                                                        break;
                                                    }
                                                    z = false;
                                                    if (!((UnknownElement) this.children.get(i)).similar(unknownElement.children.get(i))) {
                                                        break;
                                                    }
                                                    i++;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }
}
