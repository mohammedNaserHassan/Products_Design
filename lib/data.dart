

import 'Product.dart';

class MockData{
  MockData._();
  static final MockData mockData = MockData._();
  List<Product> getProducts() {
    return <Product>[
      Product(product_name: ' Laptop',product_salary: 250,path: 'assets/images/L1.webp',isFavourite: false,index:0),
      Product(product_name: 'Strawberries',product_salary: 300,path: 'assets/images/L2.webp',isFavourite: false,index: 1),
      Product(product_name: 'Jeans',product_salary: 270,path: 'assets/images/L3.jpg',isFavourite: false,index: 2),
      Product(product_name: 'Ice cream',product_salary: 550,path: 'assets/images/L4.webp',isFavourite: false,index: 3),
      Product(product_name: 'Grape',product_salary: 169,path: 'assets/images/L5.webp',isFavourite: false,index: 4),
      Product(product_name: 'Egg',product_salary: 76,path: 'assets/images/L6.webp',isFavourite: false,index: 5),
      Product(product_name: 'Milk',product_salary: 22,path: 'assets/images/L7.webp',isFavourite: false,index: 6),
      Product(product_name: 'cherries',product_salary: 38,path: 'assets/images/L8.webp',isFavourite: false,index: 7),

    ];
  }
}