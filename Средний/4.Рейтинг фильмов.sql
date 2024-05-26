 WITH UserRatings AS (
    SELECT
        MR.user_id,
        U.name,
        COUNT(MR.movie_id) AS ratings_count
    FROM
        MovieRating MR
    JOIN
        Users U ON MR.user_id = U.user_id
    GROUP BY
        MR.user_id, U.name
),
MaxUser AS (
    SELECT
        name
    FROM
        UserRatings
    ORDER BY
        ratings_count DESC,
        name
    LIMIT 1
),

 MovieAverageRatings AS (
    SELECT
        MR.movie_id,
        M.title,
        AVG(MR.rating) AS avg_rating
    FROM
        MovieRating MR
    JOIN
        Movies M ON MR.movie_id = M.movie_id
    WHERE
        MR.created_at >= '2020-02-01' AND MR.created_at <= '2020-02-29'
    GROUP BY
        MR.movie_id, M.title
),
MaxMovie AS (
    SELECT
        title
    FROM
        MovieAverageRatings
    ORDER BY
        avg_rating DESC,
        title
    LIMIT 1
)

-- Объединение результатов в один столбец
SELECT name AS results FROM MaxUser
UNION ALL
SELECT title AS results FROM MaxMovie;
