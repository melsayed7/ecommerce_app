import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/style/my_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';

  List<Widget> images = [
    Image.asset('assets/images/Property1.png'),
    Image.asset('assets/images/Property2.png'),
    Image.asset('assets/images/Property3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/small_logo.png'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: MyColor.textColor,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: MyColor.textColor,
                      ),
                      hintText: 'what do you search for?',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/shopping_cart.png'),
              ),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: .95,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
            ),
            items: images,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      color: MyColor.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'view all',
                  style: TextStyle(
                    color: MyColor.textColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          /*Expanded(
            child: FutureBuilder(
              future: ApiManager.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: MyColor.textColor,
                  ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        const Text('Some Thing Go Wrong'),
                        ElevatedButton(
                            onPressed: () {
                              ApiManager.getCategories();
                            },
                            child: const Text('Try Again'))
                      ],
                    ),
                  );
                }
                var categoryList = snapshot.data?.data ?? [];
                return GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 13 / 8,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCategoryWidget(
                      image: categoryList[index].image ?? '',
                      text: categoryList[index].name ?? '',
                    );
                  },
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
