import 'package:flutter/material.dart';
import 'package:hotels_ui/home_page.dart';
import 'package:hotels_ui/pages/hotel_assignment.dart';
import 'package:hotels_ui/pages/hotels_ui.dart';
import 'package:hotels_ui/pages/sample_from_mentor.dart';

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
        Sample.id: (context) => const Sample(),
        HotelsUI.id: (context) => const HotelsUI(),
        AssignmentHotel.id: (context) => const AssignmentHotel(),
      }
    );
  }
}
