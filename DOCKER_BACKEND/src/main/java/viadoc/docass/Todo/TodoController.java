package viadoc.docass.Todo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "api/v1/todo")
public class TodoController {

    private final TodoService todoService;

    @Autowired
    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @PostMapping
    public void addTodo(@RequestBody Todo todo){
        todoService.addTodo(todo);
    }

    @GetMapping()
    @ResponseBody
    public List<Todo> getAllTodos(){
        return todoService.getAllTodos();
    }
}
