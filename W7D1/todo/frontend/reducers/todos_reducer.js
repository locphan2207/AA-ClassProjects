import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';
import { receiveTodos, receiveTodo } from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'buy stuff',
    body: 'snacks, vegetables',
    done: true
  },
  2: {
    id: 2,
    title: 'go to the beach',
    body: 'bring chairs, towels and volleyballs',
    done: false
  },
};


const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      return {todos: action.todos};
    case RECEIVE_TODO:
      const id = action.todo.id;
      console.log(action.todo);
      let nextState = {};
      nextState[id] = action.todo;
      return merge(state, nextState);

    default:
      return state;
  }

};

export default todosReducer;
