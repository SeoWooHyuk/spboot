$(document).ready(function(){
	
	function getId(id){
	return document.getElementById(id);
	}	

	console.log(roomName);
	console.log(roomId);

	let websocket = new SockJS("/stomp/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
	var stomp = Stomp.over(websocket);

    //2. connection이 맺어지면 실행
	stomp.connect({}, function (){
	console.log("STOMP Connection")
	onOpen();

	let btnSend = getId('btnSend');
	let talk = getId('talk'); //jsp 출려부위치 div
	let msg = getId('msg');
	
	stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
		const content = JSON.parse(chat.body);
		onMessage(content);
	});	

	function send(){
		let mid = getId('mid').value;
		let date = new Date().toLocaleString();
		let checks = false;
		let checkd = false;
		if(msg.value.trim() != ''){
			stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, data : date , message: msg.value, mid: getId('mid').value , checks : false , checkd : false}));
		}
		msg.value ='';
	}

	//채팅방 나갈때
	$("#disconn").on("click", (e) => {
		
		let mid = getId('mid').value;
		let message = getId('mid').value + "님이 탈주하였습니다..";
		let date = new Date().toLocaleString();
		let checks = false;
		let checkd = true;
		stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, data : date, message: message, mid: mid , checks : checks , checkd : checkd}));
		onClose();
	})

	//채팅창에 들어왔을 때
	function onOpen() {
	
		let mid = getId('mid').value;
		let message = getId('mid').value + "님이 입장하였습니다..";
		let date = new Date().toLocaleString();
		let checks = true;
		let checkd  = false;
		stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, data : date, mid: mid, message: message, checks : checks , checkd : checkd}))
	
	}

	//채팅방 나갈때
	function onClose() {
		stomp.disconnect();
		location.href = document.referrer;
	}
	
	

	function onMessage(chat){

		let css;
		let csson = 'class=on' 
		let cssout = 'class=out' 
		if(chat.mid == mid.value){
			css = 'class=other';
		}else{
			
			css = 'class=me';
		}

		if(chat.checkd)  //채팅방을 나갔을때 호출되는 문법
		{
			let item = `<div ${cssout} >
			<span><b>${chat.mid}</b></span> [ ${chat.data}]<br/>
			<span>${chat.message}</span>
			</div>`;
			talk.innerHTML += item;
			talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
		}else{
			if(chat.checks) //true일때 채팅방에 입장했을때 호출되는 메서드
			{
				let item = `<div ${csson} >
				<span><b>${chat.mid}</b></span> [ ${chat.data}]<br/>
				<span>${chat.message}</span>
				</div>`;
				talk.innerHTML += item;
				talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
			}else{
				let item = `<div ${css} >
				<span><b>${chat.mid}</b></span> [ ${chat.data}]<br/>
				<span>${chat.message}</span>
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