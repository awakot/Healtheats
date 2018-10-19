var CategoryMenuList = createReactClass({
  render() {
    var categoryNodes = this.props.categories.map(function (cat) {
      return (
        <Categories data={cat} />
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
    return {clicked: false};
  },
  handleClick() {
    this.setState({
      clicked: true
    });
    var categoryNameDivs =
      Array.prototype.slice.call(
        document.getElementsByClassName('categories-list__item--name')
      );
    categoryNameDivs.map(function (div) {
      div.style.display = "none";
    });
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
          <a className="categories-list__item--menu" href={"/menus/"+menu.id}>
            <span className="categories-list__item--menu-name">{menu.name}</span>
            <span className="categories-list__item--menu-kcal">100kcal</span>
            <span className="categories-list__item--menu-price">¥{menu.price}</span>
            <span className="categories-list__item--menu-desc">{menu.description}</span>
            <img className="categories-list__item--menu-pic" src={menu.picture} />
          </a>
        );
      })
    );    
  }
});
