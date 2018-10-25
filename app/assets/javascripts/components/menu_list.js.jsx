var CategoryMenuList = createReactClass({
  render() {
    var categoryNodes = this.props.categories.map(function (cat) {
      return (
        <Categories data={cat} key={cat.id} />
      );
    });
    return (
      <div className="categories-list">
        {categoryNodes}
      </div>
    );
  }
});

var Categories = createReactClass({
  getInitialState() {
    return { clicked: false };
  },
  handleClick() {
    this.setState({ clicked: true });
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
          <Menu menu={menu} key={menu.id} />
        );
      })
    );    
  }
});

var Menu = createReactClass({
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
