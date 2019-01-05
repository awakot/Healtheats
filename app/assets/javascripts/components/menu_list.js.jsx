var CategoryMenuList = createReactClass({
  getInitialState() {
    return { position: [] };
  },
  getPosition() {
    navigator.geolocation.getCurrentPosition(
      // 取得成功した場合
      function location(position) {
        alert("緯度:"+position.coords.latitude+",経度"+position.coords.longitude);
      },
      // 取得失敗した場合
      function(error) {
        switch(error.code) {
          case 1: //PERMISSION_DENIED
            alert("位置情報の利用が許可されていません");
            break;
          case 2: //POSITION_UNAVAILABLE
            alert("現在位置が取得できませんでした");
            break;
          case 3: //TIMEOUT
            alert("タイムアウトになりました");
            break;
          default:
            alert("その他のエラー(エラーコード:"+error.code+")");
            break;
        }
      }
    );
  },
  render() {
    var categoryNodes = this.props.categories.map(function (cat) {
      return (
        <Categories data={cat} key={cat.id} />
      );
    });
    return (
      <div className="categories-list">
        {/* <div onClick={this.getPosition}>近くのお店を検索する（位置情報を利用します）</div> */}
        {categoryNodes}
      </div>
    );
  }
});

var Categories = createReactClass({
  getInitialState() {
    return { clicked: false };
  },
  hoge(hoge){
    this.setState({ clicked: true });
    console.log(hoge);
  },
  handleClick() {
    // this.setState({ clicked: true });
    let hoge = "hoge";
    this.hoge(hoge);
    var categoryNameDivs =
      Array.prototype.slice.call(
        document.getElementsByClassName('categories-list__item--name')
      );
    categoryNameDivs.map(function (div) {
      div.style.display = "none";
    });
  },
  render() {
    return (
      <div className="categories-list__item">
        <div className="categories-list__item--name" onClick={this.handleClick}>{this.props.data.name}</div>
        {this.state.clicked ? <CategoryMenu menus={this.props.data.menus}/> : null}
      </div>
    )
  }
});

var CategoryMenu = createReactClass({
  render() {
    return (
      this.props.menus.map(function (menu) {
        return (
          <AdminMenu menu={menu} key={menu.id} />
        );
      })
    );    
  }
});

var AdminMenu = createReactClass({
  getInitialState() {
    return { calorie_amount: null };
  },
  getCalorie(calorie_id){
    if (this.state.calorie_amount !== null){
      return
    };
    $.ajax({
      url: "/api/calories/".concat(calorie_id),
      dataType: 'json',
      type: 'GET',
      success: function(calorie) {
        this.setState({ calorie_amount: calorie.amount });
      }.bind(this),
      error: function(status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render(){
    var menu = this.props.menu;
    this.getCalorie(menu.calorie_id);
    return(
      <a className="categories-list__item--menu" href={"/menus/"+menu.id}>
        <span className="categories-list__item--menu-name">{menu.name}</span>
        <span className="categories-list__item--menu-kcal">{this.state.calorie_amount}kcal</span>
        <span className="categories-list__item--menu-price">¥{menu.price}</span>
        <span className="categories-list__item--menu-desc">{menu.description}</span>
        <img className="categories-list__item--menu-pic" src={menu.picture} />
      </a>
    );
  }
})
