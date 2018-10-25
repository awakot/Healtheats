var Activity = createReactClass({
  getInitialState() {
    return { clicked: false };
  },
  detailClicked() {
    if (this.state.clicked == false){
      this.setState({ clicked: true });
    } else {
      this.setState({ clicked: false });
    }
  },
  hideDetailBtn(){
    $(".taken_menu__btn").addClass("transparent");
    $(".taken_menus__item--wrapper__child").addClass("transparent");
    $(".taken_menu__detail--btn").css("display", "block");  
  },
  render() {
    return (
      <div className="taken_menu" onClick={this.detailClicked}>
        <div className="taken_menu__btn" onClick={this.hideDetailBtn}>詳細</div>
        <ActivityDetail menu_id={this.props.menu_id} date={this.props.date} clicked={this.state.clicked} />
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
  hideMenuDetail(){
    $(".taken_menu__detail").removeClass("clicked_true");
    $(".taken_menu__detail").addClass("clicked_false");
    $(".taken_menu__btn").removeClass("transparent");
    $(".taken_menus__item--wrapper").children().removeClass("transparent");
  },
  render() {
    return (
      <div className={"taken_menu__detail clicked_"+ this.props.clicked}>
        <div className="taken_menu__detail--date">{this.props.date} のメニュー</div>
        <div className="taken_menu__detail--name">{this.state.menu_name}</div>
        <div className="taken_menu__detail--desc">{this.state.menu_desc}</div>
        <div className="taken_menu__detail--price">¥{this.state.menu_price}</div>
        <div className="taken_menu__detail--calorie">{this.state.menu_calorie_id}kcal</div>
        <img src={this.state.menu_pic} className="taken_menu__detail--pic" />
        <div className="taken_menu__detail--btn" onClick={this.hideMenuDetail}>close</div>
      </div>
    );
  }
})
