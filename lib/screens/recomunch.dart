// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';


class RecoPage extends StatefulWidget {
  const RecoPage({super.key});

  @override
  State<RecoPage> createState() => _RecoPageState();
}

class _RecoPageState extends State<RecoPage> {
  final GlobalKey<ScaffoldState> recoScaffold = GlobalKey<ScaffoldState>();

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    drawer: menuOptions(context),
    key: recoScaffold,
    body: Stack(
      children: [
        topBar(recoScaffold, context),
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
                      itemCount: 4,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      separatorBuilder: (context, index) => const SizedBox(height: 25),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                      height: 130,
                                      width: 130,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/nogallery.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                height: 100, 
                                width: 170, 
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text(
                                              'Name of Dining Option',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFFFF2215),
                                              ), 
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2, 
                                            ),
                                    const Text('Details'),
                                    const Text('Details'),
                                    const Text('Details'),
                                  ],
                                ),
                              )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                advertisement()
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

}
