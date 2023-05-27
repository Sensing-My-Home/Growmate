package pi.growmate.rabbitmq;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

@Service
public class RabbitMQConsumer {

    private static final Logger LOGGER = LoggerFactory.getLogger(RabbitMQConsumer.class);

    @RabbitListener(queues = {"${rabbitmq.air.humidity.queue.name}"})
    public void consumeAirHumidity(String message){
        LOGGER.info(String.format("Received message -> %s", message));
    }

    @RabbitListener(queues = {"${rabbitmq.air.temperature.queue.name}"})
    public void consumeAirTemperature(String message){
        LOGGER.info(String.format("Received message -> %s", message));
    }

    @RabbitListener(queues = {"${rabbitmq.soil.humidity.queue.name}"})
    public void consumeSoilHumidity(String message){
        LOGGER.info(String.format("Received message -> %s", message));
    }
}
