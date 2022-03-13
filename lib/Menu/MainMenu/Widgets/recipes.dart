import 'package:bugarin_app/Menu/MainMenu/Widgets/details_recipes.dart';
import 'package:bugarin_app/Menu/MainMenu/list.dart';
import 'package:bugarin_app/models/cahce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../Colors.dart';

class Recipes extends StatefulWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  final _searchInputController = TextEditingController();
  bool premium = cache.read('premium');
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchInputController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return premium
        ? Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find best recipes for cooking',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Container(
                            height: 40,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextField(
                                controller: _searchInputController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: primary, width: 3)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: primary, width: 3)),
                                  hintText: 'Search',
                                  fillColor: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Trending Now',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('See all')
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (builder) =>
                                                  DetailsRecipes(
                                                      index: index))),
                                      child: Container(
                                        height: 170,
                                        width: 200,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        trendingRecipes
                                                            .elementAt(index)
                                                            .elementAt(2)),
                                                  )),
                                            ),
                                            Text(
                                              trendingRecipes
                                                  .elementAt(index)
                                                  .elementAt(0),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(trendingRecipes
                                                .elementAt(index)
                                                .elementAt(1))
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 20,
                                    );
                                  },
                                  itemCount: trendingRecipes.length))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Container(
            child: Center(child: Text('Purchase to unlock this menu')),
          );
  }
}
