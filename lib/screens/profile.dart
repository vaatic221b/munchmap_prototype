import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/screens/bookmark.dart';
import 'package:munchmap_prototype/screens/settings.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';

class ProfilePage extends StatefulWidget {
  final HiveService hiveService;
  const ProfilePage({super.key, required this.hiveService});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> profileScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: menuOptions(context, widget.hiveService),
      key: profileScaffold,
      body: Stack(
        children: [
          topBar(profileScaffold, context, widget.hiveService),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bookmarks Icon
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BookmarkPage(hiveService: widget.hiveService)),
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/icons/bookmark_icon.png', height: 30),
                              const SizedBox(width: 8), 
                              Text('Bookmarks',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.montserrat().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Settings Icon
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingsPage(hiveService: widget.hiveService)),
                            );
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 3),
                              Image.asset('assets/icons/settings_icon.png', height: 32),
                              const SizedBox(width: 9), 
                              Text('Settings',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.montserrat().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),

                        const SizedBox(height: 5),
  
                        Text(
                          'Your Listings:',
                          style: TextStyle(
                            fontFamily: GoogleFonts.montserrat().fontFamily,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: const Color(0xFFFF2215)

                          ),
                        ),

                        Container(
                          color: Colors.white,
                          height: 350,
                          width: 400,
                          child: Container(
                            height: 100,                              
                            color: Colors.white,
                            child: const Center(child: Text("You don't have any listings yet...")),

                          ),
                        ),


                        const SizedBox(height: 10),

                        Center(child: businessButton(context)),

                        const SizedBox(height: 15),
                        
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                            child: Image.asset(
                              'assets/icons/support_icon.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),


                        const Spacer(),

                        
                      ],
                    )

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
  
  ElevatedButton businessButton(BuildContext context) {
    return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage(hiveService: widget.hiveService); 
                    },
                  ),
                );
              },
  
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(170, 45),
                backgroundColor: const Color(0xFFFF2215), 
                foregroundColor: Colors.white, 
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), 
                ),
              ),
  
              child: Text(
                'Register Business',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                )
                ), 
            );
  }

}