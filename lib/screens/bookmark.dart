import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';

class BookmarkPage extends StatefulWidget {
  final HiveService hiveService;
  const BookmarkPage({Key? key, required this.hiveService});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final GlobalKey<ScaffoldState> bookmarkScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: menuOptions(context, widget.hiveService),
      key: bookmarkScaffold,
      body: Stack(
        children: [
          topBar(bookmarkScaffold, context, widget.hiveService),
        Padding(
          padding: const EdgeInsets.only(top: 82),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Text('Bookmarks', 
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFFFF2215)
                )),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 580,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
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
  
  ElevatedButton businessButton(BuildContext context) {
    return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BookmarkPage(hiveService: widget.hiveService); 
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