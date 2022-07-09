package org.apache.tools.ant.types.resources.selectors;

import java.util.Iterator;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Comparison;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Quantifier;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.types.resources.comparators.DelegatedResourceComparator;
import org.apache.tools.ant.types.resources.comparators.ResourceComparator;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/selectors/Compare.class */
public class Compare extends DataType implements ResourceSelector {
    private static final String ONE_CONTROL_MESSAGE = " the <control> element should be specified exactly once.";
    private Union control;
    private DelegatedResourceComparator comp = new DelegatedResourceComparator();
    private Quantifier against = Quantifier.ALL;
    private Comparison when = Comparison.EQUAL;

    private BuildException oneControl() {
        return new BuildException(new StringBuffer().append(super.toString()).append(ONE_CONTROL_MESSAGE).toString());
    }

    public void add(ResourceComparator resourceComparator) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.comp.add(resourceComparator);
            setChecked(false);
        }
    }

    public ResourceCollection createControl() {
        Union union;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (this.control != null) {
                throw oneControl();
            }
            this.control = new Union();
            setChecked(false);
            union = this.control;
        }
        return union;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.control != null) {
                        DataType.pushAndInvokeCircularReferenceCheck(this.control, stack, project);
                    }
                    DataType.pushAndInvokeCircularReferenceCheck(this.comp, stack, project);
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.resources.selectors.ResourceSelector
    public boolean isSelected(Resource resource) {
        boolean evaluate;
        synchronized (this) {
            if (isReference()) {
                evaluate = ((ResourceSelector) getCheckedRef()).isSelected(resource);
            } else if (this.control == null) {
                throw oneControl();
            } else {
                dieOnCircularReference();
                int i = 0;
                int i2 = 0;
                Iterator it = this.control.iterator();
                while (it.hasNext()) {
                    if (this.when.evaluate(this.comp.compare(resource, (Resource) it.next()))) {
                        i++;
                    } else {
                        i2++;
                    }
                }
                evaluate = this.against.evaluate(i, i2);
            }
        }
        return evaluate;
    }

    public void setAgainst(Quantifier quantifier) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.against = quantifier;
        }
    }

    public void setWhen(Comparison comparison) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.when = comparison;
        }
    }
}
