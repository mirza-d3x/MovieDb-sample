import 'package:apisample/Model/TrendingModel.dart';
import 'package:apisample/Provider/providertrending.dart';
import 'package:apisample/Provider/tvShowsProvider.dart';
import 'package:apisample/UI/MovieDetails/ScreenMovieDetails.dart';
import 'package:apisample/UI/SearchScreen/searchScreen.dart';
import 'package:apisample/UI/TvShows/tvShowsDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String baseUrl = "https://image.tmdb.org/t/p/w185";

class _MyHomePageState extends State<MyHomePage> {
  TrendingModel? testModel;
  bool loading = true;

  @override
  void initState() {
    final trendingProvider =
        Provider.of<TrendingProvider>(context, listen: false);
    trendingProvider.getTrendingMovieData(context);

    final tvShowsProvider =
        Provider.of<TvShowsProvider>(context, listen: false);
    tvShowsProvider.getTvShowData(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trendingProvider = Provider.of<TrendingProvider>(context);
    final tvshowsProvider = Provider.of<TvShowsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("The Movie DB"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Movies & Tv Shows",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const ScreenSearch(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Top Rated Tv Shows",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              tvshowsProvider.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      height: MediaQuery.of(context).size.height* .40,

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            trendingProvider.trendingModel.results!.length,
                        itemBuilder: ((BuildContext context, index) =>
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => ScreenTvShowDetails(
                                    id: tvshowsProvider
                                        .tvshowsModel.results![index].id
                                        .toString(),
                                  ),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                // height: MediaQuery.of(context).size.height *
                                //     .30,
                                width: MediaQuery.of(context).size.width * .60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: NetworkImage(baseUrl +
                                            tvshowsProvider.tvshowsModel
                                                .results![index].posterPath
                                                .toString()),
                                        fit: BoxFit.cover)),
                              ),
                            )),
                      ),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Trending Movies",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              trendingProvider.loading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: trendingProvider.trendingModel.results!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 20,
                              childAspectRatio: .65,
                              mainAxisSpacing: 20),
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => ScreenMovieDetails(
                                id: trendingProvider
                                    .trendingModel.results![index].id
                                    .toString(),
                              ),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(baseUrl +
                                        trendingProvider.trendingModel
                                            .results![index].posterPath
                                            .toString()))),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
