import 'package:disenio_prueba/home/busqueda_cliente.dart';
import 'package:disenio_prueba/home/busqueda_cotizacion.dart';
import 'package:disenio_prueba/home/busqueda_movimiento.dart';
import 'package:disenio_prueba/home/card_cotizacion.dart';
import 'package:disenio_prueba/home/ver_cotizacion/widgets/articulos_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            "Diseño prueba",
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20.sp),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          FittedBox(
            child: IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              icon: Icon(Icons.search, color: Colors.white, size: 30.sp),
            ),
          ),
          FittedBox(
            child: IconButton(
              onPressed: () {
                context.go("/crear");
              },
              icon: Icon(Icons.note_add, color: Colors.white, size: 30.sp),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 5,
          children: [BusquedaCotizacion(), Divider(), CardCotizacion()],
        ),
      ),

      endDrawer: DrawerBusqueda(
        title: "Busqueda",
        tabBars: {
          "Movimiento": BusquedaMovimiento(),
          "Cliente": BusquedaCliente(),
        },
      ),
    );
  }
}

class DrawerBusqueda extends StatelessWidget {
  final Map<String, Widget> tabBars;
  final String title;
  const DrawerBusqueda({super.key, required this.title, required this.tabBars});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 300.w,
        child: DefaultTabController(
          length: tabBars.length,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs:
                    tabBars.keys
                        .map(
                          (e) => Tab(
                            child: FittedBox(
                              child: Text(
                                e,
                                style: GoogleFonts.montserrat(fontSize: 15.sp),
                              ),
                            ),
                          ),
                        )
                        .toList(), //[
                //]
              ),
              title: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 20.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              centerTitle: true,
            ),
            body: TabBarView(
              children: tabBars.entries.map((e) => e.value).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
