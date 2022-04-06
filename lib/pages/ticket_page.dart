import 'package:flutter/material.dart';
import 'package:SAMAYA/misc/app_colors.dart';
import 'package:SAMAYA/widgets/app_text.dart';

import 'package:qr_flutter/qr_flutter.dart';

class TicketPAge extends StatelessWidget {
  const TicketPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.AppMainColor,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppText("تذكرة دخول", AppColors.AppMainColor, 25),
                      AppText("معرض الوحي - عدد الأشخاص 3", Colors.black, 18),
                      AppText(" وقت الدخول 5:30 مساءا", Colors.redAccent, 18),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
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
            ),
          ],
        ),
      ),
    );
  }
}
