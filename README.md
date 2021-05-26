# 2021_Capstone_CoderGarden

## 커밋규칙 
### 1. 파일을 추가할때는 Add 파일명_작성자 (세부 내용에는 어떠 기능을 하는 파일을 추가했는지 적기)
### 2. 파일을 수정할때는 Mod 파일명_작성자 (세부 내용에는 어떠한 기능을 수정하였는지 적기)
### 3. 파일을 삭제할때는 Del 파일명_작성자 
<<<<<<< HEAD
=======



### graduate_help 덤프파일 import 하기
1. MySQL에서 `create database capstone` 로 'capstone' 데이터베이스 생성후 quit
   
2. db.sql 파일을 원하는 위치에 가져다 놓는다.
3. 터미널 실행 후 동일한 위치로 터미널 이동 (MySQL 접속 X)
3. `mysql -u root -p capstone < db.sql` 명령어 실행해서 import

### Django - MySQL 연동하기
>  2021_Capstone_CoderGarden/config/my_Settings
1. 각자 로컬에서 MySQL 실행
2. config > my_Settings.py > DATABASE 파트에서 PASSWORD를 자신의 MySQL 비밀번호로 설정
3. `python manage.py inspectdb` 명령어로 연동 DB 감지 테스트.
>>>>>>> 276285d6c9caee60f1d2af9ae88a4702624d3a17
