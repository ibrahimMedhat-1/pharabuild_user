import 'package:flutter/material.dart';
import 'package:insurance_card_scanner/insurance_card_scanner.dart';

class CardScannerPage extends StatelessWidget {
  const CardScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CardScanner(
          sessionToken: 'secret_test_jmYWGEfm2dxpDL3H',
          debug: true,
          live: true,
          onCardScanError: (error) {
            print("=================$error");
            Navigator.pop(context);
          },
          onCardScanSuccess: (scannedCard) {
            print(scannedCard);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
