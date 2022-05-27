import 'package:counter_provider_eg/framework/controller/fw_provider.dart';

class FbP1IncreaseCounterEvent extends AbstractEvent {
  final int value;

  FbP1IncreaseCounterEvent(this.value);
}

class FbP2IncreaseCounterEvent extends AbstractEvent {
  final int value;

  FbP2IncreaseCounterEvent(this.value);
}

class FbP3IncreaseCounterEvent extends AbstractEvent {
  final int value;

  FbP3IncreaseCounterEvent(this.value);
}