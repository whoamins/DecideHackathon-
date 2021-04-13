class Product{
  int id;
  String title; // Название товара
  DateTime expirationDate; // Срок годности
  int quantity;// Количество
  int isExpired; // Просроченный чи не

  Product({this.title, this.expirationDate, this.quantity, this.isExpired});
  Product.withId({this.id, this.title, this.expirationDate, this.quantity, this.isExpired});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if(id != null) {
      map['id'] = id;
    }

    map['id'] = id;
    map['title'] = title;
    map['expirationDate'] = expirationDate.toIso8601String();
    map['quantity'] = quantity;
    map['isExpired'] = isExpired;
    return map;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product.withId(
      id: map['id'],
      title: map['title'],
      expirationDate: DateTime.parse(map['date']),
      quantity: map['quantity'],
      isExpired: map['isExpired'],
    );
  }
}