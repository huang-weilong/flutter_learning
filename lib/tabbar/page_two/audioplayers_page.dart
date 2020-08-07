import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayersPage extends StatefulWidget {
  @override
  _AudioPlayersPageState createState() => _AudioPlayersPageState();
}

class _AudioPlayersPageState extends State<AudioPlayersPage> {
  AudioPlayer audioPlayer = AudioPlayer(); // 初始化
  AudioCache audioCache;
  String networkUrl =
      'https://webfs.yun.kugou.com/201912151701/2529f53a1466b58962e5a240a8a266ce/G171/M07/1F/05/i5QEAF26pGeAMPHiADWzkIj97AU712.mp3';

  @override
  void dispose() {
    audioPlayer?.release();
    audioCache?.fixedPlayer?.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('播放音频'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                audioCache = AudioCache(fixedPlayer: audioPlayer);
                this.audioCache.play('music/ljj.mp3');
              },
              child: Text('开始播放'),
            ),
            RaisedButton(
              onPressed: () {
                this.audioCache?.fixedPlayer?.pause();
              },
              child: Text('暂停'),
            ),
            RaisedButton(
              onPressed: () {
                this.audioCache?.fixedPlayer?.resume();
              },
              child: Text('继续播放'),
            ),
            RaisedButton(
              onPressed: () {
                this.audioCache?.fixedPlayer?.stop();
              },
              child: Text('停止'),
            ),
          ],
        ),
      ),
    );
  }
}
