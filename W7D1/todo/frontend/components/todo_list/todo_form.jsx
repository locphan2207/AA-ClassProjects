import React from 'react';

class TodoForm extends React.Component {

  constructor({receiveTodo}) {
    super({receiveTodo});
    this.receiveTodo = receiveTodo;
    this.state = {
      id: "",
      title: "",
      body: "",
      done: false
    };
  }

  linkState(key) {
    return (event => this.setState({[key]: event.currentTarget.value}));
  }

  createTodo(e) {
    e.preventDefault();
    debugger
    return this.receiveTodo(this.state);
  }

  render() {
    return (
      <form>
        <label>Title
          <input onChange={this.linkState('title')} type="text" value={this.state.title}></input>
        </label>
        <label>Body
          <input onChange={this.linkState('body')} type="text" value={this.state.body}></input>
        </label>
        <input onClick={this.createTodo.bind(this)} type="submit" value="Create Todo!"></input>
      </form>
    );
  }
}

export default TodoForm;
