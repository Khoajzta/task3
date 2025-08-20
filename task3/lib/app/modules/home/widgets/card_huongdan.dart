import 'package:flutter/material.dart';
import 'package:task3/app/data/models/item_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardCongthuc extends StatelessWidget {
  final Meal meal;
  const CardCongthuc({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: SizedBox(
        width: 206,
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubeVideoCard(
              url: meal.strYoutube.toString(),
              width: 300,
              height: 110,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1 tiếng 20 phút',
                        style: TextStyle(
                          color: Color(0XFF0043B3),
                          fontSize: 12,
                        ),
                      ),
                      Icon(Icons.favorite_border_outlined),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Cách chiên trứng một cách cung phu ',
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle, color: Color(0xffCEA700)),
                      SizedBox(width: 20),
                      Text(
                        'Điinh Trọng Phúc',
                        style: TextStyle(
                          color: Color(0xffCEA700),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubeVideoCard extends StatefulWidget {
  final String url;
  final String? title;
  final double borderRadius;
  final double? width;
  final double? height;

  const YoutubeVideoCard({
    super.key,
    required this.url,
    this.title,
    this.borderRadius = 16,
    this.width,
    this.height,
  });

  @override
  State<YoutubeVideoCard> createState() => _YoutubeVideoCardState();
}

class _YoutubeVideoCardState extends State<YoutubeVideoCard> {
  late final String? _videoId;
  YoutubePlayerController? _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoId = YoutubePlayer.convertUrlToId(widget.url);
  }

  void _startVideo() {
    if (_videoId != null && _videoId.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: _videoId,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
      );
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double w = widget.width ?? 300;
    final double h = widget.height ?? 200;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          if (widget.title != null)
            Text(widget.title!, style: Theme.of(context).textTheme.titleMedium),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            width: w,
            height: h,
            child: _isPlaying && _controller != null
                ? YoutubePlayer(
                    controller: _controller!,
                    showVideoProgressIndicator: true,
                  )
                : Stack(
                    fit: StackFit.expand,
                    children: [
                      // Ảnh thumbnail
                      if (_videoId != null)
                        Image.network(
                          "https://img.youtube.com/vi/$_videoId/0.jpg",
                          fit: BoxFit.cover,
                        )
                      else
                        const Center(child: Text("Link không hợp lệ")),
                      // Nút Play
                      Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 64,
                          ),
                          onPressed: _startVideo,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
