CREATE TABLE sticker (
    id            BIGINT       NOT NULL AUTO_INCREMENT,
    image_url     TEXT         NOT NULL COMMENT '스티커 이미지 S3 URL',
    name          VARCHAR(50)  COMMENT '관리용 라벨',
    display_order INT          NOT NULL COMMENT '팔레트 정렬 순서',
    active        BOOLEAN      NOT NULL DEFAULT TRUE COMMENT '현재 팔레트 노출 여부',
    created_at    DATETIME(6)  NOT NULL,
    updated_at    DATETIME(6),
    PRIMARY KEY (id),
    KEY idx_sticker_active_order (active, display_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='제철기록장 스티커 (어드민 관리, 이미지 불변)';
