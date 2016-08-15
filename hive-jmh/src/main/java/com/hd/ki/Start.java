package com.hd.ki;

import static com.hd.ki.queries.HiveQL.*;

import java.sql.*;
import java.util.concurrent.TimeUnit;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.results.format.ResultFormatType;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.openjdk.jmh.runner.options.TimeValue;

import com.hd.ki.consntants.HiveTables;
import com.hd.ki.queries.HiveQL;

/**
 * Created by Lev_Khacheresiantc on 8/9/2016.
 */
@State(Scope.Benchmark)
public class Start {
    private final static String DRIVER_NAME =
        "org.apache.hadoop.hive.jdbc.HiveDriver";
    private final static String HIVE_SERVER_URL =
        "jdbc:hive2://localhost:10000/hw_4";
    private final static String RESULT_NAME =
            "benchmark-scheme-orc-method-";

    @Param({ "mr", "tez" })
    public String engine;
    @Param({ "false","true" })
    public String vectorisation;

    private Connection connection;
    private Statement statement;

    public static void main(String[] args) throws RunnerException {

        for (int methodNumber = 1; methodNumber <= 4; methodNumber++) {
            Options options = buildCommonOptions(
                Start.class.getCanonicalName() + ".query" + methodNumber, methodNumber);
            new Runner(options).run();
        }
    }

    private static Options buildCommonOptions(String methodToExecute, int number) {
        return new OptionsBuilder().include(methodToExecute).forks(1)
            .detectJvmArgs().mode(Mode.AverageTime).warmupIterations(1)
            .measurementIterations(5).timeout(TimeValue.seconds(2))
            .timeUnit(TimeUnit.SECONDS).shouldFailOnError(true)
            .result(RESULT_NAME + number)
            .resultFormat(ResultFormatType.CSV).build();
    }

    @Setup
    public void init() throws SQLException {
        connection = DriverManager.getConnection(HIVE_SERVER_URL, "", "");
        statement = connection.createStatement();
        statement.execute(SET_FLIGHTS_TABLE + HiveTables.SchemeORC.FLIGHTS);
        statement.execute(SET_AIRPORTS_TABLE + HiveTables.SchemeORC.AIRPORTS);
        statement.execute(SET_CARRIERS_TABLE + HiveTables.SchemeORC.CARRIERS);
        statement.execute(SET_OPTIMIZE_INDEX_FILTER_TRUE);
        statement.execute(SET_OPTIMIZE_INDEX_FILTER_COMPACT_SIZE_ZERO);
        statement.execute(SET_ENGINE + engine);
       // statement.execute(SET_VECTORISATION + vectorisation);
    }

    @TearDown
    public void cleanUp() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Benchmark
    public ResultSet query1() throws SQLException {
        return statement.executeQuery(HiveQL.QUERY_1);
    }

    @Benchmark
    public ResultSet query2() throws SQLException {
        return statement.executeQuery(HiveQL.QUERY_2);
    }

    @Benchmark
    public ResultSet query3() throws SQLException {
        return statement.executeQuery(HiveQL.QUERY_3);
    }

    @Benchmark
    public ResultSet query4() throws SQLException {
        return statement.executeQuery(HiveQL.QUERY_4);
    }
}
