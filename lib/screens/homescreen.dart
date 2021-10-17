import 'package:flutter/material.dart';
import 'package:nasa_demo/model/nasa.dart';
import 'package:nasa_demo/providers/nasa_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;

  @override
  void initState() {
    super.initState();
   Provider.of<NasaProvider>(context, listen: false).getNasaData;
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<NasaProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: postMdl.finalData.title != null ?  Column(
            children: [
              Text("Title : "+postMdl.finalData.title!),
              const SizedBox(height: 20,),
              Text("explanation : "+postMdl.finalData.explanation!),
              const SizedBox(height: 20,),
              Text("date : "+postMdl.finalData.date!),
            ],
          ) : Center(child: CircularProgressIndicator(),),
        ),
      ),
    );
  }
}
