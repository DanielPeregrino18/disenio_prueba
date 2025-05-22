import 'package:disenio_prueba/home/widgets/card_articulo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class CrearCotizacionTotales extends StatefulWidget {
  const CrearCotizacionTotales({Key? key}) : super(key: key);

  @override
  _CrearCotizacionTotalesState createState() => _CrearCotizacionTotalesState();
}

class _CrearCotizacionTotalesState extends State<CrearCotizacionTotales> {
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
        leading: IconButton(
          onPressed: () {
            context.go("/");
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LinearProgressBar(
              maxSteps: 5,
              progressType: LinearProgressBar.progressTypeLinear,
              currentStep: 4,
              progressColor: Colors.blue,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 10,
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Center(
                      child: Text(
                        "Totales",
                        style: GoogleFonts.montserrat(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextBoldNormal(bold: "Subtotal", normal: "25,00"),
                    TextBoldNormal(bold: "-Dscto. Total", normal: "0.00"),
                    TextBoldNormal(bold: "+Importe con Desc", normal: "25.00"),
                    TextBoldNormal(bold: "+leps Total", normal: "0.00"),
                    TextBoldNormal(bold: "+IVA Total", normal: "25.00"),
                    TextBoldNormal(bold: "-IVARetenido", normal: "0.00"),
                    TextBoldNormal(bold: "=Grand Total", normal: "29.00"),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Observaciones",
                      style: GoogleFonts.montserrat(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 8, //or null
                      decoration: InputDecoration.collapsed(
                        hintText: "Observaciones... ",
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 15.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.go("/crear/articulos");
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
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.go("/crear/final");
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
          ],
        ),
      ),
    );
  }
}
