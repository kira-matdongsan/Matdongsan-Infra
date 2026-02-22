-- count 컬럼 제거: 집계 쿼리로 대체
-- DDD에서 정합성은 집계 쿼리로 보장, 비정규화 count 컬럼 제거
ALTER TABLE dish DROP COLUMN vote_count;
ALTER TABLE featured_food DROP COLUMN dish_vote_count;
ALTER TABLE food_story DROP COLUMN like_count;
ALTER TABLE food_story DROP COLUMN report_count;
ALTER TABLE food DROP COLUMN like_count;
ALTER TABLE dish_vote_image DROP COLUMN report_count;

-- dish_vote_image.dish_id 중복 제거
-- dish_vote.dish_id 를 통해 이미 접근 가능한 중복 컬럼
ALTER TABLE dish_vote_image DROP COLUMN dish_id;
