import 'package:disenio_prueba/home/widgets/dropdown_almacen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusquedaCliente extends StatefulWidget {
  const BusquedaCliente({super.key});

  @override
  State<BusquedaCliente> createState() => _BusquedaClienteState();
}

class _BusquedaClienteState extends State<BusquedaCliente> {
  int _almacenSelected = 1;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Table(
          columnWidths: const <int, TableColumnWidth>{
            0: FractionColumnWidth(.35),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                Text("Almacén", style: GoogleFonts.montserrat( fontSize: 15.sp)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownAlmacen()
                  ),
              ],
            ),
            TableRow(
              children: [
                Text("Cliente:*", style: GoogleFonts.montserrat( fontSize: 15.sp)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SearchAnchor.bar(
                    barTextStyle: WidgetStatePropertyAll(GoogleFonts.montserrat(fontSize: 15.sp)),
                    viewHeaderTextStyle: TextStyle( fontSize: 15.sp),
                    barLeading: Text(""),
                    barPadding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                    isFullScreen: false,
                    barShape: WidgetStatePropertyAll(
                      OutlinedBorder.lerp(
                        ContinuousRectangleBorder(),
                        ContinuousRectangleBorder(),
                        0,
                      ),
                    ),
                    barElevation: WidgetStatePropertyAll(0),
                    barBackgroundColor: WidgetStatePropertyAll(
                      Colors.transparent,
                    ),
                    barSide: WidgetStatePropertyAll(BorderSide(color: Colors.black)),
                    viewBackgroundColor: Colors.white,
                    suggestionsBuilder: (context, controller) {
                      return [
                        ListTile(
                          onTap: () {},
                          title: Text("1. VISA CFSA", style: GoogleFonts.montserrat( fontSize: 15.sp, fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CARNES FINAS SAN ANDRES, S.A. DE C.V.", style: GoogleFonts.montserrat(fontSize: 12.sp),),
                              Text("CFS881114KWA", style: GoogleFonts.montserrat(fontSize: 12.sp)),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Text("Ordenes de compra:", style: GoogleFonts.montserrat( fontSize: 15.sp)),
                Padding(padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8), child: TextField(
                  style: GoogleFonts.montserrat( fontSize: 15.sp),
                )),
              ],
            ),
            TableRow(
              children: [
                Text("Fecha Inicial", style: GoogleFonts.montserrat( fontSize: 15.sp)),
                TextButton.icon(onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                }, label: Text("08/05/2025", style: GoogleFonts.montserrat( fontSize: 15.sp)), icon: Icon(Icons.calendar_month),),
              ],
            ),
            TableRow(
              children: [
                Text("Fecha Fin", style: GoogleFonts.montserrat( fontSize: 15.sp)),
                TextButton.icon(onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                }, label: Text("08/05/2025", style: GoogleFonts.montserrat( fontSize: 15.sp)), icon: Icon(Icons.calendar_month),),
              ],
            ),
            TableRow(
              children: [
                Text("Folio:", style: GoogleFonts.montserrat( fontSize: 15.sp)),
                Padding(padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 8), child: TextField(
                  style: GoogleFonts.montserrat(fontSize: 15.sp),
                )),
              ],
            ),
            TableRow(
              children: [
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(onPressed: () {
        
                  }, child: Text("Buscar", style: GoogleFonts.montserrat( fontSize: 15.sp))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
