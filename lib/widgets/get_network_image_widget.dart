import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class GetNetworkImageWidget extends StatelessWidget {
  const GetNetworkImageWidget(
      {Key? key,
      required this.imgUrl,
      this.fit = BoxFit.fitWidth,
      this.width,
      this.height,
      this.shimmerHeight})
      : super(key: key);

  final String imgUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double? shimmerHeight;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imgUrl,
      fit: fit,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white,
        child: Container(
          height: shimmerHeight ?? double.infinity,
          width: width ?? double.infinity,
          decoration: const BoxDecoration(color: Colors.black26),
        ),
      ),
      errorWidget: (context, url, error) =>
          //  const SizedBox(
          //     width: 30, height: 30, child: Center(child: Icon(Icons.error))),

          Image.asset('assets/images/nia.jpg', fit: BoxFit.fill),
      fadeOutDuration: const Duration(milliseconds: 1500),
      fadeInDuration: const Duration(milliseconds: 1000),
    );
  }
}
