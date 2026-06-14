# Matdongsan-Infra — Agent Guide

맛동산 AWS 인프라(Terraform) + DB 마이그레이션(Flyway). 긴 지식은 **brain** 에 산다 — 이 파일은 얇은 라우터다.

## Knowledge Base

지식베이스: `~/Documents/matdongsan-brain/` (Obsidian vault).

**Always read first:**
- `~/Documents/matdongsan-brain/00-Index/AI-Agent-Entry.md` — 읽기 순서·status 규칙·hard rules
- `~/Documents/matdongsan-brain/02-Architecture/matdongsan-infra.md` — 이 서비스 stub

**Read by topic (lazy-load):**
- AWS 리소스(vpc/ec2/rds/s3/ecr/route53/ses/iam) → `02-Architecture/matdongsan-infra.md` + `05-Runbooks/Deployment.md`
- DB 마이그레이션(flyway, 스키마) → `03-Domain/DB-Schema.md` + `05-Runbooks/Deployment.md`
- 배포 파이프라인 전반(BE↔Infra 조율) → `05-Runbooks/Deployment.md`
- 현황·문제 우선순위 → `00-Index/Health-Report.md`
- 과거 결정 → `00-Index/Decision-Log.md`

## Project quick facts
- `aws-infra/*.tf` (terraform, region ap-northeast-2, profile `terraform`) + `flyway/`(Dockerfile, conf, db/migration 17개, db/seed).
- 환경 **dev 하나뿐**(prod 없음). 단일 EC2(t2.micro, public) 에 API+Flyway 컨테이너.
- 마이그레이션은 `main` 의 `flyway/**` 변경 시 이미지 빌드 → SSH 로 EC2 에서 `flyway migrate`. 물리 FK 재생성 안 함.

## Hard rules
- **모든 인프라 변경은 PR 에 blast radius + 롤백 계획 명시.**
- secret 은 `secret.tfvars`(gitignore)/GitHub Actions secrets/EC2 `~/.env` — 절대 커밋 금지.
- 이 파일에 brain 내용 복붙 금지 — 링크만. 새 사실은 brain 에 기록.
- API 배포와 Flyway 마이그레이션은 분리된 파이프라인 → 스키마 변경 시 순서/하위호환 주의(Deployment runbook).
