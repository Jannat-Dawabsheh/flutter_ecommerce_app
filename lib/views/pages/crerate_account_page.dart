import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/login_social_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;
  late FocusNode _emailFocusNode,_passwordFocusNode,_usernameFocusNode;
  String? _email,_password,_username;
  bool visibility=false;
  
  @override
  void initState() {
    _formKey=GlobalKey<FormState>();
    _emailController=TextEditingController();
    _passwordController=TextEditingController();
    _emailFocusNode=FocusNode();
    _passwordFocusNode=FocusNode();
    _usernameController=TextEditingController();
    _usernameFocusNode=FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void createAccount() async{
   if (_formKey.currentState!.validate()) {
      await BlocProvider.of<AuthCubit>(context).register(
        _emailController.text,
        _passwordController.text,
        _usernameController.text,
      );
    }
    
  }

  
static final RegExp alphaExp = RegExp('[^a-zA-Z ]'); 

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
                  Text("Create Account", style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),),
                  const SizedBox(height: 8,),
                  Text("start learning with create your account", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.grey,
                  ),),
                  const SizedBox(height: 36,),
                  Text("Username", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _usernameController,
                    onChanged: (value) => _username=value,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter your username';
                      }else if(alphaExp.hasMatch(value)){
                        return 'Only Alphabets are allowed in a username';
                      }else{
                        return null;
                      }
                    },
                    focusNode: _usernameFocusNode,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      _usernameFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: "Create your Username",
                      prefixIcon: Icon(Icons.person_2_outlined),
                      prefixIconColor: AppColors.grey, 
                    ),
                    
                  ),
                  const SizedBox(height: 36,),
                  Text("Email", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _emailController,
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
                    controller: _passwordController,
                    onChanged: (value) => _password=value,
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      _passwordFocusNode.unfocus();
                      createAccount();
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

                   const SizedBox(height: 24,),
                   SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: BlocConsumer<AuthCubit, AuthState>(
                      bloc: BlocProvider.of<AuthCubit>(context),
                        listenWhen: (previous, current) =>
                            current is AuthSuccess || current is AuthError,
                        listener: (context, state) {
                          if (state is AuthSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Register Success!'),
                              ),
                            );
                            Navigator.of(context).pushNamed(AppRoutes.home);
                          } else if (state is AuthError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                              ),
                            );
                          }
                        },
                        buildWhen: (previous, current) =>
                            current is AuthLoading || current is AuthError,
                      builder: (context, state) {
                        if (state is AuthLoading) {
                            return ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).primaryColor,
                                foregroundColor: AppColors.white,
                              ),
                              child: const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            );
                          }
                        return  ElevatedButton(
                      onPressed:createAccount, 
                      child: Text("Create Account",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600
                         )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                      ),
                      ); 
                      },
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
                      
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}







