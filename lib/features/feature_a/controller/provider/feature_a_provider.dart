
import 'package:counter_provider_eg/features/feature_a/controller/event/fa_increase_counter_event.dart';
import 'package:counter_provider_eg/framework/controller/fw_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../model/FeatureACounter.dart';

class FeatureAProvider extends AbstractProvider {
  final FeatureAProviderStore store = FeatureAProviderStore();
  //final PublishSubject<AbstractEvent> _eventController = PublishSubject<AbstractEvent>();

  ///
  /// To be invoked to emit an event
  ///
  //Function(AbstractEvent) get emitEvent => _eventController.sink.add;

  /*FeatureAProvider() {
    _eventController.listen((AbstractEvent event) {
      if (event is FaP1IncreaseCounterEvent) {
        increaseP1Counter(event);
      }

      else if (event is FaP2IncreaseCounterEvent) {
        increaseP2Counter(event);
      }

      else if (event is FaP3IncreaseCounterEvent) {
        increaseP3Counter(event);
      }
    });
  }*/

  Future<void> increaseP1Counter(FaP1IncreaseCounterEvent event) async {
    //FeatureACounter oldState = store.p1CounterState;
    FeatureACounter oldState = store.p1CounterStateStream.value;
    store.updateP1CounterState(FeatureACounter(oldState.value + event.value));
  }

  Future<void> increaseP2Counter(FaP2IncreaseCounterEvent event) async {
    //FeatureACounter oldState = store.p2CounterState;
    FeatureACounter oldState = store.p2CounterStateStream.value;
    store.updateP2CounterState(FeatureACounter(oldState.value + event.value));
  }

  Future<void> increaseP3Counter(FaP3IncreaseCounterEvent event) async {
    //FeatureACounter oldState = store.p3CounterState;
    FeatureACounter oldState = store.p3CounterStateStream.value;
    store.updateP3CounterState(FeatureACounter(oldState.value + event.value));
  }

  @override
  void dispose() {
    //_eventController.close();
  }
}

class FeatureAProviderStore extends AbstractProviderStore {
  final BehaviorSubject<FeatureACounter> _p1CounterStateController = BehaviorSubject<FeatureACounter>.seeded(FeatureACounter(0));
  ValueStream<FeatureACounter> get p1CounterStateStream => _p1CounterStateController.stream;
  //FeatureACounter get p1CounterState => _p1CounterStateController.stream.value;
  void updateP1CounterState(FeatureACounter state) => _p1CounterStateController.sink.add(state);

  final BehaviorSubject<FeatureACounter> _p2CounterStateController = BehaviorSubject<FeatureACounter>.seeded(FeatureACounter(0));
  ValueStream<FeatureACounter> get p2CounterStateStream => _p2CounterStateController.stream;
  //FeatureACounter get p2CounterState => _p2CounterStateController.stream.value;
  void updateP2CounterState(FeatureACounter state) => _p2CounterStateController.sink.add(state);

  final BehaviorSubject<FeatureACounter> _p3CounterStateController = BehaviorSubject<FeatureACounter>.seeded(FeatureACounter(0));
  ValueStream<FeatureACounter> get p3CounterStateStream => _p3CounterStateController.stream;
  //FeatureACounter get p3CounterState => _p3CounterStateController.stream.value;
  void updateP3CounterState(FeatureACounter state) => _p3CounterStateController.sink.add(state);

  @override
  void dispose() {
    _p1CounterStateController.close();
    _p2CounterStateController.close();
    _p3CounterStateController.close();
  }
}