$(document).ready(function(){
	
	function getId(id){
	return document.getElementById(id);
	}	

	console.log(roomName);
	console.log(roomId);
	console.log(username);

	let data = {};//전송 데이터(JSON)
	let websocket = new SockJS("/stomp/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
	var stomp = Stomp.over(websocket);

    //2. connection이 맺어지면 실행
	stomp.connect({}, function (){
	console.log("STOMP Connection")

	let mid = getId('mid');
	let btnSend = getId('btnSend');
	let talk = getId('talk');
	let msg = getId('msg');
	
	stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
		const content = JSON.parse(chat.body);
		onMessage(content);
		stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: mid.value}));
	});	

	function send(){
		if(msg.value.trim() != ''){
			data.mid = getId('mid').value;
			data.msg = msg.value;
			data.date = new Date().toLocaleString();
			data.checks = false;
			data.checkd = false;
			stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: mid.value}));
		}
		msg.value ='';
	}

	//채팅방 나갈때
	$("#disconn").on("click", (e) => {
		
		data.mid = getId('mid').value + "님이 탈주하였습니다..";
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		data.checks = false;
		data.checkd = true;
		stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
		stomp.close();
	})

	//채팅창에 들어왔을 때
	function onOpen() {
	
		data.mid = getId('mid').value + "님 환영합니다.";
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		data.checks = true;
		data.checkd = false;
		stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: mid.value}));
	
	}

	//채팅방 나갈때
	function onClose() {
		location.href = document.referrer;
	}
	
	

	function onMessage(chat){
		console.log(chat.writer + "메세지 챗");
		let css;
		let csson = 'class=on' 
		let cssout = 'class=out' 
		if(data.mid == mid.value){
			css = 'class=other';
		}else{
			
			css = 'class=me';
		}

		if(data.checkd)
		{
			let item = `<div ${cssout} >
			<span><b>${data.mid}</b></span> [ ${data.date}]<br/>
			<span>${data.msg}</span>
			</div>`;
			talk.innerHTML += item;
			talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
		}else{
			if(data.checks)
			{
				let item = `<div ${csson} >
				<span><b>${data.mid}</b></span> [ ${data.date}]<br/>
				<span>${data.msg}</span>
				</div>`;
				talk.innerHTML += item;
				talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
			}else{
				let item = `<div ${css} >
				<span><b>${data.mid}</b></span> [ ${data.date}]<br/>
				<span>${data.msg}</span>
				</div>`;
				talk.innerHTML += item;
				talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
			}	
		}	
	}
	

	msg.onkeyup = function(ev){
		if(ev.keyCode == 13){
			isJoined =false;
			send();
		}
	}

	btnSend.onclick = function(){
		isJoined =false;
		send();
	}

	

	}); //스톰프 커넥

});