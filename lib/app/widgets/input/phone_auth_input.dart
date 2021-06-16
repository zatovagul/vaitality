import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/widgets/input/input_frame.dart';
import 'package:vaitality/app/widgets/input/text_input.dart';

class PhoneAuthInput extends StatefulWidget {
  final TextEditingController phoneController;


  const PhoneAuthInput({Key? key,required this.phoneController}) : super(key: key);

  @override
  _PhoneAuthInputState createState() => _PhoneAuthInputState();
}

class _PhoneAuthInputState extends State<PhoneAuthInput> {
  late TextEditingController codeController, phoneController;
  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    phoneController = TextEditingController();
  }
  var codeFormatter = MaskTextInputFormatter(
    mask: "+###",
    filter: {'#': RegExp(r'[0-9]')},
  );
  var num7formatter = MaskTextInputFormatter(
    mask: "(###) ### ## ##",
    filter: {'#': RegExp(r'[0-9]')},
  );
  var num9formatter = MaskTextInputFormatter(
    mask: "## (###) ### ## ##",
    filter: {'#': RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    return InputFrame(
      child: Row(
        children: [
          SizedBox(
            width: AppSizes.w1 * (codeController.text.length<=2 ? 30 : codeController.text.length==3 ? 40 : 50),
              child: TextInput(
            controller: codeController,
            maskFormatter: codeFormatter,
            onChanged: _setNumber,
                hint: "+",
          )),
          Expanded(child:
            TextInput(
              controller: phoneController,
              maskFormatter: _checkCode() ? num7formatter : num9formatter,
              hint: _checkCode() ? "(xxx) xxx xx xx" : "xx (xxx) xxx xx xx",
              onChanged: (v)=>_setNumber(null),
            )
          ),
        ],
      ),
    );
  }

  _setNumber(v){
    setState(() {
      String phone = codeController.text+phoneController.text.replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "");
      widget.phoneController.text = phone;
    });
  }
  _checkCode(){
    if(codeController.text.length==4)
      return false;
    return true;
  }
}
