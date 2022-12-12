// // ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:iramakain/drawer.dart';
// import 'package:iramakain/appbar.dart';
// import 'package:pbp_django_auth/pbp_django_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:iramakain/Donation/models/donationModels.dart';

// class detailDonation extends StatelessWidget {
//   final DonationModel itemHolder;

//   // String jenis_barang = "";
//   // int amount = 0;
//   // int
//   detailDonation({super.key, required this.itemHolder});

//   goBack(BuildContext context) {
//     Navigator.pop(context);
//   }
//   final _keyDialog1 = GlobalKey();
//   final _formKey = GlobalKey<FormState>();
//   String jenis_barang = "";
//   int amount = 0;
//   String waktu_isi = "";
//   String shipping_method = "";
//   List<String> shippingMethodList = [
//     ('Antar sendiri'),
//     ('JNE'),
//     ('POS INDONESIA'),
//     ('TIKI'),
//     ('SiCepat'),
//     ('J&T')
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final request = context.watch<CookieRequest>();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Details"),
//       ),
//       drawer: IramaKainDrawer(),
//       body: Stack(children: <Widget>[
//         Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("lib/Donation/assets/img/Rectangle.png"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Padding(
//             padding: EdgeInsets.only(top: 20),
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: <
//                     Widget>[
//               Center(
//                   child: Text(
//                 'Detail Donasi',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               )),
//               // Expanded(child: Container(height: 40,)),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 40),
//                 alignment: Alignment.center,
//                 width: 400,
//                 height: 300,
//                 padding: EdgeInsets.all(50),
//                 decoration: BoxDecoration(
//                   // gradient: Gradient.
//                   // color: Color.fromRGBO(64, 28, 92, 1),
//                   gradient: LinearGradient(colors: [
//                     Color.fromRGBO(138, 43, 226, 0.6),
//                     Color.fromRGBO(170, 195, 138, 0.8),
//                   ]),
//                   borderRadius: BorderRadius.circular(5.0),
//                 ),
//                 // padding: EdgeInsets.only(top: 40, left: 10, right: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         style: TextStyle(
//                             color: Color.fromRGBO(64, 28, 92, 1), fontSize: 16),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Jenis Kain: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextSpan(text: '${itemHolder.jenis_barang}'),
//                         ],
//                       ),
//                     ),
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         style: TextStyle(
//                             color: Color.fromRGBO(64, 28, 92, 1), fontSize: 16),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Banyak: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextSpan(text: '${itemHolder.amount}'),
//                         ],
//                       ),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                             color: Color.fromRGBO(64, 28, 92, 1), fontSize: 16),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Shipping Method: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextSpan(text: '${itemHolder.shipping_method}'),
//                         ],
//                       ),
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                             color: Color.fromRGBO(64, 28, 92, 1), fontSize: 16),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Last updated: ',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextSpan(
//                               text: DateFormat('MMMM dd, yyyy').format(
//                                   DateTime.parse('${itemHolder.waktu_isi}'))),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 20,
//                     ),
//                     Container(
//                         width: 90,
//                         child: ElevatedButton(
//                           child: Text('Edit'),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color.fromRGBO(64, 28, 92, 1),
//                             shadowColor: Color.fromRGBO(64, 28, 92, 1),
//                             elevation: 5,
//                           ),
//                           onPressed: () {
//                             showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return Dialog(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     elevation: 15,
//                                     child: Form(
//                                       key: _formKey,
//                                       child: SingleChildScrollView(
//                                         child: Container(
//                                           padding: const EdgeInsets.all(20.0),
//                                           child: Column(
//                                             children: [
//                                               Text(
//                                                 "Edit Donasi",
//                                                 style: TextStyle(
//                                                     color: Color.fromRGBO(
//                                                         64, 28, 92, 1),
//                                                     fontSize: 20),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: TextFormField(
//                                                   decoration: InputDecoration(
//                                                     hintText:
//                                                         '${itemHolder.jenis_barang}',
//                                                     labelText: "Jenis Barang",
//                                                     // Menambahkan icon agar lebih intuitif
//                                                     // icon: const Icon(Icons.people),
//                                                     // Menambahkan circular border agar lebih rapi
//                                                     border: OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5.0),
//                                                     ),
//                                                   ),
//                                                   // Menambahkan behavior saat nama diketik
//                                                   // onChanged: (String? value) {
//                                                   //   setState(() {
//                                                   //     _judul = value!;
//                                                   //   });
//                                                   // },
//                                                   // Menambahkan behavior saat data disimpan
//                                                   onSaved: (String? value) {
//                                                     jenis_barang = value!;
//                                                   },
//                                                   // Validator sebagai validasi form
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 // Menggunakan padding sebesar 8 pixels
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: TextFormField(
//                                                   decoration: InputDecoration(
//                                                     hintText:
//                                                         '${itemHolder.amount}',
//                                                     labelText:
//                                                         "Banyak Kain (dalam kg)",
//                                                     // Menambahkan icon agar lebih intuitif
//                                                     // icon: const Icon(Icons.people),
//                                                     // Menambahkan circular border agar lebih rapi
//                                                     border: OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5.0),
//                                                     ),
//                                                   ),
//                                                   keyboardType:
//                                                       TextInputType.number,
//                                                   inputFormatters: <
//                                                       TextInputFormatter>[
//                                                     FilteringTextInputFormatter
//                                                         .digitsOnly
//                                                   ],
//                                                   // Menambahkan behavior saat nama diketik
//                                                   // onChanged: (String? value) {
//                                                   //     amount = int.parse(value!);

//                                                   // },
//                                                   // Menambahkan behavior saat data disimpan
//                                                   onSaved: (String? value) {
//                                                     amount = int.parse(value!);
//                                                   },
//                                                   // Validator sebagai validasi form
//                                                 ),
//                                               ),
//                                               Center(
//                                                   child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: <Widget>[
//                                                     Container(width: 10),
//                                                     DropdownButton(
//                                                       icon: const Icon(Icons
//                                                           .keyboard_arrow_down),
//                                                       items: shippingMethodList
//                                                           .map((String items) {
//                                                         return DropdownMenuItem(
//                                                           value: items,
//                                                           child: Text(items),
//                                                         );
//                                                       }).toList(),
//                                                       hint: Text(
//                                                           '${itemHolder.shipping_method}'),
//                                                       onChanged:
//                                                           (String? newValue) {
//                                                         shipping_method =
//                                                             newValue!;
//                                                       },
//                                                     ),
//                                                   ])),
//                                               TextButton(
//                                                 child: const Text(
//                                                   "Simpan",
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                                 style: ButtonStyle(
//                                                   shadowColor:
//                                                       MaterialStateProperty.all(
//                                                           Color.fromRGBO(
//                                                               64, 28, 92, 1)),
//                                                   elevation:
//                                                       MaterialStateProperty.all(
//                                                           5),
//                                                   backgroundColor:
//                                                       MaterialStateProperty.all(
//                                                           Color.fromRGBO(
//                                                               64, 28, 92, 1)),
//                                                 ),
//                                                 onPressed: () async {
//                                                   print(amount);
//                                                   List<DonationModel>
//                                                       detaildonations = [
//                                                     DonationModel(
//                                                         pk: itemHolder.pk,
//                                                         waktu_isi:
//                                                             DateTime.now()
//                                                                 .toString(),
//                                                         jenis_barang:
//                                                             jenis_barang,
//                                                         amount: amount,
//                                                         shipping_method:
//                                                             shipping_method,
//                                                         is_done: false)
//                                                   ];

//                                                   Map details = new Map();
//                                                   details['jenis_barang'] =
//                                                       jenis_barang != ""
//                                                           ? jenis_barang
//                                                           : '${itemHolder.jenis_barang}';
//                                                   details['amount'] = "8";
//                                                   //   0
//                                                   // ? int.parse('${amount}')
//                                                   // : int.parse(
//                                                   //     '${itemHolder.amount}');
//                                                   details['shipping_method'] =
//                                                       shipping_method != ""
//                                                           ? shipping_method
//                                                           : '${itemHolder.shipping_method}';
//                                                   String data = DonationToJson(
//                                                       detaildonations);
//                                                   // isiDetails.add(details);
//                                                   // showDialog(
//                                                   //   context: context,
//                                                   //   builder: (context) {
//                                                   //     return Dialog(
//                                                   //       shape:
//                                                   //           RoundedRectangleBorder(
//                                                   //         borderRadius:
//                                                   //             BorderRadius
//                                                   //                 .circular(10),
//                                                   //       ),
//                                                   //       elevation: 15,
//                                                   //       child: Center(
//                                                   //           widthFactor: 1,
//                                                   //           heightFactor: 4,
//                                                   //           child: Text(
//                                                   //             "Data berhasil disimpan",
//                                                   //             style: TextStyle(
//                                                   //                 color: Colors
//                                                   //                     .red),
//                                                   //           )),
//                                                   //     );
//                                                   //   },
//                                                   // );
//                                                   print(data);
//                                                   // final response =
//                                                   //     await http.post(
//                                                   //   Uri.parse(
//                                                   //       'https://irama-kain.up.railway.app/donation/edit/${itemHolder.pk}'),
//                                                   //   headers: <String, String>{
//                                                   //     'Content-Type':
//                                                   //         'application/json; charset=UTF-8',
//                                                   //   },
//                                                   //   body: jsonEncode(<String,
//                                                   //       String>{
//                                                   //     "jenis_barang":
//                                                   //         jenis_barang,
//                                                   //     "amount": '${amount}',
//                                                   //     "shipping_method":
//                                                   //         shipping_method
//                                                   //   }),
//                                                   // );
//                                                   final response =
//                                                       await request.post(
//                                                     "https://irama-kain.up.railway.app/donation/edit_flutter/${itemHolder.pk}",
                                                    
//                                                       {
                                                        
//                                                       "jenis_barang" : jenis_barang,
//                                                       "amount" : '${amount}',
//                                                       "shipping_method" : shipping_method

//                                                     }
//                                                   );
//                                                   print(response);
//                                                   if (response["status"] ==
//                                                       true) {
//                                                     showDialog<String>(
//                                                       context: context,
//                                                       builder: (BuildContext
//                                                               context) =>
//                                                           AlertDialog(
//                                                             elevation: 20,
//                                                             backgroundColor: Color.fromRGBO(170, 195, 138, 0.8),
//                                                             icon: Icon(Icons.sentiment_satisfied_sharp, color: Colors.amber, size: 25,),
//                                                         title: Text(
//                                                             "Info",
//                                                             textAlign: TextAlign.center,

//                                                             ),
//                                                         content: Text("Donasi berhasil diedit!", textAlign: TextAlign.center,),
//                                                         actions: [
//                                                           TextButton(
//                                                             onPressed: () =>
//                                                                 Navigator.pop(
//                                                                     context,
//                                                                     'OK'),
//                                                             child: const Text(
//                                                                 'OK',  textAlign: TextAlign.center,),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     );
//                                                   }
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 });
//                           },
//                         ))
//                   ],
//                 ),
//               ),
//             ]))
//       ]),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           child: ElevatedButton(
//             onPressed: () {
//               goBack(context);
//             },
//             child: Text('Back'),
//           ),
//           padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//         ),
//         elevation: 5,
//       ),
//     );
//   }
// }
