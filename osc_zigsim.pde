import oscP5.*;
import netP5.*;

OscP5 oscP5;
PVector accel;
PVector gyro;
float volume = 0;
 
void setup() {
  size(500,500);
  frameRate(30);
  oscP5 = new OscP5(this,50000);
  accel = new PVector(0,0,0);
  gyro  = new PVector(0,0,0);
}
 
void draw() {
  background(int(50*gyro.x), int(50*gyro.y), int(50*gyro.z));
  fill(int(200*accel.x), int(200*accel.y), int(200*accel.z));
  ellipse(int(100*accel.x)+250, int(100*accel.y)+250, 10*volume, 10*volume);
}
 
void oscEvent(OscMessage msg) {
  if(msg.checkAddrPattern("/ZIGSIM/kazuimotn/miclevel")==true) {
    volume = msg.get(0).floatValue();
  }
  if(msg.checkAddrPattern("/ZIGSIM/kazuimotn/accel")==true) {
  accel.x = msg.get(0).floatValue();
  accel.y = msg.get(1).floatValue();
  accel.z = msg.get(2).floatValue();
  }
  if(msg.checkAddrPattern("/ZIGSIM/kazuimotn/gyro")==true) {
  gyro.x = msg.get(0).floatValue();
  gyro.y = msg.get(1).floatValue();
  gyro.z = msg.get(2).floatValue();
  }
}
