import 'package:codelandia_team_work_ecommerce/service/api/products_api.dart';
import 'package:codelandia_team_work_ecommerce/widgets/category_card.dart';
import 'package:codelandia_team_work_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../get_x/state/product_list_get_x.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/category_grid_card.dart';


class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  void _openNewPage(BuildContext context) {
    int index=0;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CategoryGridCard(index: index,), 
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    ProductList getController = Get.put(ProductList());

    TextEditingController searchController = TextEditingController();
    getController.getData();
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'discover'.tr,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.yourstory.com/cs/2/96eabe90392211eb93f18319e8c07a74/Imagejtb7-1684960500563.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTextField(getController, searchController),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        const BottomSheetWidget(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.filter_list,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'categories'.tr,
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                   IconButton(
  onPressed: () {
    _openNewPage(context);
  },
  icon: const Icon(Icons.arrow_forward),
),
                     
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 160,
                  child: CategoryCard(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  height: 80,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        color: Get.isDarkMode
                            ? Colors.grey[300]
                            : Colors.grey[500],
                        height: 5,
                        width: 35,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'all'.tr,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: Get.width,
              color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
              child: FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: Get.height * 0.4,
                            minWidth: Get.width,
                          ),
                          child: Center(
                            child: Lottie.asset(
                                'assets/lottie/lottie_loading.json'),
                          ),
                        )
                      : const ProductCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildTextField(
      ProductList getController, TextEditingController searchController) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
            borderRadius: BorderRadiusDirectional.circular(12),
          ),
          height: 50,
          width: double.infinity,
          child: TextField(
            onChanged: (value) {
              getController.searchedList(value);
            },
            controller: searchController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10, top: 15),
              border: InputBorder.none,
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: '  search products'.tr,
            ),
          ),
        ),
      ),
    );
  }
}
