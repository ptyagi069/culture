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
          'Country Details',
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 28,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Country Codes: ${countryCodes.join(", ")}',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'List of Countries in the Region:',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          filteredCountries[index]['countryName'] ?? '',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 28,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        subtitle: Text(
                          filteredCountries[index]['countryCode'] ?? '',
                          style: TextStyle(fontSize: 16),
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
