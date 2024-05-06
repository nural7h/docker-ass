package viadoc.docass.Todo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/todo")
@CrossOrigin(origins = "*", allowedHeaders = "*", exposedHeaders = "Access-Control-Allow-Origin")
public class TodoController {

    private final TodoService todoService;

    @Autowired
    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @PostMapping
    public Todo addTodo(@RequestBody Todo todo) {
        Todo addedTodo = todoService.addTodo(todo);
        System.out.println("Added todo: " + addedTodo.getTitle() + " " + addedTodo.getId());
        return addedTodo;
    }

    @GetMapping()
    @ResponseBody
    public List<Todo> getAllTodos() {
        return todoService.getAllTodos();
    }
}
