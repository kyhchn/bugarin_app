import 'package:bugarin_app/Menu/MainMenu/Widgets/belomjadi.dart';
import 'package:bugarin_app/Menu/MainMenu/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Insight extends StatelessWidget {
  const Insight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            height: 4,
            color: Colors.grey.shade100,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eat right',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
          ),
          Container(
            height: 210,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => Yahahahahahaha())),
                      child: Container(
                        height: 206,
                        width: 163,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 2,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 163,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage(eatRight
                                          .elementAt(index)
                                          .elementAt(1)),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                              child: Text(
                                eatRight.elementAt(index).elementAt(0),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  itemCount: eatRight.length),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 490,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                      boxShadow: [
                      
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'COVID-19',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => Yahahahahahaha())),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      covidCard.elementAt(0).elementAt(0),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              height: 190,
                              width: 235,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          covidCard.elementAt(0).elementAt(1)))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => Yahahahahahaha())),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      covidCard.elementAt(1).elementAt(0),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              height: 190,
                              width: 235,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          covidCard.elementAt(1).elementAt(1)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200,
                      
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'COVID-19',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => Yahahahahahaha())),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      covidCard.elementAt(0).elementAt(0),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              height: 190,
                              width: 235,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          covidCard.elementAt(0).elementAt(1)))),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => Yahahahahahaha())),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      covidCard.elementAt(1).elementAt(0),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              height: 190,
                              width: 235,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          covidCard.elementAt(1).elementAt(1)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
