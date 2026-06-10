# logoanimation

A Flutter splash screen that hand-draws the Threads logo with a single animated
"pen" stroke, then fades away to reveal the app.

## How it works

The whole effect lives in [`lib/splash.dart`](lib/splash.dart). `SplashView`
wraps your app's root widget and overlays a self-drawing logo on a black
background. When the animation finishes, the overlay fades out and the wrapped
child is shown.

```dart
MaterialApp(
  home: const SplashView(child: HomePage()),
);
```

### The animation

A single `AnimationController` (2 s) drives two values via `TweenSequence`:

- **`_draw`** — `0 → 1`, eased, controlling how much of the logo is revealed.
  Holds at `1.0` for the last 20% of the timeline so the finished logo is
  briefly visible.
- **`_overlayFade`** — stays opaque for 85% of the timeline, then fades the
  black overlay to transparent so the app underneath appears.

### The painter

`_ThreadsPainter` (a `CustomPainter`) draws the logo as one continuous pen
stroke, in two phases sharing a single timeline:

1. **Outer ring** — the round silhouette, drawn as a 30 px stroke. The path is
   traced in reverse so it starts at the top-right tip and sweeps around to the
   "bridge" point where the inner hook begins.
2. **Inner hook / swirl** — the inner `@` tail, rendered as a filled ribbon
   (not a stroke) built from offset edges plus rounded end-caps. Its width ramps
   from a thin string to full width so it emerges as a clean thread.

Both phases are clipped to the logo's fill path (even-odd) so the inner counter
stays open and any overdraw onto the rim is hidden.

### Tuning the look

Key knobs in `lib/splash.dart`:

| What | Where |
| --- | --- |
| Total animation duration | `_ctrl` duration in `initState` |
| Reveal vs. hold / fade timing | the `weight` values in `_draw` / `_overlayFade` |
| Logo size on screen | the `Size` passed to `CustomPaint` in `build` |
| Stroke / ribbon width | `strokeWidth` (ring) and `maxR` (hook) in `paint` |
| Hook start thickness & taper | `minR` and `rampLen` in `paint` |
| Logo geometry | the `_logoFillPath`, `_outerPath`, and `_hookPath` getters |

`makeThreadsPainter(double draw)` is exposed for building the painter in
isolation (e.g. visual tests) at a fixed `draw` value.

## Getting Started

```bash
flutter pub get
flutter run
```

For help with Flutter development, see the
[online documentation](https://docs.flutter.dev/).
