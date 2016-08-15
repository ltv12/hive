package com.hd.ki.consntants;

/**
 * Created by Lev_Khacheresiantc on 8/11/2016.
 */
public class HiveTables {
    public static class BaseScheme {
        public final static String AIRPORTS = "airports";
        public final static String FLIGHTS = "flights";
        public final static String CARRIERS = "carriers";
    }

    public static class Scheme_1 {
        public final static String AIRPORTS = "airports";
        public final static String FLIGHTS = "flights_b_s1";
        public final static String CARRIERS = "carriers";
    }
    public static class Scheme_2 {
        public final static String AIRPORTS = "airports_b_s2";
        public final static String FLIGHTS = "flights_p_s2";
        public final static String CARRIERS = "carriers";
    }

    public static class Scheme_3 {
        public final static String AIRPORTS = "airports";
        public final static String FLIGHTS = "flights_pb_s3";
        public final static String CARRIERS = "carriers";
    }
    public static class Scheme_4 {
        public final static String AIRPORTS = "airports";
        public final static String FLIGHTS = "flights_b_s4";
        public final static String CARRIERS = "carriers";
    }

    public static class SchemeIndexed {
        public final static String AIRPORTS = "airports_indexed";
        public final static String FLIGHTS = "flights_indexed";
        public final static String CARRIERS = "carriers";
    }

    public static class SchemeORC {
        public final static String AIRPORTS = "airports_orc";
        public final static String FLIGHTS = "flights_orc";
        public final static String CARRIERS = "carriers_orc";
    }

    public static class SchemeCompressedORC {
        public final static String AIRPORTS = "airports_orc_compressed";
        public final static String FLIGHTS = "flights_orc_compressed";
        public final static String CARRIERS = "carriers_orc_compressed";
    }
}
