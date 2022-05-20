import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/styles/colors.dart';
//import 'package:google_fonts/google_fonts.dart';
//
//
//
//
//
//
//Widget myTextButton(String title,  fun ,{double size})  =>
//
//    InkWell(
//      onTap: fun,
//      child: Text(title,
//        style: TextStyle(
//          fontSize: size == null ? 18.sp : size.sp ,
//
//        ),
//      ),
//    );
//
//Widget svgImage(
//    icon, {
//      Color color,
//      double size,
//      double width,
//    }) =>
//    SvgPicture.asset(
//      'assets/images/$icon.svg',
//      color: color,
//      height: size,
//      width: width ?? size,
//    );


Future To(BuildContext context, Widget widget) async {
  return await Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) => widget));
}


Future ToAndFinish(BuildContext context, Widget widget) async {
  return Navigator.pushAndRemoveUntil<dynamic>(
    context,
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
        (route) => false, //if you want to disable back feature set to false
  );
}

//
//TextStyle defaultTextStyleHint() =>
//    GoogleFonts.cairo(
//      fontSize: 16.sp,
//      color: Colors.black,
//      fontWeight:FontWeight.w300,
//
//    );
//
//
//
//


////
//// Future<bool> myToast(String message, Color color) {
////   return Fluttertoast.showToast(
////     msg: message,
////     toastLength: Toast.LENGTH_SHORT,
////     gravity: ToastGravity.BOTTOM,
////     timeInSecForIosWeb: 1,
////     backgroundColor: color??Colors.black38,
////     textColor: Colors.white,
////     fontSize: 16.0,
////   );
//// }
//
//
//
//
//
Widget myListTielStatic(String title , Widget icon  , Function function) =>

    Column(
      children: [

        ListTile(
          //stileColor: primaryColor,
          onTap: function,
          title:Row(
            children: [
              icon,
              //Icon(Icons.fact_check , color: Colors.black,),
              SizedBox(width: 20.w,),
              Text(
                title,
                style:  GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
//            Spacer(),
//
//            Icon(Icons.arrow_forward_ios , size: 18.r, color: Colors.black45 ),

            ],
          ),

          //Image.asset("assets/images/order_icon.png"),

        ),

        // Divider(
        //   endIndent: 10,
        //   indent: 10,
        //   color: Colors.grey,
        //   thickness: 1,
        //
        // ),



      ],

    );

Widget myListTiel(String title ,  url  , Function function,) =>

Column(
  children: [

    ListTile(
      //stileColor: primaryColor,
      onTap: function,
      title:Row(
        children: [
          Image.network("$url" , width: 25.w,height: 25.h,),


          SizedBox(width: 20.w,),
          Text(
            title,
            style:  GoogleFonts.cairo(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
//            Spacer(),
//
//            Icon(Icons.arrow_forward_ios , size: 18.r, color: Colors.black45 ),

        ],
      ),

      //Image.asset("assets/images/order_icon.png"),

    ),

    // Divider(
    //   endIndent: 10,
    //   indent: 10,
    //   color: Colors.grey,
    //   thickness: 1,
    //
    // ),



  ],

);
//
//
//
//
//
//Widget homeScreenHeaders (String title) =>
//    Text(
//      title,
//      textAlign: TextAlign.start,
//      style: GoogleFonts.cairo(
//        color: Colors.black,
//        fontSize: 20.sp,
//        fontWeight: FontWeight.w600,
//      ),
//    );
//
//Widget CartRow(String title , String subTitle) =>
//
//    Padding(
//      padding:  EdgeInsets.symmetric(horizontal: 50),
//      child: Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: [
//        Text(title,
//          style: GoogleFonts.cairo(
//            fontSize: 15.sp,
//            color: Colors.black,
//            fontWeight: FontWeight.w300,
//          ),
//        ),
//
//        Text(subTitle,
//          style: GoogleFonts.cairo(
//            fontSize: 16.sp,
//            color: Colors.black,
//            fontWeight: FontWeight.w300,
//          ),
//        ),
//      ],
//    ),
//    );
//
//
//
//
//
//Widget OrderRow(String title , String subTitle) =>
//
//    Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: [
//        Text(title,
//          style: GoogleFonts.cairo(
//            fontSize: 15.sp,
//            color: Colors.black,
//            fontWeight: FontWeight.w600,
//          ),
//        ),
//
//        Text(subTitle,
//          style: GoogleFonts.cairo(
//            fontSize: 15.sp,
//            color: Colors.grey,
//            fontWeight: FontWeight.w600,
//          ),
//        ),
//      ],
//    );
//
//
//
//Widget profileItem(String title , String subTitle) =>
//
//    Padding(
//      padding:  EdgeInsets.symmetric(horizontal: 10.w).add(EdgeInsets.only(top: 10.h)),
//      child: Container(
//        alignment: Alignment.centerRight,
//        width: double.infinity,
//        height: 70.h,
//        decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.circular(8.r),
//          boxShadow: [
//            BoxShadow(
//                color: Colors.grey.withOpacity(0.3),
//                offset: Offset(0, 5),
//                blurRadius: 3.0,
//                spreadRadius: 0),
//          ],
//        ),
//        child: Padding(
//          padding:  EdgeInsets.symmetric(horizontal: 15.w),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//
//            children: [
//              Text(
//                title,
//                style:  GoogleFonts.cairo(
//                  fontSize: 17.sp,
//                  fontWeight: FontWeight.w600,
//                  color: Colors.black,
//                ),
//              ),
//              Text(
//                subTitle,
//                style: GoogleFonts.cairo(
//                  fontSize: 16,
//                  fontWeight: FontWeight.w500,
//                  color: Colors.grey,
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//
//
//
//
//
//
//
  Widget myButton(String title ,  fun) =>
           //
    InkWell(
      onTap: fun,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 35.h,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              width: 5.w,
            ),
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );



  Widget myText(String text , int fontSize , FontWeight fontWeight  ) =>
      Text(

        text,
        style:  TextStyle(
          fontSize: fontSize.sp,
          color: Colors.black,
          fontWeight: fontWeight,
          fontFamily: "cairo",
        ),
        textAlign:  TextAlign.center,
      );

  //

  Widget myPdfRowItem(String text , Widget icon , Function function) =>
      InkWell(
        onTap: function,
        child: Row(
          children: [
            Text(
              text,
              style:  GoogleFonts.cairo(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 5 , right: 5),
              child: icon,
            ),
          ],
        ),
      );







//Widget defaultTextForm(
//    TextEditingController controller,
//    String hint,
//    {
//      Widget icon,
//      bool isPassword = false,
//      String defaultValidator,
//      TextInputType type = TextInputType.text,
//      ValueKey key,
//      Widget prefixIcon,
//      Widget suffixIcon,
//
//    }) =>
//    Container(
//      height: 70,
//      color: Color(0xffFBF5F5),
//      child: TextFormField(
//
//        controller: controller,
//        obscureText: isPassword,
//
//        decoration: InputDecoration(
//          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//          // border: InputBorder.none,
//          //= null ? Container() : suffixIcon
//          suffixIcon: suffixIcon  == null ? null : suffixIcon ,
//          hintText: hint,
//
//          prefix: prefixIcon,
//          hintStyle: defaultTextStyleHint(),
//          prefixIcon: Row(
//            mainAxisSize: MainAxisSize.min,
//            children: [
//              icon ?? Container(),
//              SizedBox(
//                width: 15.w,
//              )
//            ],
//          ),
//          //icon:icon ,
//          prefixIconConstraints:
//          BoxConstraints(minWidth: 30.w, minHeight: 20.w),
//        ),
//        // validator: validator
//        //     ??
//        //         (str) {
//        //       return defaultValidator;
//        //     },
//          keyboardType: type,
//
//        validator: (value){
//          if(value.isEmpty){
//            return
//                "this field is required ";
//          }  else{
//            return null;
//          }
//        },
//      ),
//    );
//
//
//
