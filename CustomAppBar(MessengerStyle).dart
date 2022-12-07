import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.suffixWidget1,
    this.suffixWidget2,
    this.titleWidget,
  }) : super(key: key);
  final String? title;
  final Widget? titleWidget;
  final Widget? suffixWidget1;
  final Widget? suffixWidget2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      color: Colors.white,
      child: SafeArea(
          child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 18, right: 18),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: titleWidget == null
                      ? Container()
                      : CircleAvatar(
                          backgroundColor:
                              const Color(0xff000000).withOpacity(0.04),
                          child: titleWidget ?? Text(title!)),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  child: Text(
                    title!,
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: suffixWidget1 == null
                      ? Container()
                      : CircleAvatar(
                          backgroundColor:
                              const Color(0xff000000).withOpacity(0.04),
                          child: suffixWidget1),
                ),
                const SizedBox(
                  width: 12,
                ),
                suffixWidget2 == null
                    ? Container()
                    : Container(
                        child: CircleAvatar(
                            backgroundColor:
                                const Color(0xff000000).withOpacity(0.04),
                            child: suffixWidget2),
                      )
              ],
            ),
          )
        ]),
      )),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 54);
}
