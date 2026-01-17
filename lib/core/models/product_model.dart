import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/user/home/data/models/category_model.dart';

class ProductModel {
  final String id;
  final String name;
  final double rating;
  final double price;
  final int review;
  final String image;
  final bool isCheck;
  final CategoryModel category;
  final List<Color> colors;
  final List<String> sizes = ["S", "M", "L", "XL"];

  ProductModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.review,
    required this.image,
    required this.isCheck,
    required this.category,
    required this.colors,
  });
}

List<ProductModel> products = [
  // Example products: Women
  ProductModel(
    id: "1",
    name: "Lorem Ipsum Chair Sit Amet Consectetur",
    rating: 4.5,
    price: 120.0,
    review: 150,
    image:
        "https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: true,
    category: categories[1],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  ProductModel(
    id: "2",
    name: "Modern Lamp",
    rating: 4.0,
    price: 80.0,
    review: 85,
    image:
        "https://images.unsplash.com/photo-1483181957632-8bda974cbc91?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: false,
    category: categories[0],
    colors: [Colors.yellow, Colors.white],
  ),
  ProductModel(
    id: "3",
    name: "Stylish Chair",
    rating: 4.5,
    price: 120.0,
    review: 150,
    image:
        "https://images.unsplash.com/photo-1724881362288-6ca0c8e0abcb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: true,
    category: categories[1],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  ProductModel(
    id: "4",
    name: "Modern Lamp",
    rating: 4.0,
    price: 80.0,
    review: 85,
    image:
        "https://images.unsplash.com/photo-1524163555301-3f21d0ca96f2?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: false,
    category: categories[0],
    colors: [Colors.yellow, Colors.white],
  ),
  ProductModel(
    id: "5",
    name: "Modern Lamp",
    rating: 4.0,
    price: 80.0,
    review: 85,
    image:
        "https://images.unsplash.com/photo-1602278966726-761095dc59bf?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: false,
    category: categories[0],
    colors: [Colors.yellow, Colors.white],
  ),
  // Example products: Men
  ProductModel(
    id: "21",
    name: "Stylish Chair",
    rating: 4.5,
    price: 120.0,
    review: 150,
    image:
        "https://images.unsplash.com/photo-1622519407650-3df9883f76a5?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: true,
    category: categories[1],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  ProductModel(
    id: "22",
    name: "Modern Lamp",
    rating: 4.0,
    price: 80.0,
    review: 85,
    image:
        "https://images.unsplash.com/photo-1617113930975-f9c7243ae527?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: false,
    category: categories[0],
    colors: [Colors.yellow, Colors.white],
  ),
  ProductModel(
    id: "23",
    name: "Stylish Chair",
    rating: 4.5,
    price: 120.0,
    review: 150,
    image:
        "https://images.unsplash.com/photo-1535530705774-695729778c55?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: true,
    category: categories[1],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  ProductModel(
    id: "24",
    name: "Modern Lamp",
    rating: 4.0,
    price: 80.0,
    review: 85,
    image:
        "https://images.unsplash.com/photo-1626743702655-543c7789cd4d?q=80&w=686&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: false,
    category: categories[0],
    colors: [Colors.yellow, Colors.white],
  ),
  ProductModel(
    id: "25",
    name: "Modern Lamp",
    rating: 4.0,
    price: 80.0,
    review: 85,
    image:
        "https://plus.unsplash.com/premium_photo-1658506787944-7939ed84aaf8?q=80&w=669&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    isCheck: false,
    category: categories[0],
    colors: [Colors.yellow, Colors.white],
  ),
  // Add more products as needed
];
