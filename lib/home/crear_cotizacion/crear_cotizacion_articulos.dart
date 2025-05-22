import 'package:carousel_slider/carousel_slider.dart';
import 'package:disenio_prueba/home/widgets/card_articulo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class CrearCotizacionArticulos extends StatefulWidget {
  const CrearCotizacionArticulos({Key? key}) : super(key: key);

  @override
  _CrearCotizacionArticulosState createState() =>
      _CrearCotizacionArticulosState();
}

class _CrearCotizacionArticulosState extends State<CrearCotizacionArticulos> {

  CarouselSliderController controller = CarouselSliderController();
  int indexCar = 0;
  List<CardArticulo> articulos = [];

  void goToLastArticulo(){
    if(indexCar > 0) {//todo se bugea cuando da la vuelta completa del carrusel
      controller.jumpToPage(indexCar );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crear Cotización",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          context.go("/");
        }, icon: Icon(Icons.exit_to_app)),
      ),
      body: Column(
        children: [
          LinearProgressBar(
            maxSteps: 5,
            progressType: LinearProgressBar.progressTypeLinear,
            currentStep: 3,
            progressColor: Colors.blue,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            minHeight: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Agregar Articulos",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          Row(
                            spacing: 30,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Código",
                                  ),
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                onPressed: () {
                                  int page = articulos.length;
                                  setState(() {
                                    articulos.add(CardArticulo(num: page,));
                                    indexCar = page;
                                  });
                                  //controller.jumpToPage(page);
                                  goToLastArticulo();
                                },





                                label: Text(
                                  "Buscar",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                icon: Icon(Icons.search, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  if(articulos.isNotEmpty)
                  CarouselSlider.builder(
                    itemCount: articulos.length,
                    carouselController: controller,
                    itemBuilder: (context, index, realIndex) {
                      return articulos[index];
                    },
                    options: CarouselOptions(
                      aspectRatio: 1,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          if(reason.index != 2){
                            indexCar = index;
                          }
                        });
                      },
                    ),
                  ),
                  if(articulos.isNotEmpty)
                  FittedBox(
                    child: LinearProgressBar(
                      maxSteps: articulos.length,
                      progressType: LinearProgressBar.progressTypeDots,
                      dotsActiveSize: 15,
                      dotsInactiveSize: 10,
                      dotsSpacing: EdgeInsets.all(5),
                      currentStep: indexCar,
                      progressColor: Colors.blue,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 10.h,
                    ),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                onPressed: () {
                  context.go("/crear/fechas");
                },
                child: Text(
                  "Anterior",
                  style: GoogleFonts.montserrat(
                    fontSize: 15.sp,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                onPressed: () {
                  context.go("/crear/totales");
                },
                child: Text(
                  "Siguiente",
                  style: GoogleFonts.montserrat(
                    fontSize: 15.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

/*
class tablaArticulos extends StatelessWidget {
  const tablaArticulos({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        border: TableBorder.all(),
        dataRowColor: WidgetStatePropertyAll(Colors.white),
        dataTextStyle: GoogleFonts.montserrat(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        headingRowColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.primary,
        ),
        horizontalMargin: 8,
        columnSpacing: 18,
        columns: [
          DataColumn(
            label: Text(
              "Código",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Artículo",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Unidad",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Precio",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Margen",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Descuento",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Cantidad",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Importe",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "%IVA",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Lista precio",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Marca",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Existencia",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Presentación",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Dato extra",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Tiempo Entrega",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "No. de Serie",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              "Solicitar",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(TextField()),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("0.00")),
              DataCell(Text("0.00")),
              DataCell(Text("0.0000")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
              DataCell(Text("prueba")),
            ],
          ),
        ],
      ),
    );
  }
}
*/
