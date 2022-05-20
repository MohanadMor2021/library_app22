import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:library_app/ads/banner_ad_model.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_app_banner.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/drawer_screens/home_screen/cubit/home_cubit.dart';
import 'package:library_app/dummy_data/home_screen_data.dart';
import 'package:library_app/inner_screens/result_screen.dart';
import 'package:library_app/items/home_screen_item.dart';

import 'cubit/home_state.dart';

//import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String _selectedstage;

//  List<String> stages = ['الجامعي', 'الإبتدائي', 'الثانوي', 'الإعدادي'];

//  bool _switchValue=true;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LibraryCubit, libraryStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          LibraryCubit cubit = LibraryCubit.get(context);
          return cubit.homeModel!=null? Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: primaryColor,
                drawer: MyDrawer(),
                body: SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children: [


                          SizedBox(
                            height: (MediaQuery
                                .of(context)
                                .size
                                .height - MediaQuery
                                .of(context)
                                .padding
                                .top) * 0.25,
                            child: LayoutBuilder(
                              builder: (ctx, constraint) =>
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      SizedBox(
                                        height: constraint.maxHeight * 0.3,

                                        child: Row(
                                          children: [
                                            Builder(
                                              builder: (BuildContext ctx) {
                                                return IconButton(
                                                  icon: CircleAvatar(
                                                    backgroundColor:
                                                    Colors.grey.shade100
                                                        .withOpacity(0.3),
                                                    child: Icon(
                                                      Icons.menu,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Scaffold.of(ctx)
                                                        .openDrawer();
                                                  },
                                                  tooltip: MaterialLocalizations
                                                      .of(context)
                                                      .openAppDrawerTooltip,
                                                );
                                              },
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/lib_logo.png",
                                        width: 170,
                                        height: constraint.maxHeight * 0.7,),
                                    ],
                                  ),
                            ),
                          ),


                          Container(
                            width: double.infinity,
                            height: (MediaQuery
                                .of(context)
                                .size
                                .height - MediaQuery
                                .of(context)
                                .padding
                                .top) * 0.75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [

                                MyAppBanner(
                                  "https://www.facebook.com/amjad.abed.948",
                                  myText(
                                    "اضغط هنا لمشاهدة شرح تحميل الملفات",
                                    14,
                                    FontWeight.w400,
                                  ),
                                ),

                                Expanded(
                                  child: Scrollbar(
                                    thickness: 5,
                                    radius: Radius.circular(50),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 30, bottom: 20),
                                      child: ListView.builder(
                                          itemCount: cubit.homeModel.titles.length,
                                          itemBuilder: (context, index) {
                                            return HomeScreenItem(cubit.homeModel.titles[index],cubit.sectionModel,cubit.subsectionModel);


                                          }
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),


                      Align(
                        alignment: Alignment.bottomCenter,

                        child: AdBanner2(),
                      ),


//              Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Spacer(),
//                  AdBanner2(),
//
////                Container(
////                  alignment: Alignment.center,
////                  color: Colors.red,
////                  height: 60,
////                  width: double.infinity,
////                  child: Text("hhhhhhhhhhhhh"),
////                ),
//                ],
//              ),
                    ],
                  ),
                ),

              )

          ):Scaffold(


        body:  Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width:      MediaQuery.of(context).size.width,

              child: Image.asset('assets/images/123.png')),
          Center(child: CircularProgressIndicator(color: Colors.red,strokeWidth: 10,))

        ],

        ));
        }

          );
        }

  }



/*
SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w)
                            .add(EdgeInsets.only(top: 10.h , bottom: 10.h)),
                        child:
                        myText(
                            "المراحل الدراسية",
                            15,
                            FontWeight.w600
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          width: double.infinity,
                          height: 250.h,
                          child: Padding(
                            padding:  EdgeInsets.only(top: 5 , bottom: 13),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: 2,
                                      itemBuilder: (context , index){
                                        return CustomDropDown(
                                          stages,
                                          onSelect: (newValue) {
                                            _selectedstage = newValue;
                                          },
                                          hint: "اختر المرحلة",
                                        );
                                      }
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 30.w).add(EdgeInsets.only(top: 10.h)),
                                  child: myButton(
                                      "عرض النتائج",
                                          (){
                                        To(context , ResultScreen());
                                          }
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),

                      Divider(
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,

                      ),



//                      Padding(
//                        padding: EdgeInsets.symmetric(horizontal: 30.w)
//                            .add(EdgeInsets.only(top: 10.h , bottom: 10.h)),
//                        child:  myText(
//                            "أقسام آخرى",
//                            15,
//                            FontWeight.w600
//                        ),
//                      ),
//
//                      Padding(
//                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
//                        child: Container(
//                          width: double.infinity,
//                          height: 135.h,
//                          decoration: BoxDecoration(
//                            color: Colors.grey.shade200,
//                            borderRadius: BorderRadius.circular(10.r),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Colors.grey.shade100.withOpacity(0.9),
//                                  offset: Offset(0, 7),
//                                  blurRadius: 3.0,
//                                  spreadRadius: 0),
//                            ],
//
//                          ),
//                          child: Column(
//                            children: [
//                              SizedBox(height: 10,),
//
//                              CustomDropDown(
//                                stages,
//                                onSelect: (newValue) {
//                                  _selectedstage = newValue;
//                                },
//                                hint: "اختر القسم",
//                              ),
//
//                              Padding(
//                                padding:  EdgeInsets.symmetric(horizontal: 30.w).add(EdgeInsets.only(top: 10.h)),
//                                child: myButton(
//                                    "عرض النتائج",
//                                        (){}
//                                ),
//                              ),
//
//                            ],
//                          ),
//                        ),
//                      ),

                    ],
                  ),
                ),
 */