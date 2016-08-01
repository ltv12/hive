package com.ki.hive;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.DeviceType;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

import java.util.Collection;

/**
 * Created by Lev_Khacheresiantc on 8/1/2016.
 */
public class CustomHiveFunction extends UDF {

    public Text evaluate(Text param, Text value) {
        Text result = new Text();
        if (param == null || value == null) {
            return null;
        }
        try {
            Commands command = Commands.getEnum(param.toString().toLowerCase());
            switch (command) {
            case DEVICE:
                result.set(getDevice(value));
                break;
            case BROWSER:
                result.set(getBrowser(value));
                break;
            case OS:
                result.set(getOS(value));
                break;
            }
        } catch (IllegalArgumentException iae) {
            System.out.println("The command " + param.toString()
                + " is illegal for value " + value.toString());
        }

        return result;
    }

    private String getDevice(Text value) {
        UserAgent userAgent = UserAgent.parseUserAgentString(value.toString());
        DeviceType deviceType = userAgent.getOperatingSystem().getDeviceType();
        return deviceType != null ? deviceType.getName() : "";
    }

    private String getBrowser(Text value) {
        UserAgent userAgent = UserAgent.parseUserAgentString(value.toString());
        Browser browser = userAgent.getBrowser();
        return browser != null ? browser.getName() : "";
    }

    private String getOS(Text value) {
        UserAgent userAgent = UserAgent.parseUserAgentString(value.toString());
        OperatingSystem os = userAgent.getOperatingSystem();
        return os != null ? os.getName() : "";
    }

    private enum Commands {
        DEVICE("device"), BROWSER("browser"), OS("os");

        private String command;

        Commands(String comand) {
            this.command = comand;
        }

        public static Commands getEnum(String value) {
            for (Commands v : values())
                if (v.getValue().equalsIgnoreCase(value))
                    return v;
            throw new IllegalArgumentException();
        }

        public String getValue() {
            return command;
        }

        @Override
        public String toString() {
            return this.getValue();
        }
    }
}
