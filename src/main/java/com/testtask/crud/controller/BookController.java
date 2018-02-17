package com.testtask.crud.controller;

import com.testtask.crud.model.Book;
import com.testtask.crud.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookController {
    @Autowired

    private BookRepository bookRepository;


    @GetMapping(path="/all")
    public @ResponseBody Iterable<Book> getFindAll() {
        // This returns a JSON or XML with the books
        return bookRepository.findAll();
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


    @RequestMapping("/")
    ModelAndView index(ModelAndView modelAndView) {
        modelAndView.setViewName("/_index");
        return modelAndView;
    }

    @RequestMapping("/viewstyle")
    ModelAndView viewstyle(ModelAndView modelAndView) {
        modelAndView.setViewName("/datatables");
        return modelAndView;
    }

    // WORK ====================================================================
    @RequestMapping("/v2")
    ModelAndView index2(ModelAndView modelAndView) {
        modelAndView.setViewName("/index");
        return modelAndView;
    }


    @RequestMapping(path="/books", method = RequestMethod.GET)
    public @ResponseBody Iterable<Book> getAllBooks() {
        // This returns a JSON or XML with the books
        return bookRepository.findAll();
    }

    @RequestMapping(value= "/books", method = RequestMethod.POST)
    public void addBook(@RequestBody Book book) {
        bookRepository.save(book);
    }

    @RequestMapping(value= "/books/{id}", method = RequestMethod.GET)
    public @ResponseBody Book getBookById(@PathVariable("id") long id) {
        return bookRepository.findOne(id);
    }

    @RequestMapping(value= "/books/{id}", method = RequestMethod.PATCH)
    public void updateBook(@PathVariable("id") long id, @RequestBody Book book) {
        Book b = bookRepository.findOne(id);
        b.setTitle(book.getTitle());
        b.setDescription(book.getDescription());
        b.setAuthor(book.getAuthor());
        b.setIsbn(book.getIsbn());
        b.setPrintYear(book.getPrintYear());
        b.setReadAlready(book.isReadAlready());
        bookRepository.saveAndFlush(b);
    }

    @RequestMapping(value= "/books/{id}", method = RequestMethod.DELETE)
    public void deleteBookById(@PathVariable("id") long id) {
        bookRepository.delete(id);
    }

}
