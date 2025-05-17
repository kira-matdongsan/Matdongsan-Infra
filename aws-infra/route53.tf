# 루트 도메인용 Hosted Zone 생성
resource "aws_route53_zone" "root_zone" {
  name = "hyeinisfree.me"
}

# A 레코드: mds.hyeinisfree.me → EC2 퍼블릭 IP
resource "aws_route53_record" "mds_record" {
  zone_id = aws_route53_zone.root_zone.zone_id
  name    = "mds.hyeinisfree.me"
  type    = "A"
  ttl     = 300
  records = [aws_eip.spring_eip.public_ip]
}
