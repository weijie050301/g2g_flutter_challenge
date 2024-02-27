import 'package:challenge/utils/api_service.dart';
import 'package:challenge/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:challenge/components/product_card.dart';
import 'package:challenge/models/Product.dart';

import '../details/details_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static String routeName = "/products";

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late GameModel? gameModel;
  
  @override
  void initState() {
    super.initState();
    _getData();
  }
  
  void _getData() async {
    await ApiService().readJson().then((value) => {
      setState(() {
        gameModel = value;
      })
    });
  }
  
  void fetchApiData(url) async {
    await ApiService().fetchAlbum(url).then((value) => {
      setState(() {
        gameModel = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          if (gameModel?.previous != null)
            GestureDetector(
              onTap: () => fetchApiData(gameModel?.previous ?? ''),
              child: Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(color: Colors.grey),
                child: const Text('Previous'),
              ),
            ),
          GestureDetector(
            onTap: () => fetchApiData(gameModel?.next ?? ''),
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(color: Colors.grey),
              child: const Text('Next'),
            ),
          )
        ]
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Flexible(
                child: GridView.builder(
                  itemCount: gameModel?.products.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => ProductCard(
                    product: gameModel!.products[index],
                    onPress: () => Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments:
                          ProductDetailsArguments(product: gameModel!.products[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
