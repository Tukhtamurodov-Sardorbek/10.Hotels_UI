import 'dart:async';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';

class HotelsUI extends StatefulWidget {
  const HotelsUI({Key? key}) : super(key: key);
  static const String id = 'hotels';

  @override
  _HotelsUIState createState() => _HotelsUIState();
}

class _HotelsUIState extends State<HotelsUI> {
  int time = 1;
  int selectedpage = 0;

  final Map<String, String> _hotels = {
    'assets/hotels/img.png': 'hotel #1',
    'assets/hotels/img_1.png': 'hotel #2',
    'assets/hotels/img_2.png': 'hotel #3',
    'assets/hotels/img_3.png': 'hotel #4',
    'assets/hotels/img_4.png': 'hotel #5',
  };
  final List<String> _hotelCategories = [
    'Best Hotels',
    'Luxury Hotels',
    'Eco hotels',
    'Motels'
  ];

  final TextEditingController textController = TextEditingController();
  final PageController _controller = PageController(initialPage: 1);

  void _slide() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      selectedpage++;
      if (selectedpage == _hotels.length) {
        selectedpage = 0;
      }
      _controller.nextPage(
          duration: const Duration(seconds: 2), curve: Curves.easeIn);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        time = 0;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _slide();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
              flexibleSpace: time == 1
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade400,
                      highlightColor: Colors.grey.shade200,
                      child: FlexibleSpaceBar(
                          titlePadding: const EdgeInsets.all(0),
                          title: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: AlignmentDirectional.bottomCenter,
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          background: PageView.builder(
                            controller: _controller,
                            itemCount: _hotels.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          _hotels.keys.toList()[index]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center,
                                            colors: [
                                          Colors.black.withOpacity(0.8),
                                          Colors.black.withOpacity(0.1)
                                        ])),
                                  ));
                            },
                          )),
                    )
                  : FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.all(0),
                      title: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: AlignmentDirectional.bottomCenter,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 30,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextField(
                            controller: textController,
                            onChanged: (value) {
                              //Do something wi
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[500]!,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search for hotels...',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 20.0),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey[300]!, width: 1.0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(45.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey[400]!, width: 1.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(45.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      background: PageView.builder(
                        controller: _controller,
                        itemCount: _hotels.length,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(_hotels.keys.toList()[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center,
                                        colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.black.withOpacity(0.1)
                                    ])),
                              ));
                        },
                      )),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  MediaQuery.removePadding(
                      removeTop: true, context: context, child: _body())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _hotelCategories.length,
        itemBuilder: (context, index) {
          return _template(_hotelCategories[index]);
        },
      ),
    );
  }

  Widget _template(String title) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          time == 1
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade200,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.white,
                      )),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5),
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
          const SizedBox(height: 5),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _hotels.length,
                itemBuilder: (context, index) {
                  return _CarouselCards(_hotels.keys.toList()[index],
                      _hotels.values.toList()[index]);
                }),
          ),
        ],
      ),
    );
  }

  Widget _CarouselCards(String media, String name) {
    return time == 1
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade200,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  width: 250,
                  height: 230,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 5, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: DecorationImage(
                            image: AssetImage(media), fit: BoxFit.cover)),
                    alignment: Alignment.bottomLeft,
                    child: Text(name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.blueGrey.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  )),
            ),
          )
        : GestureDetector(
            onTap: () {},
            child: Container(
                width: 250,
                height: 230,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.5),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      image: DecorationImage(
                          image: AssetImage(media), fit: BoxFit.cover)),
                  alignment: Alignment.bottomLeft,
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blueGrey.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                )),
          );
  }
}
