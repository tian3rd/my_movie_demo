import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_movie_demo/demo_theme.dart';
import 'package:my_movie_demo/screens/screens.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  List<String> posters = [
    // "https://image.tmdb.org/t/p/w780/sKvQUSyqsFq8e1ts6oo3Xp3dPH2.jpg",
    // "https://image.tmdb.org/t/p/w780/93xA62uLd5CwMOAs37eQ7vPc1iV.jpg",
    // "https://image.tmdb.org/t/p/w780/gF02RlJ9hHwqUrUTphEppsCrjmY.jpg",
    // "https://image.tmdb.org/t/p/w780/k29qVmwWwR0i5A1UMIws1Vmv6hV.jpg",
    // "https://image.tmdb.org/t/p/w780/kSlO1pHpwQfPQdgVPr7dJiJNtJ8.jpg",
    "https://image.tmdb.org/t/p/original/sKvQUSyqsFq8e1ts6oo3Xp3dPH2.jpg",
    "https://image.tmdb.org/t/p/original/93xA62uLd5CwMOAs37eQ7vPc1iV.jpg",
    "https://image.tmdb.org/t/p/original/gF02RlJ9hHwqUrUTphEppsCrjmY.jpg",
    "https://image.tmdb.org/t/p/original/k29qVmwWwR0i5A1UMIws1Vmv6hV.jpg",
    "https://image.tmdb.org/t/p/original/kSlO1pHpwQfPQdgVPr7dJiJNtJ8.jpg",
  ];

  int _posterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.shuffle),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        title: Text(
          'This Week',
          style: DemoTheme.dark().textTheme.headline2,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<String>(posters[_posterIndex]),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(posters[_posterIndex]),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Center(
            child: FractionallySizedBox(
              heightFactor: 0.6,
              child: PageView.builder(
                  itemCount: posters.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _posterIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(posters[index]),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ]),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
