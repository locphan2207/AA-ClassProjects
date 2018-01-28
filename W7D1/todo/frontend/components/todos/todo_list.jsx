import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

const TodoList = (props) => {
  // console.log(props);
  return (
    <div>
      <ul>
        {
          props.todos.map((todo) => (
            <TodoListItem key={todo.id} todo={todo} />
          ))
        } </ul>
      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  );
};

export default TodoList;
