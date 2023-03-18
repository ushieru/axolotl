import 'package:axolotl/packages/event_handler/main.dart';

class EventHandlerSingleton {
  static final EventHandler _eventHandler = EventHandler();

  EventHandlerSingleton._();

  static EventHandler getInstance() => _eventHandler;
}
