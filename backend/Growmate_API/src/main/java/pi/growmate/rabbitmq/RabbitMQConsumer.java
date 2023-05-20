package pi.growmate.rabbitmq;

import com.fasterxml.jackson.databind.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pi.growmate.datamodel.measurements.AirQualityMeasurement;
import pi.growmate.datamodel.measurements.AirTemperatureMeasurement;
import pi.growmate.datamodel.measurements.SoilQualityMeasurement;
import pi.growmate.datamodel.sensors.DivisionSensor;
import pi.growmate.datamodel.sensors.PlantSensor;
import pi.growmate.repositories.division.DivisionSensorRepository;
import pi.growmate.repositories.measurements.AirQualityRepository;
import pi.growmate.repositories.measurements.AirTemperatureRepository;
import pi.growmate.repositories.measurements.SoilQualityRepository;
import pi.growmate.repositories.plant.PlantSensorRepository;

import java.time.LocalDateTime;

@Service
public class RabbitMQConsumer {

    private static final Logger LOGGER = LoggerFactory.getLogger(RabbitMQConsumer.class);

    @Autowired
    private AirQualityRepository airQualityRepository;

    @Autowired
    private AirTemperatureRepository airTemperatureRepository;

    @Autowired
    private SoilQualityRepository soilQualityRepository;

    @Autowired
    private DivisionSensorRepository divisionSensorRepository;

    @Autowired
    private PlantSensorRepository plantSensorRepository;

    @RabbitListener(queues = "${rabbitmq.air.humidity.queue.name}")
    public void consumeAirHumidity(JsonNode jsonNode) {
        LOGGER.info("Received message -> {}", jsonNode);

        try {
            // Extract the necessary fields from the JSON
            String code = jsonNode.get("code").asText();
            double value = jsonNode.get("value").asDouble();

            // Check if the sensor exists
            DivisionSensor sensor = divisionSensorRepository.findDivisionSensorBySensorCode(code);
            if (sensor == null) {
                LOGGER.warn("Sensor with code {} does not exist. Skipping measurement.", code);
                return;
            }

            // Create a new AirQualityMeasurement object
            AirQualityMeasurement measurement = new AirQualityMeasurement();
            measurement.setSensor(sensor);
            measurement.setMeasurement(value);
            measurement.setPostDate(LocalDateTime.now());

            // Save the measurement to the repository
            airQualityRepository.save(measurement);

            LOGGER.info("Measurement saved successfully");
        } catch (Exception e) {
            LOGGER.error("Error processing the message: {}", e.getMessage());
        }
    }

    @RabbitListener(queues = "${rabbitmq.air.temperature.queue.name}")
    public void consumeAirTemperature(JsonNode jsonNode) {
        LOGGER.info("Received message -> {}", jsonNode);

        try {
            // Extract the necessary fields from the JSON
            String code = jsonNode.get("code").asText();
            double value = jsonNode.get("value").asDouble();

            // Check if the sensor exists
            DivisionSensor sensor = divisionSensorRepository.findDivisionSensorBySensorCode(code);
            if (sensor == null) {
                LOGGER.warn("Sensor with code {} does not exist. Skipping measurement.", code);
                return;
            }

            // Create a new AirTemperatureMeasurement object
            AirTemperatureMeasurement measurement = new AirTemperatureMeasurement();
            measurement.setSensor(sensor);
            measurement.setMeasurement(value);
            measurement.setPostDate(LocalDateTime.now());

            // Save the measurement to the repository
            airTemperatureRepository.save(measurement);

            LOGGER.info("Measurement saved successfully");
        } catch (Exception e) {
            LOGGER.error("Error processing the message: {}", e.getMessage());
        }
    }


    @RabbitListener(queues = "${rabbitmq.soil.humidity.queue.name}")
    public void consumeSoilHumidity(JsonNode jsonNode) {
        LOGGER.info("Received message -> {}", jsonNode);

        try {
            // Extract the necessary fields from the JSON
            String code = jsonNode.get("code").asText();
            double value = jsonNode.get("value").asDouble();

            // Check if the sensor exists
            PlantSensor sensor = plantSensorRepository.findPlantSensorBySensorCode(code);
            if (sensor == null) {
                LOGGER.warn("Sensor with code {} does not exist. Skipping measurement.", code);
                return;
            }

            // Create a new SoilQualityMeasurement object
            SoilQualityMeasurement measurement = new SoilQualityMeasurement();
            measurement.setSensor(sensor);
            measurement.setMeasurement(value);
            measurement.setPostDate(LocalDateTime.now());

            // Save the measurement to the repository
            soilQualityRepository.save(measurement);

            LOGGER.info("Measurement saved successfully");
        } catch (Exception e) {
            LOGGER.error("Error processing the message: {}", e.getMessage());
        }
    }
}

