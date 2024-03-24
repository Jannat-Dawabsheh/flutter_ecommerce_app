import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/view_models/auth_cubit/auth_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
  final size=MediaQuery.of(context).size;
  final authCubit = BlocProvider.of<AuthCubit>(context);
    return SingleChildScrollView(
      child:  Center(
       child: Column(
        children: [
           SizedBox(height: 24,),
          CircleAvatar(
            radius: size.width>800? size.height*0.5: size.height*0.1,
            backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaizazwQtqYtxIz6-5scSWz97PERGqBBDpZA&usqp=CAU"),
          
          ),
            SizedBox(height: 24,),
           Text(
            "Jannat Dawabsheh",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
           ),

             SizedBox(height: 8),
           Text(
            "test@jannat.com",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black45,
            ),
           ),
           SizedBox(height: 24,),
            ListTile(
            onTap: () async {
              print('logout');
              await authCubit.logout();
              Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.login);
            },
            leading: Icon(
              Icons.logout,
               size: 30,
               ),
            title: Text(
               'Logout',
               style: const TextStyle(
                 fontWeight: FontWeight.w600,
                  fontSize: 18
                  ),
            ),
            trailing:const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              ),

           ),
 
        ],
       ),
      ),
    );
  }
}