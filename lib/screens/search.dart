// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/models/munch_model.dart';
import 'package:munchmap_prototype/screens/recomunch.dart';
import 'package:munchmap_prototype/utility/ad_utility.dart';
import 'package:munchmap_prototype/utility/drawer_utility.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';


class SearchPage extends StatefulWidget {
  final HiveService hiveService;
  const SearchPage({super.key, required this.hiveService});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> searchScaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<_ResultsWidgetState> resultsWidgetKey = GlobalKey<_ResultsWidgetState>();

  // Function to reload ResultsWidget
  void reloadResultsWidget() {
    resultsWidgetKey.currentState?.reloadResults();
  }
  String selectedOption = 'Rating';
  bool showFilterTags = false;
  double _proximityValue = 5;

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    drawer: menuOptions(context, widget.hiveService),
    key: searchScaffold,
    body: Stack(
      children: [
        topBar(searchScaffold, context, widget.hiveService),
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
                      children: [
                        searchBar(),
                        sortBy(),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Visibility(
                          visible: showFilterTags,
                          child: Container(
                            height: 465,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 248, 248, 248),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: searchFilters(context),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: ResultsWidget(key: resultsWidgetKey),
                        ),
                      ],
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


//METHODS

  Column searchFilters(BuildContext context) {
    return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ 
                                const SizedBox(height: 5),
                                Text('Search',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22,
                                  color: const Color(0xFFFF2215)
                                  )
                                ),
                                const SizedBox(height: 10),
                                buildHeaderText('by cuisine:'),
                                const SizedBox(height: 5),
                                const Row(
                                  children: [
                                    FilterTag(tag: 'Japanese'),
                                    FilterTag(tag: 'Filipino'),
                                    FilterTag(tag: 'Fast Food'),
                                    ],
                                ),  
                                const SizedBox(height: 10),
                                buildHeaderText('by rating:'),
                                const SizedBox(height: 5),
                                const Row(
                                  children: [
                                    FilterTag(tag: '5 stars'),
                                    FilterTag(tag: '4 stars'),
                                    FilterTag(tag: '3 stars'),
                                    FilterTag(tag: '2 stars'),
                                    ],
                                ),  
                                const SizedBox(height: 10),
                                buildHeaderText('by budget range:'),
                                const SizedBox(height: 5),
                                const Row(
                                  children: [
                                    FilterTag(tag: '₱₱₱'),
                                    FilterTag(tag: '₱₱'),
                                    FilterTag(tag: '₱'),
                                    ],
                                ),  
                                const SizedBox(height: 10),
                                buildHeaderText('by proximity:'),
                                const SizedBox(height: 5),
                                Slider(
                                  value: _proximityValue,
                                  activeColor: const Color(0xFFFF2215), 
                                  inactiveColor: Colors.grey, //
                                  min: 5,
                                  max: 15,
                                  divisions: 2, 
                                  label: 'Within ${_proximityValue.toInt()} meters',
                                  onChanged: (value) {
                                    setState(() {
                                      _proximityValue = value;
                                    });
                                  },
                                ),
                                const Spacer(),
                                Center(child: filterButton(context)),
                                const SizedBox(height: 10),
                              ]
                            );
  }

  TextField searchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        hintText: 'Search...',
        hintStyle: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          color: const Color(0xFF808080),
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Image.asset(
            'assets/icons/down_icon.png',
            width: 20,
            height: 20,
          ),
          onPressed: () {
            setState(() {
              showFilterTags = !showFilterTags;
            });
          },
        ),
      ),
    );
  }
  
Padding sortBy() {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 5),
    child: Row(
      children: [
        Text(
          'Sort by:',
          style: TextStyle(
            fontFamily: GoogleFonts.inter().fontFamily,
            color: const Color(0xFF808080),
            fontSize: 13,
          ),
        ),
        const Spacer(),
        _buildSortingButton('Rating'),
        const Spacer(),
        _buildSortingButton('Proximity'),
        const Spacer(),
        _buildSortingButton('Price'),
        const SizedBox(width: 50),
      ],
    ),
  );
}

Widget _buildSortingButton(String option) {
  bool isSelected = selectedOption == option;

  return ElevatedButton(
    onPressed: () {
      if (!isSelected) {
        selectedOption = option;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {}); 
          }
        });
      }
    },
    style: ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0), 
      backgroundColor: isSelected
          ? MaterialStateProperty.all<Color>(Colors.black)
          : MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent), 
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent), 
    ),
    child: Text(
      option,
      style: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: isSelected ? Colors.white : const Color(0xFF808080),
      ),
    ),
  );
}

  ElevatedButton filterButton(BuildContext context) {
    return ElevatedButton(
              onPressed: () {
                reloadResultsWidget();
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
                'Filter',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                )
                ), 
            );
  }


}

Widget buildHeaderText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontWeight: FontWeight.w800,
      fontSize: 18,
      color: const Color(0xFFFF2215),
    ),
  );
}


class FilterTag extends StatefulWidget {
  final String tag;

  const FilterTag({Key? key, required this.tag}) : super(key: key);

  @override
  _FilterTagState createState() => _FilterTagState();
}

class _FilterTagState extends State<FilterTag> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.tag,
          style: const TextStyle(color: Colors.white),
        ),
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

class ResultsWidget extends StatefulWidget {
  const ResultsWidget({Key? key}) : super(key: key);

  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  bool isReload = false;

@override
Widget build(BuildContext context) {
  List<MunchModel> diningOptions = MunchModelList.getDiningOptions();
      if (isReload) {
      diningOptions.shuffle();
    }
  return ListView.separated(
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
                  );
}


  void reloadResults() {
    setState(() {
      isReload = !isReload;
    });
  }
}
