-- 1. user
CREATE TABLE user
(
    id                BIGINT PRIMARY KEY AUTO_INCREMENT,
    is_blocked        BOOLEAN NOT NULL DEFAULT FALSE,
    last_logged_in_at DATETIME,
    created_at        DATETIME,
    updated_at        DATETIME,
    deleted_at        DATETIME
);

-- 2. user_login_credential
CREATE TABLE user_login_credential
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id    BIGINT      NOT NULL,
    login_type VARCHAR(50) NOT NULL,
    email      VARCHAR(255),
    password   VARCHAR(255),
    oauth_id   VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES user (id),
    UNIQUE (login_type, email),
    UNIQUE (login_type, oauth_id)
);

-- 3. user_profile
CREATE TABLE user_profile
(
    id                BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id           BIGINT      NOT NULL,
    nickname          VARCHAR(50) NOT NULL,
    profile_image_url TEXT,
    created_at        DATETIME,
    updated_at        DATETIME,
    deleted_at        DATETIME,
    FOREIGN KEY (user_id) REFERENCES user (id),
    UNIQUE (nickname)
);

-- 4. terms
CREATE TABLE terms
(
    id         BIGINT PRIMARY KEY AUTO_INCREMENT,
    type       VARCHAR(50)  NOT NULL,
    version    INT          NOT NULL DEFAULT 1,
    title      VARCHAR(100) NOT NULL,
    content    TEXT         NOT NULL,
    required   BOOLEAN      NOT NULL DEFAULT TRUE,
    active     BOOLEAN      NOT NULL DEFAULT FALSE,
    order_num  INT          NOT NULL DEFAULT 1,
    created_at DATETIME,
    updated_at DATETIME
);

-- 5. user_agreement
CREATE TABLE user_agreement
(
    id           BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id      BIGINT   NOT NULL,
    term_id      BIGINT   NOT NULL,
    agreed_at    DATETIME NOT NULL,
    withdrawn_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES user (id),
    FOREIGN KEY (term_id) REFERENCES terms (id),
    UNIQUE (user_id, term_id)
);
