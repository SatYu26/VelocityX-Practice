import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' as math;

class MyStore extends VxStore {
  int counter = 0;
}

class IncrementMutation extends VxMutation<MyStore> {
  @override
  perform() {
    store.counter++;
  }
}

class DecrementMutation extends VxMutation<MyStore> {
  @override
  perform() {
    store.counter--;
  }
}

class LogInterceptor extends VxInterceptor {
  @override
  void afterMutation(VxMutation<VxStore> mutation) {
    print('Current State ${(mutation.store as MyStore).counter}');
  }

  @override
  bool beforeMutation(VxMutation<VxStore> mutation) {
    print('Previous State ${(mutation.store as MyStore).counter}');
    return true;
  }
}

class MyHomePage extends StatelessWidget {
  final AnimatorKey<double> animKey = AnimatorKey<double>();

  @override
  Widget build(BuildContext context) {
    final MyStore store = VxState.store;
    // VxState.watch(context, on: [IncrementMutation]);
    var fabs = [
      FloatingActionButton(
        onPressed: () {
          animKey.triggerAnimation();
          return IncrementMutation();
        },
        tooltip: 'Increment',
        backgroundColor: Vx.green500,
        child: Icon(Icons.add),
      ),
      10.widthBox,
      FloatingActionButton(
        onPressed: () => DecrementMutation(),
        tooltip: 'Decrement',
        backgroundColor: Vx.red500,
        child: Icon(Icons.remove),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('velocityX'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Button Press'),
              VxBuilder(
                mutations: {IncrementMutation, DecrementMutation},
                builder: (ctx, _) => VxAnimator<double>(
                  animatorKey: animKey,
                  builder: (context, state, child) => Transform.rotate(
                    angle: math.pi * state.value,
                    child: '${store.counter}'
                        .text
                        // .size(state.value)
                        .xl4
                        .indigo700
                        .size(50)
                        .headline4(context)
                        .make(),
                  ),
                ).doubleTween(0.0, 2.0).fastOutSlowIn.make(),
              ),
            ],
          ),
        ),
        floatingActionButton: VxLayout(builder: (context, size, constraints) {
          return Row(
            mainAxisAlignment: size == VxWindowSize.xsmall
                ? MainAxisAlignment.end
                : MainAxisAlignment.center,
            children: fabs,
          );
        }));
  }
}
