import 'dart:math';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/ads/banner_ad_model.dart';
import 'package:library_app/components/constant.dart';
import 'package:library_app/components/custom_drop_down.dart';
import 'package:library_app/components/drop_down/drop_down_button_list_item.dart';
import 'package:library_app/components/global_componnets.dart';
import 'package:library_app/components/my_app_banner.dart';
import 'package:library_app/components/my_drawer.dart';
import 'package:library_app/dummy_data/pdf_files_datd.dart';
import 'package:library_app/items/pdf_item.dart';
import 'package:share_plus/share_plus.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';

class ResultScreen extends StatefulWidget {
  final myvalue1;
  final myvalue2;
  final myvalue3;
  final myvalue4;

   ResultScreen( this.myvalue1,this.myvalue2, this.myvalue3, this.myvalue4 );

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  TextEditingController _controller = TextEditingController();

  DropDownButtonListItem _selectedstage;

  int banarIndex = Random().nextInt(dataFiles.length);




  List<DropDownButtonListItem> stages = [

    DropDownButtonListItem("الأحدث"),
    DropDownButtonListItem("الأقدم"),
    DropDownButtonListItem("الإسم"),


  ];



  List<DropDownButtonListItem> types = [

    DropDownButtonListItem("مذكرة"),
    DropDownButtonListItem("ملخص"),


  ];








  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        drawer: MyDrawer(),
        body: SafeArea(
          child: Column(
            children: [

              Container(
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.25,
                child: LayoutBuilder(
                  builder: (ctx,constraint)
                  => SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        Container(

                          height: constraint.maxHeight*0.25 ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: IconButton(

                                      icon: CircleAvatar(

                                        backgroundColor:
                                        Colors.grey.shade100.withOpacity(0.3),
                                        child: Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        Scaffold.of(ctx).openDrawer();
                                      },
                                      tooltip: MaterialLocalizations.of(context)
                                          .openAppDrawerTooltip,
                                    ),
                                  );
                                },
                              ),


                              Builder(
                                  builder: (ctx) {
                                    return IconButton(
                                      icon: CircleAvatar(
                                        backgroundColor:
                                        Colors.grey.shade100.withOpacity(0.3),
                                        child: Icon(
                                          Icons.filter_list,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {

                                        Scaffold.of(ctx).showBottomSheet<void>(
                                              (BuildContext context) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(30.r),
                                                  topLeft: Radius.circular(30.r),
                                                ),
                                                color: Colors.white,
                                              ),
                                              height: MediaQuery.of(context).size.height * 0.35,
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:  EdgeInsets.only(right: 20),
                                                      child: myText(
                                                        "الإسم : ",
                                                        15,
                                                        FontWeight.w600,

                                                      ),
                                                    ),

                                                    CustomDropDown(
                                                      stages,
                                                      onSelect: (newValue) {
                                                        _selectedstage = newValue;
                                                      },
                                                      hint: "طرق الفلترة",
                                                    ),

                                                    Padding(
                                                      padding:  EdgeInsets.only(right: 20),
                                                      child: myText(
                                                        "النوع : ",
                                                        15,
                                                        FontWeight.w600,
                                                      ),
                                                    ),

                                                    CustomDropDown(
                                                      types,
                                                      onSelect: (newValue) {
                                                        _selectedstage = newValue;
                                                      },
                                                      hint: "طرق الفلترة",
                                                    ),

                                                    SizedBox(height: 30,),


                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal:10),

                                                      child: myButton(" فلتر", () {
                                                      }),
                                                    ),





                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );




                                      },
                                    );
                                  }
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(bottom:  constraint.maxHeight*0.05),
                          child: Image.asset("assets/images/lib_logo.png", width:  150,height: constraint.maxHeight*0.35,),
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            alignment: Alignment.center,
                            height:  constraint.maxHeight*0.35,
                            child: TextField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "بحث",
                                contentPadding:  EdgeInsets.all(12), isDense: true,
                                hintStyle: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade300.withOpacity(0.3),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                suffixIcon:  Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.02,
              ),

              Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)* 0.73,
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

//                    Padding(
//                      padding: EdgeInsets.symmetric(horizontal: 30)
//                          .add(EdgeInsets.only(top: 15)),
//                      child: InkWell(
//                        onTap: () {},
//                        child: Container(
//                          alignment: Alignment.center,
//                          width: double.infinity,
//                          height: 70,
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(8),
//                            border: Border.all(color: primaryColor),
//                            color: Colors.white,
//                          ),
//                          child: myText(
//                            "اضغط هنا لمشاهدة شرح تحميل الملفات",
//                            14,
//                            FontWeight.w400,
//                          ),
//                        ),
//                      ),
//                    ),

                    MyAppBanner(
                        "https://www.facebook.com/amjad.abed.948",
                      myText(
                        "اضغط هنا لمشاهدة شرح تحميل الملفات",
                        14,
                        FontWeight.w400,
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(bottom: 20),
                        child: ListView.builder(
                            itemCount: cubit.resultModel.files.length,
                            itemBuilder: (context, index) {

                              if(index == banarIndex){
                                return Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 20),
                                  child: AdBanner2(),
                                ) ;
                              }else {
                                return
                                  DelayedDisplay(
                                      delay: const Duration( milliseconds: 300),
                                      child: PdfItem(
                                          cubit.resultModel.files[index]));
                              }
                            }

                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
