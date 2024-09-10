
WITH active_users AS (
    SELECT 
        country,
        COUNT(*) AS active_users
    FROM 
        penetration_analysis
    WHERE 
        last_active_date >= DATEADD(day, -30, '2024-09-11')
        AND sessions >= 5
        AND listening_hours >= 10
    GROUP BY 
        country
),
total_users AS (
    SELECT 
        country,
        COUNT(*) AS total_users
    FROM 
        penetration_analysis
    GROUP BY 
        country
)
SELECT 
    t.country,
    ROUND((a.active_users * 100.0 / t.total_users), 2) AS active_user_penetration_rate
FROM 
    total_users t
LEFT JOIN 
    active_users a
ON 
    t.country = a.country;
