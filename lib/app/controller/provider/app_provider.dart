import 'package:counter_provider_eg/features/feature_a/controller/provider/feature_a_provider.dart';
import 'package:counter_provider_eg/features/feature_b/controller/provider/feature_b_provider.dart';
import 'package:counter_provider_eg/framework/controller/fw_provider.dart';
import 'package:rxdart/subjects.dart';

class AppProvider extends AbstractProvider {
  final AppProviderStore store = AppProviderStore();
  final AppFeatureProviderFactory featureProviderFactory = AppFeatureProviderFactory();
  final PublishSubject<AbstractEvent> _eventController = PublishSubject<AbstractEvent>();

  ///
  /// To be invoked to emit an event
  ///
  Function(AbstractEvent) get emitEvent => _eventController.sink.add;

  AppProvider() {
    _eventController.listen((event) {

    });
  }

  @override
  void dispose() {
    _eventController.close();
  }
}

class AppProviderStore extends AbstractProviderStore {
  @override
  void dispose() {
    // TODO: implement dispose
  }
}

class AppFeatureProviderFactory {
  AbstractProvider _featureProvider = DummyProvider();

  AbstractProvider get currentFeatureProvider => _featureProvider;

  void _destoryCurrentFeatureProvider() {
    _featureProvider?.dispose();
  }

  // Menu blocs initializations.
  void initFeatureAProvider() {
    _destoryCurrentFeatureProvider();
    _featureProvider = FeatureAProvider();
  }

  void initFeatureBProvider() {
    _destoryCurrentFeatureProvider();
    _featureProvider = FeatureBProvider();
  }

  void dispose() {
    _featureProvider?.dispose();
  }
}

class DummyProvider extends AbstractProvider {
  @override
  void dispose() {
    // TODO: implement dispose
  }
}