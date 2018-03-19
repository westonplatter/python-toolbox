import React, {Component} from 'react';
import axios from 'axios';
import qs from 'qs';

export default class SearchPage extends Component {
  constructor(props) {
    super(props);


    this.state = { name: this.props.name };
  }

  updateName = (name) => {
    this.setState({ name });
  };

  handleInputChange = (event) => {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;

    this.setState({
      [name]: valuex
    });
  }

  handleSubmit = (e) => {
    let data = {q:{}}

    if (this.state.name) {
      data.q.name_cont = this.state.name
    }

    let url = "/package?" + qs.stringify(data)

    axios({
      method: "get",
      url: url
    })
  }

  render() {
    return (
      <div>
        <h2>Search</h2>

        <form onSubmit={this.handleInputChange}>
          <label htmlFor="name">Name Contains</label>

          <input
            value={this.state.name}
            onChange={this.handleChange}
            type="text"
          />

          <button type="submit">Search</button>
        </form>

      </div>
    );
  }
}
