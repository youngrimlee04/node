1. 구조
 notJapan
  > bin
   www : 엔트리 포인트로 코드의 시작점, 서버 가동, 포트 지정, 실시간 통신 소켓 설정 
  > node_modules : 해당 프로젝트를 구동할 때 사용하는 패키지(모듈)를 모아둔 곳 
    
  > public : 정적 데이터 위치, 이미지/클라이언트 사이드 js, css, 별도의 주소를 지정하지 않아도 웹에서 접근 가능
  > routes : 라우트는 요청이 들어오면 누가 처리할 것인지 연결(라우팅)
  > views : html이 위치한 곳으로 템플릿 엔진에 따라 파일명이 변경됨
            express -e notJapan : -e 옵션인 템플릿 엔진을 ejs로 사용하겠다는 뜻, 그래서 index html이 아닌 index.ejs로 저장됨
    index.js
    users.js
  > app.js : 이 파일이 진짜 시작점 
  > package.json : node 프로젝트의 각종 메타 정보, 구동법, 사용 패키지 등 npm 스크립트명령(start 등) 확인 가능


  2. 개발상 문제
  > 소스 수정할 때마다 서버 재가동해야 함, 아래 nodemon 설치 해서 이 문제 해결
   $npm i -g nodemon
  > 구동하려면 nodemon ./bin/www 인데 명령어 너무 길어서 아래 작업 진행
  > notjapan 프로젝트 밑에 package json에서 start 명령어 start": "node ./bin/www 를 nodemon ./bin/www로 바꾸면 npm start로 간단히 서버 재구동 가능 