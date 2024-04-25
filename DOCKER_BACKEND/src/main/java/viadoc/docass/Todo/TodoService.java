package viadoc.docass.Todo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TodoService {
    private final TodoRepository todoRepository;

    @Autowired
    public TodoService(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }


    public void addTodo(Todo todo) {
        Optional<Todo> a = todoRepository.findById(todo.getId());
        if (a.isPresent()){
            throw new IllegalStateException("Id already exists. ");
        }
        todoRepository.save(todo);
    }

    public List<Todo> getAllTodos() {
        return todoRepository.findAll();
    }
}
