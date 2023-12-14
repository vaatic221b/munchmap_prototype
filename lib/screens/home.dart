import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> homeScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menuOptions(context),
      key: homeScaffold,
      endDrawer: rightDrawer(),
      body: Stack(
        children: [

          mapDisplay(),
          topBar(homeScaffold, context),
          foodDiscovery(),
        ],
      ),
    );
  }

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


//METHODS

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
  
  Widget nearbyMunch() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, right: 10),
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              homeScaffold.currentState?.openEndDrawer();
            },
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(20),
              child: cardContents(),
            ),
          );
        },
      ),
    );
  }

  Column cardContents() {
    return Column(
                children: [
                  Container(
                    height: 100,
                    width: 130,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sampleDine2.png'), 
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                  ),

                  const SizedBox(height: 2),

                  Expanded(
                    child: Container(
                      width: 130,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Name of Dining Option',
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
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10, right: 10),
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              homeScaffold.currentState?.openEndDrawer();
            },
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(20),
              child: cardContents(),
            ),
          );
        },
      ),
    );
    
  }
  
  Drawer rightDrawer() {
    return Drawer(
      child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sampleDetails.png'), 
                        fit: BoxFit.cover,
                      ),
                    ),        
      )
    );
  }
}
