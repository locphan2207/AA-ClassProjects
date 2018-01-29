import { connect } from 'react-redux';
import TodoList from './todo_list';
import {allTodos} from '../../reducers/selectors';
import {receiveTodo} from '../../actions/todo_actions';



const mapStateToProps = (state) => ({
  todos: allTodos(state) //hold array of todos
});

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

export default connect( mapStateToProps, mapDispatchToProps)(TodoList);