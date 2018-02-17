package com.testtask.crud.repository;


import com.testtask.crud.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {

    @Query("select b from book b where " +
            " UPPER(b.title) LIKE CONCAT('%',UPPER(:partData),'%')  OR  " +
            " UPPER(b.description) LIKE CONCAT('%',UPPER(:partData),'%') OR " +
            " UPPER(b.author) LIKE CONCAT('%',UPPER(:partData),'%') OR  " +
            " UPPER(b.isbn) LIKE CONCAT('%',UPPER(:partData),'%') OR " +
            " cast(b.printYear AS string) LIKE CONCAT('%',UPPER(:partData),'%')")
    List<Book> getBooksByPartData(@Param("partData") String partData);
}

