-- table: todos
-- name: SelectTodosByUsername :many
SELECT *
FROM todos
WHERE username = $1;
-- name: InsertTodo :one
INSERT INTO todos (body, username)
VALUES ($1, $2)
RETURNING *;
-- name: UpdateTodo :one
UPDATE todos
SET body = $1
WHERE id = $2
RETURNING *;
-- name: DeleteTodo :exec
DELETE FROM todos
WHERE id = $1;