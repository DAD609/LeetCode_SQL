WITH FirstLogin AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM
        Activity
    GROUP BY
        player_id
),
NextDayLogin AS (
    SELECT
        A1.player_id
    FROM
        Activity A1
    JOIN
        FirstLogin FL
    ON
        A1.player_id = FL.player_id
        AND A1.event_date = FL.first_login_date + INTERVAL '1 day'
)
SELECT
    ROUND(COUNT(DISTINCT NDL.player_id) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    NextDayLogin NDL;
