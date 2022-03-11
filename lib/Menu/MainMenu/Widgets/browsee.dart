import 'package:bugarin_app/Menu/GetStarted/list.dart';
import 'package:bugarin_app/Menu/MainMenu/Widgets/belomjadi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  const Browse({Key? key}) : super(key: key);

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  final _browse = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _browse.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _browse,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 3)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey, width: 3)),
                hintText: 'Search',
                fillColor: Colors.grey.shade400,
              ),
            ),
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (() => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (builder) => Yahahahahahaha()))),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                browse.elementAt(index).elementAt(1)))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                          child: Text(
                            browse.elementAt(index).elementAt(0),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 8,
                );
              },
              itemCount: browse.length),
        )
      ],
    );
  }
}
