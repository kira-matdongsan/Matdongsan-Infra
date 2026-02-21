-- DDD 구조에서 도메인 간 무결성은 애플리케이션 레이어에서 관리하므로 DB FK 제약 제거

ALTER TABLE dish DROP FOREIGN KEY dish_ibfk_1;
ALTER TABLE dish DROP FOREIGN KEY dish_ibfk_2;
ALTER TABLE dish_vote DROP FOREIGN KEY dish_vote_ibfk_1;
ALTER TABLE dish_vote_image DROP FOREIGN KEY dish_vote_image_ibfk_1;
ALTER TABLE dish_vote_image DROP FOREIGN KEY dish_vote_image_ibfk_2;
ALTER TABLE dish_vote_image_report DROP FOREIGN KEY dish_vote_image_report_ibfk_1;
ALTER TABLE featured_food DROP FOREIGN KEY featured_food_ibfk_1;
ALTER TABLE food_story DROP FOREIGN KEY food_story_ibfk_1;
ALTER TABLE food_story_image DROP FOREIGN KEY food_story_image_ibfk_1;
ALTER TABLE food_story_like DROP FOREIGN KEY food_story_like_ibfk_1;
ALTER TABLE food_story_report DROP FOREIGN KEY food_story_report_ibfk_1;
ALTER TABLE user_agreement DROP FOREIGN KEY user_agreement_ibfk_1;
ALTER TABLE user_agreement DROP FOREIGN KEY user_agreement_ibfk_2;
ALTER TABLE user_login_credential DROP FOREIGN KEY user_login_credential_ibfk_1;
ALTER TABLE user_profile DROP FOREIGN KEY user_profile_ibfk_1;