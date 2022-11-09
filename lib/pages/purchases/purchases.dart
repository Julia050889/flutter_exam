import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/pages/purchases/bloc/purchases_bloc.dart';

class PurchasesPageWidget extends StatelessWidget {
  const PurchasesPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PurchasesBloc>(
        create: (context) => PurchasesBloc()..add(GetPurchasesList()),
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              color: Colors.green,
            ),
            Center(
              child: Container(
                height: 800,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BlocBuilder<PurchasesBloc, PurchasesState>(
                  builder: (context, state) {
                    return ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Text('h');
                        });
                  },
                ),
              ),
            ),
          ],
        )));
  }
//         BlocBuilder<PurchasesBloc, PurchasesState>(
//             builder: (context, state) {
//           if (state is PurchasesLoaded) {
//             return Stack(
//               children: [Container(
//                 color: Colors.green),
//                 Container(
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.white)),
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                   child: ListView.builder(
//                       itemCount: state.purchases.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                             child: Text(
//                           '5',
//                         )

//                             // ListTile(
//                             //   title: Text(state.purchases[index].title.toString()),
//                             //   subtitle: Text(state.purchases[index].subTitle ??
//                             //       state.purchases[index].price.toString()),
//                             //   leading: Stack(
//                             //       alignment: AlignmentDirectional.center,
//                             //       children: [
//                             //         Container(
//                             //           width: 100,
//                             //           height: 120,
//                             //           decoration: BoxDecoration(
//                             //               color: Style.blue,
//                             //               borderRadius: BorderRadius.circular(12)),
//                             //         ),
//                             //         Container(
//                             //           height: 50,
//                             //           width: 50,
//                             //           decoration: BoxDecoration(
//                             //               borderRadius: BorderRadius.circular(12),
//                             //               border: Border.all(color: Colors.white)),
//                             //           child: Column(
//                             //             mainAxisAlignment: MainAxisAlignment.center,
//                             //             crossAxisAlignment: CrossAxisAlignment.center,
//                             //             children: [
//                             //               Text(
//                             //                 state.purchases[index].playsCount
//                             //                     .toString(),
//                             //                 style:
//                             //                     const TextStyle(color: Colors.white),
//                             //               ),
//                             //               const Text(
//                             //                 'Plays',
//                             //                 style: TextStyle(color: Colors.white),
//                             //               ),
//                             //             ],
//                             //           ),
//                             //         ),
//                             //       ]),
//                             //   trailing: Text(state.purchases[index].price.toString()),
//                             // ),
//                             );
//                       }),
//                 ),
//               ),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         }),
//       ),
//     );
//   }
// }
}
