//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medsure_patient/res/dimension.dart';
// import 'package:video_player/video_player.dart';
//
//
// class PlayVideoScreen extends StatefulWidget{
//   String mediaUrl;
//   PlayVideoScreen(this.mediaUrl, {Key? key}) : super(key: key);
//
//   @override
//   State<PlayVideoScreen> createState() => _PlayVideoScreenState();
// }
//
// class _PlayVideoScreenState extends State<PlayVideoScreen> {
//    /* late VideoPlayerController _controller;
//     late Future<void> initializeVideoPlayerFuture;
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(widget.mediaUrl);
//     _controller = VideoPlayerController.network(widget.mediaUrl,
//
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//     );
//     initializeVideoPlayerFuture=_controller.initialize();
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//
//
//
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _controller.dispose();
//   }*/
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         actions:  [
//           GestureDetector(
//               onTap: (){
//                 Get.back();
//               },
//               child: Icon(Icons.close,color: Colors.black,size: 22,))
//         ],
//       ),
//       body: FutureBuilder(
//         future: initializeVideoPlayerFuture,
//         builder: (context,snapshot){
//           if(snapshot.connectionState==ConnectionState.done){
//             return AspectRatio(aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),);
//           }else{
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//         floatingActionButton: FloatingActionButton(
//         onPressed: () {
//          setState(() {
//            if(_controller.value.isPlaying){
//              _controller.pause();
//            }else{
//              _controller.play();
//            }
//          });
//         },
//         child: Icon(_controller.value.isPlaying? Icons.pause:Icons.play_arrow),
//     ),
//     );
//   }
//
//  /* Widget videoWidget(VideoPlayerController controller){
//     return controller.value.isInitialized?Container(
//       alignment: Alignment.topCenter,
//       child: buildVideo(),
//     ):const SizedBox(
//       height: 250,
//       child: Center(
//         child: Text("Not found"),
//       ),
//     );
//   }
//
//   Widget buildVideo()=> buildVideoPlayer();
//
//   Widget buildVideoPlayer()=>VideoPlayer(_controller);*/
// }