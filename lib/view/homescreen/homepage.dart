import 'package:flutter/material.dart';
import 'package:musicplayer/controller/homescreencontroller.dart';
import 'package:musicplayer/controller/playercontroller.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = context.read<HomeScreenController>();
    return Consumer<HomeScreenController>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (value.songs.isEmpty) {
          return const Center(
            child: Text('No music found'),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) => SongListItem(
            song: value.songs[index],
          ),
          itemCount: value.songs.length,
        );
      },
    );
  }
}

class SongListItem extends StatelessWidget {
  const SongListItem({
    super.key,
    required this.song,
  });

  final SongModel song;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<AudioPlayerController>().onAudioTouch(song);
      },
      leading: QueryArtworkWidget(
        id: song.id,
        type: ArtworkType.AUDIO,
      ),
      title: Text(song.title),
    );
  }
}
