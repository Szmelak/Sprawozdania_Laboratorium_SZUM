#define USE_USBCON
#define analog A0
#include <ros.h>
#include <std_msgs/Int16.h>

ros::NodeHandle nh;

std_msgs::Int16 msg; 
ros::Publisher chatter("chatter", &msg);


void setup() {
  // put your setup code here, to run once:
  nh.initNode();
  nh.advertise(chatter);

  //potencjometr:

  pinMode(analog, INPUT_PULLUP);
}

void loop() {
  // put your main code here, to run repeatedly:
  msg.data = analogRead(analog);
  chatter.publish(&msg);
  nh.spinOnce();

  delay(100);
}
