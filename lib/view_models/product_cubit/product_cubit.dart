import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(quantity: 1, size:0));
  void increment()=>emit(ProductState(quantity: state.quantity+1 , size:state.size));
  void decrement()=>emit(ProductState(quantity: state.quantity>2?state.quantity-1:1 , size:state.size));
  void setSize(int itemSize)=>emit(ProductState(quantity: state.quantity , size:itemSize));
}
