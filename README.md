Задачи с Leetcode на различные функции необходимые для работы с таблицами базы данных , вот некоторые примеры из решении (легкие)
1. **Определение, могут ли три отрезка образовать треугольник**:
   - **Функция**: Проверка условий треугольника с использованием `CASE`.
   - **Запрос**:
     ```sql
     SELECT x, y, z,
            CASE
                WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
                ELSE 'No'
            END AS is_triangle
     FROM Triangle;
     ```

2. **Отчет о фильмах с нечетным `id` и не "boring" описанием, отсортированных по рейтингу**:
   - **Функция**: Фильтрация и сортировка с использованием `MOD`, `WHERE`, и `ORDER BY`.
   - **Запрос**:
     ```sql
     SELECT *
     FROM Cinema
     WHERE MOD(id, 2) <> 0
       AND description <> 'boring'
     ORDER BY rating DESC;
     ```

3. **Нахождение первого логина каждого игрока**:
   - **Функция**: Агрегация с использованием `MIN` и `GROUP BY`.
   - **Запрос**:
     ```sql
     SELECT player_id, MIN(event_date) AS first_login_date
     FROM Activity
     GROUP BY player_id;
     ```

4. **Отчет о сотрудниках с отсутствующей информацией (имя или зарплата)**:
   - **Функция**: Объединение таблиц и фильтрация с использованием `LEFT JOIN` и `WHERE`.
   - **Запрос**:
     ```sql
     SELECT e.employee_id
     FROM Employees e
     LEFT JOIN Salaries s ON e.employee_id = s.employee_id
     WHERE e.name IS NULL OR s.salary IS NULL
     ORDER BY e.employee_id;
     ```

5. **Отчет о фильмах с описанием "boring" и четным `id`**:
   - **Функция**: Фильтрация с использованием `MOD` и `WHERE`.
   - **Запрос**:
     ```sql
     SELECT *
     FROM Cinema
     WHERE MOD(id, 2) = 0
       AND description = 'boring';
     ```

6. **Нахождение авторов, просмотревших свои собственные статьи**:
   - **Функция**: Фильтрация с использованием `WHERE` и `DISTINCT`.
   - **Запрос**:
     ```sql
     SELECT DISTINCT author_id AS id
     FROM Views
     WHERE author_id = viewer_id
     ORDER BY author_id ASC;
     ```

7. **Отчет о сотрудниках с бонусом меньше 1000**:
   - **Функция**: Объединение таблиц и фильтрация с использованием `INNER JOIN` и `WHERE`.
   - **Запрос**:
     ```sql
     SELECT e.name, b.bonus
     FROM Employee e
     INNER JOIN Bonus b ON e.empId = b.empId
     WHERE b.bonus < 1000;
     ```
