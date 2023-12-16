import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/screens/login.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  final HiveService hiveService;
  const WelcomePage({super.key, required this.hiveService});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
    
              Image.asset(
                'assets/images/munchmapLTred.png',
                width: 185,
              ), 
    
              const SizedBox(height: 50),
    
              SizedBox(
                width: 250,
                height: 300,
    
                child: PageView(
                  controller: _controller,
                  children: [
                    feature1(),
                    feature2(),
                    feature3(),
                    feature4(),
                  ]
                ),
              ),
    
              const SizedBox(height: 30),
              
              SmoothPageIndicator(
                controller: _controller, 
                count: 4,
                effect: const JumpingDotEffect(
                  activeDotColor: Color(0xFFFF2215),
                  dotColor: Color(0xFFDCDCDC),
                  dotHeight: 10,
                  dotWidth: 10
                ),
              ),
    
              const SizedBox(height: 45), 
  
              loginButton(context),
    
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage(hiveService: widget.hiveService); 
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
                'Login',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                )
                ), 
            );
  }

  Column feature4() {
    return Column(
                  children: [
                    SizedBox(
                      width: 195,
                      height: 195,
                      child: Image.asset(
                        'assets/images/welcome4.png',
                        fit: BoxFit.cover, 
                      ),
                    ),

                    const Spacer(),
                    
                    Text(
                      'RecoMunch',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                      ),
                    ),
                    
                    const SizedBox(height: 5),

                    Text(
                      'Constantly get recommendations based on your preferences',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                );
  }

  Column feature3() {
    return Column(
                  children: [
                    SizedBox(
                      width: 195,
                      height: 195,
                      child: Image.asset(
                        'assets/images/welcome3.png',
                        fit: BoxFit.cover, 
                      ),
                    ),

                    const Spacer(),
                    
                    Text(
                      'Business Registration',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                      ),
                    ),
                    
                    const SizedBox(height: 5),

                    Text(
                      'Promote your own shops and gain exposure',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                );
  }



  Column feature2() {
    return Column(
                  children: [
                    SizedBox(
                      width: 195,
                      height: 195,
                      child: Image.asset(
                        'assets/images/welcome2.png',
                        fit: BoxFit.cover, 
                      ),
                    ),

                    const Spacer(),
                    
                    Text(
                      'Munch Picker',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                      ),
                    ),
                    
                    const SizedBox(height: 5),

                    Text(
                      'Banish indecision with our assistive wheel of dining',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                );
  }

  Column feature1() {
    return Column(
                  children: [
                    SizedBox(
                      width: 195,
                      height: 195,
                      child: Image.asset(
                        'assets/images/welcome1.png',
                        fit: BoxFit.cover, 
                      ),
                    ),

                    const Spacer(),
                    
                    Text(
                      'Hidden Gems',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 18
                      ),
                    ),
                    
                    const SizedBox(height: 5),

                    Text(
                      'Discover new shops in your vicinity with our Hidden Gems feature',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 14
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                );
  }
}
