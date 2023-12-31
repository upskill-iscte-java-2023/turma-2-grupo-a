package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.user.Token;
import pt.upskill.vias.entities.user.User;

@Repository
public interface TokenRepository extends JpaRepository<Token, Long> {

    Token getTokenByTokenId(String tokenId);
    Token getTokenByUser(User user);


}
