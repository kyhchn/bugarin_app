import 'package:bugarin_app/Menu/MainMenu/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailsRecipes extends StatefulWidget {
  const DetailsRecipes({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<DetailsRecipes> createState() => _DetailsRecipesState();
}

class _DetailsRecipesState extends State<DetailsRecipes> {
  int _isClicked = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 190,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                imageDetails.elementAt(widget.index)))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            trendingRecipes
                                .elementAt(widget.index)
                                .elementAt(0),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Image.asset('assets/caloriesFood/button.png')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _isClicked = index;
                              });
                            },
                            child: Container(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    appbarRecipes.elementAt(index),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: index == _isClicked
                                            ? Colors.black
                                            : Colors.grey,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: index == _isClicked
                                              ? Colors.black
                                              : Colors.transparent,
                                          width: 4))),
                            ),
                          );
                        },
                        itemCount: appbarRecipes.length,
                      ),
                    ),
                  ),
                  _isClicked == 0
                      ? Container()
                      : _isClicked == 1
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                height: 600,
                                child: ListView.separated(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'STEP ' + (index + 1).toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              stepRecipes
                                                  .elementAt(widget.index)
                                                  .elementAt(index),
                                              style: TextStyle(fontSize: 17),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 20,
                                      );
                                    },
                                    itemCount: stepRecipes
                                        .elementAt(widget.index)
                                        .length),
                              ),
                            )
                          : Container()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
