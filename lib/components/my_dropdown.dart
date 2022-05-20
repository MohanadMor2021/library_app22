import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../models/home_model.dart';

class my_dropdown extends StatefulWidget {
  final List<dynamic> titles;
  int myvalue;
  final  LibraryCubit cubit;
  final MychangeMethod;

  my_dropdown(this.titles, this.myvalue,{ this.cubit, this.MychangeMethod});

  @override
  State<my_dropdown> createState() => _my_dropdownState();
}

class _my_dropdownState extends State<my_dropdown> {

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);
    // final items=widget.titles;
    // items.add('تفريغ')

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
        height: MediaQuery.of(context).size.height * 0.08,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
        child: IgnorePointer(
          ignoring: false,
          child: DropdownButton(
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),

             hint: Text('اختر المرحلة')
            ,
            isExpanded: true,
            value: widget.myvalue,

            onChanged:   widget.MychangeMethod,


          //     (value) {
            //   setState(() async{
            //
            //   //  widget.myvalue = value;
            //   //   print(value);
            //   // await cubit.getSection(id: value);
            //   // print(cubit.sectionModel.status);
            //   //
            //   //   print('$valueتم بنجاح ');
            //   });
            // },
            items: widget.titles
                .map(

                    (e) {
                      return DropdownMenuItem(value: e.id, child: Text(e.name));
                    })
                .toList(),
          ),
        ),
      ),
    );
  }
}
