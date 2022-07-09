package org.apache.tools.ant;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Stack;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.apache.tools.ant.util.DOMElementWriter;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;
import org.w3c.dom.CDATASection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

/* loaded from: classes.jar:org/apache/tools/ant/XmlLogger.class */
public class XmlLogger implements BuildLogger {
    private static final String BUILD_TAG = "build";
    private static final String ERROR_ATTR = "error";
    private static final String LOCATION_ATTR = "location";
    private static final String MESSAGE_TAG = "message";
    private static final String NAME_ATTR = "name";
    private static final String PRIORITY_ATTR = "priority";
    private static final String STACKTRACE_TAG = "stacktrace";
    private static final String TARGET_TAG = "target";
    private static final String TASK_TAG = "task";
    private static final String TIME_ATTR = "time";
    private static DocumentBuilder builder = getDocumentBuilder();
    private PrintStream outStream;
    private int msgOutputLevel = 4;
    private Document doc = builder.newDocument();
    private Hashtable tasks = new Hashtable();
    private Hashtable targets = new Hashtable();
    private Hashtable threadStacks = new Hashtable();
    private TimedElement buildElement = null;

    /* renamed from: org.apache.tools.ant.XmlLogger$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/XmlLogger$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/XmlLogger$TimedElement.class */
    private static class TimedElement {
        private Element element;
        private long startTime;

        private TimedElement() {
        }

        TimedElement(AnonymousClass1 anonymousClass1) {
            this();
        }

        public String toString() {
            return new StringBuffer().append(this.element.getTagName()).append(":").append(this.element.getAttribute("name")).toString();
        }
    }

    private static DocumentBuilder getDocumentBuilder() {
        try {
            return DocumentBuilderFactory.newInstance().newDocumentBuilder();
        } catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private Stack getStack() {
        Stack stack = (Stack) this.threadStacks.get(Thread.currentThread());
        Stack stack2 = stack;
        if (stack == null) {
            stack2 = new Stack();
            this.threadStacks.put(Thread.currentThread(), stack2);
        }
        return stack2;
    }

    private TimedElement getTaskElement(Task task) {
        TimedElement timedElement;
        TimedElement timedElement2 = (TimedElement) this.tasks.get(task);
        if (timedElement2 == null) {
            Enumeration keys = this.tasks.keys();
            while (true) {
                if (!keys.hasMoreElements()) {
                    timedElement = null;
                    break;
                }
                Task task2 = (Task) keys.nextElement();
                if ((task2 instanceof UnknownElement) && ((UnknownElement) task2).getTask() == task) {
                    timedElement = (TimedElement) this.tasks.get(task2);
                    break;
                }
            }
        } else {
            timedElement = timedElement2;
        }
        return timedElement;
    }

    private void synchronizedAppend(Node node, Node node2) {
        synchronized (node) {
            node.appendChild(node2);
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildFinished(BuildEvent buildEvent) {
        OutputStreamWriter outputStreamWriter;
        Throwable th;
        IOException e;
        OutputStreamWriter outputStreamWriter2;
        this.buildElement.element.setAttribute(TIME_ATTR, DefaultLogger.formatTime(System.currentTimeMillis() - this.buildElement.startTime));
        if (buildEvent.getException() != null) {
            this.buildElement.element.setAttribute(ERROR_ATTR, buildEvent.getException().toString());
            CDATASection createCDATASection = this.doc.createCDATASection(StringUtils.getStackTrace(buildEvent.getException()));
            Element createElement = this.doc.createElement(STACKTRACE_TAG);
            createElement.appendChild(createCDATASection);
            synchronizedAppend(this.buildElement.element, createElement);
        }
        String property = buildEvent.getProject().getProperty("XmlLogger.file");
        String str = property;
        if (property == null) {
            str = "log.xml";
        }
        String property2 = buildEvent.getProject().getProperty("ant.XmlLogger.stylesheet.uri");
        String str2 = property2;
        if (property2 == null) {
            str2 = "log.xsl";
        }
        OutputStreamWriter outputStreamWriter3 = null;
        try {
            try {
                PrintStream printStream = this.outStream;
                OutputStream outputStream = printStream;
                if (printStream == null) {
                    outputStream = new FileOutputStream(str);
                }
                outputStreamWriter2 = new OutputStreamWriter(outputStream, "UTF8");
            } catch (IOException e2) {
                e = e2;
                outputStreamWriter2 = null;
            }
        } catch (Throwable th2) {
            th = th2;
            outputStreamWriter = outputStreamWriter3;
        }
        try {
            outputStreamWriter2.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
            if (str2.length() > 0) {
                outputStreamWriter2.write(new StringBuffer().append("<?xml-stylesheet type=\"text/xsl\" href=\"").append(str2).append("\"?>\n\n").toString());
            }
            new DOMElementWriter().write(this.buildElement.element, outputStreamWriter2, 0, "\t");
            outputStreamWriter2.flush();
            FileUtils.close(outputStreamWriter2);
            this.buildElement = null;
        } catch (IOException e3) {
            e = e3;
            OutputStreamWriter outputStreamWriter4 = outputStreamWriter2;
            outputStreamWriter3 = outputStreamWriter2;
            throw new BuildException("Unable to write log file", e);
        } catch (Throwable th3) {
            outputStreamWriter = outputStreamWriter2;
            th = th3;
            FileUtils.close(outputStreamWriter);
            throw th;
        }
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildStarted(BuildEvent buildEvent) {
        this.buildElement = new TimedElement(null);
        this.buildElement.startTime = System.currentTimeMillis();
        this.buildElement.element = this.doc.createElement(BUILD_TAG);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void messageLogged(BuildEvent buildEvent) {
        String str;
        int priority = buildEvent.getPriority();
        if (priority > this.msgOutputLevel) {
            return;
        }
        Element createElement = this.doc.createElement(MESSAGE_TAG);
        switch (priority) {
            case 0:
                str = ERROR_ATTR;
                break;
            case 1:
                str = "warn";
                break;
            case 2:
                str = "info";
                break;
            default:
                str = "debug";
                break;
        }
        createElement.setAttribute("priority", str);
        Throwable exception = buildEvent.getException();
        if (4 <= this.msgOutputLevel && exception != null) {
            CDATASection createCDATASection = this.doc.createCDATASection(StringUtils.getStackTrace(exception));
            Element createElement2 = this.doc.createElement(STACKTRACE_TAG);
            createElement2.appendChild(createCDATASection);
            synchronizedAppend(this.buildElement.element, createElement2);
        }
        createElement.appendChild(this.doc.createCDATASection(buildEvent.getMessage()));
        Task task = buildEvent.getTask();
        Target target = buildEvent.getTarget();
        TimedElement timedElement = null;
        if (task != null) {
            timedElement = getTaskElement(task);
        }
        TimedElement timedElement2 = timedElement;
        if (timedElement == null) {
            timedElement2 = timedElement;
            if (target != null) {
                timedElement2 = (TimedElement) this.targets.get(target);
            }
        }
        if (timedElement2 != null) {
            synchronizedAppend(timedElement2.element, createElement);
        } else {
            synchronizedAppend(this.buildElement.element, createElement);
        }
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setEmacsMode(boolean z) {
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setErrorPrintStream(PrintStream printStream) {
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setMessageOutputLevel(int i) {
        this.msgOutputLevel = i;
    }

    @Override // org.apache.tools.ant.BuildLogger
    public void setOutputPrintStream(PrintStream printStream) {
        this.outStream = new PrintStream((OutputStream) printStream, true);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
        Target target = buildEvent.getTarget();
        TimedElement timedElement = (TimedElement) this.targets.get(target);
        if (timedElement != null) {
            timedElement.element.setAttribute(TIME_ATTR, DefaultLogger.formatTime(System.currentTimeMillis() - timedElement.startTime));
            Stack stack = getStack();
            TimedElement timedElement2 = null;
            if (!stack.empty()) {
                TimedElement timedElement3 = (TimedElement) stack.pop();
                if (timedElement3 != timedElement) {
                    throw new RuntimeException(new StringBuffer().append("Mismatch - popped element = ").append(timedElement3).append(" finished target element = ").append(timedElement).toString());
                }
                timedElement2 = null;
                if (!stack.empty()) {
                    timedElement2 = (TimedElement) stack.peek();
                }
            }
            if (timedElement2 == null) {
                synchronizedAppend(this.buildElement.element, timedElement.element);
            } else {
                synchronizedAppend(timedElement2.element, timedElement.element);
            }
        }
        this.targets.remove(target);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
        Target target = buildEvent.getTarget();
        TimedElement timedElement = new TimedElement(null);
        timedElement.startTime = System.currentTimeMillis();
        timedElement.element = this.doc.createElement(TARGET_TAG);
        timedElement.element.setAttribute("name", target.getName());
        this.targets.put(target, timedElement);
        getStack().push(timedElement);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskFinished(BuildEvent buildEvent) {
        TimedElement timedElement;
        Task task = buildEvent.getTask();
        TimedElement timedElement2 = (TimedElement) this.tasks.get(task);
        if (timedElement2 == null) {
            throw new RuntimeException(new StringBuffer().append("Unknown task ").append(task).append(" not in ").append(this.tasks).toString());
        }
        timedElement2.element.setAttribute(TIME_ATTR, DefaultLogger.formatTime(System.currentTimeMillis() - timedElement2.startTime));
        Target owningTarget = task.getOwningTarget();
        TimedElement timedElement3 = null;
        if (owningTarget != null) {
            timedElement3 = (TimedElement) this.targets.get(owningTarget);
        }
        if (timedElement3 == null) {
            synchronizedAppend(this.buildElement.element, timedElement2.element);
        } else {
            synchronizedAppend(timedElement3.element, timedElement2.element);
        }
        Stack stack = getStack();
        if (!stack.empty() && (timedElement = (TimedElement) stack.pop()) != timedElement2) {
            throw new RuntimeException(new StringBuffer().append("Mismatch - popped element = ").append(timedElement).append(" finished task element = ").append(timedElement2).toString());
        }
        this.tasks.remove(task);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
        TimedElement timedElement = new TimedElement(null);
        timedElement.startTime = System.currentTimeMillis();
        timedElement.element = this.doc.createElement(TASK_TAG);
        Task task = buildEvent.getTask();
        String taskName = buildEvent.getTask().getTaskName();
        String str = taskName;
        if (taskName == null) {
            str = "";
        }
        timedElement.element.setAttribute("name", str);
        timedElement.element.setAttribute("location", buildEvent.getTask().getLocation().toString());
        this.tasks.put(task, timedElement);
        getStack().push(timedElement);
    }
}
