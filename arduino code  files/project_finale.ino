#include <DFRobot_SIM808.h>
#include <SoftwareSerial.h>
#define MESSAGE_LENGTH 160
char message[MESSAGE_LENGTH];
int messageIndex = 0;
char MESSAGE[300];
char lat[12];
char lon[12];
char wspeed[12];

char phone[16];
char datetime[24];

#define PIN_TX    10
#define PIN_RX    11

//--------------------------------------------------------------

boolean send_geofence_alert_once = true;
//--------------------------------------------------------------
// Size of the geo fence (in meters)
const float maxDistance = 30;

//--------------------------------------------------------------
float initialLatitude = 0;
float initialLongitude = 0;

float latitude, longitude;
//--------------------------

SoftwareSerial mySerial(PIN_TX,PIN_RX);
DFRobot_SIM808 sim808(&mySerial);//Connect RX,TX,PWR,

void setup()
{
  mySerial.begin(9600);
  Serial.begin(9600);

  //******** Initialize sim808 module *************

  if( sim808.attachGPS())
      Serial.println("Open the GPS power success");
  else 
      Serial.println("Open the GPS power failure");
      
  Serial.println("Init Success, please send SMS message to me!");
}

void loop()
{
  //*********** Detecting unread SMS ************************
   messageIndex = sim808.isSMSunread();

   //*********** At least, there is one UNREAD SMS ***********
   if (messageIndex > 0)
   { 
      Serial.print("messageIndex: ");
      Serial.println(messageIndex);
      
      sim808.readSMS(messageIndex, message, MESSAGE_LENGTH, phone, datetime);
                 
      //***********In order not to full SIM Memory, is better to delete it**********
      sim808.deleteSMS(messageIndex);
      Serial.print("From number: ");
      Serial.println(phone);  
      Serial.print("Datetime: ");
      Serial.println(datetime);        
      Serial.print("Recieved Message: ");
      Serial.println(message); 

    while(!sim808.getGPS())
    {
      
    }
    delay(10000);

   
      Serial.print(sim808.GPSdata.year);
      Serial.print("/");
      Serial.print(sim808.GPSdata.month);
      Serial.print("/");
      Serial.print(sim808.GPSdata.day);
      Serial.print(" ");
      Serial.print(sim808.GPSdata.hour);
      Serial.print(":");
      Serial.print(sim808.GPSdata.minute);
      Serial.print(":");
      Serial.print(sim808.GPSdata.second);
      Serial.print(":");
      Serial.println(sim808.GPSdata.centisecond);
      Serial.print("latitude :");
      Serial.println(sim808.GPSdata.lat);
      Serial.print("longitude :");
      Serial.println(sim808.GPSdata.lon);
      Serial.print("speed_kph :");
      Serial.println(sim808.GPSdata.speed_kph);
      Serial.print("heading :");
      Serial.println(sim808.GPSdata.heading);
      Serial.println();
  
      float la = sim808.GPSdata.lat;
      float lo = sim808.GPSdata.lon;
      float ws = sim808.GPSdata.speed_kph;
  
      dtostrf(la, 6, 6, lat); //put float value of la into char array of lat. 6 = number of digits before decimal sign. 2 = number of digits after the decimal sign.
      dtostrf(lo, 6, 6, lon); //put float value of lo into char array of lon
      //dtostrf(ws, 6, 3, wspeed);  //put float value of ws into char array of wspeed
    
      sprintf(MESSAGE, "Latitude : %s\nLongitude : %s \nTry With This Link.\nhttps://maps.google.com/maps?q=-%s,%s",lat,lon,  lat, lon);
      
       Serial.println("Sim808 init success");
       Serial.println("Start to send message ...");
       Serial.println(MESSAGE);
       Serial.println(phone);
       sim808.sendSMS(phone,MESSAGE);
      //************* Turn off the GPS power ************
      //sim808.detachGPS();
      
     
  
 
   }
}

void geoFence(){
 float distance = getDistance(latitude, longitude, initialLatitude, initialLongitude);
  //--------------------------------------------------------------
 if(distance > maxDistance) {
    //------------------------------------------
    if(send_geofence_alert_once == true){
     
      sendGeoFenceAlert();
      send_geofence_alert_once = false;
      
      
    }
    //------------------------------------------
  }
  else{
    send_alert_once = true;
  }
  //--------------------------------------------------------------

  // Calculate distance between two points
float getDistance(float flat1, float flon1, float flat2, float flon2) {

  // Variables
  float dist_calc=0;
  float dist_calc2=0;
  float diflat=0;
  float diflon=0;

 // Calculations
  diflat  = radians(flat2-flat1);
  flat1 = radians(flat1);
  flat2 = radians(flat2);
  diflon = radians((flon2)-(flon1));

  dist_calc = (sin(diflat/2.0)*sin(diflat/2.0));
  dist_calc2 = cos(flat1);
  dist_calc2*=cos(flat2);
  dist_calc2*=sin(diflon/2.0);
  dist_calc2*=sin(diflon/2.0);
  dist_calc +=dist_calc2;

  dist_calc=(2*atan2(sqrt(dist_calc),sqrt(1.0-dist_calc)));
  
  dist_calc*=6371000.0; //Converting to meters

  return dist_calc;
}



/*****************************************************************************************
* sendAlert() function
*****************************************************************************************/
void sendGeoFenceAlert()
{
  //return;
  String sms_data;
  sms_data = "Alert! The object is outside the fense.\r";
  sms_data += "http://maps.google.com/maps?q=loc:";
  sms_data += String(latitude) + "," + String(longitude);

  //return;
  sim808.print("AT+CMGF=1\r");
  delay(1000);
  sim808.print("AT+CMGS=\""+PHONE+"\"\r");
  delay(1000);
  sim808.print(sms_data);
  delay(100);
  sim808.write(0x1A); //ascii code for ctrl-26 //sim800.println((char)26); //ascii code for ctrl-26
  delay(1000);
  Serial.println("SMS Sent Successfully.");



}
