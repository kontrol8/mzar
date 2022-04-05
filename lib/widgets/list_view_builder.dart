import 'package:flutter/material.dart';

class AppListView extends StatefulWidget {
  final String imageName;
  final String ImageText;
  final String ImagePlace;

  const AppListView(
      {Key? key,
      this.imageName = "",
      this.ImageText = "",
      this.ImagePlace = ""})
      : super(key: key);

  @override
  State<AppListView> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 180,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/" + widget.imageName),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.white.withOpacity(0.1)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.2, 0.3],
          ),
        ),
        child: Container(
          height: 250,
          width: 180,
          margin: const EdgeInsets.only(right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.ImageText,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Janna",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.white,
                    size: 12,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.ImagePlace,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Janna",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
