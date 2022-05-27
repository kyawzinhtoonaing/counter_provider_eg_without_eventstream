import 'package:counter_provider_eg/framework/controller/fw_provider.dart';

class FaP1IncreaseCounterEvent extends AbstractEvent {
  final int value;

  FaP1IncreaseCounterEvent(this.value);
}

class FaP2IncreaseCounterEvent extends AbstractEvent {
  final int value;

  FaP2IncreaseCounterEvent(this.value);
}

class FaP3IncreaseCounterEvent extends AbstractEvent {
  final int value;

  FaP3IncreaseCounterEvent(this.value);
}