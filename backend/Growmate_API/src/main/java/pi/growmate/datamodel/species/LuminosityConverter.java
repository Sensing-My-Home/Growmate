package pi.growmate.datamodel.species;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.criteria.CriteriaBuilder;

public class LuminosityConverter implements AttributeConverter<OptimalLuminosity, Integer> {
    @Override
    public Integer convertToDatabaseColumn(OptimalLuminosity optimalLuminosity) {
        return switch (optimalLuminosity) {
            case SUNNY -> 3;
            case HIGH -> 2;
            case MEDIUM -> 1;
            case LOW -> 0;
            default -> throw new IllegalArgumentException("Invalid luminosity converter: " + optimalLuminosity);
        };
    }

    @Override
    public OptimalLuminosity convertToEntityAttribute(Integer optimalLuminosityInt) {
        return switch (optimalLuminosityInt) {
            case 0 -> OptimalLuminosity.LOW;
            case 1 -> OptimalLuminosity.MEDIUM;
            case 2 -> OptimalLuminosity.HIGH;
            case 3 -> OptimalLuminosity.SUNNY;
            default -> throw new IllegalArgumentException("Invalid luminosity converter integer: " + optimalLuminosityInt);
        };
    }
}
