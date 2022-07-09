package org.apache.tools.ant.input;

import java.util.Arrays;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.ReflectUtil;

/* loaded from: classes.jar:org/apache/tools/ant/input/SecureInputHandler.class */
public class SecureInputHandler extends DefaultInputHandler {
    static Class array$Ljava$lang$Object;
    static Class class$java$lang$String;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.input.DefaultInputHandler, org.apache.tools.ant.input.InputHandler
    public void handleInput(InputRequest inputRequest) throws BuildException {
        Class cls;
        Class cls2;
        String prompt = getPrompt(inputRequest);
        try {
            Object invokeStatic = ReflectUtil.invokeStatic(Class.forName("java.lang.System"), "console");
            do {
                if (class$java$lang$String == null) {
                    cls = class$("java.lang.String");
                    class$java$lang$String = cls;
                } else {
                    cls = class$java$lang$String;
                }
                if (array$Ljava$lang$Object == null) {
                    cls2 = class$("[Ljava.lang.Object;");
                    array$Ljava$lang$Object = cls2;
                } else {
                    cls2 = array$Ljava$lang$Object;
                }
                char[] cArr = (char[]) ReflectUtil.invoke(invokeStatic, "readPassword", cls, prompt, cls2, null);
                inputRequest.setInput(new String(cArr));
                Arrays.fill(cArr, ' ');
            } while (!inputRequest.isInputValid());
        } catch (Exception e) {
            super.handleInput(inputRequest);
        }
    }
}
