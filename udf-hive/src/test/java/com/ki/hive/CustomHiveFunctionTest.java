package com.ki.hive;

import junit.framework.TestCase;
import org.apache.hadoop.io.Text;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/**
 * Created by Lev_Khacheresiantc on 8/1/2016.
 */
public class CustomHiveFunctionTest extends Assert {
    private Text textToTest;
    private Text emptyText;
    private CustomHiveFunction function;

    @Before
    public void runBeforeTestMethod() {
        textToTest = new Text(
            "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)\t113.117.187.*");
        emptyText = new Text();
        function = new CustomHiveFunction();

    }

    @Test
    public void testUDF_withCorrectInput() {

        Text expectedDevice = new Text("Computer");
        Text device = function.evaluate(new Text("device"), textToTest);
        assertEquals(device, expectedDevice);

        Text expectedBrowser = new Text("Internet Explorer 6");
        Text browser = function.evaluate(new Text("browser"), textToTest);
        assertEquals(browser, expectedBrowser);

        Text expectedOS = new Text("Windows XP");
        Text os = function.evaluate(new Text("os"), textToTest);
        assertEquals(os, expectedOS);

    }

    @Test
    public void testUDF_withEmptyInput() {

        Text expectedResult = new Text("Unknown");
        Text device = function.evaluate(new Text("device"), emptyText);
        assertEquals(device, expectedResult);

        Text browser = function.evaluate(new Text("browser"), emptyText);
        assertEquals(browser, expectedResult);

        Text os = function.evaluate(new Text("os"), emptyText);
        assertEquals(os, expectedResult);

    }
}
