import 'package:counter_provider_eg/features/feature_b/controller/event/fb_increase_counter_event.dart';
import 'package:counter_provider_eg/features/feature_b/controller/model/FeatureBCounter.dart';
import 'package:counter_provider_eg/framework/controller/fw_provider.dart';
import 'package:rxdart/rxdart.dart';

class FeatureBProvider extends AbstractProvider {
  final FeatureBProviderStore store = FeatureBProviderStore();
  //final PublishSubject<AbstractEvent> _eventController = PublishSubject<AbstractEvent>();

  ///
  /// To be invoked to emit an event
  ///
  //Function(AbstractEvent) get emitEvent => _eventController.sink.add;

  /*FeatureBProvider() {
    _eventController.listen((AbstractEvent event) {
      if (event is FbP1IncreaseCounterEvent) {
        increaseP1Counter(event);
      }

      else if (event is FbP2IncreaseCounterEvent) {
        increaseP2Counter(event);
      }

      else if (event is FbP3IncreaseCounterEvent) {
        increaseP3Counter(event);
      }
    });
  }*/

  Future<void> increaseP1Counter(FbP1IncreaseCounterEvent event) async {
    //FeatureBCounter oldState = store.p1CounterState;
    FeatureBCounter oldState = store.p1CounterStateStream.value;
    store.updateP1CounterState(FeatureBCounter(oldState.value + event.value));
  }

  Future<void> increaseP2Counter(FbP2IncreaseCounterEvent event) async {
    //FeatureBCounter oldState = store.p2CounterState;
    FeatureBCounter oldState = store.p2CounterStateStream.value;
    store.updateP2CounterState(FeatureBCounter(oldState.value + event.value));
  }

  Future<void> increaseP3Counter(FbP3IncreaseCounterEvent event) async {
    //FeatureACounter oldState = store.p3CounterState;
    FeatureBCounter oldState = store.p3CounterStateStream.value;
    store.updateP3CounterState(FeatureBCounter(oldState.value + event.value));
  }

  @override
  void dispose() {
    //_eventController.close();
  }
}

class FeatureBProviderStore extends AbstractProviderStore {
  final BehaviorSubject<FeatureBCounter> _p1CounterStateController = BehaviorSubject<FeatureBCounter>.seeded(FeatureBCounter(0));
  ValueStream<FeatureBCounter> get p1CounterStateStream => _p1CounterStateController.stream;
  //FeatureACounter get p1CounterState => _p1CounterStateController.stream.value;
  void updateP1CounterState(FeatureBCounter state) => _p1CounterStateController.sink.add(state);

  final BehaviorSubject<FeatureBCounter> _p2CounterStateController = BehaviorSubject<FeatureBCounter>.seeded(FeatureBCounter(0));
  ValueStream<FeatureBCounter> get p2CounterStateStream => _p2CounterStateController.stream;
  //FeatureACounter get p2CounterState => _p2CounterStateController.stream.value;
  void updateP2CounterState(FeatureBCounter state) => _p2CounterStateController.sink.add(state);

  final BehaviorSubject<FeatureBCounter> _p3CounterStateController = BehaviorSubject<FeatureBCounter>.seeded(FeatureBCounter(0));
  ValueStream<FeatureBCounter> get p3CounterStateStream => _p3CounterStateController.stream;
  //FeatureACounter get p3CounterState => _p3CounterStateController.stream.value;
  void updateP3CounterState(FeatureBCounter state) => _p3CounterStateController.sink.add(state);

  @override
  void dispose() {
    _p1CounterStateController.close();
    _p2CounterStateController.close();
    _p3CounterStateController.close();
  }
}