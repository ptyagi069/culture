import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'country_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map<String, String>> _countries = [];
  late List<String> _regionNames = [];
  late List<String> _filteredRegionNames = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    getCountries();
  }

  Future<void> getCountries() async {
    var response = await http
        .get(Uri.parse('https://devapi.cultureholidays.com/GetCountry'));
    var jsonData = jsonDecode(response.body);

    List<Map<String, String>> countries = [];

    for (var data in jsonData) {
      String countryName = data['countryName'];
      String countryCode = data['countryCode'];
      String regionName = data['regionName'];

      countries.add({
        'countryName': countryName,
        'countryCode': countryCode,
        'regionName': regionName,
      });
    }

    Set<String> regionNames =
        Set.from(countries.map((country) => country['regionName']!));

    setState(() {
      _countries = countries;
      _regionNames = regionNames.toList();
      _filteredRegionNames = _regionNames; // Initialize filtered list
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterRegions(String query) {
    setState(() {
      _filteredRegionNames = _regionNames
          .where((region) => region.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'REGIONS',
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 25,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterRegions,
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
              ),
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRegionNames.length,
              itemBuilder: (context, index) {
                return _buildRegionCard(context, _filteredRegionNames[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionCard(BuildContext context, String regionName) {
    List<Map<String, String>> filteredCountries = _countries
        .where((country) => country['regionName'] == regionName)
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Card(
        elevation: 3,
        color: Color.fromARGB(255, 237, 236, 236),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryPage(
                  filteredCountries: filteredCountries,
                  countryCodes: filteredCountries
                      .map((country) => country['countryCode'] ?? '')
                      .toList(),
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(25),
            child: Center(
              child: Text(
                regionName,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  color: Color.fromARGB(255, 70, 70, 70),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
