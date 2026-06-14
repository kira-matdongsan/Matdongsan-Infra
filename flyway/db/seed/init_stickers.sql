-- 제철기록장 스티커 초기 14종 (image_url 은 placeholder — 어드민이 실제 S3 URL 로 교체)
INSERT INTO sticker (image_url, name, display_order, active, created_at, updated_at) VALUES
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_01.png', 'sticker_1',  1,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_02.png', 'sticker_2',  2,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_03.png', 'sticker_3',  3,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_04.png', 'sticker_4',  4,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_05.png', 'sticker_5',  5,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_06.png', 'sticker_6',  6,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_07.png', 'sticker_7',  7,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_08.png', 'sticker_8',  8,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_09.png', 'sticker_9',  9,  TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_10.png', 'sticker_10', 10, TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_11.png', 'sticker_11', 11, TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_12.png', 'sticker_12', 12, TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_13.png', 'sticker_13', 13, TRUE, NOW(6), NOW(6)),
('https://matdongsan-dev-bucket.s3.ap-northeast-2.amazonaws.com/stickers/sticker_14.png', 'sticker_14', 14, TRUE, NOW(6), NOW(6));
