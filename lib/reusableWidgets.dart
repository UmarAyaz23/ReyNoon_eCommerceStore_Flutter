import 'package:flutter/material.dart';
import 'package:ecommerce_project/main.dart';

class ReusableWidgets {
  // 1. Elevated Buttons
  static Widget transparentElevatedButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: gold,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: gold, width: 1),
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      onPressed: onPressed,
      child: bodyText(text: label, color: gold),
    );
  }

  static Widget filledElevatedButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        backgroundColor: gold,
        shape: RoundedRectangleBorder(
          side: const BorderSide(style: BorderStyle.none, width: 0),
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      onPressed: onPressed,
      child: bodyText(text: label, color: white),
    );
  }


  // 2. Body Text
  static Widget bodyText({
    required String text,
    required Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: color,
        fontFamily: "Nunito-VariableFont_wght"
      ),
    );
  }


  // 2. Head Text
  static Widget headText({
    required String text,
    required Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  // 2. Special Text
  static Widget specialText({
    required String text,
    required Color color,
    required double fontSize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: color,
        fontFamily: "Nunito-VariableFont_wght",
        overflow: TextOverflow.fade
      ),
      textAlign: TextAlign.center,
      maxLines: null,
    );
  }
}
