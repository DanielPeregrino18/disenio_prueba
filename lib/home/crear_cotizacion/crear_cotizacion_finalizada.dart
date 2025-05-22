import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class CrearCotizacionFinalizada extends StatefulWidget {
  const CrearCotizacionFinalizada({Key? key}) : super(key: key);

  @override
  _CrearCotizacionFinalizadaState createState() =>
      _CrearCotizacionFinalizadaState();
}

class _CrearCotizacionFinalizadaState extends State<CrearCotizacionFinalizada> {
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
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LinearProgressBar(
              maxSteps: 5,
              progressType: LinearProgressBar.progressTypeLinear,
              currentStep: 5,
              progressColor: Colors.blue,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 10,
            ),
            Column(
              children: [
                Text("Cotización Realizada", style: GoogleFonts.montserrat(fontSize: 30.sp, fontWeight: FontWeight.bold),),
                Icon(Icons.check_circle_outline, color: Colors.green, size: 200.sp,)
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
                    context.go("/");
                  },
                  child: Text(
                    "Salir",
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
                    context.go("/");
                  },
                  child: Text(
                    "Ver Cotización",
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
