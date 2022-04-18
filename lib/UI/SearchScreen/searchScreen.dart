import 'dart:ui';

import 'package:apisample/Provider/SearchResults/searchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

late String searchQuery;

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  void initState() {
    final seahPrv = Provider.of<SearchProvider>(context, listen: false);
    seahPrv.getSearchResultsProv(context, searchQuery);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searPrv = Provider.of<SearchProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Movies & Tv Shows",
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) => setState(() {
                searchQuery = value;
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "Found 12 Results",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.60),
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) => Container(
                  height: MediaQuery.of(context).size.height / .050,
                  width: MediaQuery.of(context).size.width / .030,
                  // decoration: BoxDecoration(image: NetworkImage()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
