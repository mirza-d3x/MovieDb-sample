import 'package:apisample/Provider/tvShowDetailsProvider.dart';
import 'package:apisample/UI/HomePage/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTvShowDetails extends StatefulWidget {
  ScreenTvShowDetails({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<ScreenTvShowDetails> createState() => _ScreenTvShowDetails();
}

class _ScreenTvShowDetails extends State<ScreenTvShowDetails> {
  @override
  void initState() {
    final tvShDetProv =
        Provider.of<TvShowDetailsProvider>(context,listen: false);
    tvShDetProv.getTvShDePro(context, widget.id);
    // TODO: implement initState
    super.initState();
  }

  bool toggleTF = false;

  @override
  Widget build(BuildContext context) {
    final tvShDetProv =
        Provider.of<TvShowDetailsProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: tvShDetProv.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .40,
                    width: MediaQuery.of(context).size.width * .30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          baseUrl +
                              tvShDetProv.tvShowsDetailsModel.posterPath
                                  .toString(),
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    tvShDetProv.tvShowsDetailsModel.name.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RunTime:" +
                            tvShDetProv.tvShowsDetailsModel.episodeRunTime
                                .toString() +
                            " min",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Release Date" +
                            tvShDetProv.tvShowsDetailsModel.firstAirDate
                                .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Average Vote" +
                            tvShDetProv.tvShowsDetailsModel.voteAverage
                                .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        tvShDetProv.tvShowsDetailsModel.overview.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            overflow: toggleTF
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis),
                        maxLines: toggleTF ? null : 2,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              toggleTF = !toggleTF;
                            });
                          },
                          child: Text(
                            toggleTF ? "Show less" : "Show more",
                          ))
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
