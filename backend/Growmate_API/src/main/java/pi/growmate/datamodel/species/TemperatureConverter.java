package pi.growmate.datamodel.species;

import jakarta.persistence.AttributeConverter;

public class TemperatureConverter implements AttributeConverter<OptimalTemperature, Integer> {
    @Override
    public Integer convertToDatabaseColumn(OptimalTemperature optimalTemperature) {
        return switch (optimalTemperature) {
            case COOL -> 0;
            case AVERAGE -> 1;
            case WARM -> 2;
            default -> throw new IllegalArgumentException("Invalid temperature converter: " + optimalTemperature);
        };
    }

    @Override
    public OptimalTemperature convertToEntityAttribute(Integer optimalTemperatureInt) {
        return switch (optimalTemperatureInt) {
            case 0 -> OptimalTemperature.COOL;
            case 1 -> OptimalTemperature.AVERAGE;
            case 2 -> OptimalTemperature.WARM;
            default -> throw new IllegalArgumentException("Invalid temperature converter integer: " + optimalTemperatureInt);
        };
    }
}
