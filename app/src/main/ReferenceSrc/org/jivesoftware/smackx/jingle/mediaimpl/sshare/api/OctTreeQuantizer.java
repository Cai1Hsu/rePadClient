package org.jivesoftware.smackx.jingle.mediaimpl.sshare.api;

import java.io.PrintStream;
import java.util.Vector;
import org.jivesoftware.smackx.jingle.SmackLogger;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer.class */
public class OctTreeQuantizer implements Quantizer {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(OctTreeQuantizer.class);
    static final int MAX_LEVEL = 5;
    private int maximumColors;
    private int reduceColors;
    private OctTreeNode root;
    private int nodes = 0;
    private int colors = 0;
    private Vector<OctTreeNode>[] colorList = new Vector[6];

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode.class */
    class OctTreeNode {
        int children;
        int count;
        int index;
        boolean isLeaf;
        OctTreeNode[] leaf = new OctTreeNode[8];
        int level;
        OctTreeNode parent;
        int totalBlue;
        int totalGreen;
        int totalRed;

        OctTreeNode() {
            OctTreeQuantizer.this = r4;
        }

        public void list(PrintStream printStream, int i) {
            String str = "";
            for (int i2 = 0; i2 < i; i2++) {
                str = str + " ";
            }
            if (this.count == 0) {
                OctTreeQuantizer.LOGGER.debug(str + this.index + ": count=" + this.count);
            } else {
                OctTreeQuantizer.LOGGER.debug(str + this.index + ": count=" + this.count + " red=" + (this.totalRed / this.count) + " green=" + (this.totalGreen / this.count) + " blue=" + (this.totalBlue / this.count));
            }
            for (int i3 = 0; i3 < 8; i3++) {
                if (this.leaf[i3] != null) {
                    this.leaf[i3].list(printStream, i + 2);
                }
            }
        }
    }

    public OctTreeQuantizer() {
        setup(256);
        for (int i = 0; i < 6; i++) {
            this.colorList[i] = new Vector<>();
        }
        this.root = new OctTreeNode();
    }

    private int buildColorTable(OctTreeNode octTreeNode, int[] iArr, int i) {
        int i2;
        if (this.colors > this.maximumColors) {
            reduceTree(this.maximumColors);
        }
        if (!octTreeNode.isLeaf) {
            int i3 = 0;
            while (true) {
                i2 = i;
                if (i3 >= 8) {
                    break;
                }
                int i4 = i;
                if (octTreeNode.leaf[i3] != null) {
                    octTreeNode.index = i;
                    i4 = buildColorTable(octTreeNode.leaf[i3], iArr, i);
                }
                i3++;
                i = i4;
            }
        } else {
            int i5 = octTreeNode.count;
            iArr[i] = (-16777216) | ((octTreeNode.totalRed / i5) << 16) | ((octTreeNode.totalGreen / i5) << 8) | (octTreeNode.totalBlue / i5);
            octTreeNode.index = i;
            i2 = i + 1;
        }
        return i2;
    }

    private void insertColor(int i) {
        int i2 = (i >> 16) & 255;
        int i3 = (i >> 8) & 255;
        int i4 = i & 255;
        OctTreeNode octTreeNode = this.root;
        for (int i5 = 0; i5 <= 5; i5++) {
            int i6 = 128 >> i5;
            int i7 = 0;
            if ((i2 & i6) != 0) {
                i7 = 0 + 4;
            }
            int i8 = i7;
            if ((i3 & i6) != 0) {
                i8 = i7 + 2;
            }
            int i9 = i8;
            if ((i4 & i6) != 0) {
                i9 = i8 + 1;
            }
            OctTreeNode octTreeNode2 = octTreeNode.leaf[i9];
            if (octTreeNode2 == null) {
                octTreeNode.children++;
                octTreeNode2 = new OctTreeNode();
                octTreeNode2.parent = octTreeNode;
                octTreeNode.leaf[i9] = octTreeNode2;
                octTreeNode.isLeaf = false;
                this.nodes++;
                this.colorList[i5].addElement(octTreeNode2);
                if (i5 == 5) {
                    octTreeNode2.isLeaf = true;
                    octTreeNode2.count = 1;
                    octTreeNode2.totalRed = i2;
                    octTreeNode2.totalGreen = i3;
                    octTreeNode2.totalBlue = i4;
                    octTreeNode2.level = i5;
                    this.colors++;
                    return;
                }
            } else if (octTreeNode2.isLeaf) {
                octTreeNode2.count++;
                octTreeNode2.totalRed += i2;
                octTreeNode2.totalGreen += i3;
                octTreeNode2.totalBlue += i4;
                return;
            }
            octTreeNode = octTreeNode2;
        }
        LOGGER.debug("insertColor failed");
    }

    private void reduceTree(int i) {
        for (int i2 = 4; i2 >= 0; i2--) {
            Vector<OctTreeNode> vector = this.colorList[i2];
            if (vector != null && vector.size() > 0) {
                for (int i3 = 0; i3 < vector.size(); i3++) {
                    OctTreeNode elementAt = vector.elementAt(i3);
                    if (elementAt.children > 0) {
                        for (int i4 = 0; i4 < 8; i4++) {
                            OctTreeNode octTreeNode = elementAt.leaf[i4];
                            if (octTreeNode != null) {
                                if (!octTreeNode.isLeaf) {
                                    LOGGER.debug("not a leaf!");
                                }
                                elementAt.count += octTreeNode.count;
                                elementAt.totalRed += octTreeNode.totalRed;
                                elementAt.totalGreen += octTreeNode.totalGreen;
                                elementAt.totalBlue += octTreeNode.totalBlue;
                                elementAt.leaf[i4] = null;
                                elementAt.children--;
                                this.colors--;
                                this.nodes--;
                                this.colorList[i2 + 1].removeElement(octTreeNode);
                            }
                        }
                        elementAt.isLeaf = true;
                        this.colors++;
                        if (this.colors <= i) {
                            return;
                        }
                    }
                }
                continue;
            }
        }
        LOGGER.debug("Unable to reduce the OctTree");
    }

    @Override // org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.Quantizer
    public void addPixels(int[] iArr, int i, int i2) {
        for (int i3 = 0; i3 < i2; i3++) {
            insertColor(iArr[i3 + i]);
            if (this.colors > this.reduceColors) {
                reduceTree(this.reduceColors);
            }
        }
    }

    public void buildColorTable(int[] iArr, int[] iArr2) {
        this.maximumColors = iArr2.length;
        for (int i : iArr) {
            insertColor(i);
            if (this.colors > this.reduceColors) {
                reduceTree(this.reduceColors);
            }
        }
        if (this.colors > this.maximumColors) {
            reduceTree(this.maximumColors);
        }
        buildColorTable(this.root, iArr2, 0);
    }

    @Override // org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.Quantizer
    public int[] buildColorTable() {
        int[] iArr = new int[this.colors];
        buildColorTable(this.root, iArr, 0);
        return iArr;
    }

    @Override // org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.Quantizer
    public int getIndexForColor(int i) {
        int i2;
        OctTreeNode octTreeNode = this.root;
        int i3 = 0;
        while (true) {
            if (i3 > 5) {
                LOGGER.debug("getIndexForColor failed");
                i2 = 0;
                break;
            }
            int i4 = 128 >> i3;
            int i5 = 0;
            if (((i >> 16) & 255 & i4) != 0) {
                i5 = 0 + 4;
            }
            int i6 = i5;
            if (((i >> 8) & 255 & i4) != 0) {
                i6 = i5 + 2;
            }
            int i7 = i6;
            if ((i & 255 & i4) != 0) {
                i7 = i6 + 1;
            }
            OctTreeNode octTreeNode2 = octTreeNode.leaf[i7];
            if (octTreeNode2 == null) {
                i2 = octTreeNode.index;
                break;
            } else if (octTreeNode2.isLeaf) {
                i2 = octTreeNode2.index;
                break;
            } else {
                octTreeNode = octTreeNode2;
                i3++;
            }
        }
        return i2;
    }

    @Override // org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.Quantizer
    public void setup(int i) {
        this.maximumColors = i;
        this.reduceColors = Math.max(512, i * 2);
    }
}
