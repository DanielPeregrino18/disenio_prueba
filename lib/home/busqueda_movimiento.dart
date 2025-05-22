import 'package:disenio_prueba/home/widgets/dropdown_almacen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusquedaMovimiento extends StatefulWidget {
  const BusquedaMovimiento({super.key});

  @override
  State<BusquedaMovimiento> createState() => _BusquedaMovimientoState();
}

class _BusquedaMovimientoState extends State<BusquedaMovimiento> {

  int _almacenSelected = 1;

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> almacenes = [
      {"nombre": "ZADS", "id": 1},
      {"nombre": "VEAL", "id": 2},
      {"nombre": "RODENSA", "id": 3},
      {"nombre": "INTEGRA", "id": 4},
      {"nombre": "FCESAR", "id": 5},
      {"nombre": "FVERONICA", "id": 6},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                Text("Movimiento: ", style: GoogleFonts.montserrat( fontSize: 15.sp)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: GoogleFonts.montserrat(fontSize: 15.sp),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                  ),
                )
              ]
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
          ]
      ),
    );
  }
}
