ALTER TABLE food_story_report
    ADD CONSTRAINT uk_food_story_report_story_user UNIQUE (story_id, user_id);
