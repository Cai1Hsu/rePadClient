package org.apache.tools.ant.input;

import java.util.LinkedHashSet;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/input/MultipleChoiceInputRequest.class */
public class MultipleChoiceInputRequest extends InputRequest {
    private final LinkedHashSet choices;

    public MultipleChoiceInputRequest(String str, Vector vector) {
        super(str);
        if (vector == null) {
            throw new IllegalArgumentException("choices must not be null");
        }
        this.choices = new LinkedHashSet(vector);
    }

    public Vector getChoices() {
        return new Vector(this.choices);
    }

    @Override // org.apache.tools.ant.input.InputRequest
    public boolean isInputValid() {
        return this.choices.contains(getInput()) || ("".equals(getInput()) && getDefaultValue() != null);
    }
}
