SELECT * FROM {{ref('dim_listings_cleansed')}} L
INNER JOIN {{ref('fct_reviews')}} R
USING (listing_id)
WHERE L.created_at >= R.review_date