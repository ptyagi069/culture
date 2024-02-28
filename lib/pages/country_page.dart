import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class CountryPage extends StatefulWidget {
  final String regionName;

  const CountryPage({Key? key, required this.regionName}) : super(key: key);

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<String> countries = [];
  List<String> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  Future<void> getCountries() async {
    try {
      var response = await http
          .get(Uri.parse('https://devapi.cultureholidays.com/GetCountry'));
      var jsonData = jsonDecode(response.body);

      List<String> countriesForRegion = [];

      for (var data in jsonData) {
        if (data['regionName'] == widget.regionName) {
          countriesForRegion.add(data['countryName']);
        }
      }

      setState(() {
        countries = countriesForRegion;
        filteredCountries = countriesForRegion;
      });
    } catch (error) {
      print("Error fetching countries: $error");
    }
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where(
              (country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Countries in ${widget.regionName}',
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 19,
            color: Color.fromARGB(255, 66, 66, 66),
          ),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here...",
                hintStyle: GoogleFonts.dmSerifDisplay(
                  fontSize: 15,
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
              onChanged: filterCountries,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Card(
                    elevation: 3,
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      child: Center(
                        child: Text(
                          filteredCountries[index],
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 18,
                            color: Color.fromARGB(255, 66, 66, 66),
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
