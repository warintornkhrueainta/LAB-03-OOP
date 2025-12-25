class Product {

  String _id;

  String name;
  double _price; 
  int? stock;

  Product({
    required String id,
    required this.name,
    required double price,
    this.stock,
  })  : _id = id,
        _price = price {
    print("New Product created: $_id ($name)");
  }


  String get id => _id;

  double get price => _price;

  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      print("ราคาไม่ถูกต้อง (ต้อง > 0) -> ไม่เปลี่ยนค่า");
    }
  }

  void applyDiscount(double percent) {
    if (percent >= 0 && percent <= 100) {
      _price -= _price * (percent / 100);
    } else {
      print("เปอร์เซ็นต์ส่วนลดต้องอยู่ระหว่าง 0–100");
    }
  }

  void restock(int amount) {
    stock ??= 0;
    stock = stock! + amount;
  }

  void showInfo() {
    print("----------------");
    print("ID: $_id");
    print("Name: $name");
    print("Price: $_price");
    print("Stock: ${stock ?? "ยังไม่ระบุสต็อก"}");
  }
}

class DigitalProduct extends Product {
  double fileSizeMB;

  DigitalProduct({
    required String id,
    required String name,
    required double price,
    int? stock,
    required this.fileSizeMB,
  }) : super(
          id: id,
          name: name,
          price: price,
          stock: stock,
        );

  @override
  void showInfo() {
    super.showInfo();
    print("Type: Digital");
    print("File Size: $fileSizeMB MB");
  }
}


class FoodProduct extends Product {
  String expireDate;

  FoodProduct({
    required String id,
    required String name,
    required double price,
    int? stock,
    required this.expireDate,
  }) : super(
          id: id,
          name: name,
          price: price,
          stock: stock,
        );

  @override
  void showInfo() {
    super.showInfo();
    print("Type: Food");
    print("Expire Date: $expireDate");
  }
}

void main() {
  Product p1 = Product(
    id: "P001",
    name: "Notebook",
    price: 50,
  );

  DigitalProduct p2 = DigitalProduct(
    id: "D001",
    name: "E-Book Flutter",
    price: 199,
    fileSizeMB: 120.5,
  );

  FoodProduct p3 = FoodProduct(
    id: "F001",
    name: "Milk",
    price: 25,
    stock: 10,
    expireDate: "2026-01-10",
  );

  p1.applyDiscount(10); 
  p1.restock(50);       

  p2.price = -100;      
  p3.restock(5);        


  List<Product> products = [p1, p2, p3];

  for (var product in products) {
    product.showInfo();
  }
}
