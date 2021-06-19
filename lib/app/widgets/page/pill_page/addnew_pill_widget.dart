import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/constants/string_formats.dart';
import 'package:vaitality/app/widgets/input/text_input.dart';
import 'package:vaitality/app/widgets/list_frame_widget.dart';

class AddNewPillWidget extends StatefulWidget {
  @override
  _AddNewPillWidgetState createState() => _AddNewPillWidgetState();
}

class _AddNewPillWidgetState extends State<AddNewPillWidget> {
  late bool isRemind, showDP;
  late DateTime choseDay, nowDay;
  late TextEditingController nameController, noteController;
  late int repeat;
  int page = 0;
  @override
  void initState() {
    isRemind = false; showDP = false;
    choseDay = DateTime.now();
    nowDay = DateTime.now().add(Duration(minutes: -1));

    repeat = 0;

    nameController = TextEditingController();
    noteController = TextEditingController();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.90,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        color: AppColors.blueGrey
      ),
      child: Column(
        children: [
          Container(
            height: AppSizes.w1 * 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                color: AppColors.white
            ),
            child: Stack(
              children: [
                  Center(child: Text(page==0?"Подробнее":"Повтор", style: AppTextStyles.black17_w500)),
                  page==0?
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(padding: EdgeInsets.only(right: AppSizes.w1 * 10),
                      child: TextButton(onPressed: Get.back, child: Text("Готово", style: AppTextStyles.pink17_w400,)),
                    ),
                  ):Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: AppSizes.w1 * 2),
                      child: InkWell(
                        onTap:()=>_setPage(0),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_outlined, color: AppColors.pink, size: AppSizes.w1 * 20,),
                            Text("Подробнее", style: AppTextStyles.pink15_w400,)
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Container(height: 0.5,color: AppColors.grey,),
          SizedBox(
            height: Get.height*0.9 - 0.5 - AppSizes.w1 * 50,
            child: page == 0 ? _mainPage() : _repeatPage(),
          )
        ],
      ),
    );
  }

  _mainPage()=>ListView(
    children: [
      SizedBox(height: AppSizes.w1 * 32,),
      ListFrameWidget(children: [
        SizedBox(
            height: AppSizes.w1 * 32,
            child: TextInput(
              fontSize: 15,
              hint: "Препарат",
              controller: nameController,
            )
        ),
        SizedBox(
            height: AppSizes.w1 * 32,
            child: TextInput(
              fontSize: 15,
              hint: "Заметки",
              controller: noteController,
            )
        ),
      ]),SizedBox(height: AppSizes.w1 * 32,),
      ListFrameWidget(children: [
        SizedBox(
            height: AppSizes.w1 * 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Напоминать", style: AppTextStyles.black15_w400,),
                Padding(
                  padding: EdgeInsets.only(right: AppSizes.w1 * 13),
                  child: CupertinoSwitch(
                    activeColor: AppColors.pink,
                    onChanged: setRemind, value: isRemind,
                  ),
                )
              ],
            )
        ),
        SizedBox(
            height: AppSizes.w1 * 32,
            child: TextButton(
              onPressed: setShowDP,
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Уведомление", style: AppTextStyles.black15_w400,),
                  Padding(
                    padding: EdgeInsets.only(right: AppSizes.w1 * 13),
                    child: Text(_getDate(), style: AppTextStyles.lightGrey14_w400,),
                  )
                ],
              ),
            )
        ),
        if(showDP)
        SizedBox(
          height: AppSizes.w1 * 161,
          child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime a) => setState(()=>choseDay = a),
              minimumDate: nowDay,
              initialDateTime: choseDay,
              maximumDate: nowDay.add(Duration(days: 400)),
            maximumYear: nowDay.add(Duration(days: 400)).year,
            use24hFormat: true,
            minimumYear: nowDay.year,
              ),
        ),
        SizedBox(
            height: AppSizes.w1 * 32,
            child: TextButton(
              onPressed: ()=>_setPage(1),
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Повтор", style: AppTextStyles.black15_w400,),
                  Padding(
                    padding: EdgeInsets.only(right: AppSizes.w1 * 16),
                    child: Row(
                      children: [
                        Text(_getRepeatName(repeat), style: AppTextStyles.lightGrey14_w400,),
                        SizedBox(width: AppSizes.w1 * 0,),
                        Icon(Icons.arrow_forward_ios_outlined, color: AppColors.lightGrey, size: AppSizes.w1 * 12,)
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ])
    ],
  );
  _repeatPage()=>ListView(
    children: [
      SizedBox(height: AppSizes.w1 * 32),
      ListFrameWidget(children: [
        for(int i=0;i<5;i++)
          _getRepeatItem(i)
      ]),
    ],
  );
  Widget _getRepeatItem(int a)=>Container(
      height: AppSizes.w1 * 32,
      child: TextButton(
        onPressed: ()=>setState(()=>repeat=a),
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_getRepeatName(a), style: AppTextStyles.black15_w400,),
            if(a == repeat)
              Padding(
                padding: EdgeInsets.only(right: AppSizes.w1 * 16),
                child: SvgPicture.asset("assets/images/blue_galochka.svg", width: AppSizes.w1 * 12,),
              )
          ],
        ),
      ),
    );


  _getRepeatName(int a){
    switch(a){
      case 0:
        return "Никогда";
      case 1:
        return "Ежедневно";
      case 2:
        return "Раз в 2 дня";
      case 3:
        return "Еженедельно";
      case 4:
        return "Ежемесячно";
    }
  }

  _setPage(v)=>setState(()=>page=v);

  _getDate(){
    String time = StringFormats.timeFormat.format(choseDay);
    String day = StringFormats.dayFormat.format(choseDay);
    String week = StringFormats.weeks[choseDay.weekday-1];
    return "$week, $day г.,$time";
  }

  setRemind(val)=>setState(()=>isRemind = val);
  setShowDP()=>setState(()=>showDP = !showDP);
}
