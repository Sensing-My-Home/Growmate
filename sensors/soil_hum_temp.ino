#include <DHT.h>
#include <Adafruit_Sensor.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#define DHTPIN     2
#define DHTTYPE    DHT11

const int soil_sensor_pin = A0;
const int soil_dry = 1023;
const int soil_wet = 490;

// Change the credentials below, so your ESP8266 connects to your router
const char* ssid = "";
const char* password = "";

// Change the variable to your Raspberry Pi IP address, so it connects to your MQTT broker
const char* mqtt_server = "";
const int mqtt_port = 1883;
const char* mqttUser = "";
const char* mqttPassword = "";

// Initializes the espClient
WiFiClient espClient;
PubSubClient client(espClient);

DHT dht(DHTPIN, DHTTYPE);

float t = 0.0;
float h = 0.0;

const long interval = 1000;

// This functions connects your ESP8266 to your router
void setup_wifi() {
  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("WiFi connected - ESP IP address: ");
  Serial.println(WiFi.localIP());
}

// This functions is executed when some device publishes a message to a topic that your ESP8266 is subscribed to
// Change the function below to add logic to your program, so when a device publishes a message to a topic that 
// your ESP8266 is subscribed you can actually do something
void callback(String topic, byte* message, unsigned int length) {
  Serial.print("Message arrived on topic: ");
  Serial.print(topic);
  Serial.print(". Message: ");
  String messageTemp;
  
  for (int i = 0; i < length; i++) {
    Serial.print((char)message[i]);
    messageTemp += (char)message[i];
  }
  Serial.println();
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");

    if (client.connect("ESP8266Client", mqttUser, mqttPassword)) {
      Serial.println("connected");  
      // Subscribe or resubscribe to a topic
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void setup() {  
  Serial.begin(9600);
  dht.begin();
  setup_wifi();
  client.setServer(mqtt_server, mqtt_port);
  client.setCallback(callback);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  if(!client.loop()) {
    client.connect("ESP8266Client", mqttUser, mqttPassword);
  }

  float newT = dht.readTemperature();
  if (isnan(newT)){
    Serial.println("Failed to read from DHT sensor!");
  } else {
    t = newT;
    Serial.print("Temperature (in C): "); 
    Serial.println(t);
  }

  float newH = dht.readHumidity();
  if (isnan(newH)){
    Serial.println("Failed to read from DHT sensor!");
  } else {
    h = newH;
    Serial.print("Humidity (in %): ");
    Serial.println(h);
  }

  int moisture_percentage;
  moisture_percentage = map(analogRead(soil_sensor_pin), soil_wet, soil_dry, 100, 0);
  Serial.print("Soil Moisture (in %): ");
  Serial.print(moisture_percentage);
  Serial.println("%");

  // Computes temperature values in Celsius
  static char temperatureTemp[7];
  dtostrf(t, 6, 2, temperatureTemp);

  static char humidityTemp[7];
  dtostrf(h, 6, 2, humidityTemp);

  static char soilMoistureTemp[7];
  dtostrf(moisture_percentage, 6, 2, soilMoistureTemp);

  // Publishes Temperature and Humidity values
  client.publish("temperature", temperatureTemp);
  client.publish("humidity", humidityTemp);
  client.publish("soil", soilMoistureTemp);

  delay(interval);  
}  



