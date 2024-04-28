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

    public Todo addTodo(Todo todo) {
        Optional<Todo> a = todoRepository.findById(todo.getId());
        if (a.isPresent()) {
            throw new IllegalStateException("Todo already exists. ");
        }
        Todo addedTodo = todoRepository.save(todo);
        return addedTodo;
    }

    public List<Todo> getAllTodos() {
        return todoRepository.findAll();
    }
}
