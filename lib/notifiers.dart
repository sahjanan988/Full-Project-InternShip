class MyStateNotifier extends StateNotifier<MyState> {
  MyStateNotifier() : super(MyState('Initial message'));

  void updateMessage(String newMessage) {
    state = MyState(newMessage);
  }
}