SELECT 
    RANK,
    NAME, 
    LOCATION, 
    NUMBER_OF_ROOMS,
    ENTRY_PRICE_IN_USD, 
    CASE WHEN LOWER(Amenities) LIKE '%swimming pool%' THEN 1 ELSE 0 END AS Swimming_Pool, -- 1 if the the Amenities column mentions a swimming pool and 0 if not
    CASE WHEN LOWER(Amenities) LIKE '%spa/wellness centre%' THEN 1 ELSE 0 END AS Spa,
    CASE WHEN LOWER(Amenities) LIKE '%fitness centre%' THEN 1 ELSE 0 END AS Fitness_Centre,
    CASE WHEN LOWER(Amenities) LIKE '%pet friendly%' THEN 1 ELSE 0 END AS Pet_friendly,
    CASE WHEN LOWER(Amenities) LIKE '%family friendly%' THEN 1 ELSE 0 END AS Family_Friendly,
    CASE WHEN LOWER(Amenities) LIKE '%beach%' THEN 1 ELSE 0 END AS Beach,
    CASE WHEN LOWER(Amenities) LIKE '%cinema%' THEN 1 ELSE 0 END AS Cinema,
    CASE WHEN LOWER(Amenities) LIKE '%shopping%' THEN 1 ELSE 0 END AS Shopping
FROM 
    {{ref('Top_50_Staging')}}