CREATE TABLE steps (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    step TEXT NOT NULL,
    completed BOOLEAN DEFAULT false,
    project_id INTEGER
        REFERENCES projects(id) ON DELETE CASCADE NOT NULL
);

BEGIN;

TRUNCATE
    users,
    projects
    RESTART IDENTITY CASCADE;

INSERT INTO users (email, username, password)
VALUES
    ('test123@test.com', 'username123', 'password123'),
    ('test456@test.com', 'username456', 'password456'),
    ('test789@test.com', 'username789', 'password789');

INSERT INTO projects (name, description, user_id)
VALUES  
    ('Test 1', '1st test project', 1),
    ('Test 2', '2nd test project', 2),
    ('Test 3', null, 3);

INSERT INTO materials (item, project_id)
VALUES
    ('Test Item 1A', 1),
    ('Test Item 1B', 1),
    ('Test Item 1C', 1),
    ('Test Item 2A', 2),
    ('Test Item 2B', 2),
    ('Test Item 2C', 2),
    ('Test Item 3A', 3),
    ('Test Item 3B', 3),
    ('Test Item 3C', 3);

INSERT INTO steps (step, project_id)
VALUES
    ('Test Step 1A', 1),
    ('Test Step 1B', 1),
    ('Test Step 1C', 1),
    ('Test Step 2A', 2),
    ('Test Step 2B', 2),
    ('Test Step 2C', 2),
    ('Test Step 3A', 3),
    ('Test Step 3B', 3),
    ('Test Step 3C', 3);

COMMIT;