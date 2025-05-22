import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class CrearCotizacionDomicilio extends StatelessWidget {
  const CrearCotizacionDomicilio({Key? key}) : super(key: key);

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
            currentStep: 1,
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
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(
                          "Domicilio:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                            text: "AVE. NIÑOS HEROES NO. 2001",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(
                          "Colonia:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: "MIRADOR"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(
                          "Estado:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: "CHIHUAHUA"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(
                          "Ciudad:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: "CHIHUAUHUA"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(
                          "Código Postal:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: "31270"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(
                          "Entre calles:",
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
                          "F. Entrega:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(onPressed: () {}, child: Text("15/05/2025")),
                      TextButton(
                        onPressed: () async {
                          final TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 23, minute: 50),
                            initialEntryMode: TimePickerEntryMode.inputOnly,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: MediaQuery(
                                    data: MediaQuery.of(
                                      context,
                                    ).copyWith(alwaysUse24HourFormat: true),
                                    child: child!,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text("23:50"),
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
                          context.go("/crear");
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
                          context.go("/crear/fechas");
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
          ),
        ],
      ),
    );
  }
}
