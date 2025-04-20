CREATE TABLE bike_share_year_0 (
    date TIMESTAMP,
    season INT,
    year INT,
    month INT,
    hour INT,
    holiday BOOLEAN,
    weekday INT,
    working_day BOOLEAN,
    weathersit INT,
    temp DECIMAL,
    atemp DECIMAL,
    hum DECIMAL,
    windspeed DECIMAL,
    rider_type VARCHAR(15),
    riders INT
) CREATE TABLE bike_share_year_1 (
    date TIMESTAMP,
    season INT,
    year INT,
    month INT,
    hour INT,
    holiday BOOLEAN,
    weekday INT,
    working_day BOOLEAN,
    weathersit INT,
    temp DECIMAL,
    atemp DECIMAL,
    hum DECIMAL,
    windspeed DECIMAL,
    rider_type VARCHAR(15),
    riders INT
) CREATE TABLE cost_table (
    year INT,
    price DECIMAL(10, 2),
    COGS DECIMAL(10, 2)
)