copy bike_share_year_0
FROM 'C:\Users\autob\OneDrive\Desktop\bike_share_data_analysis\YT_Bike_Share_Data\bike_share_yr_0.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
copy bike_share_year_1
FROM 'C:\Users\autob\OneDrive\Desktop\bike_share_data_analysis\YT_Bike_Share_Data\bike_share_yr_1.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );
copy cost_table
FROM 'C:\Users\autob\OneDrive\Desktop\bike_share_data_analysis\YT_Bike_Share_Data\cost_table.csv' WITH (
        FORMAT csv,
        HEADER true,
        DELIMITER ',',
        ENCODING 'UTF8'
    );