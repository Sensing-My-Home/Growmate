package pi.growmate.datamodel.species;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class HumidityConverter implements AttributeConverter<OptimalHumidity, Integer> {
    @Override
    public Integer convertToDatabaseColumn(OptimalHumidity optimalHumidity) {
        return switch (optimalHumidity) {
            case LOW -> 0;
            case MEDIUM -> 1;
            case HIGH -> 2;
            default -> throw new IllegalArgumentException("Invalid humidity converter: " + optimalHumidity);
        };
    }

    @Override
    public OptimalHumidity convertToEntityAttribute(Integer optimalHumidityInt) {
        return switch (optimalHumidityInt) {
            case 0 -> OptimalHumidity.LOW;
            case 1 -> OptimalHumidity.MEDIUM;
            case 2 -> OptimalHumidity.HIGH;
            default -> throw new IllegalArgumentException("Invalid humidity converter integer: " + optimalHumidityInt);
        };
    }
}
