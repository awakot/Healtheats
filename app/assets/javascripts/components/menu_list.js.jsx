var MenuList = createReactClass({
  loadMenusFromServer() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function(result) {
        this.setState({data: result.data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState() {
    return {data: []};
  },
  componentDidMount() {
    this.loadMenusFromServer();
    setInterval(this.loadMenusFromServer, this.props.pollInterval);
  },
  render() {
    return (
      <div className="menuList">
        <MenuListInner data={this.state.data}/>
      </div>
    );
  }
});

var MenuListInner = createReactClass({
  render() {
    var menuNodes = this.props.data.map(function (menu) {
      return (
        <Menu data={menu} />
      );
    });
    return (
      <div className="menuList">
        {menuNodes}
      </div>
    );
  }
})

var Menu = createReactClass({
  render() {
    return (
      <div className="menu">
        <h2 className="menu_name">
          {this.props.data.name}
        </h2>
        <p>{this.props.data.description}</p>
        <p>¥{this.props.data.price}</p>
        <p>{this.props.data.kcalorie} kcal</p>
      </div>
    )
  }
})
