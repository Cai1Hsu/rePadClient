package com.edutech.json;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes.jar:com/edutech/json/Tree.class */
public class Tree<T> {
    private static final int indent = 2;
    private T head;
    private ArrayList<Tree<T>> leafs = new ArrayList<>();
    private Tree<T> parent = null;
    private HashMap<T, Tree<T>> locate = new HashMap<>();

    public Tree(T t) {
        this.head = t;
        this.locate.put(t, this);
    }

    public static <T> Collection<T> getSuccessors(T t, Collection<Tree<T>> collection) {
        ArrayList arrayList;
        Iterator<Tree<T>> it = collection.iterator();
        while (true) {
            if (it.hasNext()) {
                Tree<T> next = it.next();
                if (((Tree) next).locate.containsKey(t)) {
                    arrayList = next.getSuccessors(t);
                    break;
                }
            } else {
                arrayList = new ArrayList();
                break;
            }
        }
        return arrayList;
    }

    private String printTree(int i) {
        Iterator<Tree<T>> it;
        String str = "";
        for (int i2 = 0; i2 < i; i2++) {
            str = String.valueOf(str) + " ";
        }
        String str2 = String.valueOf(str) + this.head;
        while (this.leafs.iterator().hasNext()) {
            str2 = String.valueOf(str2) + "\n" + it.next().printTree(i + 2);
        }
        return str2;
    }

    public Tree<T> addLeaf(T t) {
        Tree<T> tree = new Tree<>(t);
        this.leafs.add(tree);
        tree.parent = this;
        tree.locate = this.locate;
        this.locate.put(t, tree);
        return tree;
    }

    public void addLeaf(T t, T t2) {
        if (this.locate.containsKey(t)) {
            this.locate.get(t).addLeaf(t2);
        } else {
            addLeaf(t).addLeaf(t2);
        }
    }

    public T getHead() {
        return this.head;
    }

    public Tree<T> getParent() {
        return this.parent;
    }

    public Collection<Tree<T>> getSubTrees() {
        return this.leafs;
    }

    public Collection<T> getSuccessors(T t) {
        ArrayList arrayList = new ArrayList();
        Tree<T> tree = getTree(t);
        if (tree != null) {
            Iterator<Tree<T>> it = tree.leafs.iterator();
            while (it.hasNext()) {
                arrayList.add(it.next().head);
            }
        }
        return arrayList;
    }

    public Tree<T> getTree(T t) {
        return this.locate.get(t);
    }

    public ArrayList<Tree<T>> getTrees(T t) {
        ArrayList<Tree<T>> arrayList = new ArrayList<>();
        Tree<T> tree = getTree(t);
        ArrayList<Tree<T>> arrayList2 = arrayList;
        if (tree != null) {
            arrayList2 = tree.leafs;
        }
        return arrayList2;
    }

    public void removeHead(T t) {
        this.locate.remove(t);
    }

    public Tree<T> setAsParent(T t) {
        Tree<T> tree = new Tree<>(t);
        tree.leafs.add(this);
        this.parent = tree;
        tree.locate = this.locate;
        tree.locate.put(this.head, this);
        tree.locate.put(t, tree);
        return tree;
    }

    public void setHead(T t) {
        this.head = t;
        this.locate.put(this.head, this);
    }

    public String toString() {
        return printTree(0);
    }

    public void updateTree(T t, Tree<T> tree) {
        this.locate.put(t, tree);
    }
}
