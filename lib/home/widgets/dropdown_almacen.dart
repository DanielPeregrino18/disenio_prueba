import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownAlmacen extends StatefulWidget {
  const DropdownAlmacen({Key? key}) : super(key: key);

  @override
  State<DropdownAlmacen> createState() => _DropdownAlmacenState();
}

class _DropdownAlmacenState extends State<DropdownAlmacen> {
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

    return DropdownButton(
      iconSize: 22.sp,
      style: GoogleFonts.montserrat(fontSize: 15.sp, color: Colors.black),
      value: _almacenSelected,
      items:
      almacenes
          .map(
            (e) => DropdownMenuItem(
          value: e['id'],
          child: Text("${e['id']}. ${e['nombre']}"),
        ),
      )
          .toList(),
      onChanged: (Object? value) {
        setState(() {
          _almacenSelected = value! as int;
        });
      },
      isExpanded: true,
    );
  }
}
