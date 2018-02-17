package com.testtask.crud.controller;

import com.testtask.crud.model.Book;
import com.testtask.crud.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BookController {
    @Autowired

    private BookRepository bookRepository;

    // WORK  ====================================================================
    @RequestMapping("/")
    ModelAndView index(ModelAndView modelAndView) {
        modelAndView.setViewName("/index");
        return modelAndView;
    }


    @GetMapping(path="/all")
    public @ResponseBody Iterable<Book> getFindAll() {
        // This returns a JSON or XML with the books
        return bookRepository.findAll();
    }

    @RequestMapping(value= "/search/{part}", method = RequestMethod.GET)
    public @ResponseBody
    List<Book> getBooksByPartData(@PathVariable("part") String part) {
        // This returns a JSON or XML with the books
        if(part == null || part.isEmpty()) {
            return bookRepository.findAll();
        } else {
            return bookRepository.getBooksByPartData(part);
        }
    }


    @RequestMapping(value= "/edit/{id}", method = RequestMethod.GET)
    ModelAndView edit(ModelAndView modelAndView, @PathVariable("id") long id) {
        Book book;
        if(id != 0) {
            book = bookRepository.findOne(id);
        } else {
            book = new Book();
        }
        modelAndView.addObject(book);
        modelAndView.setViewName("/edit");
        return modelAndView;
    }

    @RequestMapping(value= "/delete/{id}", method = RequestMethod.GET)
    public String delete(ModelAndView modelAndView, @PathVariable("id") long id) {
        bookRepository.delete(id);
        return "redirect:/";
    }

    @RequestMapping(value= "/read/{id}", method = RequestMethod.GET)
    public String setRead(ModelAndView modelAndView, @PathVariable("id") long id) {
        Book b = bookRepository.findOne(id);
        b.setReadAlready(true);
        bookRepository.save(b);
        return "redirect:/";
    }

    @RequestMapping(value = "/postbook", method = RequestMethod.POST)
    public String postBook(@RequestBody Book book) { //ModelAndView modelAndView,
        Book b;
        if(bookRepository.exists(book.getId())) {
            b = bookRepository.findOne(book.getId());
        } else {
            b = new Book();
            b.setAuthor(book.getAuthor());
        }
        b.setTitle(book.getTitle());
        b.setDescription(book.getDescription());
        b.setIsbn(book.getIsbn());
        b.setPrintYear(book.getPrintYear());
        b.setReadAlready(false); //book.isReadAlready()
        bookRepository.save(b);
        return "redirect:/";
    }




    // readonly  ====================================================================
    @RequestMapping("/readonly")
    ModelAndView viewstyle(ModelAndView modelAndView) {
        modelAndView.setViewName("/readonly");
        return modelAndView;
    }



    // SIMPLESTYLE  ====================================================================
    @RequestMapping("/simplestyle")
    ModelAndView index2(ModelAndView modelAndView) {
        modelAndView.setViewName("/simplestyle");
        return modelAndView;
    }


    @RequestMapping(path="/books", method = RequestMethod.GET)
    public @ResponseBody Iterable<Book> getAllBooks() {
        // This returns a JSON or XML with the books
        return bookRepository.findAll();
    }

    @RequestMapping(value= "/books", method = RequestMethod.POST)
    public @ResponseBody Book addBook(@RequestBody Book book) {
        bookRepository.save(book);
        return book;
    }

    @RequestMapping(value= "/books/{id}", method = RequestMethod.GET)
    public @ResponseBody Book getBookById(@PathVariable("id") long id) {
        return bookRepository.findOne(id);
    }

    @RequestMapping(value= "/books/{id}", method = RequestMethod.PATCH)
    public @ResponseBody Book updateBook(@PathVariable("id") long id, @RequestBody Book book) {
        Book b = bookRepository.findOne(id);
        b.setTitle(book.getTitle());
        b.setDescription(book.getDescription());
        b.setAuthor(book.getAuthor());
        b.setIsbn(book.getIsbn());
        b.setPrintYear(book.getPrintYear());
        b.setReadAlready(book.isReadAlready());
        bookRepository.saveAndFlush(b);
        return b;
    }

    @RequestMapping(value= "/books/delete/{id}", method = RequestMethod.GET)
    public String deleteBookById(@PathVariable("id") long id) {
        bookRepository.delete(id);
        return "redirect:/simplestyle";
    }

}
