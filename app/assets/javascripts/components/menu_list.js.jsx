var CategoryMenuList = createReactClass({
  render() {
    var categoryNodes = this.props.categories.map(function (cat) {
      return (
        <Categories data={cat} />
      );
    });
    return (
      <div className="categories">
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
        document.getElementsByClassName('categories-item__name--action')
      );
    categoryNameDivs.map(function (div) {
      div.style.display = "none";
    });
  },
  render() {
    return (
      <div className="categories-item">
        <div className="categories-item__name">
          <div className="categories-item__name--action" onClick={this.handleClick}>
            {this.props.data.name}
          </div>
          {this.state.clicked ? <CategoryMenu menus={this.props.data.menus}/> : null}
        </div>
      </div>
    )
  }
});

var CategoryMenu = createReactClass({
  render() {
    return (
      this.props.menus.map(function (menu) {
        return (
          <a className="categories-item__name--menu" href={"/menus/"+menu.id}>
            <div className="categories-item__name--menu-name">{menu.name}</div>
            <div className="categories-item__name--menu-description">{menu.description}</div>
          </a>
        );
      })
    );    
  }
});
