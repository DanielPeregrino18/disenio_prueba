import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpansionPrueba extends StatefulWidget {
  const ExpansionPrueba({super.key});

  @override
  State<ExpansionPrueba> createState() => _ExpansionPruebaState();
}

class _ExpansionPruebaState extends State<ExpansionPrueba> {
  ExpandableController controller = ExpandableController();
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        controller: controller,
        child: Card(
          color: Colors.white60,
          elevation: 4,
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cotización: 3203", style: GoogleFonts.montserrat(fontSize: 15.sp),),
                    Text("Fecha: 12/05/2025", style: GoogleFonts.montserrat(fontSize: 15.sp)),
                  ],
                ),
                Divider(),
                Text("Almacén: INTEGRA", style: GoogleFonts.montserrat(fontSize: 15.sp)),
                Text("Cliente: OMAR RAFAEL AGUIRRE SAENZ", style: GoogleFonts.montserrat(fontSize: 15.sp)),
                Divider( height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size(50, 30),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft
                      ),
                      onPressed: () {
                        setState(() {
                          controller.toggle();
                        });
                      },
                      label: Text(
                        controller.expanded ? "Ocultar detalle" : "Ver detalle",
                        style: GoogleFonts.montserrat(color: Colors.blue, fontSize: 15.sp),
                      ),
                      icon: Icon(
                        controller.value
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.blue, size: 20.sp,
                      ),
                    ),
                    Text("Estatus: Cotizado", style: GoogleFonts.montserrat(fontSize: 15.sp)),
                  ],
                ),
                Expandable(
                  collapsed: SizedBox(),
                  expanded: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Text(
                          "Artículo: SERVICIO SOPORTE SUC OCAMPO FALLA WINDOWS EQUIPO MOSTRADOR Unidad: SERV.",
                            style: GoogleFonts.montserrat(fontSize: 15.sp)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Table(
                            border: TableBorder(
                              verticalInside: BorderSide(color: Colors.grey),
                              top: BorderSide(color: Colors.grey),
                            ),
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Cant:", style: GoogleFonts.montserrat(fontSize: 15.sp)), Text("1.0", style: GoogleFonts.montserrat(fontSize: 15.sp))],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Pend:", style: GoogleFonts.montserrat(fontSize: 15.sp)), Text("1.0", style: GoogleFonts.montserrat(fontSize: 15.sp))],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Cant:", style: GoogleFonts.montserrat(fontSize: 15.sp)), Text("1.0", style: GoogleFonts.montserrat(fontSize: 15.sp))],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Pend:", style: GoogleFonts.montserrat(fontSize: 15.sp)), Text("1.0", style: GoogleFonts.montserrat(fontSize: 15.sp))],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
