import 'dart:math';

import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<String> images = ['assets/images/image1.jpeg','assets/images/image2.jpg','assets/images/image3.jpeg','assets/images/image4.jpg','assets/images/image5.jpg',
  'assets/images/image6.jpg'];
  final pageController = PageController();
  double currentPage = 0.0;
  void listener(){
    setState(() {
      currentPage = pageController.page!;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(listener);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.removeListener(listener);
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView.builder(
          controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index){
            final percent = 0.5 - (currentPage - index);
            final value = percent.clamp(0.0, 1.0);
              print(percent);
              // return Transform(
              //   alignment: Alignment.center,
              //   transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateX(pi*value),
              //     child: Image.asset(images[index],fit: BoxFit.fitWidth,width: 120,height: 120,));
              return Transform.scale(
                  scale: value * 1,
                  child: Image.asset(images[index],fit: BoxFit.fitWidth,width: 120,height: 120,));
            }
          ,
        ),
      ),
    );
  }
}
