import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels_ui/pages/hotel_assignment.dart';
import 'package:hotels_ui/pages/hotels_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> pages = {
    HotelsUI.id: 'Hotels',
    AssignmentHotel.id: 'Hotels Simple UI',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Hotels', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return _card(index + 1, pages.values.toList()[index],
                pages.keys.toList()[index]);
          },
        ),
      ),
    );
  }

  Widget _card(int number, String name, String id) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        elevation: 15,
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(id);
          },
          minVerticalPadding: 10,
          minLeadingWidth: 10,
          leading: Text(number.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 18)),
          title: Center(
              child: Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 20),
                  textAlign: TextAlign.center
              )
          ),
          selectedColor: Colors.blueGrey,
        )
    );
  }
}