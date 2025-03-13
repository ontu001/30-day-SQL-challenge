WITH trails_info AS (
    -- Joining trails with mountain_huts to get hut names and altitudes
    SELECT 
        t.hut1 AS hut_A, h1.name AS hut_A_name, h1.altitude AS hut_A_altitude,
        t.hut2 AS hut_B, h2.name AS hut_B_name, h2.altitude AS hut_B_altitude
    FROM trails t
    JOIN mountain_huts h1 ON t.hut1 = h1.id
    JOIN mountain_huts h2 ON t.hut2 = h2.id
),
ordered_trails AS (
    -- Ensure the hut with the higher altitude is hut_A and the lower one is hut_B
    SELECT 
        CASE WHEN hut_A_altitude > hut_B_altitude THEN hut_A ELSE hut_B END AS start_hut,
        CASE WHEN hut_A_altitude > hut_B_altitude THEN hut_A_name ELSE hut_B_name END AS start_hut_name,
        CASE WHEN hut_A_altitude > hut_B_altitude THEN hut_B ELSE hut_A END AS middle_hut,
        CASE WHEN hut_A_altitude > hut_B_altitude THEN hut_B_name ELSE hut_A_name END AS middle_hut_name
    FROM trails_info
)
SELECT 
    t1.start_hut_name AS startpt,
    t1.middle_hut_name AS middlept,
    t2.middle_hut_name AS endpt
FROM ordered_trails t1
JOIN ordered_trails t2 ON t1.middle_hut = t2.start_hut
WHERE t1.start_hut_name <> t2.middle_hut_name; -- Ensure unique huts in the sequence
