# 빌드 단계
FROM node:16-alpine AS build

# 작업 디렉토리 설정
WORKDIR /app

# 패키지 설치
COPY package*.json ./
RUN npm install

# 애플리케이션 소스 복사
COPY . .

# 애플리케이션 빌드
RUN npm run build

# 실행 단계
FROM nginx:alpine

# Nginx 설정 복사 (옵션)
# COPY nginx.conf /etc/nginx/nginx.conf

# 빌드된 애플리케이션 복사
COPY --from=build /app/dist /usr/share/nginx/html

# Nginx 포트 노출
EXPOSE 80

# Nginx 실행
CMD ["nginx", "-g", "daemon off;"]
