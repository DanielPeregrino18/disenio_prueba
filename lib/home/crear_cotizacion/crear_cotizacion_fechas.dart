 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class CrearCotizacionFechas extends StatefulWidget {
  const CrearCotizacionFechas({Key? key}) : super(key: key);

  @override
  _CrearCotizacionFechasState createState() => _CrearCotizacionFechasState();
}

class _CrearCotizacionFechasState extends State<CrearCotizacionFechas> {

  bool checkedValue = false;
  bool checkedValue2 = false;
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
            currentStep: 2,
            progressColor: Colors.blue,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            minHeight: 10,
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              "Fecha de registro: ",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(
                                text: "15/05/2025",
                              ),
                              enabled: false,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              "Fecha O.C:",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(onPressed: () {}, child: Text("15/05/2025")),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              "Fecha I. Consigna:",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(onPressed: () {}, child: Text("15/05/2025")),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              "Fecha F. Consigna:",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(onPressed: () {}, child: Text("15/05/2025")),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              "No. de Serie:",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(text: ""),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              "Orden Compra:",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(text: ""),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              "CampoAddendam:",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(text: ""),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Autorizar"),
                              value: checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue = newValue ?? false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              title: Text("Iva Total Retenido"),
                              value: checkedValue2,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue2 = newValue ?? false;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],
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
                              context.go("/crear/domicilio");
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
                                padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h)),
                                backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))
                            ),

                            onPressed: () {
                              context.go("/crear/articulos");
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
                  )
              )
          )
        ],
      ),
    );
  }
}
