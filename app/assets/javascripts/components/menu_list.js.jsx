var MenuBox = createReactClass({
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
  handleMenuSubmit(menu) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: menu,
      success: function(data) {
        this.setState({data: this.state.data.concat([data])});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount() {
    this.loadMenusFromServer();
    setInterval(this.loadMenusFromServer, this.props.pollInterval);
  },
  render() {
    return (
      <div className="menubox">
        <MenuForm onMenuSubmit={this.handleMenuSubmit}/>
        <table>
          <thead>
            <tr>
              <th>店名</th>
              <th>メニュー名</th>
              <th>説明</th>
              <th>価格</th>
              <th>kcal</th>
            </tr>
          </thead>
          <MenuList data={this.state.data}/>
        </table>
      </div>
    );
  }
});

var MenuList = createReactClass({
  render() {
    var menuNodes = this.props.data.map(function (menu) {
      return (
        <Menu data={menu} />
      );
    });
    return (
      <tbody className="menubox-list">
        {menuNodes}
      </tbody>
    );
  }
})

var Menu = createReactClass({
  render() {
    return (
      <tr className="menubox-list__item">
        <td>[# TODO: 店名]</td>
        <td className="menubox-list__item--name">
          {this.props.data.name}
        </td>
        <td className="menubox-list__item--desc">{this.props.data.description}</td>
        <td className="menubox-list__item--price">¥{this.props.data.price}</td>
        <td className="menubox-list__item--kcal">{this.props.data.kcalorie} kcal</td>
      </tr>
    )
  }
})

var MenuForm = createReactClass({
  render(){
    return (
      <div className="menubox-form">
        # TODO: returns menu form
        Menuモデルをmasterにマージしたらformから新しいmenuをpostする処理を書く
      </div>
    )
  }
})
