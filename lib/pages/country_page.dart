import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryPage extends StatefulWidget {
  final List<Map<String, String>> filteredCountries;
  final List<String> countryCodes;

  CountryPage({required this.filteredCountries, required this.countryCodes});

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  late List<Map<String, String>> _filteredCountries;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _filteredCountries = widget.filteredCountries;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = widget.filteredCountries.where((country) {
        final countryName = country['countryName']?.toLowerCase() ?? '';
        return countryName.contains(query.toLowerCase());
      }).toList();
    });
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterCountries,
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
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCountries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Card(
                    elevation: 3,
                    color: const Color.fromARGB(255, 232, 232, 232),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          _filteredCountries[index]['countryName'] ?? '',
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
    );
  }
}
