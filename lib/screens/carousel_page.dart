import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import 'package:flutter/material.dart';
import 'package:my_movie_demo/demo_theme.dart';
import 'package:my_movie_demo/screens/screens.dart';
import '../data/posters.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
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
            onPressed: () async {
              try {
                // Saved with this method.
                var imageId = await ImageDownloader.downloadImage(
                  posters[_posterIndex],
                );
                if (imageId == null) {
                  return;
                }
                // Below is a method of obtaining saved image information.
                var fileName = await ImageDownloader.findName(imageId);
                var path = await ImageDownloader.findPath(imageId);
                var size = await ImageDownloader.findByteSize(imageId);
                var mimeType = await ImageDownloader.findMimeType(imageId);
                if (kDebugMode) {
                  print("File info:\n"
                    "File name: $fileName\n"
                    "Path: $path\n"
                    "Size: $size Bytes\n"
                    "Mime type: $mimeType");
                }
              } on PlatformException catch (error) {
                if (kDebugMode) {
                  print(error);
                }
              }
            },
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
