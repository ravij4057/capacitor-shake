package com.ravij4057.plugins.shake;

import com.getcapacitor.Logger;

public class MyShake {

    public String echo(String value) {
        Logger.info("Echo", value);
        return value;
    }
}
