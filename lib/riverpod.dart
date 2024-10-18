import 'package:riverpod/riverpod.dart';

class MyState {
  final int counter;

  MyState(this.counter);
}

final myStateProvider = StateNotifierProvider<MyStateNotifier, MyState>((ref) => MyStateNotifier());

class MyStateNotifier extends StateNotifier<MyState> {
  MyStateNotifier() : super(MyState(0));

  void increment() {
    state = MyState(state.counter + 1);
  }
}
final counterProvider = StateProvider((ref) => 0);

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider); // Establishes dependency

    return Text('$count');
  }
}