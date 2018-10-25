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
  getInitialState() {
    return { menu_name: "" };
  },
  componentDidMount() {
    $.ajax({
      url: "/api/menus/".concat(this.props.menu_id).concat(".json"),
      dataType: 'json',
      type: 'GET',
      success: function(menu) {
        this.setState({
          menu_name: menu.name,
          menu_desc: menu.description,
          menu_price: menu.price,
          menu_pic: menu.picture
        });
      }.bind(this),
      error: function(status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render() {
    console.log(this);
    return (
      <div>
        <div>{this.props.date}</div>
        <div>{this.state.menu_name}</div>
        <div>{this.state.menu_desc}</div>
        <div>{this.state.menu_price}</div>
        <div>{this.state.menu_pic}</div>
      </div>
    );
  }
})
