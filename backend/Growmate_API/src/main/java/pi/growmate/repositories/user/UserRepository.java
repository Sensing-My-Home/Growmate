package pi.growmate.repositories.user;

import org.springframework.data.jpa.repository.JpaRepository;
import pi.growmate.datamodel.user.User;

public interface UserRepository extends JpaRepository<User, Long> {
}
