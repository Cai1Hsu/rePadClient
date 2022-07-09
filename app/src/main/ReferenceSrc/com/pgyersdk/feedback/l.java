package com.pgyersdk.feedback;

import android.content.Context;
import android.hardware.SensorListener;
import android.hardware.SensorManager;
import android.util.Log;

/* loaded from: classes.dex */
public final class l implements SensorListener {
    private static String a = "ShakeListener";
    private SensorManager g;
    private long k;
    private m l;
    private Context m;
    private long o;
    private long p;
    private int b = 950;
    private int c = 110;
    private int d = 500;
    private int e = 1000;
    private int f = 4;
    private float h = -1.0f;
    private float i = -1.0f;
    private float j = -1.0f;
    private int n = 0;

    public l(Context context) {
        this.m = context;
        a();
    }

    public final void a() {
        this.g = (SensorManager) this.m.getSystemService("sensor");
        if (this.g == null) {
            Log.d(a, "不支持摇一摇");
        }
        if (!this.g.registerListener(this, 2, 1)) {
            this.g.unregisterListener(this, 2);
            Log.d(a, "不支持摇一摇");
        }
    }

    public final void a(m mVar) {
        this.l = mVar;
    }

    public final void b() {
        if (this.g != null) {
            this.g.unregisterListener(this, 2);
            this.g = null;
        }
    }

    @Override // android.hardware.SensorListener
    public final void onAccuracyChanged(int i, int i2) {
    }

    @Override // android.hardware.SensorListener
    public final void onSensorChanged(int sensor, float[] values) {
        if (sensor != 2) {
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.p > this.d) {
            this.n = 0;
        }
        if (currentTimeMillis - this.k <= this.c) {
            return;
        }
        if ((Math.abs(((((values[0] + values[1]) + values[2]) - this.h) - this.i) - this.j) / ((float) (currentTimeMillis - this.k))) * 10000.0f > this.b) {
            int i = this.n + 1;
            this.n = i;
            if (i >= this.f && currentTimeMillis - this.o > this.e) {
                this.o = currentTimeMillis;
                this.n = 0;
                if (this.l != null) {
                    this.l.a();
                }
            }
            this.p = currentTimeMillis;
        }
        this.k = currentTimeMillis;
        this.h = values[0];
        this.i = values[1];
        this.j = values[2];
    }
}
