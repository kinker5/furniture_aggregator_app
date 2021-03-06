import 'package:furniture_aggregator_app/domain/entity/geolocation.dart';
import 'package:furniture_aggregator_app/domain/entity/product.dart';

class Shop {
  final String id;
  final String title;
  final Geolocation geolocation;
  final List<Product> products;

  Shop({
    required this.id,
    required this.title,
    required this.geolocation,
    required this.products,
  });
}
