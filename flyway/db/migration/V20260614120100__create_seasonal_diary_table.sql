CREATE TABLE seasonal_diary (
    id          BIGINT       NOT NULL AUTO_INCREMENT,
    user_id     BIGINT       NOT NULL COMMENT '기록 작성자 ID',
    record_date DATE         NOT NULL COMMENT '기록이 귀속되는 날짜',
    sticker_id  BIGINT       NOT NULL COMMENT '스티커 ID (sticker.id, 불변 참조 - 과거 동결)',
    content     VARCHAR(40)  NOT NULL COMMENT '기록 내용 (최대 40자)',
    created_at  DATETIME(6)  NOT NULL,
    updated_at  DATETIME(6),
    deleted_at  DATETIME(6),
    PRIMARY KEY (id),
    KEY idx_seasonal_diary_user_date (user_id, record_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='제철기록장 (비공개 캘린더 기록)';
