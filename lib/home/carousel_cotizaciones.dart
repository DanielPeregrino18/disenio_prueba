import 'package:carousel_slider/carousel_slider.dart';
import 'package:disenio_prueba/home/card_cotizacion.dart';
import 'package:disenio_prueba/home/expansion_prueba.dart';
import 'package:flutter/material.dart';

class CarouselCotizaciones extends StatefulWidget {
  const CarouselCotizaciones({Key? key}) : super(key: key);

  @override
  _CarouselCotizacionesState createState() => _CarouselCotizacionesState();
}

class _CarouselCotizacionesState extends State<CarouselCotizaciones> {
  CarouselSliderController buttonCarouselController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: buttonCarouselController,
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return SingleChildScrollView(child: CardCotizacion());
          },
          options: CarouselOptions(
              aspectRatio: 1,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
          ),
        ),
        ElevatedButton(onPressed: () {
          
        }, child: Text("data"))
      ],
    );

  }
}
