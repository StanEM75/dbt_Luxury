SELECT 
    LOCATION AS CITY, -- Rename to make it clear that we are going to analyze through city dimensions
    SUM(NUMBER_OF_ROOMS) AS AVAILABLE_ROOMS, -- Count all the hotel rooms available in the city
    ROUND(AVG(ENTRY_PRICE_IN_USD)) AS AVG_PRICE, -- Get the average entry price for a hotel room
    SUM(Swimming_Pool) AS NUMBER_OF_POOLS, -- Count the pools
    SUM(Spa) AS NUMBER_OF_SPAS, -- Count the spas
    SUM(Fitness_Centre) AS NUMBER_OF_FITNESS, -- Count the fitness centres
    SUM(Pet_friendly) AS NUMBER_OF_PET_FRIENDLY, -- Count the pet-friendly locations
    SUM(Family_Friendly) AS NUMBER_OF_FAMILY_FRIENDLY, -- Count the family-friendly locations
    SUM(Beach) AS NUMBER_OF_BEACH, -- Count the locations close to beaches
    SUM(Cinema) AS NUMBER_OF_CINEMA, -- Count the locations close to cinemas
    SUM(Shopping) AS NUMBER_OF_Shopping, -- Count the locations close to shopping places
FROM 
    {{ref('Top_50_Inter')}}
GROUP BY 
    ALL