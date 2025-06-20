-- This is the default template for models

WITH 

    stg_enterprises AS (
        SELECT
            *
        FROM {{ ref('stg_tech_mews_db_prod__enterprises') }}
    )

    

SELECT * FROM stg_enterprises

