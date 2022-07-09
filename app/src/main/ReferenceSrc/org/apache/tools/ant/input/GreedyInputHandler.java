package org.apache.tools.ant.input;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.StreamPumper;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/input/GreedyInputHandler.class */
public class GreedyInputHandler extends DefaultInputHandler {
    @Override // org.apache.tools.ant.input.DefaultInputHandler, org.apache.tools.ant.input.InputHandler
    public void handleInput(InputRequest inputRequest) throws BuildException {
        String prompt = getPrompt(inputRequest);
        InputStream inputStream = null;
        try {
            inputStream = getInputStream();
            System.err.println(prompt);
            System.err.flush();
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            StreamPumper streamPumper = new StreamPumper(inputStream, byteArrayOutputStream);
            Thread thread = new Thread(streamPumper);
            thread.start();
            try {
                thread.join();
            } catch (InterruptedException e) {
                try {
                    thread.join();
                } catch (InterruptedException e2) {
                }
            }
            inputRequest.setInput(new String(byteArrayOutputStream.toByteArray()));
            if (!inputRequest.isInputValid()) {
                throw new BuildException("Received invalid console input");
            }
            if (streamPumper.getException() == null) {
                return;
            }
            throw new BuildException("Failed to read input from console", streamPumper.getException());
        } finally {
            FileUtils.close(inputStream);
        }
    }
}
