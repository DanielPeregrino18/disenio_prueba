import 'package:disenio_prueba/home/card_cotizacion.dart';
import 'package:disenio_prueba/home/ver_cotizacion/widgets/articulos_search_bar.dart';
import 'package:disenio_prueba/home/widgets/search_bar_clientes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/card_articulo.dart';

class VerCotizacion extends StatefulWidget {
  const VerCotizacion({Key? key}) : super(key: key);

  @override
  _VerCotizacionState createState() => _VerCotizacionState();
}

class _VerCotizacionState extends State<VerCotizacion> {
  int _currentStep = 0;
  bool checkedValue = false;
  bool checkedValue2 = false;
  final String alm = 'REFRI-GOMEZ';
  TableRow tableRow(ColorScheme theme, String left, Widget right, bool colored) {
    return TableRow(
      decoration: BoxDecoration(
        color: colored ? theme.primary.withAlpha(30) : Colors.transparent,
      ),
      children: [
        TableCell(
          child: SizedBox(
            height: 55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        TableCell(
          child: Padding(padding: const EdgeInsets.all(3), child: right),
        ),
      ],
    );
  }

  void mostrarMenu(Widget menu) {
    showModalBottomSheet(
      useSafeArea: true,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return menu;
      },
    );
  }

  final String fechaInicial = '29/05/2023';
  List<CardArticulo> articulos = [];
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cotización",
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Stepper(
          onStepTapped: (int newIndex) {
            setState(() {
              _currentStep = newIndex;
            });
          },
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep != 5) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              Navigator.pop(context);
              //modalButtonSheetFullScreen(ConfirmationWidget(theme: theme));
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child:
                  _currentStep == 0
                      ? ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: const Text('Siguiente'),
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: details.onStepCancel,
                            child: const Text('Atrás'),
                          ),
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: Text(
                              _currentStep == 6 ? 'Finalizar' : 'Siguiente',
                            ),
                          ),
                        ],
                      ),
            );
          },
          type: StepperType.vertical,
          steps: [
            Step(
              isActive: _currentStep >= 0,
              title: const Text('Datos de la Cotización'),
              subtitle: Text('1/4'),
              content: Table(
                columnWidths: {
                  0: FractionColumnWidth(.35),
                  1: FlexColumnWidth(),
                },
                children: [
                  tableRow(
                    theme,
                    'Almacén',
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        alm,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        //mostrar almacenes en un carrusel
                      },
                    ),
                    true,
                  ),
                  tableRow(theme, 'Cliente', SearchBarClientes(), false),
                  tableRow(
                    theme,
                    'Vendedor',
                    TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: "578. ANAIS_ESTRADA.",
                      ),
                    ),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Sucursal',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(
                        text: "1- CLIENTE DE CONTADO",
                      ),
                    ),
                    false,
                  ),
                  tableRow(
                    theme,
                    'Atención a',
                    TextField(enabled: false),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Dirección',
                    TextField(enabled: false),
                    false,
                  ),
                  tableRow(
                    theme,
                    'Lista de Precios',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(text: "PR. AL PUBLICO"),
                    ),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Vigencia',
                    TextButton(
                      child: Text(
                        fechaInicial,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        /* showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime.now(),
                        );*/
                      },
                    ),
                    false,
                  ),
                ],
              ),
            ),
            Step(
              isActive: _currentStep >= 1,
              title: Text('Datos de la cotización'),
              subtitle: Text("2/4"),
              content: Table(
                columnWidths: {
                  0: FractionColumnWidth(.35),
                  1: FlexColumnWidth(),
                },
                children: [
                  tableRow(
                    theme,
                    'Fecha de Registro',
                    TextButton(
                      child: Text(
                        fechaInicial,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        /* showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime.now(),
                        );*/
                      },
                    ),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Fecha O.C',
                    TextButton(
                      child: Text(
                        fechaInicial,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        /*showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime.now(),
                        );*/
                      },
                    ),
                    false,
                  ),
                  tableRow(
                    theme,
                    'No. de Serie',
                    TextField(enabled: false),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Orden Compra',
                    TextField(enabled: false),
                    false,
                  ),
                  tableRow(
                    theme,
                    'Archivo Orden C.',
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.upload, color: theme.primary),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                      ),
                    ),
                    true,
                  ),
                ],
              ),
            ),
            Step(
              isActive: _currentStep >= 2,
              title: Text("Datos de la Cotización"),
              subtitle: Text("3/4"),
              content: Table(
                columnWidths: {
                  0: FractionColumnWidth(.35),
                  1: FlexColumnWidth(),
                },
                children: [
                  tableRow(theme, 'Cotización', Text("15550"), true),
                  tableRow(
                    theme,
                    'Estatus',
                    Text('COTIZADO', style: TextStyle(color: Colors.red)),
                    false,
                  ),
                  tableRow(
                    theme,
                    'RFC',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(text: "XAXX010101000"),
                    ),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Plazo',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(text: "0"),
                    ),
                    false,
                  ),
                  tableRow(theme, 'Descuento',
                      TextFormField(
                        decoration: InputDecoration(labelText: "Descuento", floatingLabelStyle: TextStyle(fontSize: 20), border: OutlineInputBorder()),
                      ),
                      true
                  ),
                  tableRow(
                    theme,
                    'Moneda',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(text: "MXN"),
                    ),
                    false,
                  ),
                  tableRow(
                    theme,
                    'Paridad',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(text: "1.0000"),
                    ),
                    true,
                  ),
                ],
              ),
            ),
            Step(
              isActive: _currentStep >= 3,
              title: Text("Datos de la Cotización"),
              subtitle: Text("4/4"),
              content: Column(
                children: [
                  Table(
                    columnWidths: {
                      0: FractionColumnWidth(.35),
                      1: FlexColumnWidth(),
                    },
                    children: [
                      tableRow(
                        theme,
                        'Fecha I.Consigna',
                        TextButton(
                          child: Text(
                            fechaInicial,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onPressed: () {
                            /*showDatePicker(
                                context: context,
                                firstDate: DateTime(2015),
                                lastDate: DateTime.now(),
                              );*/
                          },
                        ),
                        true,
                      ),
                      tableRow(
                        theme,
                        'Fecha F.Consigna',
                        TextButton(
                          child: Text(
                            fechaInicial,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onPressed: () {
                            /*showDatePicker(
                                context: context,
                                firstDate: DateTime(2015),
                                lastDate: DateTime.now(),
                              );*/
                          },
                        ),
                        false,
                      ),
                      tableRow(theme, 'Campo Addenda', TextField(), true),
                      tableRow(theme, 'Observaciones', TextField(), false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: Text("Autorizar"),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text("Iva Total Retenido"),
                          value: checkedValue2,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue2 = newValue ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Step(
                isActive: _currentStep >= 4,
                title: Text("Domicilio"),
                content: Table(
                  columnWidths: {
                    0: FractionColumnWidth(.35),
                    1: FlexColumnWidth(),
                  },
                  children: [
                    tableRow(
                      theme,
                      'Domicilio',
                      TextField(),
                      true,
                    ),
                    tableRow(
                      theme,
                      'Colonia',
                      TextField(),
                      false,
                    ),
                    tableRow(
                      theme,
                      'Estado',
                      TextField(controller: TextEditingController(text: "CHIHUAHUA"),),
                      true,
                    ),
                    tableRow(
                      theme,
                      'Ciudad',
                      TextField(controller: TextEditingController(text: "CHIHUAHUA"),),
                      false,
                    ),
                    tableRow(
                      theme,
                      'Código Postal',
                      TextField(),
                      true,
                    ),
                    tableRow(
                      theme,
                      'Entre calles',
                      TextField(),
                      false,
                    ),
                    tableRow(
                      theme,
                      'F. Entrega',
                      FittedBox(
                        child: Row(
                          children: [
                            TextButton(onPressed: () {}, child: Text("15/05/2025")),
                            TextButton(
                              onPressed: () async {
                                final TimeOfDay? time = await showTimePicker(
                                  context: context,
                                  helpText: "Hora de entrega",
                                  confirmText: "Aceptar",
                                  cancelText: "Cancelar",
                                  hourLabelText: "Hora",
                                  minuteLabelText: "Minutos",
                                  errorInvalidText: "Formato incorrecto",
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
                      ),
                      false,
                    ),
                  ],
                )
            ),
            Step(
              isActive: _currentStep >= 5,
              title: Text('Artículos'),
              subtitle: Text('Capturar Artículos'),
              content: Column(
                spacing: 10,
                children: [
                  ArticulosSearchBar(theme: theme),
                  //ArticulosExpansionPanelList(),
                  Divider(),
                  CardCotizacion()
                ],
              ),
            ),
            Step(
              isActive: _currentStep == 6,
              title: Text('Totales'),
              content: Table(
                columnWidths: {
                  0: FractionColumnWidth(.35),
                  1: FlexColumnWidth(),
                },
                children: <TableRow>[
                  tableRow(theme, 'Subtotal', Text('\$388.90'), true),
                  tableRow(theme, '- Descuento Total', Text('\$0.00'), false),
                  tableRow(theme, '+ Ieps Total', Text('\$0.00'), true),
                  tableRow(
                    theme,
                    '+ Importe con Desc.',
                    Text('\$388.90'),
                    false,
                  ),
                  tableRow(theme, '+ IVA Total', Text('\$62.23'), true),
                  tableRow(theme, '- IVA Retenido', Text('\$0.00'), false),
                  tableRow(theme, '= Gran Total', Text('\$451.13'), true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/*
Table(
                columnWidths: {
                  0: FractionColumnWidth(.35),
                  1: FlexColumnWidth(),
                },
                children: [
                  tableRow(
                    theme,
                    'Almacén',
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        alm,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        //mostrar almacenes en un carrusel
                      },
                    ),
                    true,
                  ),
                  tableRow(theme, 'Cliente', SearchBarClientes(), false),
                  tableRow(
                    theme,
                    'Vendedor',
                    TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(), floatingLabelStyle: TextStyle(fontSize: 20), labelText: "Vendedor"),
                      readOnly: true,
                      controller: TextEditingController(
                        text: "578. ANAIS_ESTRADA.",
                      ),
                    ),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Sucursal',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(
                        text: "1- CLIENTE DE CONTADO",
                      ),
                    ),
                    false,
                  ),
                  tableRow(
                    theme,
                    'Atención a',
                    TextField(enabled: false),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Dirección',
                    TextField(enabled: false),
                    false,
                  ),
                  tableRow(
                    theme,
                    'Lista de Precios',
                    TextField(
                      enabled: false,
                      controller: TextEditingController(text: "PR. AL PUBLICO"),
                    ),
                    true,
                  ),
                  tableRow(
                    theme,
                    'Vigencia',
                    TextButton(
                      child: Text(
                        fechaInicial,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        /* showDatePicker(
                          context: context,
                          firstDate: DateTime(2015),
                          lastDate: DateTime.now(),
                        );*/
                      },
                    ),
                    false,
                  ),
                ],
              ),
 */