import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          "WELCOME",
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 19,
            height: 1.5,
            color: Color.fromARGB(255, 66, 66, 66),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[300],
          child: ListView(
            children: [
              DrawerHeader(
                
                  child: Icon(
                Icons.pin_drop,
                size: 35,
                color: Colors.white,
              )),
            ],
          ),
        ),
      ),
      //BODY
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          //TOP TEXT
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "REGIONS",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  height: 1.5,
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          //SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search here...",
                  hintStyle: GoogleFonts.dmSerifDisplay(
                    fontSize: 15,
                    color: Color.fromARGB(255, 66, 66, 66),
                  )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // CARDS
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildRegionCard(context, "Middle East"),
                _buildRegionCard(context, "Europe"),
                _buildRegionCard(context, "Asia"),
                _buildRegionCard(context, "Africa"),
                _buildRegionCard(context, "Oceania"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionCard(BuildContext context, String regionName) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(33),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(regionName,
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 15,
                    color: Color.fromARGB(255, 66, 66, 66),
                  )),
            ],
          ),
        ),
        onTap: () {
          // Handle tapping on the card (if needed)
        },
      ),
    );
  }
}
