WITH mart_fullmoon_reivews AS (
    SELECT * FROM {{ ref('mart_fullmoon_reviews') }}
)
SELECT 
    is_full_moon,
    review_sentiment,
    COUNT(*) as reviews
FROM 
    mart_fullmoon_reivews
GROUP BY
    is_full_moon,
    review_sentiment
ORDER BY
    is_full_moon,
    review_sentiment