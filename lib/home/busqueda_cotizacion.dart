import 'package:disenio_prueba/home/widgets/dropdown_almacen.dart';
import 'package:disenio_prueba/home/widgets/search_bar_clientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusquedaCotizacion extends StatefulWidget {
  const BusquedaCotizacion({super.key});

  @override
  State<BusquedaCotizacion> createState() => _BusquedaCotizacionState();
}

class _BusquedaCotizacionState extends State<BusquedaCotizacion> {
  int _almacenSelected = 1;

  @override
  Widget build(BuildContext context) {


    List<Map<String, dynamic>> tipos = [
      {"nombre": "Fecha Registro", "id": 1},
      {"nombre": "Fecha Movimiento", "id": 2},
      {"nombre": "Fecha de cancelación", "id": 3},
      {"nombre": "Fecha O.C", "id": 4},
      {"nombre": "Fecha de Inicio Consigna", "id": 5},
      {"nombre": "Fecha de Fin Consigna", "id": 6},
    ];

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Almacén",
                  style: GoogleFonts.montserrat(fontSize: 15.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: DropdownAlmacen()
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Cliente:*", style: GoogleFonts.montserrat(fontSize: 15.sp),),
              ),
              Expanded(
                child: SearchBarClientes(),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Tipo:", style: GoogleFonts.montserrat(fontSize: 15.sp), textAlign: TextAlign.center),
              ),
              Expanded(
                child: DropdownButton(
                  iconSize: 22.sp,
                  style: GoogleFonts.montserrat(fontSize: 15.sp, color: Colors.black),
                  value: _almacenSelected,
                  items:
                      tipos
                          .map(
                            (e) => DropdownMenuItem(
                              value: e['id'],
                              child: Text("${e['nombre']}"),
                            ),
                          )
                          .toList(),
                  onChanged: (Object? value) {
                    setState(() {
                      _almacenSelected = value! as int;
                    });
                  },
                  isExpanded: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FractionColumnWidth(.3),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        Text("Desde:", style: GoogleFonts.montserrat(fontSize: 15.sp),),
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              barrierLabel: "fech",
                              fieldLabelText: "Fechaaa",
                              cancelText: "Cancelar",
                              confirmText: "Seleccionar",
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                          },
                          child: Text("08/05/2025", style: GoogleFonts.montserrat(fontSize: 15.sp),),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text("Hasta:", style: GoogleFonts.montserrat(fontSize: 15.sp)),
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                          },
                          child: Text("08/05/2025", style: GoogleFonts.montserrat(fontSize: 15.sp)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(onPressed: () {}, child: Text("Buscar", style: GoogleFonts.montserrat(fontSize: 15.sp))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
