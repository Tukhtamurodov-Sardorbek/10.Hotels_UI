import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  static const String id = "sample_from_mentor";

  const Sample({Key? key}) : super(key: key);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/hotels/img.png'),
                    fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.black.withOpacity(.4),
                        ]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text("What kind of hotel you need?", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.grey,),
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                            hintText: "Search for hotels..."
                        ),
                      ),
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Best Hotels", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/hotels/img.png', title: 'Hotel 1'),
                        makeItem(image: 'assets/hotels/img_1.png', title: 'Hotel 2'),
                        makeItem(image: 'assets/hotels/img_2.png', title: 'Hotel 3'),
                        makeItem(image: 'assets/hotels/img_3.png', title: 'Hotel 4'),
                        makeItem(image: 'assets/hotels/img_4.png', title: 'Hotel 5'),
                        makeItem(image: 'assets/hotels/img_5.png', title: 'Hotel 6')
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text("Luxury Hotels", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 20),),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeItem(image: 'assets/hotels/img.png', title: 'Hotel 1'),
                        makeItem(image: 'assets/hotels/img_1.png', title: 'Hotel 2'),
                        makeItem(image: 'assets/hotels/img_2.png', title: 'Hotel 3'),
                        makeItem(image: 'assets/hotels/img_3.png', title: 'Hotel 4'),
                        makeItem(image: 'assets/hotels/img_4.png', title: 'Hotel 5'),
                        makeItem(image: 'assets/hotels/img_5.png', title: 'Hotel 6')
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1.4 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2),
                  ]
              )
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ),
      ),
    );
  }
}