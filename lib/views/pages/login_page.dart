import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/views/widgets/login_social_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_routes.dart';
import '../widgets/forget_password_model_sheet.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailControler;
  late final TextEditingController _passwordControler;
  late FocusNode _emailFocusNode,_passwordFocusNode;
  String? _email,_password;
  bool visibility=false;
  @override
  void initState() {
    _formKey=GlobalKey<FormState>();
    _emailControler=TextEditingController();
    _passwordControler=TextEditingController();
    _emailFocusNode=FocusNode();
    _passwordFocusNode=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _emailControler.dispose();
    _passwordControler.dispose();
    super.dispose();
  }
  void login(){
    debugPrint("Email: $_email, Password:$_password");
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Success'),),
      );
      Navigator.of(context).pushNamed(AppRoutes.home);
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24,),
                  Text("Login Account!", style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),),
                  const SizedBox(height: 8,),
                  Text("Please, login with registered account!", style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      _emailFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      prefixIcon: Icon(Icons.email_outlined),
                      prefixIconColor: AppColors.grey, 
                    ),
                    
                  ),
                  const SizedBox(height: 36,),
                  Text("Password", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordControler,
                    onChanged: (value) => _password=value,
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      _passwordFocusNode.unfocus();
                      login();
                    },
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter your password';
                      }else if(value.length<6){
                        return 'Password must be at least 6 characters';
                      }else{
                        return null;
                      }
                    },
                    obscureText: !visibility,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: AppColors.grey, 
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            visibility=!visibility;
                          });
                        },
                        child: Icon(visibility?Icons.visibility_off: Icons.visibility),
                        ), 
                      suffixIconColor: AppColors.grey,
                    ),
                    
                  ),
                   const SizedBox(height: 8,),
                   Align(
                    alignment: Alignment.centerRight,
                     child: TextButton(
                      onPressed: ()=>showModalBottomSheet(
                        context: context, 
                        builder: (context)=> forgetPasswordModelSheet(),
                        ), 
                      child: Text("forget password?", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primary,
                                   ),),
                      ),
                   ),
                   const SizedBox(height: 24,),
                   SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                      onPressed:login, 
                      child: Text("login",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600
                         )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                      ),
                      ),  
                    ),
              
                    const SizedBox(height: 16,),
                    
                    Align(
                      alignment: Alignment.center,
                      child: Text("Or using other methods",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.grey,
                          
                        )),
                    ),
              
                    const SizedBox(height: 16,),
                    LoginSocialItem(
                      icon: FontAwesomeIcons.google, 
                      title: 'Login with Google', 
                      color: AppColors.red,
                      onTap: (){}
                      ),
                      const SizedBox(height: 16,),
                      LoginSocialItem(
                      icon: FontAwesomeIcons.facebookF, 
                      title: 'Login with Facebook', 
                      color: AppColors.blue,
                      onTap: (){}
                      ),
                     const SizedBox(height: 16,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don\'t have an account?",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.grey,
                        
                          )),
                      TextButton(
                      onPressed: (){
                         Navigator.of(context).pushNamed(AppRoutes.createAccountPage);
                      }, 
                      child: Text("Register", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primary,
                          ),),
                      ), 
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}