-- featured_food에 active 컬럼 추가 (특집 활성화 여부를 명시적으로 관리)
ALTER TABLE featured_food ADD COLUMN active BOOLEAN NOT NULL DEFAULT FALSE;

-- food에서 중복 관리 컬럼 제거 (featured_food.active로 단일화)
ALTER TABLE food DROP COLUMN is_featured;
ALTER TABLE food DROP COLUMN last_featured_at;

-- dish에서 redundant 컬럼 제거 (dish → featured_food → food 경로로 접근 가능)
ALTER TABLE dish DROP COLUMN food_id;
