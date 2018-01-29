import React from 'react';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    let headerText = "Sign Up";
    let buttonText = "Sign Up";
    if (this.props.formType === "login") {
      headerText = "Log In";
      buttonText = "Log In";
    }

    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <h1>{headerText}</h1>
        <label>Username
          <input onChange={(e)=>this.setState({username: e.target.value})}
            type="text"/>
        </label>
        <label>Password
          <input onChange={(e)=>this.setState({password: e.target.value})}
            type="password"/>
        </label>
      <input type="submit" value={buttonText}/>
      </form>
    );
  }
}

export default SessionForm;
