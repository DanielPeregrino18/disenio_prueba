import 'package:disenio_prueba/home/widgets/card_articulo.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCotizacion extends StatefulWidget {
  const CardCotizacion({Key? key}) : super(key: key);

  @override
  _CardCotizacionState createState() => _CardCotizacionState();
}

class _CardCotizacionState extends State<CardCotizacion> {
  ExpandableController controller = ExpandableController();
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: controller,
      child: GestureDetector(
        onTap: () {
          context.go("/ver");
        },
        child: Card(
          color: Colors.white,
          elevation: 4,
          margin: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 2,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cotización: 3206",
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Fecha: 13/05/2025",
                      style: GoogleFonts.montserrat(fontSize: 16.sp),
                    ),
                  ],
                ),
                Divider(height: 4),
                TextBoldNormal(bold: "Almacén", normal: "INTEGRA"),
                TextBoldNormal(bold: "Vendedor", normal: "SHIRLEY_DAVIDSON_MENDOZA"),
                TextBoldNormal(bold: "Cliente", normal: "VISA MEAT"),
                TextBoldNormal(bold: "Paridad", normal: "1.00"),
                TextBoldNormal(bold: "Fecha de cancelacion", normal: "13/05/2025"),
                TextBoldNormal(bold: "Total", normal: "8,723.20"),
                Divider(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: Size(50, 30),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        setState(() {
                          controller.toggle();
                        });
                      },
                      label: Text(
                        controller.expanded ? "Ocultar detalle" : "Ver detalle",
                        style: GoogleFonts.montserrat(
                          color: Colors.blue,
                          fontSize: 15.sp,
                        ),
                      ),
                      icon: Icon(
                        controller.value
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.blue,
                        size: 20.sp,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                          text: "Estatus: ",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                          children: [
                            TextSpan(text: "Cotizado", style: TextStyle(color: Colors.green))
                          ]
                      ),
                    ),
                  ],
                ),
                Expandable(
                  collapsed: SizedBox(),
                  expanded: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 15.w,
                          runSpacing: 10.h,
                          children: [
                            TextBoldNormal(bold: "Código", normal: "43"),
                            TextBoldNormal(bold: "Artículo", normal: "Creditos"),
                            TextBoldNormal(bold: "Unidad", normal: "PZA"),
                            TextBoldNormal(bold: "Marca", normal: "SIN MARCA"),
                          ],
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
                                      children: [
                                        Text(
                                          "Cant:",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "1,000.0",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Desc:",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "0.00",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
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
                                      children: [
                                        Text(
                                          "Importe:",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "7,520.00",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "%IVA:",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          "16.0",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
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
      ),
    );
  }
}
