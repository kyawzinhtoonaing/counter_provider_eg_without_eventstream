import 'package:counter_provider_eg/app/controller/provider/app_provider.dart';
import 'package:counter_provider_eg/features/feature_b/controller/event/fb_increase_counter_event.dart';
import 'package:counter_provider_eg/features/feature_b/controller/model/FeatureBCounter.dart';
import 'package:counter_provider_eg/features/feature_b/controller/provider/feature_b_provider.dart';
import 'package:counter_provider_eg/features/feature_b/screens/fb_page3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FbPage2 extends StatelessWidget {
  static const String routeName = "/fb/page2";

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    FeatureBProvider fbp = appProvider.featureProviderFactory.currentFeatureProvider as FeatureBProvider;
    //FeatureBProvider fbp = Provider.of<FeatureBProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feature B - Page 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'In FB-Page 1, you have pushed the button this many times:',
            ),
            StreamBuilder<FeatureBCounter>(
              stream: fbp.store.p1CounterStateStream,

                /*subtitle: StreamBuilder<MWP00003Coinbill>(stream: coinbillStream, builder: (BuildContext context, AsyncSnapshot<MWP00003Coinbill> snapshot) {
                  return Text(snapshot?.data?.merchant ?? '', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
                })*/

              builder: (BuildContext context, AsyncSnapshot<FeatureBCounter> snapshot){
                int count = snapshot?.data?.value ?? 0;
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const Text(
              'In FB-Page 2, you have pushed the button this many times:',
            ),
            StreamBuilder<FeatureBCounter>(
              stream: fbp.store.p2CounterStateStream,

              /*subtitle: StreamBuilder<MWP00003Coinbill>(stream: coinbillStream, builder: (BuildContext context, AsyncSnapshot<MWP00003Coinbill> snapshot) {
                  return Text(snapshot?.data?.merchant ?? '', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
                })*/

              builder: (BuildContext context, AsyncSnapshot<FeatureBCounter> snapshot){
                int count = snapshot?.data?.value ?? 0;
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const Text(
              'In FB-Page 3, you have pushed the button this many times:',
            ),
            StreamBuilder<FeatureBCounter>(
              stream: fbp.store.p3CounterStateStream,

              /*subtitle: StreamBuilder<MWP00003Coinbill>(stream: coinbillStream, builder: (BuildContext context, AsyncSnapshot<MWP00003Coinbill> snapshot) {
                  return Text(snapshot?.data?.merchant ?? '', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20));
                })*/

              builder: (BuildContext context, AsyncSnapshot<FeatureBCounter> snapshot){
                int count = snapshot?.data?.value ?? 0;
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FbPage3.routeName);
                },
                child: const Text("Next")
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          fbp.increaseP2Counter(FbP2IncreaseCounterEvent(1));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}