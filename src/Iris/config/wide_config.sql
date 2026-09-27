CREATE TABLE IF NOT EXISTS backend_config (
    key TEXT PRIMARY KEY,
    value TEXT NOT NULL
);

INSERT INTO backend_config (key, value) VALUES
    ("anim_duration", "250")