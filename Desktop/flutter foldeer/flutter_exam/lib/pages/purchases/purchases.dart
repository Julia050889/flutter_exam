import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/base/styles/color.dart';
import 'package:flutter_exam/pages/purchases/bloc/purchases_bloc.dart';
import 'package:flutter_exam/pages/purchases/purchases_provider.dart';
import 'package:provider/provider.dart';

class PurchasesPageWidget extends StatefulWidget {
  const PurchasesPageWidget({super.key});

  @override
  State<PurchasesPageWidget> createState() => _PurchasesPageWidgetState();
}

class _PurchasesPageWidgetState extends State<PurchasesPageWidget> {
  final PurchasesBloc _newsBloc = PurchasesBloc();

  @override
  void initState() {
    _newsBloc.add(GetPurchasesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PurchasesBloc>(
      create: (context) => _newsBloc,
      child: Scaffold(
        body: BlocBuilder<PurchasesBloc, PurchasesState>(
            builder: (context, state) {
          if (state is PurchasesLoaded) {
            return Container(
              child: ListView.builder(
                  itemCount: state.purchases.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: ListTile(
                        title: Text(state.purchases[index].title.toString()),
                        subtitle: Text(state.purchases[index].subTitle ??
                            state.purchases[index].price.toString()),
                        leading: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: 60,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Style.blue,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.purchases[index].playsCount
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Plays',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        trailing: Text(state.purchases[index].price.toString()),
                      ),
                    );
                  }),
            );
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
