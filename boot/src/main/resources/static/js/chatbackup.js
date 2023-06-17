$(document).ready(function(){
	
	function getId(id){
	return document.getElementById(id);
	}	

	let data = {};//전송 데이터(JSON)
	//let websocket  = new WebSocket("ws://localhost:8080/ws/chat");
	let websocket = new SockJS("/ws/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
	let stompClient = Stomp.over(websocket);
	stompClient.connect({}, onConnected, onError);	


	websocket.onmessage = onMessage;
	websocket.onopen = onOpen;
	websocket.onclose = onClose;
	let mid = getId('mid');
	let btnSend = getId('btnSend');
	let talk = getId('talk');
	let msg = getId('msg');

	function send(){
		if(msg.value.trim() != ''){
			data.mid = getId('mid').value;
			data.msg = msg.value;
			data.date = new Date().toLocaleString();
			data.checks = false;
			data.checkd = false;
			var temp = JSON.stringify(data);
			websocket.send(temp);
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
		var temp = JSON.stringify(data);
		websocket.send(temp);
		websocket.close();
	})

	//채팅창에 들어왔을 때
	function onOpen(evt) {
	
		data.mid = getId('mid').value + "님 환영합니다.";
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		data.checks = true;
		data.checkd = false;
		var temp = JSON.stringify(data);
		websocket.send(temp);
	
	}

	//채팅방 나갈때
	function onClose(evt) {
		location.href = document.referrer;
	}
	
		function onMessage(msg){
			data = JSON.parse(msg.data);
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
			}
			else
			{
				
			if(data.checks)
			{
				let item = `<div ${csson} >
				<span><b>${data.mid}</b></span> [ ${data.date}]<br/>
				<span>${data.msg}</span>
				</div>`;
				talk.innerHTML += item;
				talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
			}
			else{
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

	

	

});