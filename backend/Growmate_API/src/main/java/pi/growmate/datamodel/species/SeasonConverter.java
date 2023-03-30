package pi.growmate.datamodel.species;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class SeasonConverter implements AttributeConverter<Season, Integer> {
    @Override
    public Integer convertToDatabaseColumn(Season season) {
        return switch (season) {
            case FALL -> 3;
            case SUMMER -> 2;
            case SPRING -> 1;
            case WINTER -> 0;
            default -> throw new IllegalArgumentException("Invalid season converter: " + season);
        };
    }

    @Override
    public Season convertToEntityAttribute(Integer seasonInt) {
        return switch (seasonInt) {
            case 0 -> Season.WINTER;
            case 1 -> Season.SPRING;
            case 2 -> Season.SUMMER;
            case 3 -> Season.FALL;
            default -> throw new IllegalArgumentException("Invalid season integer: " + seasonInt);
        };
    }
}
