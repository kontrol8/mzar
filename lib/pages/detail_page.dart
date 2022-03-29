import 'package:flutter/material.dart';
import 'package:mzar/pages/ticket_page.dart';
import 'package:mzar/widgets/app_buttons.dart';
import 'package:mzar/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int rateStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 270,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/wahi.png"),
                )),
              ),
            ),
            Positioned(
              top: 35,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35)),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 15, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "معرض الوحي",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 22,
                                fontFamily: "Janna",
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "25 ر.س.",
                            style: TextStyle(
                                color: Color.fromRGBO(
                                  150,
                                  126,
                                  80,
                                  5,
                                ),
                                fontSize: 22,
                                fontFamily: "Janna",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: Color.fromRGBO(
                              150,
                              126,
                              80,
                              5,
                            ),
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "مكة المكرمة",
                            style: TextStyle(
                              color: Color.fromRGBO(
                                150,
                                126,
                                80,
                                5,
                              ),
                              fontSize: 12,
                              fontFamily: "Janna",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,
                                  color: index < rateStars
                                      ? Colors.yellow.shade800
                                      : Colors.grey);
                            }),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "(4.7)",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Janna",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "عدد الاشخاص",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontFamily: "Janna",
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "عدد الاشخاص في المجموعة",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: "Janna",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                text: (index + 1).toString(),
                                size: 45,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Color.fromRGBO(150, 126, 80, 5)
                                    : Color.fromRGBO(240, 236, 230, 5),
                                borderColor: selectedIndex == index
                                    ? Color.fromRGBO(150, 126, 80, 5)
                                    : Color.fromRGBO(240, 236, 230, 5),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "عن المعرض",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontFamily: "Janna",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        child: Text(
                          "يرتبط المشروع بغار حراء، وهو المكان الذي ابتدأ فيه نزول الوحي على النبــي ؛ لذا؛ كــان مـوضـوع الوحي المحور الأساس في هذا المكون المهم من مكونات المشروع، وهو معرض الوحي.",
                          style: TextStyle(fontFamily: "Janna"),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppButton(
                        isIcon: true,
                        icon: Icons.favorite_border_outlined,
                        size: 40,
                        color: Color.fromRGBO(150, 126, 80, 5),
                        backgroundColor: Colors.white,
                        borderColor: Color.fromRGBO(150, 126, 80, 5)),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Directionality(
                            textDirection: TextDirection.rtl,
                            child: const TicketPAge(),
                          ),
                        ),
                      ),
                      child: ResponsiveButton(
                          width: 200, isResponsive: true, text: " احجزالان"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
