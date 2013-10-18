var pusherOn = 0;

$(document).ready(function(){

if (railsEnv === "development")
	devMode = 1;

//devMode is passed from the view as a javascript_tag
if( devMode){
	console.log("In Development mode. Stating pusher logger...")
	Pusher.log = function(message){
		if (devMode && window.console && window.console.log) {
			window.console.log(message);
		}
	};
}
// subscribe user to chat

if (uid){
	pusher = new Pusher(window.pusherKey,
		{ auth: { params: {uid: uid, cid: cid} } }
	);

 	//create the channel and bind the events	
 channel = pusher.subscribe("presence-"+chatsName);

 channel.bind("pusher:subscription_error", function(status){
	 	if(status == 408 || status == 503){
	 		console.log("error subscribing...");
	 	}
	});
			//bind pusher events
channal.bind("pusher:subscription_succeeded", function(){
		channel.bind("pusher:member_added", function(subscribe){
			userAdd( subscribe.id, subscribe.info.first_name + " " + subscribe.info.last_name);
	});

	channel.bind("pusher:member_removed", function(subscribe){
			userRemove( subscribe.id);
		});
		pusherOn = 1;
	});	
} //if uid 



}) // ends document ready 