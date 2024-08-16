class Product {
  String name;
  double price;
  int quantity;
  Product({required this.name, required this.price, this.quantity = 1});
}

class Cart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.forEach((p) {
      if (p.name == product.name) {
        p.quantity += product.quantity;
        return;
      }
    });
    products.add(product);
  }

  void removeProduct(Product product) {
    if (products.remove(product)) {
      print('\nRemoved successfully');
    } else {
      print('\nProduct not founded');
    }
  }

  void displayCart() {
    if (products.isEmpty) {
      print('\nYour cart is empty.');
    } else {
      products.forEach((product) {
        print('\nName: ${product.name}');
        print('\nPrice: ${product.price}');
        print('\nQuantity: ${product.quantity}');
        print('------------------------------');
      });
    }
  }

  double calculateTotal() {
    double total = 0.0;
    products.forEach((product) {
      total += product.price * product.quantity;
    });
    return total;
  }
}

void main(List<String> args) {
  Product apple = Product(name: 'Apple', price: 50.0, quantity: 7);
  Product banana = Product(name: 'Banana', price: 30.0, quantity: 5);
  Product orange = Product(name: 'Orange', price: 25.5, quantity: 2);

  Cart cart = Cart();

  cart.addProduct(apple);
  cart.addProduct(banana);
  cart.addProduct(orange);

  cart.displayCart();

  double total = cart.calculateTotal();
  print('\nTotal Price: \$${total}');

  cart.removeProduct(apple);
  print('\nAfter removing Banana:');
  cart.displayCart();
  total = cart.calculateTotal();
  print('\nTotal Price after removal: \$$total');
}
