-- user_agreement UNIQUE(user_id, term_id) 제약 제거
-- withdrawn_at 으로 현재 유효한 동의를 판단하므로, 재동의 이력 추적을 위해 UNIQUE 제약 제거
ALTER TABLE user_agreement DROP INDEX user_id;
