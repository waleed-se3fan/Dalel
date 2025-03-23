class CartModel {
  final String name;
  final String price;
  final String id;
  final String image;

  CartModel(this.name, this.price, this.id, this.image);
  factory CartModel.fromFire(json, String id) {
    return CartModel(json['name'], json['price'], id, json['image'] ?? '');
  }
}
