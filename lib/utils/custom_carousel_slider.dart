import '../resources/exports/index.dart';

class CustomCarouselSlider extends StatelessWidget {
  final CustomCarouselModel sliderData;

  const CustomCarouselSlider({Key? key, required this.sliderData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        aspectRatio: 1,
        enlargeCenterPage: true,
        viewportFraction: 0.96,
      ),
      items: sliderData.data
          .map(
            (i) => Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(color: Colors.white),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: i,
              ),
            ),
          )
          .toList(),
    );
  }
}
