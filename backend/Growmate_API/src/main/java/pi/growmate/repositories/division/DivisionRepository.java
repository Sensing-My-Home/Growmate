package pi.growmate.repositories.division;

import org.springframework.data.jpa.repository.JpaRepository;
import pi.growmate.datamodel.division.Division;

public interface DivisionRepository extends JpaRepository<Division, Long> {
}
