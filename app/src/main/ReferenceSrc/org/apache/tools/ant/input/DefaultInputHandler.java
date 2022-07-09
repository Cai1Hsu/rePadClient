package org.apache.tools.ant.input;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Enumeration;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.KeepAliveInputStream;

/* loaded from: classes.jar:org/apache/tools/ant/input/DefaultInputHandler.class */
public class DefaultInputHandler implements InputHandler {
    protected InputStream getInputStream() {
        return KeepAliveInputStream.wrapSystemIn();
    }

    protected String getPrompt(InputRequest inputRequest) {
        String str;
        String prompt = inputRequest.getPrompt();
        String defaultValue = inputRequest.getDefaultValue();
        if (inputRequest instanceof MultipleChoiceInputRequest) {
            StringBuffer stringBuffer = new StringBuffer(prompt);
            stringBuffer.append(" (");
            Enumeration elements = ((MultipleChoiceInputRequest) inputRequest).getChoices().elements();
            boolean z = true;
            while (true) {
                boolean z2 = z;
                if (!elements.hasMoreElements()) {
                    break;
                }
                if (!z2) {
                    stringBuffer.append(", ");
                }
                String str2 = (String) elements.nextElement();
                if (str2.equals(defaultValue)) {
                    stringBuffer.append('[');
                }
                stringBuffer.append(str2);
                if (str2.equals(defaultValue)) {
                    stringBuffer.append(']');
                }
                z = false;
            }
            stringBuffer.append(")");
            str = stringBuffer.toString();
        } else {
            str = prompt;
            if (defaultValue != null) {
                str = new StringBuffer().append(prompt).append(" [").append(defaultValue).append("]").toString();
            }
        }
        return str;
    }

    @Override // org.apache.tools.ant.input.InputHandler
    public void handleInput(InputRequest inputRequest) throws BuildException {
        BufferedReader bufferedReader;
        String prompt = getPrompt(inputRequest);
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(getInputStream()));
            do {
                try {
                    System.err.println(prompt);
                    System.err.flush();
                    try {
                        inputRequest.setInput(bufferedReader.readLine());
                    } catch (IOException e) {
                        throw new BuildException("Failed to read input from Console.", e);
                    }
                } catch (Throwable th) {
                    th = th;
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (IOException e2) {
                            throw new BuildException("Failed to close input.", e2);
                        }
                    }
                    throw th;
                }
            } while (!inputRequest.isInputValid());
            if (bufferedReader == null) {
                return;
            }
            try {
                bufferedReader.close();
            } catch (IOException e3) {
                throw new BuildException("Failed to close input.", e3);
            }
        } catch (Throwable th2) {
            th = th2;
            bufferedReader = null;
        }
    }
}
