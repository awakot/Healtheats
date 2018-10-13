var RestaurantBox = createReactClass({
  loadRestaurantsFromServer() {
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
  handleRestaurantSubmit(restaurant) {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: restaurant,
      success: function(data) {
        this.setState({data: this.state.data.concat([data])});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  componentDidMount() {
    this.loadRestaurantsFromServer();
    setInterval(this.loadRestaurantsFromServer, this.props.pollInterval);
  },
  render() {
    return (
      <div className="restaurantbox">
        <RestaurantForm onRestaurantSubmit={this.handleRestaurantSubmit}/>
        <table>
          <thead>
            <tr>
              <th>店名</th>
              <th>郵便番号</th>
              <th>住所</th>
            </tr>
          </thead>
          <RestaurantList data={this.state.data}/>
        </table>
      </div>
    );
  }
});

var RestaurantList = createReactClass({
  render() {
    var restaurantNodes = this.props.data.map(function (restaurant) {
      return (
        <Restaurant data={restaurant} />
      );
    });
    return (
      <tbody className="restaurantbox-list">
        {restaurantNodes}
      </tbody>
    );
  }
})

var Restaurant = createReactClass({
  render() {
    return (
      <tr className="restaurantbox-list__item">
        <td className="restaurantbox-list__item--name">
          {this.props.data.name}
        </td>
        <td className="restaurantbox-list__item--zip_code">
          {this.props.data.zip_code}
        </td>
        <td className="restaurantbox-list__item--address">
          {this.props.data.address}
        </td>
      </tr>
    )
  }
})

var RestaurantForm = createReactClass({
  render(){
    return (
      <div className="restaurantbox-form">
        # TODO: post new restaurant from this form
      </div>
    )
  }
})
