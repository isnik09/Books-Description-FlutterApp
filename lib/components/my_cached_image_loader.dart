import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImageLoader extends StatelessWidget {
  const MyCachedNetworkImageLoader({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl != null
          ? imageUrl!
          : 'https://th.bing.com/th/id/R.a5a3efc32135a6b4f1c3a1629af55b0b?rik=%2f%2bEoNkUWpOCMBQ&riu=http%3a%2f%2fblog.yareel.com%2fwp-content%2fuploads%2f2014%2f11%2fimg-placeholder-dark.jpg&ehk=QEyabwmTYY0CWmsQtlZFzfHGuZTGO27Le9V%2flUlEn%2bs%3d&risl=&pid=ImgRaw&r=0',
      errorWidget: (context, url, error) {
        return AspectRatio(
          aspectRatio: 2 / 3,
          child: Image.asset(
            'assets/R.jpeg',
            fit: BoxFit.cover,
          ),
        );
      },
      fit: BoxFit.cover,
      height: double.infinity,
      progressIndicatorBuilder: (context, url, progress) {
        return AspectRatio(
          aspectRatio: 2 / 3,
          child: Image.asset(
            'assets/R.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
