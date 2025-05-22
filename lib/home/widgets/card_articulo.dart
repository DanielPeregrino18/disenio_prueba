import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardArticulo extends StatefulWidget {
  final int num;
  const CardArticulo({Key? key, required this.num}) : super(key: key);

  @override
  _CardArticuloState createState() => _CardArticuloState();
}

class _CardArticuloState extends State<CardArticulo> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onDoubleTap: () async {
          return showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      bottom: TabBar(
                        tabs: [
                          Tab(
                            child: Text(
                              "Descripción",
                              style: GoogleFonts.montserrat(fontSize: 15.sp),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Existencias",
                              style: GoogleFonts.montserrat(fontSize: 15.sp),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        "43.- Creditos",
                        style: GoogleFonts.montserrat(
                          fontSize: 20.sp,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      centerTitle: true,
                      automaticallyImplyLeading: false,
                    ),
                    body: TabBarView(
                      children: [DescripcionArticulo(), ExistenciasArticulo()],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "43.- Creditos * ${widget.num}",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              Wrap(
                spacing: 15,
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 8,
                children: [
                  TextBoldNormal(bold: "Precio", normal: "5.00"),
                  TextBoldNormal(bold: "Unidad", normal: "PZA"),
                  TextBoldNormal(bold: "Margen", normal: "-99.42"),
                  TextBoldNormal(bold: "Descuento", normal: "0.0000"),
                  TextBoldNormal(bold: "Cantidad", normal: "1.00"),
                  TextBoldNormal(bold: "Importe", normal: "5.00"),
                  TextBoldNormal(bold: "%IVA", normal: "16.0000"),
                  TextBoldNormal(bold: "Lista precio", normal: "1"),
                  TextBoldNormal(bold: "Marca", normal: "SIN MARCA"),
                  TextBoldNormal(bold: "Exsitencia", normal: "-1,059,841.00"),
                  TextBoldNormal(bold: "Presentación", normal: ""),
                  TextBoldNormal(bold: "Dato extra", normal: ""),
                  TextBoldNormal(bold: "Tiempo Entrega", normal: "0"),
                  TextBoldNormal(bold: "No. de Serie", normal: ""),
                ],
              ),
              Divider(),
              Expanded(
                child: Row(
                  spacing: 10,
                  children: [
                    Text(
                      "Cantidad:",
                      style: GoogleFonts.montserrat(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Flexible(child: TextField()),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: Text(
                        "Solicitar",
                        style: GoogleFonts.montserrat(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Eliminar")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExistenciasArticulo extends StatelessWidget {
  const ExistenciasArticulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Wrap(
            spacing: 15,
            runSpacing: 10,
            children: [
              TextBoldNormal(bold: "Articulo", normal: "VEAL"),
              TextBoldNormal(bold: "Existencia", normal: "-27062"),
              TextBoldNormal(bold: "Pedida", normal: "53738"),
              TextBoldNormal(bold: "BACK ORDERS", normal: "269284"),
              TextBoldNormal(
                bold: "Fecha de entrega mas proxima",
                normal: "26/12/2023",
              ),
              TextBoldNormal(bold: "Ubicación", normal: ""),
            ],
          ),
          SizedBox(height: 15.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
              headingTextStyle: GoogleFonts.montserrat(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold),
              columns: [
                DataColumn(label: Text("Almacen")),
                DataColumn(label: Text("Existencia")),
                DataColumn(label: Text("Pedida")),
                DataColumn(label: Text("Ubicación")),
              ],
              rows: [
                DataRow(
                    cells: [
                      DataCell(Text("ZADS")),
                      DataCell(Text("0.00")),
                      DataCell(Text("0.00")),
                      DataCell(Text("")),
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("VEAL")),
                      DataCell(Text("0.00")),
                      DataCell(Text("53,738.81")),
                      DataCell(Text("")),
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("RODENSA")),
                      DataCell(Text("0.00")),
                      DataCell(Text("0.00")),
                      DataCell(Text("")),
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("INTEGRA")),
                      DataCell(Text("0.00")),
                      DataCell(Text("0.00")),
                      DataCell(Text("")),
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("FCESAR")),
                      DataCell(Text("0.00")),
                      DataCell(Text("0.00")),
                      DataCell(Text("")),
                    ]
                ),
                DataRow(
                    cells: [
                      DataCell(Text("FVERONICA")),
                      DataCell(Text("0.00")),
                      DataCell(Text("0.00")),
                      DataCell(Text("")),
                    ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DescripcionArticulo extends StatelessWidget {
  const DescripcionArticulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 10.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextBoldNormal(bold: "Descripcion", normal: "Creditos"),
          TextBoldNormal(bold: "Marca", normal: "Sin Marca"),
          TextBoldNormal(bold: "No. Parte", normal: "0010101"),
          TextBoldNormal(bold: "Existencias", normal: "-24062"),
          TextBoldNormal(bold: "Código de barras", normal: "0101"),
          TextBoldNormal(bold: "Un. Aux", normal: ""),
          TextBoldNormal(
            bold: "Precio con intereses por unidad",
            normal: "5.00",
          ),
        ],
      ),
    );
  }
}

class TextBoldNormal extends StatelessWidget {
  final String bold;
  final String normal;
  const TextBoldNormal({super.key, required this.bold, required this.normal});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.montserrat(fontSize: 15.sp),
        children: [
          TextSpan(
            text: "$bold: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: normal),
        ],
      ),
    );
  }
}
