import 'dart:math';
import 'package:flutter/material.dart';

class FullScreenCustomPaint extends StatefulWidget {
  const FullScreenCustomPaint({super.key});

  @override
  State<FullScreenCustomPaint> createState() => _FullScreenCustomPaintState();
}

class _FullScreenCustomPaintState extends State<FullScreenCustomPaint>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final List<Star> _stars = List.generate(30, (_) => Star.random());

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _animationController.addListener(() {
      setState(() {
        for (var star in _stars) {
          star.update();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.stop(); // Stop the animation
    _animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color to white
      child: CustomPaint(
        painter: StarPainter(
          animation: _animationController,
          stars: _stars,
        ),
      ),
    );
  }
}

class Star {
  Offset position;
  Offset velocity;
  Color color; // Add a color property

  Star(this.position, this.velocity, this.color);

  Star.random()
      : position = Offset(Random().nextDouble(), Random().nextDouble()),
        velocity = Offset(Random().nextDouble() * 0.01 - 0.005,
            Random().nextDouble() * 0.01 - 0.005),
        color = Color.fromARGB(
            255,
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256)); // Assign a random color

  void update() {
    position += velocity;

    if (position.dx < 0 || position.dx > 1) {
      velocity = Offset(-velocity.dx, velocity.dy);
    }
    if (position.dy < 0 || position.dy > 1) {
      velocity = Offset(velocity.dx, -velocity.dy);
    }
  }
}

class StarPainter extends CustomPainter {
  final Animation<double> animation;
  final List<Star> stars;

  StarPainter({required this.animation, required this.stars});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw each star
    for (Star star in stars) {
      Offset point = star.position.scale(size.width, size.height);
      final starPath = _createStarPath(
          point, 5, 5.0, 14.0); // Adjust the size of the star as needed

      final paint = Paint()
        ..color = star.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;

      canvas.drawPath(starPath, paint);
    }
  }

  Path _createStarPath(
      Offset center, int points, double innerRadius, double outerRadius) {
    final double angle = (2 * pi) / points;
    final Path path = Path();
    double starAngle = pi / 2;

    path.moveTo(center.dx + cos(starAngle) * outerRadius,
        center.dy + sin(starAngle) * outerRadius);
    starAngle += angle / 2;

    for (int i = 0; i < points; i++) {
      path.lineTo(center.dx + cos(starAngle) * innerRadius,
          center.dy + sin(starAngle) * innerRadius);
      starAngle += angle / 2;
      path.lineTo(center.dx + cos(starAngle) * outerRadius,
          center.dy + sin(starAngle) * outerRadius);
      starAngle += angle / 2;
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LineDrawer extends CustomPainter {
  final Animation<double> animation;
  final List<Offset> points;

  LineDrawer({required this.animation, required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, Random().nextInt(256),
          Random().nextInt(256), Random().nextInt(256))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path = Path();

    // Adjust the points to be relative to the size of the screen
    Offset prevPoint = points.first.scale(size.width, size.height);
    for (Offset point in points) {
      point = point.scale(size.width, size.height);
      path.lineTo(point.dx, point.dy);
      canvas.drawLine(prevPoint, point, paint);
      prevPoint = point;
    }

    // Close the path
    path.lineTo(points.first.dx, points.first.dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
