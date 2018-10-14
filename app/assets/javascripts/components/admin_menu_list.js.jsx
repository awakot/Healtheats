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
  componentDidMount() {
    this.loadMenusFromServer();
    setInterval(this.loadMenusFromServer, this.props.pollInterval);
  },
  reRenderMenuList(){
    // this.loadMenusFromServer();
    // this.menuList.forceUpdate();
  },
  render() {
    return (
      <div className="menubox">
        <MenuForm />
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
          <MenuList data={this.state.data} ref={(menuList) => { this.menuList = menuList; }}/>
          {/* TODO: refはあとで使う */}
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
  getInitialState() {
    return {data: []};
  },
  getCalorie(){
    $.ajax({
      url: "/api/calories/".concat(this.props.data.calorie_id),
      dataType: 'json',
      type: 'GET',
      success: function(data) {
        this.setState({ calorie: data });
      }.bind(this),
      error: function(status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render() {
    this.getCalorie();
    if (this.state.calorie !== undefined) {
      var calorie_amount = this.state.calorie.amount
    }
    return (
      <tr className="menubox-list__item">
        <td>[# TODO: 店名]</td>
        <td className="menubox-list__item--name">
          {this.props.data.name}
        </td>
        <td className="menubox-list__item--desc">{this.props.data.description}</td>
        <td className="menubox-list__item--price">¥{this.props.data.price}</td>
        <td className="menubox-list__item--kcal">{calorie_amount}kcal</td>
        <td className="menubox-list__item--picture">{this.props.data.picture}</td>
      </tr>
    )
  }
})

var MenuForm = createReactClass({
  getInitialState() {
    return {data: []};
  },
  handleMenuSubmit(menu) {
    $.ajax({
      url: "/api/menus",
      dataType: 'json',
      type: 'POST',
      data: menu,
      success: function(data) {
        this.setState({data: this.state.data.concat([data])});
      }.bind(this),
      error: function(status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleSubmit(e){
    e.preventDefault();
    this.calorieList.getCalorie();
    var name = this.name.value.trim();
    var description = this.description.value.trim();
    var price = this.price.value.trim();
    var calorie_id = this.calorieList.state.calorie_id;
    var picture = this.picture.value.trim();

    if (!name || !description || !price || !calorie_id || !picture) {
      return;
    }
    this.handleMenuSubmit({name: name, description: description, price: price, calorie_id: calorie_id, picture: picture});
    // ↑ここでcallback実行する！
    this.name.value = "";
    this.description.value = "";
    this.price.value = "";
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
          <Calories ref={(calories) => { this.calorieList = calories; }} />
          <input type="text" placeholder="アイコンまたは画像をアップロード" ref={(inputText) => { this.picture = inputText; }} />
          <input type="submit" value="登録" />
        </form>
      </div>
    )
  }
})

var Calories = createReactClass ({
  loadCaloriesFromServer() {
    $.ajax({
      url: "/api/calories",
      dataType: 'json',
      success: function(result) {
        this.setState({data: result.data});
      }.bind(this),
      error: function(status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState() {
    return {data: []};
  },
  componentDidMount() {
    this.loadCaloriesFromServer();
  },
  setCalorie(event) {
    this.setState({calorie_id: event.target.value});
  },
  getCalorie() {
    this.setState({calorie_id: this.state.calorie_id});
  },
  render () {
    var calorieNodes = this.state.data.map(function (calorie) {
      return (
        <option value={calorie.id}>{calorie.amount}</option>
      );
    });
    return (
      <select className="calories-amount d-inline" onChange={this.setCalorie}>
        <option value={null}></option>
        {calorieNodes}
      </select>
    );
  }
})
