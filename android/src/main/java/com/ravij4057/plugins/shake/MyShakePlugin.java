package com.ravij4057.plugins.shake;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "MyShake")
public class MyShakePlugin extends Plugin implements SensorEventListener {
    private SensorManager sensorManager;
    private float mAccel = 10f;
    private float mAccelCurrent = SensorManager.GRAVITY_EARTH;
    private float mAccelLast = SensorManager.GRAVITY_EARTH;
    
    // Cooldown variables
    private long lastShakeTimestamp = 0;
    private static final int COOLDOWN_MS = 2000; // 2 seconds

    @Override
    public void load() {
        sensorManager = (SensorManager) getContext().getSystemService(Context.SENSOR_SERVICE);
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        float x = event.values[0];
        float y = event.values[1];
        float z = event.values[2];
        mAccelLast = mAccelCurrent;
        mAccelCurrent = (float) Math.sqrt(x * x + y * y + z * z);
        float delta = mAccelCurrent - mAccelLast;
        mAccel = mAccel * 0.9f + delta;

        if (mAccel > 12) {
            long now = System.currentTimeMillis();
            // Sirf tab notify karein jab 2 second beet chuke hon
            if (now - lastShakeTimestamp > COOLDOWN_MS) {
                lastShakeTimestamp = now;
                notifyListeners("shake", new JSObject());
            }
        }
    }
    // ... baki accuracy method same
}