import 'package:flutter/widgets.dart';

import 'package:challenge/screens/products/products_screen.dart';
import 'package:challenge/screens/details/details_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
};
