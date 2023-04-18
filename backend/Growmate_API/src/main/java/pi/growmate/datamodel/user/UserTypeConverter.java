package pi.growmate.datamodel.user;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter
public class UserTypeConverter implements AttributeConverter<UserType, Integer> {
    @Override
    public Integer convertToDatabaseColumn(UserType userType) {
        switch (userType) {
            case ADMIN:
                return 0;
            case NORMAL:
                return 1;
            case PREMIUM:
                return 2;
            default:
                throw new IllegalArgumentException("Invalid user type: " + userType);
        }
    }

    @Override
    public UserType convertToEntityAttribute(Integer userTypeInt) {
        switch (userTypeInt) {
            case 0:
                return UserType.ADMIN;
            case 1:
                return UserType.NORMAL;
            case 2:
                return UserType.PREMIUM;
            default:
                throw new IllegalArgumentException("Invalid user type integer: " + userTypeInt);
        }
    }
}
