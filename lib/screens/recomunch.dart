// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/models/munch_model.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';


class RecoPage extends StatefulWidget {
  final HiveService hiveService;
  const RecoPage({super.key, required this.hiveService});

  @override
  State<RecoPage> createState() => _RecoPageState();
}

class _RecoPageState extends State<RecoPage> {
  final GlobalKey<ScaffoldState> recoScaffold = GlobalKey<ScaffoldState>();

@override
Widget build(BuildContext context) {
  List<MunchModel> diningOptions = MunchModelList.getDiningOptions();

  return Scaffold(
    backgroundColor: Colors.white,
    drawer: menuOptions(context, widget.hiveService),
    key: recoScaffold,
    body: Stack(
      children: [
        topBar(recoScaffold, context, widget.hiveService),
        Padding(
          padding: const EdgeInsets.only(top: 82),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 650,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: ListView.separated(
                      itemCount: diningOptions.length, // Replace with the actual length of your list
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      separatorBuilder: (context, index) => const SizedBox(height: 25),
                      itemBuilder: (context, index) {
                        MunchModel munchModel = diningOptions[index]; // Replace munchModelList with your actual list

                        return Row(
                          children: [
                            Material(
                              elevation: 1,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(munchModel.bgPath),
                                    fit: BoxFit.cover,                              
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              height: 100,
                              width: 170,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    munchModel.name,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFF2215),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  buildRatingStars(munchModel.avgRating),
                                  buildPesoIcons(munchModel.priceRange.max),
                                  Text(munchModel.address),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                advertisement(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


}

Widget buildPesoIcons(double maxPrice) {
  const String pesoIconPath = 'assets/icons/peso_icon.png';
  const double iconSize = 15.0; // Adjust the size as needed

  List<Widget> icons = [];

  if (maxPrice <= 700) {
    icons.add(SizedBox(
      height: iconSize,
      width: iconSize,
      child: Image.asset(pesoIconPath),
    ));
  } else if (maxPrice <= 1200) {
    icons.addAll([
      SizedBox(
        height: iconSize,
        width: iconSize,
        child: Image.asset(pesoIconPath),
      ),
      SizedBox(
        height: iconSize,
        width: iconSize,
        child: Image.asset(pesoIconPath),
      ),
    ]);
  } else {
    icons.addAll([
      SizedBox(
        height: iconSize,
        width: iconSize,
        child: Image.asset(pesoIconPath),
      ),
      SizedBox(
        height: iconSize,
        width: iconSize,
        child: Image.asset(pesoIconPath),
      ),
      SizedBox(
        height: iconSize,
        width: iconSize,
        child: Image.asset(pesoIconPath),
      ),
    ]);
  }

  return Row(children: icons);
}


Row buildRatingStars(double avgRating) {
  int numberOfStars = avgRating.round(); // Assuming your rating is out of 5
  List<Widget> stars = List.generate(
    numberOfStars,
    (index) => const Icon(
      Icons.star,
      color: Color(0xFFFF2215),
      size: 16,
    ),
  );

  return Row(children: stars);
}
