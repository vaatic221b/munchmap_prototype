import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmap_prototype/screens/home.dart';
import 'package:munchmap_prototype/screens/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              top: 240,
              child: SizedBox(
                width: 290,
                height: 440,
                child: Column(

                  children: [
                    loginTitle(),

                    const SizedBox(height: 17),

                    phoneField(),

                    const SizedBox(height: 15),

                    passwordField(),

                    const SizedBox(height: 30),

                    loginButton(context),

                    const SizedBox(height: 5),

                    forgot(),

                    const Spacer(),

                    goSignup(context)
                  ],
                ),
              ),
            );
  }

  Row goSignup(BuildContext context) {
    return    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      ' Click Here',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
            );
  }

  Row forgot() {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        'Forgot Password?', 
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600 
                          )
                        ),
                        Text(
                        ' Click Here', 
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )
                      )
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

  Align loginTitle() {
    return Align(
                      alignment: Alignment.centerLeft,
                      child: 
                      Text(
                        'Login', 
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      )
                    );
  }

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomePage(); 
                            },
                          ),
                        );
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
                        'Login',
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    );
  }
  

}
