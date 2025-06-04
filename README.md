# 🍱 Matdongsan Infra
`Matdongsan-Infra`는 [맛동산 프로젝트](https://github.com/kira-matdongsan/Matdongsan-BE)의 AWS 인프라 구성과 데이터베이스 마이그레이션을 관리하는 레포지토리입니다.
Terraform을 활용한 인프라 코드화와 Flyway를 통한 데이터베이스 마이그레이션 자동화로, 효율적인 DevOps 프로세스를 구현했습니다.

<br/>

## 📖 목차
- [디렉토리 구조](#-디렉토리-구조)
- [주요 기능](#-주요-기능)
- [GitHub Actions Workflow](#-github-actions-workflow)
- [Terraform 사용법](#-terraform-사용법)
- [Flyway 마이그레이션 전략](#-flyway-마이그레이션-전략) 


<br/>

## 🗂 디렉토리 구조
```bash
matdongsan-infra/
├── aws-infra/ # Terraform 기반 AWS 인프라 구성
│ ├── ec2.tf # EC2, Security Group 등 설정
│ ├── rds.tf # RDS (MySQL) 인스턴스 구성
│ ├── s3.tf # S3 버킷 및 Endpoint 구성
│ ├── ecr.tf # ECR 레포지토리 구성
│ ├── route53.tf # Route 53 DNS 구성
│ ├── vpc.tf # VPC 구성
│ ├── data.tf # 데이터 소스 정의
│ ├── ec2-iam-role.tf # EC2 인스턴스 IAM 역할
│ ├── iam.tf # IAM 사용자 및 역할 정의
│ ├── variables.tf # 변수 정의
│ ├── secret.tfvars # Secret 정보 (Git에 포함 X)
│ └── outputs.tf # 출력 변수 정의
│
├── flyway/ # Flyway 마이그레이션 설정
│ ├── Dockerfile # Flyway 전용 이미지 정의
│ ├── conf/
│ │ └── flyway.conf # Flyway 설정 파일 (Git에 포함 X)
│ └── db/
│   ├── migration/ # 마이그레이션 SQL 파일
│   └── seed/ # 초기 데이터 삽입 SQL 파일
```

<br/>

## 🚀 주요 기능
#### Terraform을 통한 AWS 인프라 구성
- VPC, Subnet, Routing Table
- EC2 인스턴스 및 보안 그룹
- RDS (MySQL) 구성
- ECR, S3 설정
- Route 53 DNS 구성

#### Flyway 기반 마이그레이션 관리
- SQL 버전 관리
- Docker Hub에 Flyway 이미지 배포
- EC2 내에서 Flyway 마이그레이션 자동 실행

#### GitHub Actions CI/CD 구성
- Docker 이미지 빌드 및 배포 자동화
- EC2에 SSH 접속하여 Flyway 실행
- Discord 웹훅을 통한 상태 알림

<br/>

## 🔁 GitHub Actions Workflow
| 이름                           | 트리거                                   | 기능                                    |
| ------------------------------ | ---------------------------------------- | --------------------------------------- |
| 🐳 Flyway Docker Build & Push  | `main` 브랜치에서 `flyway/` 변경 시 자동 | Flyway 이미지 빌드 후 Docker Hub에 푸시 |
| 🚀 Run Flyway Migration on EC2 | 위 워크플로 성공 시 자동 + 수동 실행     | EC2에서 Flyway 마이그레이션 실행        |
| 🔔 Discord Webhook 연동        | 위 2개의 워크플로에 포함                 | 시작/성공/실패 상태 Discord 전송        |

<br/>

## 📘 Terraform 사용법
`matdongsan-infra/aws-infra` 디렉토리는 Terraform을 이용하여 AWS 인프라를 코드로 관리합니다.

### 🔧 사전 준비
1. **Terraform 설치**
    
    ```bash
    brew install terraform
    ```

2. **AWS CLI 설치 및 인증 설정**
 - Named Profile 방식 권장

   ```bash
   aws configure --profile terraform
   ```

3. **로컬 파일 준비**
 - `secret.tfvars` 파일 생성

   ```hcl
   db_username = "<your-db-username>"
   db_password = "<your-db-password>"
   ```

### 📁 주요 파일 설명
| 파일명            | 설명                             |
| ----------------- | -------------------------------- |
| `main.tf`         | 전체 리소스를 포함하는 메인 파일 |
| `ec2.tf`          | EC2 인스턴스, 보안 그룹 구성     |
| `rds.tf`          | RDS 인스턴스 구성                |
| `s3.tf`           | S3 버킷 및 Endpoint 구성         |
| `ecr.tf`          | ECR 리포지토리 구성              |
| `route53.tf`      | Route 53 DNS 구성                |
| `vpc.tf`          | VPC 구성                         |
| `data.tf`         | 데이터 소스 정의                 |
| `ec2-iam-role.tf` | EC2 인스턴스 IAM 역할 정의       |
| `iam.tf`          | IAM 사용자 및 역할 정의          |
| `variables.tf`    | 변수 정의 파일                   |
| `secret.tfvars`   | Secret 값 입력 (Git 포함 ❌)     |
| `outputs.tf`      | 출력 정보 정의                   |

### 🚀 사용법
**초기화**

```bash
terraform init
```

**실행 계획 확인**

```bash
terraform plan -var-file="secret.tfvars"
```

**인프라 생성**

```bash
terraform apply -var-file="secret.tfvars"
```

**인프라 삭제**

```bash
terraform destroy -var-file="secret.tfvars"
```

<br/>

## 🗃️ Flyway 마이그레이션 전략
`matdongsan-infra/flyway` 디렉토리는 데이터베이스 마이그레이션을 위한 Flyway 설정과 SQL 파일을 관리합니다.

### 🧱 구조 설명
```bash
flyway/
├── Dockerfile            # Flyway 이미지 정의
├── conf/
│   └── flyway.conf       # 접속 설정 등
└── db/
    ├── migration/        # 마이그레이션 SQL
    └── seed/             # 초기 데이터 입력용 SQL
```

### 🚀 마이그레이션 수행 방식
1. **Flyway Docker Build & Push (자동)**
- `main` 브랜치에서 `flyway/` 디렉토리에 변경이 발생하면 GitHub Actions가 자동으로 Flyway Docker 이미지를 빌드하여 Docker Hub에 푸시합니다.

2. **Run Flyway Migration on EC2 (자동 + 수동)**
- 1번 워크플로 완료 후 자동으로 실행되거나, 필요 시 수동으로 워크플로를 실행하여 EC2 인스턴스에서 Flyway 마이그레이션을 수행합니다.
  
  ```bash
  docker run --rm \
    --env-file ~/.env \
    ${DOCKERHUB_USERNAME}/matdongsan-flyway migrate
  ```

### ✏️ SQL 파일 작성 규칙
- 파일명: `V<날짜시간>__<설명>.sql`
  
  ```bash
  V20250430182128__create_featured_food_table.sql
  ```

- `CREATE TABLE`, `ALTER TABLE` 등의 명령만 포함 (DDL)
- 초기 데이터 삽입 SQL 파일은 `db/seed` 디렉토리에서 별도 관리
