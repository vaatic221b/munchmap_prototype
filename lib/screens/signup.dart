import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/screens/login.dart';
import 'package:munchmap_prototype/utility/hive_utility.dart';

class SignUpPage extends StatefulWidget {
  final HiveService hiveService;
  const SignUpPage({super.key, required this.hiveService});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFF2215),
        body: Center(
          child: Stack(
            alignment: Alignment.center, 
            children: [
              munchmapTop(),
              mainBody(context),
            ],
          ),
        ),
      ),
    );
  }


//METHODS
  Positioned munchmapTop() {
    return Positioned(
              top: 80,
              child: Image.asset(
                'assets/images/munchmapLTwhite.png',
                width: 185,
              ),
            );
  }

  Positioned mainBody(BuildContext context) {
    return Positioned(
              top: 210,
              child: SizedBox(
                width: 290,
                height: 400,
                child: Column(

                  children: [
                    signupTitle(),

                    const SizedBox(height: 17),

                    nameField(),
                    
                    const SizedBox(height: 15),
                    
                    phoneField(),

                    const SizedBox(height: 15),

                    passwordField(),

                    const SizedBox(height: 15),

                    confirmPasswordField(),

                    const Spacer(),

                    signupButton(context),

                    const SizedBox(height: 5),

                    goLogin()
                  ],
                ),
              ),
            );
  }

  Row goLogin() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already registered?",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage(hiveService: widget.hiveService);
                          },
                        ),
                      );
                    },
                    child: Text(
                      ' Click Here',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.bold                      ),
                    ),
                  ),
                ],
              );
  }

  Container passwordField() {
    return Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25), 
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFFA7A7A7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: Image.asset('assets/icons/key_icon.png', width: 5, height: 5)
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Handle the tap on the suffix icon
                            },
                            child: Transform.scale(
                              scale: 0.5,
                              child: Image.asset('assets/icons/eye_icon.png', width: 5, height: 5)
                            ),
                          ),
                        ),
                      ),
                    );
  }

  Container phoneField() {
    return Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25), 
                          hintText: 'Phone number',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFFA7A7A7)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: Image.asset('assets/icons/phone_icon.png', width: 5, height: 5)
                          ),
                        ),
                      )
                    );
  }

  Align signupTitle() {
    return Align(
                      alignment: Alignment.centerLeft,
                      child: 
                      Text(
                        'Sign Up', 
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      )
                    );
  }

  ElevatedButton signupButton(BuildContext context) {
    return ElevatedButton(
                      onPressed: () {
                        //wala pa
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(265, 45),
                        backgroundColor: Colors.black, 
                        foregroundColor: Colors.white, 
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), 
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    );
  }
  
  Container searchBarIcon() {
    return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color(0xFF5474FD),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Transform.scale(
            scale: 1.2, 
            child: Image.asset('assets/icons/phone_icon.png'),
          ),
        );
  }
  
  Container nameField() {
    return Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25), 
                          hintText: 'Username',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFFA7A7A7)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: Image.asset('assets/icons/person_icon.png', width: 5, height: 5)
                          ),
                        ),
                      )
                    );
  }
  
  Container confirmPasswordField() {
    return Container(
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25), 
                          hintText: 'Confirm Password',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color(0xFFA7A7A7),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: Image.asset('assets/icons/key_icon.png', width: 5, height: 5)
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Handle the tap on the suffix icon
                            },
                            child: Transform.scale(
                              scale: 0.5,
                              child: Image.asset('assets/icons/eye_icon.png', width: 5, height: 5)
                            ),
                          ),
                        ),
                      ),
                    );
  }
}