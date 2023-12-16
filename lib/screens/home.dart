// ignore_for_file: unrelated_type_equality_checks, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/models/munch_model.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';
import 'package:munchmap_prototype/models/bookmark_model.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';


class HomePage extends StatefulWidget {
  final HiveService hiveService;
  const HomePage({Key? key, required this.hiveService});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> homeScaffold = GlobalKey<ScaffoldState>();
  List<MunchModel> diningOptions = [];

  void _getDiningOptions() {
    diningOptions = MunchModelList.getDiningOptions();
  }

  @override
  Widget build(BuildContext context) {
    _getDiningOptions();
    return Scaffold(
      drawer: menuOptions(context, widget.hiveService), 
      key: homeScaffold,
      body: Stack(
        children: [
          mapDisplay(),
          topBar(homeScaffold, context, widget.hiveService),
          foodDiscovery(),
        ],
      ),
    );
  }

  //rest of the code, methods below
  Column foodDiscovery() {
    return Column(
          children: [
            const Spacer(),

            Container(
              height: 355,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, 
                    blurRadius: 10.0, 
                    offset: Offset(0, 1), 
                  ),
                ],
              ),
              
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text('Munchables Nearby',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFFF2215),
                      )),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 135,
                      width: 400,
                      child: nearbyMunch(),
                      ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Text('Hidden Gems',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFFFF2215),
                        )
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 135,
                      width: 400,
                      child: hiddenGems(),
                      )
                  ],
                ),
              ),

            ),

            advertisement(),


          ],
        );
  }

  Container mapDisplay() {
    return Container(
          height: 450,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/map_placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
  }

  void _handleBookmarkChanged(bool isBookmarked, MunchModel munchModel) {
    if (isBookmarked) {
      // If bookmarked, add the current item to the bookmarkBox
      widget.hiveService.bookmarkBox.add(BookmarkModel(
        bgPath: munchModel.bgPath,
        name: munchModel.name,
        address: munchModel.address,
        shopHours: munchModel.shopHours,
        note: ' ',  // You can set a default value for the note, or leave it empty
      ));
    } else {
      // If unbookmarked, you can remove the item from the bookmarkBox if needed
      widget.hiveService.bookmarkBox.delete(munchModel.name); // Assuming 'name' is a unique identifier for your items
    }
  }


Widget nearbyMunch() {
  return Container(
    color: Colors.white,
    child: ListView.separated(
      itemCount: diningOptions.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 10, right: 10),
      separatorBuilder: (context, index) => const SizedBox(width: 25),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => RightDrawer(
                hiveService: widget.hiveService,
                bgPath: diningOptions[index].bgPath,
                name: diningOptions[index].name,
                avgRating: diningOptions[index].avgRating,
                address: diningOptions[index].address,
                status: diningOptions[index].status,
                shopHours: diningOptions[index].shopHours,
                priceRange: diningOptions[index].priceRange,
                gallery1: diningOptions[index].gallery1,
                gallery2: diningOptions[index].gallery2,
                gallery3: diningOptions[index].gallery3,
                tag1: diningOptions[index].tag1,
                tag2: diningOptions[index].tag2,
                tag3: diningOptions[index].tag3,
                isBookmarked: widget.hiveService.isBookmarked(diningOptions[index].name),
                onBookmarkChanged: (isBookmarked) {
                  _handleBookmarkChanged(isBookmarked, diningOptions[index]);
                },
              ),
            );
          },
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(20),
            child: cardContents(index),
          ),
        );
      },
    ),
  );
}

Column cardContents(int index) {
  return Column(
    children: [
      Container(
        height: 100,
        width: 130,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(diningOptions[index].bgPath),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
      ),
      const SizedBox(height: 2),
      Expanded(
        child: Container(
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            diningOptions[index].name,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFF2215),
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ),
    ],
  );
}

  
Widget hiddenGems() {

  return Container(
    color: Colors.white,
    child: ListView.separated(
      itemCount: diningOptions.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 10, right: 10),
      separatorBuilder: (context, index) => const SizedBox(width: 25),
      itemBuilder: (context, index) {

        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => RightDrawer(
                hiveService: widget.hiveService,
                bgPath: diningOptions[index].bgPath,
                name: diningOptions[index].name,
                avgRating: diningOptions[index].avgRating,
                address: diningOptions[index].address,
                status: diningOptions[index].status,
                shopHours: diningOptions[index].shopHours,
                priceRange: diningOptions[index].priceRange,
                gallery1: diningOptions[index].gallery1,
                gallery2: diningOptions[index].gallery2,
                gallery3: diningOptions[index].gallery3,
                tag1: diningOptions[index].tag1,
                tag2: diningOptions[index].tag2,
                tag3: diningOptions[index].tag3,
                isBookmarked: widget.hiveService.isBookmarked(diningOptions[index].name),
                onBookmarkChanged: (isBookmarked) {
                  _handleBookmarkChanged(isBookmarked, diningOptions[index]);
                },
              ),
            );
          },

          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(20),
            child: cardContents(index),
          ),
        );
      },
    ),
  );
}

}

class RightDrawer extends StatefulWidget {
  final HiveService hiveService;
  final String bgPath;
  final String name;
  final double avgRating;
  final String address;
  final Status status;
  final String shopHours;
  final PriceRange priceRange;
  final String gallery1;
  final String gallery2;
  final String gallery3;
  final String tag1;
  final String tag2;
  final String tag3;
  final bool isBookmarked;
  final ValueChanged<bool> onBookmarkChanged;

  const RightDrawer({super.key,
    required this.hiveService, 
    required this.bgPath,
    required this.name,
    required this.avgRating,
    required this.address,
    required this.status,
    required this.shopHours,
    required this.priceRange,
    required this.gallery1,
    required this.gallery2,
    required this.gallery3,
    required this.tag1,
    required this.tag2,
    required this.tag3,
    required this.isBookmarked,
    required this.onBookmarkChanged,
  });

  @override
  _RightDrawerState createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {
  bool isBookmarked = false;

  void printBookmarkBoxContents() {
    // Get all values in the bookmarkBox
    List<BookmarkModel> bookmarks = widget.hiveService.bookmarkBox.values.toList();

    // Print the contents
    for (int i = 0; i < bookmarks.length; i++) {
      BookmarkModel bookmark = bookmarks[i];
      print("Bookmark $i:");
      print("  Background Path: ${bookmark.bgPath}");
      print("  Name: ${bookmark.name}");
      print("  Address: ${bookmark.address}");
      print("  Shop Hours: ${bookmark.shopHours}");
      print("  Note: ${bookmark.note}");
      print(""); // Empty line for separation
    }
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  color: Colors.white,
                  width: 400,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.name,
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            widget.onBookmarkChanged(!widget.isBookmarked);
                            print(HiveService().bookmarkBox.values.toList());
                            printBookmarkBoxContents();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF2215),
                            padding: const EdgeInsets.all(0), // Adjust padding as needed
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.bookmark,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 10),
        
              Row(
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.bgPath),
                        fit: BoxFit.cover, 
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),

        
                  const SizedBox(width: 10),
        
                Container(
                  color: Colors.white,
                  height: 190,
                  width: 180,
                  child: Column(
                    children: [
                       SizedBox(
                        width: 170,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            makeTag(widget.tag1),
                            const SizedBox(width: 5),
                            makeTag(widget.tag2),
                            const SizedBox(width: 5),
                            makeTag(widget.tag3),
                          ],
                        )

                      ),

                      const SizedBox(width: 10),

                      SizedBox(
                        width: 170,
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/clock_icon.png'), 
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.status == 'open' ? 'Open' : 'Closed',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: widget.status == 'open' ? Colors.green : const Color(0xFFFF2215),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(widget.shopHours,
                                style: GoogleFonts.montserrat(
                                  fontSize: 13
                                ),),
                              ],
                            )
                          ],
                        ),

                      ),

                      const SizedBox(height: 15),
                      SizedBox(
                        width: 170,
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/wallet_icon.png'), 
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Budget range',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(widget.priceRange.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: 13
                                ),),
                              ],
                            )
                          ],
                        ),

                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: 170,
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/gallery_icon.png'), 
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Gallery',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),

                      ),                    
                    ],
                  ),
                ),
                ],
              ),

              Row(
                children: [   
                  Container(
                    color: Colors.white,
                    height: 160,
                    width: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildGalleryImage(widget.gallery1),
                        const SizedBox(width: 8), 
                        buildGalleryImage(widget.gallery2),
                        const SizedBox(width: 8),
                        buildGalleryImage(widget.gallery3),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    color: Colors.white,
                    height: 140,
                    width: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/review_icon.png',
                              width: 30, 
                              height: 30, 
                            ),
                            const SizedBox(width: 8),
                            Text('Reviews',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            const SizedBox(width: 15),
                            Image.asset(
                              'assets/icons/right_icon.png',
                              width: 20, 
                              height: 20, 
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.hiveService.clearBookmarkBox();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF2215),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Let's Go",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
       
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildGalleryImage(String imagePath) {
  return Container(
    width: 170, 
    height: 150, 
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath), 
        fit: BoxFit.cover, 
      ),
      borderRadius: BorderRadius.circular(40)
    ),
  );
}

Widget makeTag(String tag) {
  return Container(
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      tag,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    ),
  );
}


