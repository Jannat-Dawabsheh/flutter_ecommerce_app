part of 'address_cubit.dart';

// sealed class AddressState {
//   const AddressState();

//   get carouselItems => null;
// }

// final class AddressInitial extends AddressState {}
// final class AddressLoading extends AddressState{}
// final class AddressLoaded extends AddressState{

//   final AddressItemModel address;
 
//  const AddressLoaded({
//   required this.address,
//  });
// }

// final class AddressError extends AddressState{

//  final String message;
//  const AddressError({
//   required this.message,
//  });
// }

// final class SelectedIndexLoaded extends AddressState {
//   final AddressItemModel item;
//   SelectedIndexLoaded( {
//     required this.item,
//   });
// }

class AddressState {}
 class AddressLoadingState extends AddressState{}
 class AddressLoadedState extends AddressState{
    final AddressItemModel item;
    AddressLoadedState(this.item);
 }



