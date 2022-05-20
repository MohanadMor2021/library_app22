import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/drawer_screens/favorite_screen.dart';
import 'package:library_app/drawer_screens/home_screen/home_sceen.dart';
import 'package:library_app/drawer_screens/settings_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../drawer_screens/home_screen/cubit/home_state.dart';
import 'global_componnets.dart';







class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {



  List <String> titles =[
    "حسابنا على تويتر",
    "حسابنا على فيسبوك",
    "قييم التطبيق"
  ];

  List <Widget> icons = [

   // SvgPicture.asset("assets/images/twitter_white.svg" ,),
    Image.network("https://www.iconsdb.com/icons/preview/white/twitter-xxl.png" , width: 25,),
    Icon(Icons.facebook, color: Colors.white),
    SvgPicture.asset("assets/images/google-play.svg" ,),

  ];




  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return BlocConsumer<LibraryCubit, libraryStates>(
        listener: (context, state) {

    },
    builder: (context, state) =>

    Container(

      child: Drawer(

        child: Container(
          color : primaryColor,
          child: SingleChildScrollView(
            child: Column(

             children: [

               SizedBox(
                 height: 100.h,
               ),
               Image.asset("assets/images/lib_logo.png", width:  150,),
               SizedBox(
                 height: 10.h,
               ),
                myListTielStatic(
          "الرئيسية",
          Icon(Icons.home, color: Colors.white),
              () {
            ToAndFinish(context, HomeScreen());
          },
        ),
               myListTielStatic(
                 "الإعدادات",
                 Icon(Icons.settings, color: Colors.white),
                     () {
                   ToAndFinish(context, SettingsScreen());
                 },
               ),
               myListTielStatic(
                 "من نحن",
                 Icon(Icons.info, color: Colors.white),
                     () {
                   ToAndFinish(context, SettingsScreen());
                 },
               ),

            myListTielStatic(
              "المفضلة",
              Icon(Icons.favorite, color: Colors.white),
                  () {
                ToAndFinish(context, FavoriteScreen());
              },
            ),




                 Padding(
                   padding:  EdgeInsets.only(bottom: 0),
                   child: ListView.builder(
                     padding: EdgeInsets.zero,

                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: cubit.drawerModel.data.length ,
                     // ignore: missing_return
                     itemBuilder: (context, index){
                       return  myListTiel(cubit.drawerModel.data[index].name,'${cubit.drawerModel.data[index].icon}',
                             () async {
                         final url = cubit.drawerModel.data[index].link;
                         if (await canLaunch(url)) {
                           await launch(url);
                         } else {
                           throw 'Could not launch $url';
                         }
                       },);
                       // if(index == 0) {

                       // }else if(index == 1){
                       //  return
                       // } else if(index == 2){

                       // } else if ( index == 3){

                       // } else {
                       //   return
                       //
                       // }



//                           myListTiel(
//                            "حسابنا على تويتر",
// //                           icons[index],
//                             // SvgPicture.asset("assets/images/twitter_white.svg" , width: 22,),
//                           Image.network("https://www.iconsdb.com/icons/preview/white/twitter-xxl.png" , width: 23,),
//
//                                  () async {
//                                    const url = 'https://www.facebook.com/amjad.abed.948';
//                                    if (await canLaunch(url)) {
//                                      await launch(url);
//                                    } else {
//                                      throw 'Could not launch $url';
//                                    }
//                                  },
//
//                          );




                     }

               ),
                 ),


             ],
                  ),
          ),
        ),
      ),
    ));
  }
}
