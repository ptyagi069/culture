import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryPage extends StatelessWidget {
  final List<Map<String, String>> filteredCountries;
  final List<String> countryCodes;

  CountryPage({required this.filteredCountries, required this.countryCodes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'COUNTRIES',
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 25,
            color: Color.fromARGB(255, 54, 54, 54),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Locations ~>',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                color: Color.fromARGB(255, 70, 70, 70),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Card(
                      elevation: 3,
                      color: const Color.fromARGB(255, 232, 232, 232),
                      child: ListTile(
                        title: Center(
                          child: Text(
                            filteredCountries[index]['countryName'] ?? '',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 70, 70, 70),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
