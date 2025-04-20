/* 1. Combined rows from bike_share_year_0 and bike_share_year_1 within a subquery using UNION ALL.
 2. Merged the result of the UNION ALL subquery with cost_table based on matching year values using LEFT JOIN.
 3. Stored the joined result in a new table, combined_bike_data.
 */
DROP TABLE IF EXISTS combined_bike_data;
CREATE TABLE combined_bike_data AS WITH full_table AS (
    SELECT *
    FROM bike_share_year_0
    UNION ALL
    SELECT *
    FROM bike_share_year_1
)
SELECT ft.date,
    ft.season,
    ft.year,
    ft.month,
    ft.hour,
    ft.holiday,
    ft.weekday,
    ft.working_day,
    ft.weathersit,
    ft.temp,
    ft.atemp,
    ft.hum,
    ft.windspeed,
    ft.rider_type,
    ft.riders,
    ct.price,
    ct.COGS
FROM full_table AS ft
    LEFT JOIN cost_table AS ct ON ft.year = ct.year;
SELECT *
FROM combined_bike_data;