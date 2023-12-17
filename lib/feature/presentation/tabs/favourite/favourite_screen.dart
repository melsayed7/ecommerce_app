import 'package:ecommerce_app/core/my_images.dart';
import 'package:ecommerce_app/feature/presentation/tabs/favourite/widgets/favourite_item.dart';
import 'package:ecommerce_app/feature/presentation/tabs/home/widgets/search_section.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(MyImages.smallLogo),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchSection(),
          ),
        ),
      ),
      body: ListView(
        children: [
          FavouriteItem(),
          FavouriteItem(),
          FavouriteItem(),
          FavouriteItem(),
          FavouriteItem(),
          FavouriteItem(),
          FavouriteItem(),
          FavouriteItem(),
        ],
      ),
    );
  }
}
