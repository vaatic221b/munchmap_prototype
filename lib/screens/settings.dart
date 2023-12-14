import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<ScaffoldState> settingsScaffold = GlobalKey<ScaffoldState>();

@override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: menuOptions(context),
      key: settingsScaffold,
      body: Stack(
        children: [
          topBar(settingsScaffold, context),
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
                        Center(
                          child: SizedBox(
                            height: 150, // Adjust the overall size of the circular container
                            width: 150,
                            child: ClipOval(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15), // Adjust the padding to control the space
                                  child: Image.asset(
                                    'assets/icons/person_icon.png',
                                    fit: BoxFit.contain,
                                    height: 70, // Adjust the height of the image
                                    width: 70, // Adjust the width of the image
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Center(
                          child: Text('Username:',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF2215),
                          ),),
                        ),
                        Center(
                          child: Text('Phone Number:',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF2215),
                          ),),
                        ),
                        Center(
                          child: Text('Managed Listings: 0',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF2215),
                          ),),
                        ),
                                                

                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),

                        const SizedBox(height: 10),
                        // Bookmarks Icon
                        InkWell(
                          onTap: () {
                            // Redirect to BookmarksPage
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => BookmarksPage()),
                            // );
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/icons/settings.png', height: 32),
                              const SizedBox(width: 10), 
                              Text('Change Password',
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
                        // Settings Icon
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SettingsPage()),
                            );
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 3),
                              Image.asset('assets/icons/dine.png', height: 31),
                              const SizedBox(width: 10), 
                              Text('Select Dining Preferences',
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
                        // Settings Icon
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SettingsPage()),
                            );
                          },
                          child: Row(
                            children: [
                              const SizedBox(width: 3),
                              Image.asset('assets/icons/settings_icon.png', height: 40),
                              const SizedBox(width: 10), 
                              Text('Change Application Language',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.montserrat().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )
                              ),
                            ],
                          ),
                        ),
                        
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

}
