package org.apache.tools.ant.input;

/* loaded from: classes.jar:org/apache/tools/ant/input/InputRequest.class */
public class InputRequest {
    private String defaultValue;
    private String input;
    private final String prompt;

    public InputRequest(String str) {
        if (str == null) {
            throw new IllegalArgumentException("prompt must not be null");
        }
        this.prompt = str;
    }

    public String getDefaultValue() {
        return this.defaultValue;
    }

    public String getInput() {
        return this.input;
    }

    public String getPrompt() {
        return this.prompt;
    }

    public boolean isInputValid() {
        return true;
    }

    public void setDefaultValue(String str) {
        this.defaultValue = str;
    }

    public void setInput(String str) {
        this.input = str;
    }
}
