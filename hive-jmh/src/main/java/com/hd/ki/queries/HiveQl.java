package com.hd.ki.queries;

/**
 * Created by Lev_Khacheresiantc on 8/11/2016.
 */
public class HiveQL {


    public static final String  SET_OPTIMIZE_INDEX_FILTER_TRUE  = "SET hive.optimize.index.filter=true";
    public static final String  SET_OPTIMIZE_INDEX_FILTER_COMPACT_SIZE_ZERO = "SET hive.optimize.index.filter.compact.minsize=0";


    public static final String  SET_FLIGHTS_TABLE  = "set hivevar:flights=";
    public static final String  SET_AIRPORTS_TABLE  = "set hivevar:airports=";
    public static final String  SET_CARRIERS_TABLE  = "set hivevar:carriers=";

    public static final String  SET_ENGINE  = "set hive.execution.engine=";
    public static final String  SET_VECTORISATION  = "set hive.vectorized.execution.enabled=";
    public static final String  QUERY_1  =
            "SELECT COUNT(*) total_flights, c.description carrier " +
            "    FROM ${flights} f " +
            "    JOIN ${carriers} c ON (c.code = f.uniquecarrier) " +
            "GROUP BY c.description " +
            "SORT BY total_flights";

    public static final String  QUERY_2  = 
            "SELECT COUNT(*) total_flights " +
            "    FROM ${flights} f, " +
            "         ${airports} a " +
            "WHERE  (f.origin = a.iata or f.dest = a.iata) " +
            "    AND f.month = 6 " +
            "    AND \"New York\" = a.city";
    
    public static final String  QUERY_3  = 
            "SELECT COUNT(*) total_flights, r.airport FROM ( " +
            "    SELECT  a.airport " +
            "        FROM ${flights} f " +
            "        JOIN ${airports} a ON (f.origin = a.iata) " +
            "        WHERE  \"USA\" = a.country " +
            "                AND f.month BETWEEN 6 AND 8 " +
            "    UNION ALL " +
            "    SELECT  a.airport " +
            "        FROM ${flights} f " +
            "        JOIN ${airports} a ON (f.dest = a.iata) " +
            "        WHERE  \"USA\" = a.country " +
            "                AND f.month BETWEEN 6 AND 8 " +
            ") r " +
            "GROUP BY r.airport " +
            "SORT BY total_flights DESC " +
            "LIMIT 5";
    public static final String  QUERY_4  = 
            "SELECT COUNT(*) total_flights, c.description  carrier " +
            "    FROM ${flights} f " +
            "    JOIN ${carriers} c ON (c.code = f.uniquecarrier) " +
            "GROUP BY c.description " +
            "SORT BY total_flights DESC " +
            "LIMIT 1";

}
