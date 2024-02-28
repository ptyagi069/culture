import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var myAppBar = AppBar(
  backgroundColor: Colors.grey[200],
  title: Text(
    "WELCOME",
    style: GoogleFonts.dmSerifDisplay(
      fontSize: 19,
      height: 1.5,
      color: Color.fromARGB(255, 66, 66, 66),
    ),
  ),
);

var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  child: Column(
    children: [
      DrawerHeader(child: Icon(Icons.favorite)),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('H O M E'),
      ),
      ListTile(
        leading: Icon(Icons.call),
        title: Text('C O N T A C T  U S'),
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('E X I T'),
      ),
    ],
  ),
);
