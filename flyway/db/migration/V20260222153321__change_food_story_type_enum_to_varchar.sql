-- food_story.type 컬럼을 ENUM → VARCHAR(20) + CHECK constraint로 변경
-- ENUM은 새 타입 추가 시 ALTER TABLE이 필요하고 테이블 락 위험이 있음
-- VARCHAR + CHECK로 유연성 확보하면서 DB 레벨 제약은 유지
ALTER TABLE food_story
    MODIFY COLUMN type VARCHAR(20) NOT NULL,
    ADD CONSTRAINT chk_food_story_type CHECK (type IN ('RECIPE', 'PLACE', 'SEASONAL_NOTE'));
