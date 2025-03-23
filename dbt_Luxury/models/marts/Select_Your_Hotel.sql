 {{ config(materialized='table') }}

SELECT
    *
FROM 
    {{ref('Top_50_Inter')}}