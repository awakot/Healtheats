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
        <td className="menubox-list__item--picture">{this.props.data.picture}</td>
      </tr>
    )
  }
})

var MenuForm = createReactClass({
  handleSubmit(e){
    console.log(this);
    e.preventDefault();
    var name = this.name.value.trim();
    var description = this.description.value.trim();
    var price = this.price.value.trim();
    var calorie_id = this.calorie_id.value.trim();
    var picture = this.picture.value.trim();
    if (!name || !description || !price || !calorie_id || !picture) {
      return;
    }
    this.props.onMenuSubmit({name: name, description: description, price: price, calorie_id: calorie_id, picture: picture});
    // ↑ここでcallback実行する！
    this.name.value = "";
    this.description.value = "";
    this.price.value = "";
    this.calorie_id.value = "";
    this.picture.value = "";
    return;
  },
  render(){
    return (
      <div className="menubox-form">
        <form className="menuForm" onSubmit={this.handleSubmit}>
          <input type="text" placeholder="メニュー名" ref={(inputText) => { this.name = inputText; }} />
          <input type="text" placeholder="説明" ref={(inputText) => { this.description = inputText; }} />
          <input type="text" placeholder="価格" ref={(inputText) => { this.price = inputText; }} />
          <input type="text" placeholder="キロカロリー" ref={(inputText) => { this.calorie_id = inputText; }} />
          <input type="text" placeholder="アイコンまたは画像をアップロード" ref={(inputText) => { this.picture = inputText; }} />
          <input type="submit" value="登録" />
        </form>
      </div>
    )
  }
})
