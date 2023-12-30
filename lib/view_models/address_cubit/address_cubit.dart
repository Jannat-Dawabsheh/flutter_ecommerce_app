import 'package:bloc/bloc.dart';

import '../../models/address_item_model.dart';

part 'address_state.dart';


class AddressCubit extends Cubit<AddressState> {
  final Map<int,bool>selectedAddress={};
   int selectedIndex=0;
  AddressCubit() : super(AddressState());


  void setAddress(String index){
    emit(AddressLoadingState());
   Future.delayed(const Duration(seconds: 1));
    selectedIndex=addressList.indexWhere((element) => element.id==index);
    addressList[selectedIndex]=addressList[selectedIndex].copyWith(isSelected: true);
    emit(AddressLoadedState(addressList[selectedIndex]));
    print(addressList[selectedIndex].fullAddress);
  }

    void getAddressList(){
    emit(AddressLoadingState());
    Future.delayed(const Duration(seconds: 1),(){
      emit(AddressLoadedState(addressList[this.selectedIndex]));
    });
  }

}

