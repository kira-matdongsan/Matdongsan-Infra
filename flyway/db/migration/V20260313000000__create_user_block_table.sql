CREATE TABLE user_block (
    id         BIGINT       NOT NULL AUTO_INCREMENT,
    blocker_id BIGINT       NOT NULL COMMENT '차단을 한 사용자 ID',
    blocked_id BIGINT       NOT NULL COMMENT '차단 당한 사용자 ID',
    created_at DATETIME(6)  NOT NULL,
    updated_at DATETIME(6),
    deleted_at DATETIME(6),
    PRIMARY KEY (id),
    UNIQUE KEY uk_user_block (blocker_id, blocked_id),
    KEY idx_blocker_id (blocker_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사용자 차단';
