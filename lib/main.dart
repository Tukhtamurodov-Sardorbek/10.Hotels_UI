import 'package:flutter/material.dart';
import 'package:hotels_ui/home_page.dart';
import 'package:hotels_ui/pages/hotel_assignment.dart';
import 'package:hotels_ui/pages/hotels_ui.dart';

void main() {
  runApp(const Hotels());
}

class Hotels extends StatelessWidget {
  const Hotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HotelsUI.id: (context) => const HotelsUI(),
        AssignmentHotel.id: (context) => const AssignmentHotel(),
      }
    );
  }
}
