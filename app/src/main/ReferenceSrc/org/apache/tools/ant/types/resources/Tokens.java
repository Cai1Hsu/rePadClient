package org.apache.tools.ant.types.resources;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.util.ConcatResourceInputStream;
import org.apache.tools.ant.util.LineTokenizer;
import org.apache.tools.ant.util.Tokenizer;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Tokens.class */
public class Tokens extends BaseResourceCollectionWrapper {
    private String encoding;
    private Tokenizer tokenizer;

    public void add(Tokenizer tokenizer) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            if (this.tokenizer != null) {
                throw new BuildException("Only one nested tokenizer allowed.");
            }
            this.tokenizer = tokenizer;
            setChecked(false);
        }
    }

    @Override // org.apache.tools.ant.types.resources.AbstractResourceCollectionWrapper, org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                super.dieOnCircularReference(stack, project);
                if (!isReference()) {
                    if (this.tokenizer instanceof DataType) {
                        pushAndInvokeCircularReferenceCheck((DataType) this.tokenizer, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.resources.BaseResourceCollectionWrapper
    protected Collection getCollection() {
        InputStreamReader inputStreamReader;
        Collection collection;
        synchronized (this) {
            ResourceCollection resourceCollection = getResourceCollection();
            if (resourceCollection.size() == 0) {
                collection = Collections.EMPTY_SET;
            } else {
                if (this.tokenizer == null) {
                    this.tokenizer = new LineTokenizer();
                }
                ConcatResourceInputStream concatResourceInputStream = new ConcatResourceInputStream(resourceCollection);
                concatResourceInputStream.setManagingComponent(this);
                if (this.encoding == null) {
                    inputStreamReader = new InputStreamReader(concatResourceInputStream);
                } else {
                    try {
                        inputStreamReader = new InputStreamReader(concatResourceInputStream, this.encoding);
                    } catch (UnsupportedEncodingException e) {
                        throw new BuildException(e);
                    }
                }
                ArrayList arrayList = new ArrayList();
                try {
                    String token = this.tokenizer.getToken(inputStreamReader);
                    while (true) {
                        collection = arrayList;
                        if (token == null) {
                            break;
                        }
                        StringResource stringResource = new StringResource(token);
                        stringResource.setProject(getProject());
                        arrayList.add(stringResource);
                        token = this.tokenizer.getToken(inputStreamReader);
                    }
                } catch (IOException e2) {
                    throw new BuildException("Error reading tokens", e2);
                }
            }
        }
        return collection;
    }

    public void setEncoding(String str) {
        synchronized (this) {
            this.encoding = str;
        }
    }
}
