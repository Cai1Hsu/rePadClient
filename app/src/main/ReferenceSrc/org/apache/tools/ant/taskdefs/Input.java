package org.apache.tools.ant.taskdefs;

import org.apache.http.cookie.ClientCookie;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.input.DefaultInputHandler;
import org.apache.tools.ant.input.GreedyInputHandler;
import org.apache.tools.ant.input.InputHandler;
import org.apache.tools.ant.input.InputRequest;
import org.apache.tools.ant.input.MultipleChoiceInputRequest;
import org.apache.tools.ant.input.PropertyFileInputHandler;
import org.apache.tools.ant.input.SecureInputHandler;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Input.class */
public class Input extends Task {
    static Class class$org$apache$tools$ant$input$InputHandler;
    private boolean messageAttribute;
    private String validargs = null;
    private String message = "";
    private String addproperty = null;
    private String defaultvalue = null;
    private Handler handler = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Input$Handler.class */
    public class Handler extends DefBase {
        private final Input this$0;
        private String refid = null;
        private HandlerType type = null;
        private String classname = null;

        public Handler(Input input) {
            this.this$0 = input;
        }

        public InputHandler getInputHandler() {
            InputHandler inputHandler;
            Class cls;
            if (this.type != null) {
                inputHandler = this.type.getInputHandler();
            } else if (this.refid != null) {
                try {
                    inputHandler = (InputHandler) getProject().getReference(this.refid);
                } catch (ClassCastException e) {
                    throw new BuildException(new StringBuffer().append(this.refid).append(" does not denote an InputHandler").toString(), e);
                }
            } else if (this.classname == null) {
                throw new BuildException("Must specify refid, classname or type");
            } else {
                String str = this.classname;
                ClassLoader createLoader = createLoader();
                if (Input.class$org$apache$tools$ant$input$InputHandler == null) {
                    cls = Input.class$("org.apache.tools.ant.input.InputHandler");
                    Input.class$org$apache$tools$ant$input$InputHandler = cls;
                } else {
                    cls = Input.class$org$apache$tools$ant$input$InputHandler;
                }
                inputHandler = (InputHandler) ClasspathUtils.newInstance(str, createLoader, cls);
            }
            return inputHandler;
        }

        public String getClassname() {
            return this.classname;
        }

        public String getRefid() {
            return this.refid;
        }

        public HandlerType getType() {
            return this.type;
        }

        public void setClassname(String str) {
            this.classname = str;
        }

        public void setRefid(String str) {
            this.refid = str;
        }

        public void setType(HandlerType handlerType) {
            this.type = handlerType;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Input$HandlerType.class */
    public static class HandlerType extends EnumeratedAttribute {
        private static final String[] VALUES = {"default", "propertyfile", "greedy", ClientCookie.SECURE_ATTR};
        private static final InputHandler[] HANDLERS = {new DefaultInputHandler(), new PropertyFileInputHandler(), new GreedyInputHandler(), new SecureInputHandler()};

        public InputHandler getInputHandler() {
            return HANDLERS[getIndex()];
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return VALUES;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void addText(String str) {
        if (!this.messageAttribute || !"".equals(str.trim())) {
            this.message = new StringBuffer().append(this.message).append(getProject().replaceProperties(str)).toString();
        }
    }

    public Handler createHandler() {
        if (this.handler != null) {
            throw new BuildException("Cannot define > 1 nested input handler");
        }
        this.handler = new Handler(this);
        return this.handler;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x008f, code lost:
        if (r0.trim().length() == 0) goto L18;
     */
    @Override // org.apache.tools.ant.Task
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void execute() throws BuildException {
        String str;
        if (this.addproperty != null && getProject().getProperty(this.addproperty) != null) {
            log(new StringBuffer().append("skipping ").append(getTaskName()).append(" as property ").append(this.addproperty).append(" has already been set.").toString());
            return;
        }
        MultipleChoiceInputRequest multipleChoiceInputRequest = this.validargs != null ? new MultipleChoiceInputRequest(this.message, StringUtils.split(this.validargs, 44)) : new InputRequest(this.message);
        multipleChoiceInputRequest.setDefaultValue(this.defaultvalue);
        (this.handler == null ? getProject().getInputHandler() : this.handler.getInputHandler()).handleInput(multipleChoiceInputRequest);
        String input = multipleChoiceInputRequest.getInput();
        if (input != null) {
            str = input;
        }
        str = input;
        if (this.defaultvalue != null) {
            str = this.defaultvalue;
        }
        if (this.addproperty == null || str == null) {
            return;
        }
        getProject().setNewProperty(this.addproperty, str);
    }

    public void setAddproperty(String str) {
        this.addproperty = str;
    }

    public void setDefaultvalue(String str) {
        this.defaultvalue = str;
    }

    public void setMessage(String str) {
        this.message = str;
        this.messageAttribute = true;
    }

    public void setValidargs(String str) {
        this.validargs = str;
    }
}
