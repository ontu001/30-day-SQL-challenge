WITH LastNonNullValues AS (
    SELECT
        id,
        car,
        length,
        width,
        height,
        LAST_VALUE(car) IGNORE NULLS OVER (ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_car,
        LAST_VALUE(length) IGNORE NULLS OVER (ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_length,
        LAST_VALUE(width) IGNORE NULLS OVER (ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_width,
        LAST_VALUE(height) IGNORE NULLS OVER (ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_height
    FROM FOOTER
)
SELECT
    last_car AS car,
    last_length AS length,
    last_width AS width,
    last_height AS height
FROM LastNonNullValues
LIMIT 1;