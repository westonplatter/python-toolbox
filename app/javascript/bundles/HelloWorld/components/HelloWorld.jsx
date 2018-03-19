import PropTypes from 'prop-types';
import React from 'react';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   */
  constructor(props) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { name: this.props.name };
  }

  render() {
    return (
      <div>
        <h2>Search</h2>
        <form url="/packages" action="get">
          <label htmlFor="name">
            Say hello to:
          </label>
          <input
            name="name_cont"
            type="text"
          />
          <br/>
          <button type="submit">Submit</button>
        </form>
      </div>
    );
  }
}
