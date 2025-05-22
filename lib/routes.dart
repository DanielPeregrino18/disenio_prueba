
import 'package:disenio_prueba/home/crear_cotizacion/crear_cotizacion.dart';
import 'package:disenio_prueba/home/crear_cotizacion/crear_cotizacion_articulos.dart';
import 'package:disenio_prueba/home/crear_cotizacion/crear_cotizacion_domicilio.dart';
import 'package:disenio_prueba/home/crear_cotizacion/crear_cotizacion_fechas.dart';
import 'package:disenio_prueba/home/crear_cotizacion/crear_cotizacion_totales.dart';
import 'package:disenio_prueba/home/home.dart';
import 'package:disenio_prueba/home/ver_cotizacion/ver_cotizacion.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

import 'home/crear_cotizacion/crear_cotizacion_finalizada.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'crear',
          builder: (BuildContext context, GoRouterState state) {
            return const CrearCotizacion();
          },
          routes: <RouteBase>[
            GoRoute(
                path: 'domicilio',
                builder: (BuildContext context, GoRouterState state) {
                  return const CrearCotizacionDomicilio();
                },
                pageBuilder: GoTransitions.invisible.call
            ),
            GoRoute(
                path: 'fechas',
                builder: (BuildContext context, GoRouterState state) {
                  return const CrearCotizacionFechas();
                },
                pageBuilder: GoTransitions.invisible.call
            ),
            GoRoute(
                path: 'articulos',
                builder: (BuildContext context, GoRouterState state) {
                  return const CrearCotizacionArticulos();
                },
                pageBuilder: GoTransitions.invisible.call
            ),
            GoRoute(
                path: 'totales',
                builder: (BuildContext context, GoRouterState state) {
                  return const CrearCotizacionTotales();
                },
                pageBuilder: GoTransitions.invisible.call
            ),
            GoRoute(
                path: 'final',
                builder: (BuildContext context, GoRouterState state) {
                  return const CrearCotizacionFinalizada();
                },
                pageBuilder: GoTransitions.invisible.call
            )
          ]
        ),
        GoRoute(
            path: 'ver',
            builder: (BuildContext context, GoRouterState state) {
              return const VerCotizacion();
            },
        )
      ],
    ),
  ],
);