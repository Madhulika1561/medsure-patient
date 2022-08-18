

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/model/videoPlayerModel.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/screens/help/component/play_video.dart';

class HelpVideoPageBody extends StatefulWidget{
  const HelpVideoPageBody({Key? key}) : super(key: key);

  @override
  _HelpVideoPageBodyState createState() =>_HelpVideoPageBodyState();

}
class _HelpVideoPageBodyState extends State<HelpVideoPageBody>{
  List<VideoPlayerModel> videoListData = VideoPlayerModel.getVideoList();
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPage = 0.0;
  double scaleFactor =0.8;
  double _height =220;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage= pageController.page!;
      });
    });


  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
         SizedBox(
          height: 220,
          child: PageView.builder(
              controller: pageController,
              itemCount: videoListData.length,
              itemBuilder: (context,position)=>buildPageViewUI(position,videoListData[position])),
        ),
        DotsIndicator(
          dotsCount: 3,
          position: currentPage,
        decorator: DotsDecorator(
          //size: Size.square(Dimension.height10),
          activeSize: Size(Dimension.height10,Dimension.height10),
          activeColor: AppColors.lightBackgroundColor,
          color: AppColors.whiteOneColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0)
          ),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0)
          )
        ),)
      ],

    );
  }

  Widget buildPageViewUI(int index, VideoPlayerModel videoListData){
    Matrix4 matrix = Matrix4.identity();
    if(index==currentPage.floor()){
      var currScale = 1-(currentPage-index)*(1-scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==currentPage.floor()+1){
      var currScale = scaleFactor+(currentPage-index+1)*(1-scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==currentPage.floor()-1){
      var currScale = 1-(currentPage-index+1)*(1-scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale =0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
         Container(
              height: 220,
              margin: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: AppColors.lightBlueColor,
                  image:  DecorationImage(
                      image: AssetImage(videoListData.thumbUrl),
                      fit: BoxFit.cover
                  )
              ),
              child:Center(
                child: Container(
                  width: Dimension.screenHeight/17.16,
                  height: Dimension.screenHeight/17.16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor,width: 1),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        //Get.to(()=>PlayVideoScreen(videoListData.mediaUrl));
                      },
                        child: Icon(Icons.play_arrow,size: Dimension.height24,color: AppColors.whiteColor,)),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }


}