package org.apache.tools.ant.input;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/input/PropertyFileInputHandler.class */
public class PropertyFileInputHandler implements InputHandler {
    public static final String FILE_NAME_KEY = "ant.input.properties";
    private Properties props = null;

    private void readProps() throws BuildException {
        synchronized (this) {
            if (this.props == null) {
                String property = System.getProperty(FILE_NAME_KEY);
                if (property == null) {
                    throw new BuildException("System property ant.input.properties for PropertyFileInputHandler not set");
                }
                this.props = new Properties();
                try {
                    this.props.load(new FileInputStream(property));
                } catch (IOException e) {
                    throw new BuildException(new StringBuffer().append("Couldn't load ").append(property).toString(), e);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.input.InputHandler
    public void handleInput(InputRequest inputRequest) throws BuildException {
        readProps();
        Object obj = this.props.get(inputRequest.getPrompt());
        if (obj == null) {
            throw new BuildException(new StringBuffer().append("Unable to find input for '").append(inputRequest.getPrompt()).append("'").toString());
        }
        inputRequest.setInput(obj.toString());
        if (inputRequest.isInputValid()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Found invalid input ").append(obj).append(" for '").append(inputRequest.getPrompt()).append("'").toString());
    }
}
