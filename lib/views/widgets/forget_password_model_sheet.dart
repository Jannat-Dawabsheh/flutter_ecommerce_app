import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/widgets/create_new_password_model_sheet.dart';

import '../../utils/app_colors.dart';

class forgetPasswordModelSheet extends StatefulWidget {
  const forgetPasswordModelSheet({super.key});

  @override
  State<forgetPasswordModelSheet> createState() => _forgetPasswordModelSheetState();
}

class _forgetPasswordModelSheetState extends State<forgetPasswordModelSheet> {
    late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailControler;
  late FocusNode _emailFocusNode;
  String? _email;
  @override
  void initState() {
    _formKey=GlobalKey<FormState>();
    _emailControler=TextEditingController();
    _emailFocusNode=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _emailControler.dispose();
    super.dispose();
  }
  void sendCode(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Code send'),),
      );
      Navigator.of(context).pop();
      showModalBottomSheet(
      context: context, 
      builder: (context)=> CreateNewPasswordModelSheet(),
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24,),
                  Text("Forgot Password", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),),
                  const SizedBox(height: 8,),
                  Text("Enter your Email", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.grey,
                  ),),
                  const SizedBox(height: 36,),
                  Text("Email", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _emailControler,
                    onChanged: (value) => _email=value,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter your email';
                      }else if(!value.contains('@')){
                        return 'Please enter a valid email';
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocusNode,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      _emailFocusNode.unfocus();
                      sendCode();
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      prefixIcon: Icon(Icons.email_outlined),
                      prefixIconColor: AppColors.grey, 
                    ),
                    
                  ),
                   const SizedBox(height: 24,),
                   SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                      onPressed:sendCode,
                      child: Text("Send Code",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600
                         )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                      ),
                      ),  
                    ),
                ],
                    ),
                
              ),
            ),
          );
       
    
  }
}