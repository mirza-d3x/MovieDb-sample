import 'package:apisample/Provider/searchProvider.dart';
import 'package:apisample/UI/HomePage/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

bool search = true;

// ${searPrv.searchModel.results!.length.toString()}
class _ScreenSearchState extends State<ScreenSearch> {
  @override
  Widget build(BuildContext context) {
    final searPrv = Provider.of<SearchProvider>(context);
    return SafeArea(
      child: Scaffold(
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
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Movies & Tv Shows",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  final seahPrv =
                      Provider.of<SearchProvider>(context, listen: false);
                  seahPrv.getSearchResultsProv(context, value);
                  print('fromTextfield$value');
                  setState(() {
                    search = false;
                  });
                },
              ),
            ),
            search
                ? Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Text(
                      'Your Search Result will apear here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  )
                : ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Found ${searPrv.searchModel.results!.length.toString()} Results',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      searPrv.loading
                          ? const Center(
                              child: const CircularProgressIndicator(),
                            )
                          : SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          childAspectRatio: 0.60),
                                  itemCount:
                                      searPrv.searchModel.results!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        .050,
                                    width: MediaQuery.of(context).size.width /
                                        .030,
                                    child: Column(
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                            baseUrl +
                                                searPrv.searchModel
                                                    .results![index].posterPath
                                                    .toString(),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              .030,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
