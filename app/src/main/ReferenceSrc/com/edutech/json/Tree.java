package com.edutech.json;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class Tree<T> {
    private static final int indent = 2;
    private T head;
    private ArrayList<Tree<T>> leafs = new ArrayList<>();
    private Tree<T> parent = null;
    private HashMap<T, Tree<T>> locate = new HashMap<>();

    public Tree(T head) {
        this.head = head;
        this.locate.put(head, this);
    }

    public void addLeaf(T root, T leaf) {
        if (this.locate.containsKey(root)) {
            this.locate.get(root).addLeaf(leaf);
        } else {
            addLeaf(root).addLeaf(leaf);
        }
    }

    public Tree<T> addLeaf(T leaf) {
        Tree<T> t = new Tree<>(leaf);
        this.leafs.add(t);
        t.parent = this;
        t.locate = this.locate;
        this.locate.put(leaf, t);
        return t;
    }

    public Tree<T> setAsParent(T parentRoot) {
        Tree<T> t = new Tree<>(parentRoot);
        t.leafs.add(this);
        this.parent = t;
        t.locate = this.locate;
        t.locate.put(this.head, this);
        t.locate.put(parentRoot, t);
        return t;
    }

    public T getHead() {
        return this.head;
    }

    public Tree<T> getTree(T element) {
        return this.locate.get(element);
    }

    public void updateTree(T parent, Tree<T> leafTree) {
        this.locate.put(parent, leafTree);
    }

    public void setHead(T h) {
        this.head = h;
        this.locate.put(this.head, this);
    }

    public void removeHead(T h) {
        this.locate.remove(h);
    }

    public ArrayList<Tree<T>> getTrees(T parent) {
        ArrayList<Tree<T>> treeList = new ArrayList<>();
        Tree<T> tree = getTree(parent);
        if (tree != null) {
            ArrayList<Tree<T>> treeList2 = tree.leafs;
            return treeList2;
        }
        return treeList;
    }

    public Tree<T> getParent() {
        return this.parent;
    }

    public Collection<T> getSuccessors(T root) {
        Collection<T> successors = new ArrayList<>();
        Tree<T> tree = getTree(root);
        if (tree != null) {
            Iterator<Tree<T>> it = tree.leafs.iterator();
            while (it.hasNext()) {
                Tree<T> leaf = it.next();
                successors.add(leaf.head);
            }
        }
        return successors;
    }

    public Collection<Tree<T>> getSubTrees() {
        return this.leafs;
    }

    public static <T> Collection<T> getSuccessors(T of, Collection<Tree<T>> in) {
        for (Tree<T> tree : in) {
            if (((Tree) tree).locate.containsKey(of)) {
                return tree.getSuccessors(of);
            }
        }
        return new ArrayList();
    }

    public String toString() {
        return printTree(0);
    }

    private String printTree(int increment) {
        String inc = "";
        for (int i = 0; i < increment; i++) {
            inc = String.valueOf(inc) + " ";
        }
        String s = String.valueOf(inc) + this.head;
        Iterator<Tree<T>> it = this.leafs.iterator();
        while (it.hasNext()) {
            Tree<T> child = it.next();
            s = String.valueOf(s) + "\n" + child.printTree(increment + 2);
        }
        return s;
    }
}
