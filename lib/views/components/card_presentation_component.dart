import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

/*
CARD: para la pantalla de presentation, lista de datos quemados 
*/
class CardPresentationComponent extends StatefulWidget {
  const CardPresentationComponent({super.key});

  @override
  State<CardPresentationComponent> createState() =>
      _CardPresentationComponentState();
}

class _CardPresentationComponentState extends State<CardPresentationComponent> {
  List<String> presentationImages = [
    'assets/img/bladerunner.jpg',
    'assets/img/daredevil.jpg',
    'assets/img/moonline.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .5,
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: size.height * .02),
      child: Swiper(
        itemCount: presentationImages.length,
        autoplay: true,
        layout: SwiperLayout.STACK,
        axisDirection: AxisDirection.down,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemHeight: size.height * .4,
        itemWidth: size.width * .6,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              presentationImages[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
