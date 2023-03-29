package pi.growmate.datamodel.species;

import jakarta.persistence.AttributeConverter;

public class WateringFrequencyConverter implements AttributeConverter<WateringFrequency, Integer> {
    @Override
    public Integer convertToDatabaseColumn(WateringFrequency wateringFrequency) {
        return switch (wateringFrequency) {
            case INFREQUENT -> 0;
            case AVERAGE -> 1;
            case FREQUENT -> 2;
            default -> throw new IllegalArgumentException("Invalid watering frequency: " + wateringFrequency);
        };
    }

    @Override
    public WateringFrequency convertToEntityAttribute(Integer wateringFrequencyInt) {
        return switch (wateringFrequencyInt) {
            case 0 -> WateringFrequency.INFREQUENT;
            case 1 -> WateringFrequency.AVERAGE;
            case 2 -> WateringFrequency.FREQUENT;
            default -> throw new IllegalArgumentException("Invalid watering frequency integer: " + wateringFrequencyInt);
        };
    }
}
