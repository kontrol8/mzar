import 'package:flutter/material.dart';
import 'package:mzar/widgets/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketPAge extends StatelessWidget {
  const TicketPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("مبروك تم حجز التذكرة"),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.6),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: QrImage(
                  data: "Kontrol8",
                  version: 4,
                  errorCorrectionLevel: QrErrorCorrectLevel.H,
                  foregroundColor: AppColors.AppMainColor,
                  size: 270.0,
                  gapless: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
