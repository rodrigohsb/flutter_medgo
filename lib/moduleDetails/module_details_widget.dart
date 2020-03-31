import 'package:flutter/material.dart';
import '../domain/activity.dart';
import 'service/module_details_service.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ModuleDetailsStatefulWidget extends StatefulWidget {
  ModuleDetailsStatefulWidget(this.courseId);
  final courseId;

  @override
  State<StatefulWidget> createState() => ModuleDetailsWidget(this.courseId);
}

class ModuleDetailsWidget extends State<ModuleDetailsStatefulWidget> {
  ModuleDetailsWidget(this.courseId);

  final courseId;

  var future;

  final moduleDetailsService = ModuleDetailsService();

  @override
  void initState() {
    super.initState();
    future = moduleDetailsService.retrieveDetails(courseId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        return snapshot.hasError
        ?Text("${snapshot.error}")
        :snapshot.hasData
        ?ListItems(activities: snapshot.data)
        :Center(child: CircularProgressIndicator());
      });
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem({this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        key: PageStorageKey<Activity>(activity),
        title: Text(activity.title),
        children: <Widget>[
          _getWidgetByType()
        ]
    );
  }

  Widget _getWidgetByType(){
    switch(activity.type.content){
      case "video":
        return Chewie(
          VideoPlayerController.network(
              activity.content
          ),
          aspectRatio: 3 / 2,
          autoPlay: false,
          looping: false,
          autoInitialize: true,
          materialProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.blue,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.lightGreen,
          )
        );
      default:
        return Text(activity.content);
    }
  }
}

class ListItems extends StatelessWidget {

  ListItems({this.activities});
  final activities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (BuildContext context, int index) =>
          EntryItem(activity: activities[index])
    );
  }
}