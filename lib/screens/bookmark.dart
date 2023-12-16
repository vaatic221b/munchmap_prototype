import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/models/bookmark_model.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';

class BookmarkPage extends StatefulWidget {
  final HiveService hiveService;
  const BookmarkPage({super.key, required this.hiveService});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final GlobalKey<ScaffoldState> bookmarkScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<BookmarkModel> bookmarks = widget.hiveService.bookmarkBox.values.toList();
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
                  child: SizedBox(
                    height: 580,
                    child: ListView.separated(
                      itemCount: bookmarks.length, 
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      separatorBuilder: (context, index) => const SizedBox(height: 25),
                      itemBuilder: (context, index) {
                        BookmarkModel bookmark = bookmarks[index]; 

                        return Center(
                          child: SizedBox(
                            height: 130,
                            width: 350,
                            child: Row(
                              children: [
                                Material(
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 130,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(bookmark.bgPath),
                                        fit: BoxFit.cover,                              
                                      ),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 130,
                                  width: 175,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        bookmark.name,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFFF2215),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Color(0xFFFF2215), 
                                          ),
                                          const SizedBox(width: 2), 
                                          Text(
                                            bookmark.address,
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 2),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.access_time,
                                            color: Colors.blue, 
                                          ),
                                          const SizedBox(width: 2), 
                                          Text(
                                            bookmark.shopHours,
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 2),
                                      
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.notifications,
                                            color: Colors.orange, 
                                          ),
                                          const SizedBox(width: 2), 
                                          Text(
                                            bookmark.note,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 13,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 110,
                                  width: 50,
                                  color: Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          TextEditingController noteController = TextEditingController(text: bookmark.note);
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Edit Note'),
                                                content: TextField(
                                                  controller: noteController,
                                                  decoration: const InputDecoration(
                                                    hintText: 'Enter new note',
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      // save note to bookmark
                                                      widget.hiveService.bookmarkBox.putAt(index, bookmark.copyWith(note: noteController.text));
                                                      Navigator.pop(context); 
                                                      setState(() {});
                                                    },
                                                    child: const Text('Save'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context); 
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: const Icon(Icons.edit, color: Colors.white),
                                      ),

                                      const Divider(
                                        height: 5,
                                        thickness: 5,
                                        color: Colors.white,
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          widget.hiveService.bookmarkBox.deleteAt(index);
                                          setState(() {
                                            bookmarks.removeAt(index);
                                          });
                                        },
                                        icon: const Icon(Icons.delete, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                const AdvertisementWidget(),

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

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return advertisement();
  }
}