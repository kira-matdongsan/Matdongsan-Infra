-- 제철음식 테이블
CREATE TABLE food (
    id                 BIGINT AUTO_INCREMENT PRIMARY KEY,  -- 제철음식 ID

    -- 기본 정보
    name               VARCHAR(255) NOT NULL,              -- 제철음식명
    english_name       VARCHAR(255),                       -- 제철음식명 영문
    subtitle           VARCHAR(255),                       -- 소제목
    description        TEXT,                               -- 설명
    image_url          TEXT NOT NULL,                      -- 원본 이미지 URL
    thumbnail_url      TEXT,                               -- 썸네일 이미지 URL
    color              VARCHAR(10),                        -- 대표 컬러

    -- 상태 정보
    is_featured        BOOLEAN DEFAULT FALSE,              -- 공개 여부
    last_featured_at   DATETIME,                           -- 마지막 공개일 (featured_food.start_at)
    like_count         INT DEFAULT 0,                      -- 총 좋아요 수

    -- 제철 관련 정보
    season_months      JSON,                               -- 제철 시기 (1~12월)
    regions            TEXT,                               -- 주요 산지
    benefits           TEXT,                               -- 효능
    buying_tips        TEXT,                               -- 구입 요령
    preparation_tips   TEXT,                               -- 손질 요령
    nutrients          JSON,                               -- 영양 성분

    -- 공통 시간 정보
    created_at         DATETIME,
    updated_at         DATETIME
);
