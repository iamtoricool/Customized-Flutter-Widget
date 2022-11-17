import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nuntium/AppTheme/ThemeColors.dart';

class WelcomeSlider extends StatefulWidget {
  const WelcomeSlider({super.key});

  @override
  State<WelcomeSlider> createState() => _WelcomeSliderState();
}

List<String> welcomeImage = [
  'assets/images/london.jpg',
  'assets/images/newyork.jpg',
  'assets/images/tokyo.jpg',
];

class _WelcomeSliderState extends State<WelcomeSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: welcomeImage.length,
          itemBuilder: (context, index, realIndex) => Container(
            height: 336,
            width: 288,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(welcomeImage[index]), fit: BoxFit.cover)),
          ),
          carouselController: _controller,
          options: CarouselOptions(
              height: 336,
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: welcomeImage.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: _current == entry.key ? 24 : 10,
                height: 10,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Color(0xffACAFC3)
                            : Color(0xff475AD7)
                        .withOpacity(_current == entry.key ? 1 : 0.1)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
