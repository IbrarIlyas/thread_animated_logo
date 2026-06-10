import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final Widget child;
  const SplashView({super.key, required this.child});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _draw;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _draw = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 80,
      ),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 20),
    ]).animate(_ctrl);

    // Draw the logo once, then leave it fully drawn on screen.
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, context) => ColoredBox(
            color: Colors.black,
            child: Center(
              child: CustomPaint(
                size: const Size(120, 138.8),
                painter: _ThreadsPainter(draw: _draw.value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Test hook: build the painter from outside this library.
CustomPainter makeThreadsPainter(double draw) => _ThreadsPainter(draw: draw);

class _ThreadsPainter extends CustomPainter {
  final double draw;

  const _ThreadsPainter({required this.draw});

  static const double _vbW = 166.0;
  static const double _vbH = 192.0;

  // Cached metrics so we don't recompute every frame.
  static List<PathMetric>? _outerMetrics;
  static List<PathMetric>? _hookMetrics;
  static double? _cachedOuterLen;
  static double? _cachedHookLen;

  static Path get _logoFillPath {
    final p = Path()..fillType = PathFillType.evenOdd;
    p.moveTo(84.0664, 0.5);
    p.lineTo(85.375, 0.515625);
    p.cubicTo(112.756, 0.988837, 133.992, 10.345, 148.577, 28.2881);
    p.cubicTo(155.8, 37.1738, 161.137, 47.873, 164.566, 60.2881);
    p.lineTo(149.385, 64.3379);
    p.cubicTo(146.531, 54.1871, 142.245, 45.4518, 136.572, 38.4717);
    p.cubicTo(124.811, 24.0012, 107.101, 16.6112, 84.0166, 16.4404);
    p.lineTo(84.0088, 16.4404);
    p.cubicTo(61.0908, 16.6113, 43.6783, 23.9666, 32.3447, 38.374);
    p.cubicTo(21.7485, 51.8437, 16.309, 71.252, 16.1055, 95.9961);
    p.lineTo(16.1045, 95.9961);
    p.lineTo(16.1055, 96.0039);
    p.cubicTo(16.309, 120.748, 21.7495, 140.156, 32.3447, 153.626);
    p.cubicTo(43.6773, 168.034, 61.0916, 175.389, 84.0098, 175.559);
    p.lineTo(84.0166, 175.559);
    p.cubicTo(104.672, 175.407, 118.418, 170.487, 129.854, 159.062);
    p.cubicTo(142.939, 145.988, 142.707, 129.929, 138.507, 120.135);
    p.cubicTo(136.029, 114.354, 131.548, 109.564, 125.538, 105.938);
    p.lineTo(124.886, 105.544);
    p.lineTo(124.784, 106.3);
    p.cubicTo(123.347, 117.013, 120.096, 125.475, 114.987, 131.987);
    p.cubicTo(108.48, 140.282, 99.2387, 144.95, 87.4531, 145.849);
    p.lineTo(86.3047, 145.924);
    p.cubicTo(76.9654, 146.434, 67.9976, 144.18, 61.0508, 139.594);
    p.cubicTo(52.8453, 134.176, 48.0525, 125.896, 47.5391, 116.266);
    p.cubicTo(47.0326, 106.764, 50.5442, 98.6101, 57.1104, 92.6533);
    p.cubicTo(63.6848, 86.6892, 73.3507, 82.9041, 85.1738, 82.2236);
    p.cubicTo(93.5972, 81.7395, 101.469, 82.1206, 108.741, 83.3564);
    p.lineTo(109.432, 83.4746);
    p.lineTo(109.318, 82.7832);
    p.cubicTo(108.368, 76.9712, 106.473, 72.2839, 103.619, 68.8193);
    p.lineTo(103.34, 68.4873);
    p.cubicTo(99.1877, 63.6674, 92.803, 61.2382, 84.4609, 61.1846);
    p.lineTo(84.2285, 61.1846);
    p.cubicTo(77.6321, 61.1847, 68.619, 63.0018, 62.7471, 71.5342);
    p.lineTo(49.792, 62.6484);
    p.cubicTo(57.3832, 51.4194, 69.5653, 45.2452, 84.2217, 45.2451);
    p.lineTo(84.5586, 45.2451);
    p.lineTo(85.7158, 45.2637);
    p.cubicTo(97.5916, 45.5721, 107.05, 49.4609, 113.77, 56.4609);
    p.cubicTo(120.711, 63.6925, 124.783, 74.3007, 125.52, 87.8721);
    p.lineTo(125.536, 88.1816);
    p.lineTo(125.822, 88.3047);
    p.cubicTo(126.663, 88.6654, 127.496, 89.0433, 128.32, 89.4385);
    p.cubicTo(139.917, 95.0019, 148.371, 103.411, 152.801, 113.738);
    p.cubicTo(158.986, 128.165, 159.556, 151.683, 140.765, 170.457);
    p.cubicTo(126.383, 184.826, 108.926, 191.328, 84.0664, 191.5);
    p.lineTo(83.9609, 191.5);
    p.cubicTo(56.0048, 191.307, 34.5718, 181.906, 20.1807, 163.612);
    p.cubicTo(7.56478, 147.574, 0.932891, 125.318, 0.515625, 97.3965);
    p.lineTo(0.5, 96.0635);
    p.lineTo(0.5, 96.0078);
    p.lineTo(0.500977, 95.9395);
    p.lineTo(0.500977, 95.9355);
    p.cubicTo(0.723481, 67.3889, 7.36467, 44.6793, 20.1807, 28.3887);
    p.cubicTo(34.347, 10.38, 55.3365, 0.988868, 82.6553, 0.515625);
    p.lineTo(83.9609, 0.5);
    p.lineTo(84.0664, 0.5);
    p.moveTo(91.8711, 97.9678);
    p.cubicTo(89.9664, 97.9678, 88.0274, 98.0231, 86.0518, 98.1377);
    p.cubicTo(77.3984, 98.6364, 71.5623, 100.983, 67.9326, 104.211);
    p.cubicTo(64.2942, 107.447, 62.9149, 111.533, 63.1211, 115.398);
    p.cubicTo(63.3989, 120.62, 66.3681, 124.439, 70.5654, 126.857);
    p.cubicTo(74.6194, 129.193, 79.8356, 130.238, 84.9717, 130.03);
    p.lineTo(85.4678, 130.006);
    p.cubicTo(90.6275, 129.723, 96.2246, 128.565, 100.775, 124.287);
    p.cubicTo(105.325, 120.01, 108.746, 112.691, 109.74, 100.272);
    p.lineTo(109.775, 99.8379);
    p.lineTo(109.349, 99.7441);
    p.cubicTo(104.007, 98.5767, 98.1379, 97.9678, 91.8711, 97.9678);
    p.close();
    return p;
  }

  // Outer ring: from the bridge point (128.32, 89.4385) around the rim to the
  // top-right tip (164.566, 60.2881). Drawn reversed in paint() so the trace
  // starts at the tip and finishes at the bridge.
  static Path get _outerPath {
    final p = Path();
    p.moveTo(128.32, 89.4385);
    p.cubicTo(139.917, 95.0019, 148.371, 103.411, 152.801, 113.738);
    p.cubicTo(158.986, 128.165, 159.556, 151.683, 140.765, 170.457);
    p.cubicTo(126.383, 184.826, 108.926, 191.328, 84.0664, 191.5);
    p.lineTo(83.9609, 191.5);
    p.cubicTo(56.0048, 191.307, 34.5718, 181.906, 20.1807, 163.612);
    p.cubicTo(7.56478, 147.574, 0.932891, 125.318, 0.515625, 97.3965);
    p.lineTo(0.5, 96.0635);
    p.lineTo(0.5, 96.0078);
    p.lineTo(0.500977, 95.9395);
    p.lineTo(0.500977, 95.9355);
    p.cubicTo(0.723481, 67.3889, 7.36467, 44.6793, 20.1807, 28.3887);
    p.cubicTo(34.347, 10.38, 55.3365, 0.988868, 82.6553, 0.515625);
    p.lineTo(83.9609, 0.5);
    p.lineTo(84.0664, 0.5);
    p.lineTo(85.375, 0.515625);
    p.cubicTo(112.756, 0.988837, 133.992, 10.345, 148.577, 28.2881);
    p.cubicTo(155.8, 37.1738, 161.137, 47.873, 164.566, 60.2881);
    return p;
  }

  // Hook / swirl — the inner "@" tail as a single open centreline. Winds
  // counter-clockwise from the bridge: center-left, down the left, round the
  // bottom, up the right, then curling to finish at the top.
  static Path get _hookPath {
    final p = Path();
    p.moveTo(139.32, 96.4385); // bridge — ring's end point
    p.cubicTo(110.0, 93.0, 85.0, 90.0, 62.0, 100.0); // to center-left
    p.cubicTo(56.0, 107.0, 53.0, 113.0, 55.0, 120.0); // down the left
    p.cubicTo(58.0, 131.0, 72.0, 139.0, 88.0, 140.0); // round the bottom
    p.cubicTo(101.0, 141.0, 112.0, 134.0, 114.0, 122.0); // to bottom-right
    p.cubicTo(116.0, 114.0, 117.0, 106.0, 115.0, 98.0); // up the right
    p.cubicTo(115.0, 84.0, 110.0, 70.0, 100.0, 60.0); // curl up
    p.cubicTo(92.0, 52.0, 83.0, 49.0, 72.0, 51.0); // finish top-left
    return p;
  }

  void _ensureMetrics() {
    if (_outerMetrics != null) return;
    _outerMetrics = _outerPath.computeMetrics().toList();
    _hookMetrics = _hookPath.computeMetrics().toList();
    _cachedOuterLen = _outerMetrics!.fold(0.0, (s, m) => s! + m.length);
    _cachedHookLen = _hookMetrics!.fold(0.0, (s, m) => s! + m.length);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (draw <= 0.0) return;

    _ensureMetrics();

    final lenOuter = _cachedOuterLen!;
    final lenHook = _cachedHookLen!;
    final total = lenOuter + lenHook;

    final scaleX = size.width / _vbW;
    final scaleY = size.height / _vbH;

    canvas.save();
    canvas.scale(scaleX, scaleY);
    canvas.clipPath(_logoFillPath);

    // The hook is rendered as a single filled ribbon (Phase 2), not a stroke.
    final hookFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Butt cap so the ring ends exactly on the rim, with no inward nub.
    final ringPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    // Ring and hook share one timeline: ring first, hook second.
    final drawn = draw * total;

    // Phase 1 — outer ring, revealed from its end backward so the trace starts
    // at the top-right tip and finishes at the bridge point.
    double remaining = drawn.clamp(0.0, lenOuter);
    for (final m in _outerMetrics!) {
      final take = remaining.clamp(0.0, m.length);
      if (take > 0) canvas.drawPath(m.extractPath(m.length - take, m.length), ringPaint);
      remaining -= take;
      if (remaining <= 0) break;
    }

    // Phase 2 — hook / swirl, after the ring completes. Built as one closed
    // contour: forward along the left offset edge, a round cap at the leading
    // tip, back along the right edge, then a round cap at the tail. halfWidth
    // ramps from a thin string (minR) to full width (maxR) over `rampLen`.
    if (drawn > lenOuter) {
      const double rampLen = 45.0; // distance over which the string widens
      const double maxR = 15.0; // full half-width (== the old 30px stroke)
      const double minR = 1; // string half-width at the very start
      const double step = 1.5; // centreline sampling spacing
      const int capSegments = 10; // arc resolution of the round end-caps

      final m = _hookMetrics!.first; // hook is a single open contour
      final double end =
          (drawn - lenOuter).clamp(0.0, lenHook).clamp(0.0, m.length);

      double halfWidth(double d) =>
          lerpDouble(minR, maxR, (d / rampLen).clamp(0.0, 1.0))!;

      // Sample the centreline: spine point, left-hand normal, half-width.
      final positions = <Offset>[];
      final normals = <Offset>[];
      final radii = <double>[];

      void sample(double d) {
        final t = m.getTangentForOffset(d);
        if (t == null) return;
        final v = t.vector; // unit tangent
        positions.add(t.position);
        normals.add(Offset(-v.dy, v.dx)); // left-hand unit normal
        radii.add(halfWidth(d));
      }

      for (double d = 0.0; d < end; d += step) {
        sample(d);
      }
      sample(end); // always include the exact leading tip

      if (positions.length >= 2) {
        final strip = Path();

        // Offset edge point: sign +1 = left edge, -1 = right edge.
        Offset edge(int i, double sign) =>
            positions[i] + normals[i] * (sign * radii[i]);

        // Sweep a half-circle cap of `radius` around `centre`, from `aStart` to
        // `aEnd`. Angle 0 points along `dir` (bulge), +pi/2 along `n` (left edge).
        void addCap(
          Offset centre,
          Offset n,
          double radius,
          Offset dir,
          double aStart,
          double aEnd,
        ) {
          for (int s = 0; s <= capSegments; s++) {
            final a = aStart + (aEnd - aStart) * (s / capSegments);
            final c = math.cos(a);
            final sn = math.sin(a);
            strip.lineTo(
              centre.dx + (c * dir.dx + sn * n.dx) * radius,
              centre.dy + (c * dir.dy + sn * n.dy) * radius,
            );
          }
        }

        final last = positions.length - 1;

        // LEFT edge, tail -> tip.
        final l0 = edge(0, 1.0);
        strip.moveTo(l0.dx, l0.dy);
        for (int i = 1; i <= last; i++) {
          final p = edge(i, 1.0);
          strip.lineTo(p.dx, p.dy);
        }

        // Leading cap: bulge forward (tangent = normal rotated -90deg),
        // sweeping left edge -> right edge.
        final nTip = normals[last];
        addCap(
          positions[last],
          nTip,
          radii[last],
          Offset(nTip.dy, -nTip.dx),
          math.pi / 2,
          -math.pi / 2,
        );

        // RIGHT edge, tip -> tail.
        for (int i = last; i >= 0; i--) {
          final p = edge(i, -1.0);
          strip.lineTo(p.dx, p.dy);
        }

        // Tail cap: bulge backward, sweeping right edge -> left edge.
        final nTail = normals[0];
        addCap(
          positions[0],
          nTail,
          radii[0],
          Offset(-nTail.dy, nTail.dx),
          -math.pi / 2,
          math.pi / 2,
        );

        strip.close();
        canvas.drawPath(strip, hookFill);
      } else if (positions.length == 1) {
        // Degenerate first frame — a single dot at the tip.
        canvas.drawCircle(positions.first, radii.first, hookFill);
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _ThreadsPainter old) => old.draw != draw;
}