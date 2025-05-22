import 'package:disenio_prueba/home/widgets/dropdown_almacen.dart';
import 'package:disenio_prueba/home/widgets/search_bar_clientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class CrearCotizacion extends StatefulWidget {
  const CrearCotizacion({Key? key}) : super(key: key);

  @override
  _CrearCotizacionState createState() => _CrearCotizacionState();
}

class _CrearCotizacionState extends State<CrearCotizacion> {
  int _vendedor = 1;
  int _precio = 1;

  int _moneda = 1;
  List<Map<String, dynamic>> vendedores = [
    {"nombre": "SERGIOV", "id": 1},
    {"nombre": "ANDRIKR", "id": 2},
    {"nombre": "JARED", "id": 3},
    {"nombre": "DANIEL", "id": 4},
    {"nombre": "JOHAN", "id": 5},
    {"nombre": "JUAN", "id": 6},
  ];

  List<Map<String, dynamic>> listaPrecios = [
    {"nombre": "PUBLICO", "id": 1},
    {"nombre": "GTS", "id": 2},
    {"nombre": "ADN", "id": 3},
    {"nombre": "MAYOREO", "id": 4},
  ];

  List<Map<String, dynamic>> listaMonedas = [
    {"nombre": "MXN", "id": 1},
    {"nombre": "USD", "id": 2},
  ];

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
            currentStep: 0,
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
                        padding: EdgeInsets.only(right: 18.w),
                        child: Text(
                          "Almacén:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(child: DropdownAlmacen()),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "Estatus: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "Nuevo",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 18.w),
                        child: Text(
                          "Vendedor:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: DropdownButton(
                          iconSize: 22.sp,
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                          value: _vendedor,
                          items:
                              vendedores
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e['id'],
                                      child: Text("${e['id']}. ${e['nombre']}"),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (Object? value) {
                            setState(() {
                              _vendedor = value! as int;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Cliente:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(child: SearchBarClientes()),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Column(
                          children: [
                            Text(
                              "Vigencia:",
                              style: GoogleFonts.montserrat(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "14/05/2025",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Sucursal: ",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                            text: "1. PUBLICO EN GENERAL",
                          ),
                          readOnly: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "RFC:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                            text: "XAXX010101000",
                          ),
                          readOnly: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Atención a:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(child: TextField()),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Lista de precios:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: DropdownButton(
                          iconSize: 22.sp,
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                          value: _precio,
                          items:
                              listaPrecios
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e['id'],
                                      child: Text("${e['id']}. ${e['nombre']}"),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (Object? value) {
                            setState(() {
                              _precio = value! as int;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Moneda:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: DropdownButton(
                          iconSize: 22.sp,
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                          value: _moneda,
                          items:
                              listaMonedas
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e['id'],
                                      child: Text("${e['id']}. ${e['nombre']}"),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (Object? value) {
                            setState(() {
                              _moneda = value! as int;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Descuento:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(child: TextField()),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Paridad:",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(child: TextField()),
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
                            EdgeInsets.symmetric(
                              horizontal: 30.w,
                              vertical: 10.h,
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary,
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
