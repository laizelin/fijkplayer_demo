import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: VideoPage(),
    );
  }
}

class VideoPage extends StatelessWidget {
  final String videoUrl =
      //'http://v.jstv.com/a/20230815/1692063007188.shtml';
      'https://cn-sxxa-cu-02-02.bilivideo.com/upgcxcode/85/64/1247886485/1247886485-1-16.mp4?e=ig8euxZM2rNcNbRVhwdVhwdlhWdVhwdVhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1693156021&gen=playurlv2&os=bcache&oi=3704020481&trid=0000b26dccdf12744f6595bf84381464d150h&mid=0&platform=html5&upsig=ba1c80a6baca7908fd58211a403eee19&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,mid,platform&cdnid=86604&bvc=vod&nettype=0&f=h_0_0&bw=51611&logo=80000000';
  //'https://cn-sxxa-cu-02-02.bilivideo.com/upgcxcode/85/64/1247886485/1247886485-1-16.mp4?e=ig8euxZM2rNcNbRVhwdVhwdlhWdVhwdVhoNvNC8BqJIzNbfq9rVEuxTEnE8L5F6VnEsSTx0vkX8fqJeYTj_lta53NCM=&uipk=5&nbs=1&deadline=1693156021&gen=playurlv2&os=bcache&oi=3704020481&trid=0000b26dccdf12744f6595bf84381464d150h&mid=0&platform=html5&upsig=ba1c80a6baca7908fd58211a403eee19&uparams=e,uipk,nbs,deadline,gen,os,oi,trid,mid,platform&cdnid=86604&bvc=vod&nettype=0&f=h_0_0&bw=51611&logo=80000000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Page")),
      body: Center(
        child: VideoScreen(url: videoUrl),
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  final String url;

  VideoScreen({required this.url});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.url, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FijkView(
        player: player,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
