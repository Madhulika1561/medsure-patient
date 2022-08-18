

import 'package:medsure_patient/res/app_images.dart';

class VideoPlayerModel{

  final mediaUrl;
  String thumbUrl;

  VideoPlayerModel({required this.mediaUrl,required this.thumbUrl});


  static List<VideoPlayerModel> getVideoList(){

    List<VideoPlayerModel> list = [];

     list.add(VideoPlayerModel(mediaUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
         thumbUrl: AppImages.videoImg));
    list.add(VideoPlayerModel(mediaUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        thumbUrl: AppImages.videoImg));
    list.add(VideoPlayerModel(mediaUrl: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
        thumbUrl: AppImages.videoImg));

    return list;

  }

}