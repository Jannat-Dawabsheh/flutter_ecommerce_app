class PaymentMethodModel{
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String ccvCode;
  final String imgUrl;
  final String name;

  PaymentMethodModel({
    required this.id, 
    required this.cardNumber, 
    required this.cardHolderName, 
    required this.expiryDate, 
    required this.ccvCode, 
    this.imgUrl="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/2560px-MasterCard_Logo.svg.png", 
    this.name="master"
    });
}

List<PaymentMethodModel>savedCards=[
  PaymentMethodModel(id: '1', cardNumber: '123456789', cardHolderName: 'Ahmad mohammad', expiryDate: '01/2', ccvCode: '123'),
  PaymentMethodModel(id: '2', cardNumber: '147852369', cardHolderName: 'Huda mohammad', expiryDate: '01/5', ccvCode: '147'),
  PaymentMethodModel(id: '3', cardNumber: '789654123', cardHolderName: 'Sama mohammad', expiryDate: '01/7', ccvCode: '789'),
];
// master  https://freepngimg.com/thumb/categories/1783.png

// paypal  https://s3.cointelegraph.com/storage/uploads/view/3278bdc14c74dd4e85732b776d0e5b1d.png