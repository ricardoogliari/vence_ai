import 'package:flutter/material.dart';
import 'package:vence_ai/desygnsystem/colors.dart';

class VAElevattedbutton extends ElevatedButton {
  VAElevattedbutton({
    super.key,
    required super.onPressed,
    required String title,
  }) : super(
         style: ElevatedButton.styleFrom(
           backgroundColor: primaryGreen, // Cor de fundo do botão (verde)
           foregroundColor: Colors.white, // Cor do texto/ícone (branco)
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(
               12.0,
             ), // Borda levemente arredondada
           ),
           elevation: 0,
         ),
         child: Text(
           title,
           style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
         ),
       );
}
