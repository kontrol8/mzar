import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzar/misc/app_colors.dart';
import 'package:mzar/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var tabShowroom = {"wahi.png": "معرض الوحي"};
  var tabMuseum = {
    "salam.png": "متحف السلام",
    "safiya.png": "متحف الصافية",
    "jouf.png": "متحف الجوف",
    "tabuk.png": "متحف تبوك"
  };
  var tabGlobe = {"wahi.png": "معرض الوحي", "safiya.png": "متحف الصافية"};
  var menuIcons = {
    "museum.svg": "معارض ومتاحف",
    "makkah.svg": "معالم مكة المكرمة",
    "madinah.svg": "معالم المدينة المنورة",
    "activity.svg": "أنشطة",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, right: 30),
                child: Row(
                  children: [
                    Icon(Icons.menu, size: 40, color: Colors.black54),
                    Expanded(child: Container()),
                    Container(
                      height: 55,
                      width: 55,
                      margin: const EdgeInsets.only(left: 30),
                      child: DecoratedBox(
                        child: Image(
                          image: AssetImage("assets/images/person.png"),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(150, 126, 80, 5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Text(
                  "اكتشف",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontFamily: "Janna",
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                child: Align(
                  //alignment: Alignment.centerRight,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    labelPadding: const EdgeInsets.only(right: 30, left: 30),
                    // indicatorPadding:
                    //     const EdgeInsets.only(right: 30, left: 30),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4.5,
                    indicatorColor: Color.fromRGBO(150, 126, 80, 100),
                    labelStyle: TextStyle(
                        fontFamily: "Janna",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        text: 'معالم',
                      ),
                      Tab(
                        text: "معارض",
                      ),
                      Tab(
                        text: "متاحف",
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: const DetailPage(),
                    ),
                  ),
                ), //navigator.push
                child: Container(
                  height: 250,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(right: 10),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: tabGlobe.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/" +
                                      tabGlobe.keys.elementAt(index)),
                                  fit: BoxFit.cover),
                            ),
                            child: Container(
                              height: 250,
                              width: 180,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    tabGlobe.values.elementAt(index),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Janna",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: tabShowroom.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/" +
                                      tabShowroom.keys.elementAt(index)),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: tabMuseum.length,
                        scrollDirection: Axis.horizontal,
                        //reverse: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 20),
                            width: 180,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/" +
                                      tabMuseum.keys.elementAt(index)),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "عرض المزيد",
                      style: TextStyle(
                          fontFamily: "Janna",
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "+الكل",
                      style: TextStyle(
                          fontFamily: "Janna",
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 165,
                margin: const EdgeInsets.only(right: 20),
                width: double.maxFinite,
                child: Container(
                  width: double.maxFinite,
                  //padding: const EdgeInsets.only(right: 10),
                  child: ListView.builder(
                    itemCount: menuIcons.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 25, left: 25),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.AppIconColors[index]),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                "assets/svg/" + menuIcons.keys.elementAt(index),
                                matchTextDirection: true,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 60,
                            child: Text(
                              menuIcons.values.elementAt(index),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "janna",
                                  color: Colors.black45,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              //  softWrap: false,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
