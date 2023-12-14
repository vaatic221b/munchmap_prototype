import 'package:flutter/material.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({super.key});

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {
  final GlobalKey<ScaffoldState> wheelScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuOptions(context),
      key: wheelScaffold,

      body: Stack(
        children: [
            Container(
              height: 450,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/wheel.png',
                  // Adjust width and height according to your needs
                  width: 250,
                  height: 250,
                  // You can also use BoxFit.contain, BoxFit.cover, or other options
                  fit: BoxFit.contain,
                ),
              ),
            ),

          topBar(wheelScaffold, context),

          Column(
            children: [
              const Spacer(),

          Container(
            height: 330,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1.0,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/images/add.png',
                fit: BoxFit.contain,
              ),
            ),
          ),


              advertisement(),


            ],
          ),
        ],
      ),
    );
  }

}