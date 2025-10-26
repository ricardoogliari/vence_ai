import 'package:flutter/material.dart';
import 'package:vence_ai/widgets/va_elevattedbutton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Image.asset(
                'assets/images/welcome.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 48.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Vence Aí!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black, // Cor do texto
                      height: 1.2, // Ajusta a altura da linha
                    ),
                  ),

                  SizedBox(height: 16.0), // Espaço entre título e subtítulo
                  Text(
                    'Conectamos você a estabelecimentos com\nprodutos próximos do vencimento, com\ndescontos incríveis.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Color(
                        0xFF4A4A4A,
                      ), // Um cinza escuro para o corpo do texto
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 32.0),
              child: SizedBox(
                height: 56.0, // Altura do botão
                child: VAElevattedbutton(
                  onPressed: _handleStart,
                  title: 'Começar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleStart() {
    debugPrint('Botão "Começar" pressionado!');
  }
}
