import processing.net.*;
PVector my = new PVector(0,0);
PVector server = new PVector(random(300),random(300));
String message;
int i = 0;
Client myClient;
void setup(){
  size(300,300);
  noStroke();
  message="";
  myClient = new Client(this,"127.0.0.1",1234);
}
void draw(){
  background(0);
  my.x=mouseX;
  my.y=mouseY;
  if(myClient.available()>0){
    message=myClient.readString();
    if(message.charAt(0)=='x'){
    server.x=int(message.substring(1));}
    if(message.charAt(0)=='y'){
    server.y=int(message.substring(1));}
    
  }
  circle(my.x,my.y,30);
  fill(#FF0000);
  circle(server.x,server.y,30);
  fill(255);
  text(frameRate,0,10);
  if(i%2==0){
    message="x"+str(my.x);
    myClient.write(message);
  }
  else if(i%2==1){
    message="y"+str(my.y);
    myClient.write(message);
  }
  i++;
}
