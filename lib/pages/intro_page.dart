import 'package:culture/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Center(
          child: Column(
            children: [
              Text(
                "CULTURE HOLIDAYS",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 28,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Image.asset('lib/images/destination.png')),
              const SizedBox(
                height: 25,
              ),
              Text(
                "INVENTORY",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Day Wise Itinerary | Package Details",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 15,
                  height: 1.5,
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MyButton(text: "Get Started", onTap: (){
                Navigator.pushNamed(context, '/homepage');
              },),
            ],
          ),
        ),
      ),
    );
  }
}
