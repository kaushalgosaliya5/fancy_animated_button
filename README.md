<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Fancy Animated Button

Fancy Animated Button package lets you add a beautiful animated button container to your Flutter app.

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  fancy_animated_button: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:fancy_animated_button/fancy_animated_button.dart';
```

```dart
class FancyAnimatedButtonScreen extends StatelessWidget {
  const FancyAnimatedButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fancy Animated Button Screen'),
          backgroundColor: Colors.cyan,
        ),
        body: FancyAnimatedButton(
          onClick: () {},
        ));
  }
}
```

<table>
<tr>
<td>
<img  src="https://drive.google.com/file/d/1KdJ7rtQtsB2aTIilYaYaB_02XPNR3BvU/edit"  alt="">
</td>
</tr>
</table>

## Next Goals

- [x] Add onTap for functions.
