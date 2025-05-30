-- 나의 제철음식 이야기 공통 테이블
CREATE TABLE food_story (
    id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    food_id        BIGINT NOT NULL,
    user_id        BIGINT NOT NULL,
    type           ENUM('RECIPE', 'PLACE', 'SEASONAL_NOTE') NOT NULL,
    content        TEXT,
    like_count     INT DEFAULT 0,
    report_count   INT DEFAULT 0,
    recorded_date  DATE,
    recipe_name    VARCHAR(255),
    ingredients    TEXT,
    instructions   TEXT,
    place_name     VARCHAR(255),
    category       VARCHAR(255),
    address        VARCHAR(255),
    naver_url      TEXT,
    created_at     DATETIME,
    updated_at     DATETIME,
    deleted_at     DATETIME,
    FOREIGN KEY (food_id) REFERENCES food(id)
    -- FOREIGN KEY (user_id) REFERENCES user(id) -- 사용자 테이블과 연결 시 주석 해제
);

-- 이야기 이미지 테이블
CREATE TABLE food_story_image (
    id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    story_id       BIGINT NOT NULL,
    image_url      TEXT NOT NULL,
    thumbnail_url  TEXT,
    order_num      INT DEFAULT 0,
    created_at     DATETIME,
    updated_at     DATETIME,
    deleted_at     DATETIME,
    FOREIGN KEY (story_id) REFERENCES food_story(id)
);

-- 좋아요 테이블
CREATE TABLE food_story_like (
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    story_id   BIGINT NOT NULL,
    user_id    BIGINT NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    FOREIGN KEY (story_id) REFERENCES food_story(id)
    -- FOREIGN KEY (user_id) REFERENCES user(id) -- 사용자 테이블과 연결 시 주석 해제
);

-- 신고 테이블
CREATE TABLE food_story_report (
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    story_id   BIGINT NOT NULL,
    user_id    BIGINT NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    FOREIGN KEY (story_id) REFERENCES food_story(id)
    -- FOREIGN KEY (user_id) REFERENCES user(id) -- 사용자 테이블과 연결 시 주석 해제
);
