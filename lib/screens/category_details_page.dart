import 'package:codelandia_team_work_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/category_constants.dart';
import '../get_x/state/product_list_get_x.dart';
import '../widgets/category_grid_card.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String category;
  final String imageUrl;
  final int index;
  final Map backgroundColor;
  ProductList getController = Get.put(ProductList());

  CategoryDetailsPage({
    super.key,
    required this.category,
    required this.imageUrl,
    required this.index,
    required this.backgroundColor,
  });

  void _onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _openNewPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CategoryGridCard(index: index,), 
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    Color bgColor = Color(backgroundColor[category]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => _onBackPressed(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            category.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
       
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: bgColor.withOpacity(0.7),
                  ),
                  child: Text(
                    categoryDescriptions[category]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: category,
                    child: Image.network(
                      imageUrl,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
  child: SingleChildScrollView(
    child: ProductCard(), 
  ),
),
        ],
      ),
      backgroundColor: Color(backgroundColor[category]),
    );
  }
}
