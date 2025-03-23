SELECT 
    CAST(RANK AS INTEGER) AS RANK, -- Convert Rank to Integer Type
    CAST(NAME AS VARCHAR(255)) AS NAME, -- Convert Name to String Type
    CAST(LOCATION AS VARCHAR(255)) AS LOCATION, -- Convert Location to String Type
    CAST(TOTAL_ROOMS AS INTEGER) AS NUMBER_OF_ROOMS, -- Convert Total_Rooms to Integer and rename it Number_Of_Rooms to be more accurate
    CAST(STARTING_RATE_IN_$ AS INTEGER) AS ENTRY_PRICE_IN_USD, -- Convert Starting_Rate to Integer and rename it to be more accurate
    CAST(HOTEL_AMMENTIES AS VARCHAR(400)) AS AMENITIES -- Convert Hotel_Ammenties to String and rename it Amenities to be more simple
FROM 
    {{ source('raw', 'TOP_50_LUXURY_HOTELS') }}

