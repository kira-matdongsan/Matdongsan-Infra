-- 맛동산 Pick 제철 요리 테이블
CREATE TABLE dish_pick (
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    food_id      BIGINT        NOT NULL,
    vote_count   INT DEFAULT 0,
    start_at     DATETIME      NOT NULL,
    end_at       DATETIME      NOT NULL,
    created_at   DATETIME,
    updated_at   DATETIME,
    FOREIGN KEY (food_id) REFERENCES food(id)
);

-- 유저 등록 제철 요리 테이블
CREATE TABLE dish (
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    pick_id      BIGINT        NOT NULL,
    user_id      BIGINT        NOT NULL,
    name         VARCHAR(255)  NOT NULL,
    vote_count   INT DEFAULT 0,
    created_at   DATETIME,
    updated_at   DATETIME,
    deleted_at   DATETIME,
    FOREIGN KEY (pick_id) REFERENCES dish_pick(id)
    -- FOREIGN KEY (user_id) REFERENCES user(id) -- 사용자 테이블과 연결 시 주석 해제
);

-- 유저의 투표 기록 테이블
CREATE TABLE dish_vote (
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    pick_id      BIGINT        NOT NULL,
    dish_id      BIGINT        NOT NULL,
    user_id      BIGINT        NOT NULL,
    created_at   DATETIME,
    updated_at   DATETIME,
    deleted_at   DATETIME,
    FOREIGN KEY (pick_id) REFERENCES dish_pick(id),
    FOREIGN KEY (dish_id) REFERENCES dish(id)
    -- FOREIGN KEY (user_id) REFERENCES user(id) -- 사용자 테이블과 연결 시 주석 해제
);

-- 투표 이미지 테이블
CREATE TABLE dish_vote_image (
    id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    vote_id        BIGINT        NOT NULL,
    image_url      TEXT          NOT NULL,
    thumbnail_url  TEXT,
    order_num      INT DEFAULT 0,
    report_count   INT DEFAULT 0,
    created_at     DATETIME,
    updated_at     DATETIME,
    deleted_at     DATETIME,
    FOREIGN KEY (vote_id) REFERENCES dish_vote(id)
);

-- 투표 이미지 신고 테이블
CREATE TABLE dish_vote_image_report (
    id             BIGINT AUTO_INCREMENT PRIMARY KEY,
    vote_image_id  BIGINT NOT NULL,
    user_id        BIGINT NOT NULL,
    created_at     DATETIME,
    updated_at     DATETIME,
    deleted_at     DATETIME,
    FOREIGN KEY (vote_image_id) REFERENCES dish_vote_image(id)
    -- FOREIGN KEY (user_id) REFERENCES user(id) -- 사용자 테이블과 연결 시 주석 해제
);