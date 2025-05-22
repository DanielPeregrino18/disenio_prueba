import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarClientes extends StatefulWidget {
  const SearchBarClientes({Key? key}) : super(key: key);

  @override
  _SearchBarClientesState createState() => _SearchBarClientesState();
}

class _SearchBarClientesState extends State<SearchBarClientes> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SearchAnchor.bar(
        barTextStyle: WidgetStatePropertyAll(GoogleFonts.montserrat(fontSize: 15.sp)),
        viewHeaderTextStyle: GoogleFonts.montserrat(fontSize: 15.sp),
        barSide: WidgetStatePropertyAll(
          BorderSide(color: Colors.black),
        ),
        isFullScreen: false,
        barPadding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 5),
        ),
        barShape: WidgetStatePropertyAll(
          OutlinedBorder.lerp(
            ContinuousRectangleBorder(),
            ContinuousRectangleBorder(),
            0,
          ),
        ),
        barElevation: WidgetStatePropertyAll(0),
        barBackgroundColor: WidgetStatePropertyAll(
          Colors.transparent,
        ),
        viewBackgroundColor: Colors.white,
        suggestionsBuilder: (context, controller) {
          return [
            ListTile(
              onTap: () {},
              title: Text("1. VISA CFSA", style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CARNES FINAS SAN ANDRES, S.A. DE C.V.", style: GoogleFonts.montserrat(fontSize: 12.sp),),
                  Text("CFS881114KWA", style: GoogleFonts.montserrat(fontSize: 12.sp)),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text("1. VISA CFSA", style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CARNES FINAS SAN ANDRES, S.A. DE C.V.", style: GoogleFonts.montserrat(fontSize: 12.sp),),
                  Text("CFS881114KWA", style: GoogleFonts.montserrat(fontSize: 12.sp)),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text("1. VISA CFSA", style: GoogleFonts.montserrat(fontSize: 14.sp, fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CARNES FINAS SAN ANDRES, S.A. DE C.V.", style: GoogleFonts.montserrat(fontSize: 12.sp),),
                  Text("CFS881114KWA", style: GoogleFonts.montserrat(fontSize: 12.sp)),
                ],
              ),
            ),
          ];
        },
      ),
    );
  }
}
