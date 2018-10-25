var Activity = createReactClass({
  getInitialState() {
    return { clicked: false };
  },
  detailClicked() {
    this.setState({ clicked: true });
  },
  render() {
    return (
      <div className="taken_menu" onClick={hideDetailBtn}>
        <div className="taken_menu__btn" onClick={this.detailClicked}>詳細</div>
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
          menu_pic: menu.picture,
          menu_calorie_id: menu.calorie_id
        });
      }.bind(this),
      error: function(status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render() {
    return (
      <div className="taken_menu__detail">
        <div className="taken_menu__detail--date">{this.props.date}</div>
        <div className="taken_menu__detail--name">{this.state.menu_name}</div>
        <div className="taken_menu__detail--desc">{this.state.menu_desc}</div>
        <div className="taken_menu__detail--price">{this.state.menu_price}</div>
        <div className="taken_menu__detail--pic">{this.state.menu_pic}</div>
        <div className="taken_menu__detail--calorie">{this.state.menu_calorie_id}</div>
      </div>
    );
  }
})
