package android.support.v4.widget;

import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DataSetObserver;
import android.os.Handler;
import android.support.annotation.RestrictTo;
import android.support.v4.widget.CursorFilter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.FilterQueryProvider;
import android.widget.Filterable;

/* loaded from: classes.jar:android/support/v4/widget/CursorAdapter.class */
public abstract class CursorAdapter extends BaseAdapter implements Filterable, CursorFilter.CursorFilterClient {
    @Deprecated
    public static final int FLAG_AUTO_REQUERY = 1;
    public static final int FLAG_REGISTER_CONTENT_OBSERVER = 2;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected boolean mAutoRequery;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected ChangeObserver mChangeObserver;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected Context mContext;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected Cursor mCursor;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected CursorFilter mCursorFilter;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected DataSetObserver mDataSetObserver;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected boolean mDataValid;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected FilterQueryProvider mFilterQueryProvider;
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    protected int mRowIDColumn;

    /* loaded from: classes.jar:android/support/v4/widget/CursorAdapter$ChangeObserver.class */
    private class ChangeObserver extends ContentObserver {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        ChangeObserver() {
            super(new Handler());
            CursorAdapter.this = r5;
        }

        @Override // android.database.ContentObserver
        public boolean deliverSelfNotifications() {
            return true;
        }

        @Override // android.database.ContentObserver
        public void onChange(boolean z) {
            CursorAdapter.this.onContentChanged();
        }
    }

    /* loaded from: classes.jar:android/support/v4/widget/CursorAdapter$MyDataSetObserver.class */
    private class MyDataSetObserver extends DataSetObserver {
        MyDataSetObserver() {
            CursorAdapter.this = r4;
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            CursorAdapter.this.mDataValid = true;
            CursorAdapter.this.notifyDataSetChanged();
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            CursorAdapter.this.mDataValid = false;
            CursorAdapter.this.notifyDataSetInvalidated();
        }
    }

    @Deprecated
    public CursorAdapter(Context context, Cursor cursor) {
        init(context, cursor, 1);
    }

    public CursorAdapter(Context context, Cursor cursor, int i) {
        init(context, cursor, i);
    }

    public CursorAdapter(Context context, Cursor cursor, boolean z) {
        init(context, cursor, z ? 1 : 2);
    }

    public abstract void bindView(View view, Context context, Cursor cursor);

    @Override // android.support.v4.widget.CursorFilter.CursorFilterClient
    public void changeCursor(Cursor cursor) {
        Cursor swapCursor = swapCursor(cursor);
        if (swapCursor != null) {
            swapCursor.close();
        }
    }

    @Override // android.support.v4.widget.CursorFilter.CursorFilterClient
    public CharSequence convertToString(Cursor cursor) {
        return cursor == null ? "" : cursor.toString();
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return (!this.mDataValid || this.mCursor == null) ? 0 : this.mCursor.getCount();
    }

    @Override // android.support.v4.widget.CursorFilter.CursorFilterClient
    public Cursor getCursor() {
        return this.mCursor;
    }

    @Override // android.widget.BaseAdapter, android.widget.SpinnerAdapter
    public View getDropDownView(int i, View view, ViewGroup viewGroup) {
        if (this.mDataValid) {
            this.mCursor.moveToPosition(i);
            if (view == null) {
                view = newDropDownView(this.mContext, this.mCursor, viewGroup);
            }
            bindView(view, this.mContext, this.mCursor);
        } else {
            view = null;
        }
        return view;
    }

    @Override // android.widget.Filterable
    public Filter getFilter() {
        if (this.mCursorFilter == null) {
            this.mCursorFilter = new CursorFilter(this);
        }
        return this.mCursorFilter;
    }

    public FilterQueryProvider getFilterQueryProvider() {
        return this.mFilterQueryProvider;
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        Cursor cursor;
        if (!this.mDataValid || this.mCursor == null) {
            cursor = null;
        } else {
            this.mCursor.moveToPosition(i);
            cursor = this.mCursor;
        }
        return cursor;
    }

    @Override // android.widget.Adapter
    public long getItemId(int i) {
        long j = 0;
        if (this.mDataValid) {
            j = 0;
            if (this.mCursor != null) {
                j = 0;
                if (this.mCursor.moveToPosition(i)) {
                    j = this.mCursor.getLong(this.mRowIDColumn);
                }
            }
        }
        return j;
    }

    @Override // android.widget.Adapter
    public View getView(int i, View view, ViewGroup viewGroup) {
        if (!this.mDataValid) {
            throw new IllegalStateException("this should only be called when the cursor is valid");
        }
        if (!this.mCursor.moveToPosition(i)) {
            throw new IllegalStateException("couldn't move cursor to position " + i);
        }
        if (view == null) {
            view = newView(this.mContext, this.mCursor, viewGroup);
        }
        bindView(view, this.mContext, this.mCursor);
        return view;
    }

    @Override // android.widget.BaseAdapter, android.widget.Adapter
    public boolean hasStableIds() {
        return true;
    }

    void init(Context context, Cursor cursor, int i) {
        boolean z = true;
        if ((i & 1) == 1) {
            i |= 2;
            this.mAutoRequery = true;
        } else {
            this.mAutoRequery = false;
        }
        if (cursor == null) {
            z = false;
        }
        this.mCursor = cursor;
        this.mDataValid = z;
        this.mContext = context;
        this.mRowIDColumn = z ? cursor.getColumnIndexOrThrow("_id") : -1;
        if ((i & 2) == 2) {
            this.mChangeObserver = new ChangeObserver();
            this.mDataSetObserver = new MyDataSetObserver();
        } else {
            this.mChangeObserver = null;
            this.mDataSetObserver = null;
        }
        if (z) {
            if (this.mChangeObserver != null) {
                cursor.registerContentObserver(this.mChangeObserver);
            }
            if (this.mDataSetObserver == null) {
                return;
            }
            cursor.registerDataSetObserver(this.mDataSetObserver);
        }
    }

    @Deprecated
    protected void init(Context context, Cursor cursor, boolean z) {
        init(context, cursor, z ? 1 : 2);
    }

    public View newDropDownView(Context context, Cursor cursor, ViewGroup viewGroup) {
        return newView(context, cursor, viewGroup);
    }

    public abstract View newView(Context context, Cursor cursor, ViewGroup viewGroup);

    protected void onContentChanged() {
        if (!this.mAutoRequery || this.mCursor == null || this.mCursor.isClosed()) {
            return;
        }
        this.mDataValid = this.mCursor.requery();
    }

    @Override // android.support.v4.widget.CursorFilter.CursorFilterClient
    public Cursor runQueryOnBackgroundThread(CharSequence charSequence) {
        return this.mFilterQueryProvider != null ? this.mFilterQueryProvider.runQuery(charSequence) : this.mCursor;
    }

    public void setFilterQueryProvider(FilterQueryProvider filterQueryProvider) {
        this.mFilterQueryProvider = filterQueryProvider;
    }

    public Cursor swapCursor(Cursor cursor) {
        Cursor cursor2;
        if (cursor == this.mCursor) {
            cursor2 = null;
        } else {
            Cursor cursor3 = this.mCursor;
            if (cursor3 != null) {
                if (this.mChangeObserver != null) {
                    cursor3.unregisterContentObserver(this.mChangeObserver);
                }
                if (this.mDataSetObserver != null) {
                    cursor3.unregisterDataSetObserver(this.mDataSetObserver);
                }
            }
            this.mCursor = cursor;
            if (cursor != null) {
                if (this.mChangeObserver != null) {
                    cursor.registerContentObserver(this.mChangeObserver);
                }
                if (this.mDataSetObserver != null) {
                    cursor.registerDataSetObserver(this.mDataSetObserver);
                }
                this.mRowIDColumn = cursor.getColumnIndexOrThrow("_id");
                this.mDataValid = true;
                notifyDataSetChanged();
                cursor2 = cursor3;
            } else {
                this.mRowIDColumn = -1;
                this.mDataValid = false;
                notifyDataSetInvalidated();
                cursor2 = cursor3;
            }
        }
        return cursor2;
    }
}
