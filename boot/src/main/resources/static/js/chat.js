$(document).ready(function(){
	
	function getId(id){
	return document.getElementById(id);
	}	

	let data = {};//전송 데이터(JSON)
	//let websocket  = new WebSocket("ws://localhost:8080/ws/chat");
	var websocket = new SockJS("ws://localhost78945652:8080/ws/chat");
	
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
			var temp = JSON.stringify(data);
			websocket.send(temp);
		}
		msg.value ='';
	}

	//채팅창에 들어왔을 때
	function onOpen(evt) {
	
			data.mid = getId('mid').value + "님 환영합니다.";
			data.msg = msg.value;
			data.date = new Date().toLocaleString();
			data.checks = true;
			var temp = JSON.stringify(data);
			websocket.send(temp);
	
	}

	function onClose(evt) {
		var str = mid.value + ": 님이 방을 나가셨습니다.";
		websocket.send(str);
	}
	
		function onMessage(msg){
			data = JSON.parse(msg.data);
			console.log(data.checks)
			let css;
			let csson = 'class=on' 
			if(data.mid == mid.value){
				css = 'class=other';
			}else{
				
				css = 'class=me';
			}

			
			if(data.checks)
			{
				let item = `<div ${csson} >
				<span><b>${data.mid}</b></span> [ ${data.date}]<br/>
				<span>${data.msg}</span>
				</div>`;
				talk.innerHTML += item;
				talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
			}
			else
			{
				
				let item = `<div ${css} >
				<span><b>${data.mid}</b></span> [ ${data.date}]<br/>
				<span>${data.msg}</span>
				</div>`;
				talk.innerHTML += item;
				talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
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