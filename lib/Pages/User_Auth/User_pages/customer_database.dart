import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerData {
  final firestoreInstance = FirebaseFirestore.instance;
  createCustomer(customerMap, customerId) {
    firestoreInstance
        .collection("Customer")
        .doc(customerId)
        .set(customerMap)
        .catchError((e) {
      print(e);
    });
  }

  // getCustomerData()async{
  //   return await firestoreInstance.collection('Customers').doc()
  // }

}
