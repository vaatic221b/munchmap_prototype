import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:munchmap_prototype/models/munch_model.dart';
import 'package:munchmap_prototype/screens/welcome.dart';

void main() async {

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MunchMap Prototype',
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
    );
  }
}

//hello test new commit
Future<void> openHiveBoxAndAddData() async {
  // Open the Hive box
  final box = await Hive.openBox<MunchModel>('my_box');

  // Add pre-existing data
  box.addAll([
    MunchModel(
      owner: 'BronzeSail',
      bgPath: 'assets/images/munch/sailshouse/bgPath.png',
      name: 'Bronze Sails House',
      avgRating: 4.5,
      address: '123 Main St',
      status: Status.open,
      shopHours: 'Closes 9PM | Reopens 4PM',
      priceRange: PriceRange(500, 3000),
      gallery1: 'assets/images/munch/sailshouse/gallery1.png',
      gallery2: 'assets/images/munch/sailshouse/gallery2.png',
      gallery3: 'assets/images/munch/sailshouse/gallery3.png',
      tag1: 'Spaghetti',
      tag2: 'Steak',
      tag3: 'Wine',
    ),

    MunchModel(
      owner: 'Deviljho',
      bgPath: 'assets/images/munch/hangry/bgPath.png',
      name: 'Hangry burger',
      avgRating: 4.2,
      address: '456 Oak St',
      status: Status.closed,
      shopHours: 'Closes 8PM | Reopens 6AM',
      priceRange: PriceRange(800, 2500),
      gallery1: 'assets/images/munch/nogallery.png',
      gallery2: 'assets/images/munch/nogallery.png',
      gallery3: 'assets/images/munch/nogallery.png',
      tag1: 'Western',
      tag2: 'Burgers',
      tag3: 'Pizza',
    ),

      MunchModel(
      owner: 'Somebody',
      bgPath: 'assets/images/munch/infinite/bgPath.png',
      name: 'Infinite Hawk Kitchen',
      avgRating: 4.4,
      address: 'Maple Street',
      status: Status.closed,
      shopHours: 'Closes 8PM | Reopens 6AM',
      priceRange: PriceRange(800, 2500),
      gallery1: 'assets/images/munch/nogallery.png',
      gallery2: 'assets/images/munch/nogallery.png',
      gallery3: 'assets/images/munch/nogallery.png',
      tag1: 'Western',
      tag2: 'Burgers',
      tag3: 'Pizza',
    ),

      MunchModel(
      owner: 'Ado',
      bgPath: 'assets/images/munch/dahlia/bgPath.png',
      name: 'Dahlia Restaurant',
      avgRating: 5.0,
      address: 'Rose Street',
      status: Status.open,
      shopHours: 'Closes 8PM | Reopens 6AM',
      priceRange: PriceRange(800, 2500),
      gallery1: 'assets/images/munch/nogallery.png',
      gallery2: 'assets/images/munch/nogallery.png',
      gallery3: 'assets/images/munch/nogallery.png',
      tag1: 'Tea',
      tag2: 'Coffee',
      tag3: 'Cake',
    ),

  ]);
}