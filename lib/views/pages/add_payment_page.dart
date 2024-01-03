import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';

class AddPaymentCard extends StatefulWidget {
  const AddPaymentCard({super.key});

  @override
  State<AddPaymentCard> createState() => _AddPaymentCardState();
}

class _AddPaymentCardState extends State<AddPaymentCard> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _cardNumberControler;
  late final TextEditingController _cardHolderNameControler;
   late final TextEditingController _ExpiredControler;
  late final TextEditingController _cvvCodeControler;
  late FocusNode _cardNumberFocusNode,_cardHolderNameFocusNode,_ExpiredFocusNode,_cvvCodeFocusNode;
  String? _cardNumber,_cardHolderName,_Expired,_cvvCode;
  @override
  void initState() {
    _formKey=GlobalKey<FormState>();
    _cardNumberControler=TextEditingController();
    _cardHolderNameControler=TextEditingController();
    _ExpiredControler=TextEditingController();
    _cvvCodeControler=TextEditingController();
    _cardNumberFocusNode=FocusNode();
    _cardHolderNameFocusNode=FocusNode();
    _ExpiredFocusNode=FocusNode();
    _cvvCodeFocusNode=FocusNode();
    
    super.initState();
  }
  @override
  void dispose() {
    _cardNumberControler.dispose();
    _cardHolderNameControler.dispose();
    _ExpiredControler.dispose();
    _cvvCodeControler.dispose();
    super.dispose();
  }
  void AddCard(){
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Card added successfully'),),
      );
      Navigator.of(context).pop();
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Card'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36,),
                  Text("Card Number", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _cardNumberControler,
                    onChanged: (value) => _cardNumber=value,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter your card number';
                      }else{
                        return null;
                      }
                    },
                    focusNode: _cardNumberFocusNode,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      _cardNumberFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_cardHolderNameFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Card Number",
                      prefixIcon: Icon(Icons.menu),
                      prefixIconColor: AppColors.grey, 
                    ),
                  ),
                  const SizedBox(height: 36,),


                   Text("Card Holder Name", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _cardHolderNameControler,
                    onChanged: (value) => _cardHolderName=value,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter card holder name';
                      }else{
                        return null;
                      }
                    },
                    focusNode: _cardHolderNameFocusNode,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      _cardHolderNameFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_ExpiredFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Holder Name",
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: AppColors.grey, 
                    ),
                  ),


                  const SizedBox(height: 36,),
                   Text("Expired", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _ExpiredControler,
                    onChanged: (value) => _Expired=value,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter expired date';
                      }else{
                        return null;
                      }
                    },
                    focusNode: _ExpiredFocusNode,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      _ExpiredFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_cvvCodeFocusNode);
                    },
                    decoration: InputDecoration(
                      hintText: "MM/YY",
                      prefixIcon: Icon(Icons.calendar_month_outlined),
                      prefixIconColor: AppColors.grey, 
                    ),
                  ),


                  const SizedBox(height: 36,),
                   Text("CVV Code", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 8,),
                 TextFormField(
                    controller: _cvvCodeControler,
                    onChanged: (value) => _cvvCode=value,
                    focusNode: _cvvCodeFocusNode,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      _cvvCodeFocusNode.unfocus();
                      AddCard();
                    },
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return 'Please enter card CVV Code';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "CVV",
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: AppColors.grey, 
                    ),
                    
                  ),
                   const SizedBox(height: 36,),
                 

                    const SizedBox(height: 50,),
                   SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                      onPressed:AddCard, 
                      child: Text("Add Card",style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
        ),
      ),
   
    );
  }
}