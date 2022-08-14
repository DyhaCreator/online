import processing.net.*;
PVector server = new PVector(0,0);
PVector client = new PVector(random(300),random(300));
String message;
int i = 0;
Server myServer;
void setup(){
  size(300,300);
  noStroke();
  message="";
  myServer = new Server(this,1234);
}
void draw(){
  background(0);
  server.x=mouseX;
  server.y=mouseY;
  Client myClient = myServer.available();
  if(myServer.available() != null){
    message = myClient.readString();
    if(message.charAt(0)=='x'){
    client.x=int(message.substring(1));}
    if(message.charAt(0)=='y'){
    client.y=int(message.substring(1));}
  }
  circle(server.x,server.y,30);
  fill(#FF0000);
  circle(client.x,client.y,30);
  fill(#00FF00);
  text(frameRate,0,10);
  if(i%2==0){
    message="x"+str(server.x);
    myServer.write(message);
  }
  else if(i%2==1){
    message="y"+str(server.y);
    myServer.write(message);
  }
  i++;
}
