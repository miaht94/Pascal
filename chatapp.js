var express= require('express');
var app=express();
var http=require('http');
var server=http.createServer(app);
var users={}
server.listen(8080);
var io=require('socket.io').listen(server);
app.get('/',function (req,res) {
console.log('Co nguoi ket noi !!!');
res.sendFile(__dirname+'/views/chatui.html');
});
io.sockets.on('connection',function (socket){
socket.on('newUser',function(name,data){
    console.log("New user, Nickname: ",name);
    users[name]=this.socket;
    io.sockets.emit("updateName",Object.keys(users));
});
});
