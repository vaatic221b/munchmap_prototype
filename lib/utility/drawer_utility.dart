// drawer_utils.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/screens/home.dart';
import 'package:munchmap_prototype/screens/munchpicker.dart';
import 'package:munchmap_prototype/screens/profile.dart';
import 'package:munchmap_prototype/screens/recomunch.dart';
import 'package:munchmap_prototype/screens/search.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart'; 

Drawer menuOptions(BuildContext context, HiveService hiveService) {
    return Drawer(
      width: 60, 
      backgroundColor: const Color(0xFFFF2215),
      shadowColor: const Color(0xFFFF2215),
      child: ListView(
        children: [
          const Divider(
            height: 20, 
          ),
          
          ListTile(
            leading: Image.asset(
                'assets/icons/home_icon.png',
                height: 24, 
                width: 24,  
              ),
            onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage(hiveService: hiveService); 
                            },
                          ),
                        );
            }
          ),
          
          const Divider(
            height: 10, 
          ),

          ListTile(
            leading: Image.asset(
                'assets/icons/search_icon.png',
                height: 20, 
                width: 20,  
              ),
            onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SearchPage(hiveService: hiveService);
                            },
                          ),
                        );
            }
          ),

          const Divider(
            height: 150, 
          ), 

          ListTile(
            title: Center(
              child: RotatedBox(
                quarterTurns: 3, 
                child: Text(
                  "munch picker",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  )
                )
              )
            ),
            onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WheelPage(hiveService: hiveService); //pass hiveService here too?
                            },
                          ),
                        );
            },
          ),

          const Divider(
            height: 40, 
          ),

          ListTile(
            title: Center(
              child: RotatedBox(
                quarterTurns: 3, 
                child: Text(
                  "recoMunch",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  )
                )
              )
            ),
            onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RecoPage(hiveService: hiveService); //pass hiveService here too?
                            },
                          ),
                        );
            }
          )
        ]
      )
    );
}

  Positioned topBar(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context, HiveService hiveService) {
    return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

          title: Card(
            elevation: 5, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/munchmapLTred.png',
                height: 40,
              ),
            ),
          ),

            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF2215),
                  shape: BoxShape.rectangle,
                ),
                child: const Icon(Icons.menu, color: Colors.white),
              ),
            ),

            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage(hiveService: hiveService)), //pass hiveService here too?
                  );
                },
                
                icon: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF2215),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/profile_icon.png',
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
        );
  }
