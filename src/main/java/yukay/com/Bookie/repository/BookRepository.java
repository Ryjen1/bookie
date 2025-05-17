package yukay.com.Bookie.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import yukay.com.Bookie.entity.Book;

public interface BookRepository extends JpaRepository<Book, Long> {
}