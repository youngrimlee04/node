const rooms = ['KNN', 'MBC','tvN']
exports.createChatServer = ( server ) => {
    // console.log( '실시간 채팅 서버 가동')
    // 서버 소켓 생성
    const io = require('socket.io')( server )
    // 서버 소켓은 클라이언트의 접속을 대기
    // 서버 소켓은 대기 하다가 클라이언트가 접속하면 소켓을 하나 할당해서 콜백 함수에 인자로 넣어서 호출
    io.on( 'connection', ( socket ) => {
        console.log('한 명 접속완료')
     // 클라이언트가 이름을 보내면 처리하는 이벤트 헨들러는 on 
     socket.on('s_send_userName', (user_name, time)=> {
        console.log(user_name, time)
        // 1. 접속한 유저 정보를 소켓(클라이언트를 식별하는 객체)에 기록
        socket.user_name = user_name
        socket.room = rooms[0]
        socket.connectTime = time 
        // 2. 방에 조인
        socket.join( socket.room )
        // 3. 기존 방에 있던 멤버들에게 방송(client들에게 메세지 보냄 data가 서버에서 클라이언트로) > 나를 제외한 모든 같은 방 멤버로 대상 특정 
        socket.broadcast.to( socket.room )
        .emit('c_send_msg', '관리자', `${socket.user_name}님이 입장 했습니다.`, new Date() )
        // 4. 방금 조인은 유저에게 반송
        socket.emit( 'c_send_msg', '관리자', `${socket.user_name}님이 환영합니다.`, new Date() )
        // 5. 접속한 유저에게 방정보 전송
        socket.emit('c_send_roomInfo', rooms, socket.room )
     })   

     // 클라이언트가 메세지를 보내면 방송한다
     socket.on('s_send_msg', ( msg, time )=>{
        // 이 방에 있는 모든 멤버들에게 망송
        io.sockets.in( socket.room ).emit( 'c_send_msg', socket.user_name , msg, time )
     })

     // 클라이언트가 방을 바꿔 달라고 햇다, 변경 하고 정보 전송
     socket.on('s_send_roomChg', (newRoom)=>{
        // 1. 기존방에서 떠난다
        socket.leave( socket.room )
        // 2. 기존방 멤버들에게 퇴장 알림
        socket.broadcast.to( socket.room )
        .emit('c_send_msg', '관리자', `${socket.user_name}님이 퇴장 했습니다.`, new Date() )
        // 3. 새로운 방 진입 절차 시작 
        // 3-1. 방 정보 설정
        socket.room = newRoom 
        // 3-1-1. 조인 
        socket.join( socket.room )
        // 3-2. 새로운 방 멤버들에게 방송
        socket.broadcast.to( socket.room )
        .emit('c_send_msg', '관리자', `${socket.user_name}님이 입장 했습니다.`, new Date() )
        // 3-3. 본인에게 방송
        socket.emit('c_send_msg', '관리자', `${socket.user_name}님 환영합니다.`, new Date())
        // 3-4. 새로운 방 정보 방송 
        socket.emit('c_send_roomInfo', rooms, socket.room )
     })
    }) 
}