import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imusix/services/api_service.dart';

import '../models/music_data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Results results;
  late Future<MusicDataResponseModel> _musicData;

  @override
  void initState() {
    super.initState();
    _musicData = APIService().musicData();
    APIService().musicData();
    results = const Results(name: '', image: '', price: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 56,
        backgroundColor: const Color(0xffffffff),
        flexibleSpace: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            alignment: FractionalOffset.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      height: 24,
                      child:
                          Image(image: AssetImage('assets/logo/banner.png'))),
                ],
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<MusicDataResponseModel>(
          future: _musicData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.resultCount,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        onTap: () async {},
                        title: Row(
                          children: [
                            Text(
                              snapshot.data!.results[index].name,
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            CachedNetworkImage(
                                imageUrl: snapshot.data!.results[index].image)
                          ],
                        ),
                        trailing: Text(
                          snapshot.data!.results[index].price,
                          style: TextStyle(fontSize: 15),
                        ));
                  });
            } else {
              return Container();
            }
          }),
    );
  }
}
