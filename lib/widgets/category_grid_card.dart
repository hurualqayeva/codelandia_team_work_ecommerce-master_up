import 'package:codelandia_team_work_ecommerce/screens/category_details_page.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:codelandia_team_work_ecommerce/constants/category_constants.dart';
import 'package:get/get.dart';

class CategoryGridCard extends StatelessWidget {
  final int index;

 const CategoryGridCard({required this.index});

void openNewPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CategoryGridCard(index: index,), 
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: kCategoriesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
         
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetailsPage(
                      backgroundColor: kCategoryBackgroundColor,
                      index: index,
                      category: kCategoriesList[index],
                      imageUrl: kCategoryImages[kCategoriesList[index]]!,
                    ),
                  ),
                );
              },
          
          child: SizedBox(
            height: 200,
            width: 200,
            child: Card(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.all(5.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(kCategoryBackgroundColor[kCategoriesList[index]]!),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: FancyShimmerImage(
                      imageUrl: kCategoryImages[kCategoriesList[index]]!,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Color(kCategoryBackgroundColor[kCategoriesList[index]]!).withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Center(
                        child: Text(
                          kCategoriesList[index].tr.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
