Kod Matlab

teta = 0;
L = 1;
R = 0.325;
PWM1 = 255;
PWM2 = 255;

msg.X = PWM1;
msg.Y = PWM2;
send(pub, msg);

u1 = PWM1/42.5;
u2 = PWM2/42.5;
w1 = 0.3611*u1;
w2 = 0.3611*u2;
x = 0;
y = 1;

for i=0:1:20
    delta_x = (R * (w1 + w2) / 2) * cos(teta);
    delta_y = (R * (w1 + w2) / 2) * sin(teta);
    delta_teta = (R * (w1 - w2)) / L;

    x = x + delta_x;
    y = y + delta_y;
    teta = teta + delta_teta;
    hold on
    xlim([-20 20])
    ylim([-20 20])
    grid on
    plot(x,y,'ro');
    pause(0.1);
end

Program Arduino

#include <ros.h>
#include <geometry_msgs/Point.h>

#define EN_A 9
#define IN_1 7
#define IN_2 6

#define EN_B 10
#define IN_3 4
#define IN_4 5

ros::NodeHandle nh;

uint8_t motor1_PWM, motor2_PWM;

void message( const geometry_msgs::Point& msg)
{
  motor1_PWM = msg.x;
  motor2_PWM = msg.y;
}

ros::Subscriber<geometry_msgs::Point> sub("robot", &message);

void setup() 
{
  pinMode(13, OUTPUT);
  pinMode(EN_A, OUTPUT);
  pinMode(IN_1, OUTPUT);
  pinMode(IN_2, OUTPUT);

  pinMode(EN_B, OUTPUT);
  pinMode(IN_3, OUTPUT);
  pinMode(IN_4, OUTPUT);

  // INITIAL ROTATION
  digitalWrite(IN_1, LOW);
  digitalWrite(IN_2, HIGH);

  digitalWrite(IN_3, LOW);
  digitalWrite(IN_4, HIGH);

  // ROS CONFIG
  nh.initNode();
  nh.subscribe(sub);
}

void loop() 
{
  nh.spinOnce();

  // SPINNING MOTOR
  analogWrite(EN_A, motor1_PWM);
  analogWrite(EN_B, motor2_PWM);
  delay(20);
}

