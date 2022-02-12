import 'package:flutter/material.dart';

/// https://stackoverflow.com/questions/58352828/flutter-design-instagram-like-balloons-tooltip-widget

class TooltipShapeBorder extends ShapeBorder {
  /// Width of the arrow thingy
  final double arrowWidth;

  /// Height of the arrow thingy
  final double arrowHeight;

  /// Curvature of the arrow
  final double arrowArc;

  /// Radius of the corners of the container
  final double radius;

  /// Arrow at the top or at the bottom
  final String arrowPosition;

  TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
    this.arrowPosition = 'bottom',
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
  //  @override
  // Path? getInnerPath(Rect rect, {TextDirection textDirection}) {

  //   return null;
  // }
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    /// Create rectangle from fiven points
    rect = Rect.fromPoints(
      rect.topLeft,
      rect.bottomRight - Offset(0, arrowHeight),
    );
    double x = arrowWidth,
        y = arrowHeight,
        r = arrowPosition == 'top' ? 1 - arrowArc : 1 - arrowArc;
    // Arrow data points
    double moveToX = arrowPosition == 'top'
        ? rect.topCenter.dx + x / 2
        : rect.bottomCenter.dx + x / 2;
    double moveToY =
        arrowPosition == 'top' ? rect.topCenter.dy : rect.bottomCenter.dy;
    double relativeLineToX = arrowPosition == 'top' ? x / 2 * r : -x / 2 * r;
    double relativeLineToY = arrowPosition == 'top' ? y * r : y * r;
    double relativeQuadraticBezierToX1 =
        arrowPosition == 'top' ? x / 2 * (1 + r) : -x / 2 * (1 - r);
    double relativeQuadraticBezierToY1 =
        arrowPosition == 'top' ? y * (1 + r) : y * (1 - r);
    double relativeQuadraticBezierToX2 =
        arrowPosition == 'top' ? -x * (1 - r) : -x * (1 - r);
    double relativeQuadraticBezierToY2 = arrowPosition == 'top' ? 0 : 0;
    double finalRelativeLineToX =
        arrowPosition == 'top' ? -x / 2 * r : -x / 2 * r;
    double finalRelativeLineToY = arrowPosition == 'top' ? -y * r : -y * r;
    return Path()

      /// adds a rectangle as a new sub-path
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))

      /// Starts a new sub-path at the given coordinate.
      ..moveTo(moveToX, moveToY)

      /// Adds a straight line segment from the current point to the point
      /// at the given offset from the current point.
      ..relativeLineTo(relativeLineToX, relativeLineToY)

      /// Adds a quadratic bezier segment that curves from the current
      /// point to the point at the offset (x2,y2) from the current point,
      /// using the control point at the offset (x1,y1) from the current
      /// point.
      ..relativeQuadraticBezierTo(
          relativeQuadraticBezierToX1,
          relativeQuadraticBezierToY1,
          relativeQuadraticBezierToX2,
          relativeQuadraticBezierToY2)

      /// Adds a straight line segment from the current point to the point
      /// at the given offset from the current point.
      ..relativeLineTo(finalRelativeLineToX, finalRelativeLineToY);
  }

  /// We use the CustomPaint widget that provides us a canvas to be used
  /// by the CustomPainter to paint what we provide in the paint method.
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
