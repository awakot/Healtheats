var Activity = createReactClass({
  getInitialState() {
    return { clicked: false };
  },
  clicked() {
    console.log(this);
    this.setState({ clicked: true });
  },
  render() {
    return (
      <div onClick={this.clicked}>
        detail
        {this.state.clicked ? <ActivityDetail menu_id={this.props.menu_id} date={this.props.date} /> : null}
      </div>
    );
  }
});

var ActivityDetail = createReactClass({
  render() {
    return (
      <div>
        <div>{this.props.menu_id}</div>
        <div>{this.props.date}</div>
      </div>
    );
  }
})
