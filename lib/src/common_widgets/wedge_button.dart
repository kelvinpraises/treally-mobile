import 'package:flutter/material.dart';
import 'package:treally_mobile/src/constants/colors.dart';

class WedgeButton extends StatelessWidget {
  const WedgeButton({
    Key? key,
    required this.label,
    required this.callback,
    this.fillColor,
    this.color,
    required this.width,
    this.height,
    this.fontSize,
    this.loading = false,
  }) : super(key: key);

  final String label;
  final Function callback;
  final Color? fillColor;
  final Color? color;
  final double width;
  final double? height;
  final double? fontSize;
  final bool loading;

  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: loading ? null : () => callback(),
      shape: const _CustomBorder(),
      elevation: 0,
      fillColor: fillColor ?? kGreen,
      child: loading
          ? SizedBox(
              height: height ?? 70,
              width: width,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kGreen2,
                ),
              ),
            )
          : SizedBox(
              height: height ?? 70,
              width: width,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: color ?? Colors.white,
                    fontSize: fontSize ?? 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
    );
  }
}

Path _getButtonShape(double width, double height) {
  Path path = Path();
  path.moveTo(width * 0.003284768, height * 0.2415584);
  path.cubicTo(
    width * 0.003284768,
    height * 0.1421818,
    width * 0.04138411,
    height * 0.05884416,
    width * 0.09183444,
    height * 0.04954545,
  );
  path.cubicTo(
    width * 0.1961921,
    height * 0.03032468,
    width * 0.3716026,
    height * 0.002000000,
    width * 0.4999735,
    height * 0.002000000,
  );
  path.cubicTo(
    width * 0.6283444,
    height * 0.002000000,
    width * 0.8037550,
    height * 0.03031169,
    width * 0.9081126,
    height * 0.04954545,
  );
  path.cubicTo(
    width * 0.9585629,
    height * 0.05884416,
    width * 0.9966623,
    height * 0.1421818,
    width * 0.9966623,
    height * 0.2415714,
  );
  path.lineTo(
    width * 0.9966623,
    height * 0.7494416,
  );
  path.cubicTo(
    width * 0.9966623,
    height * 0.8488312,
    width * 0.9585629,
    height * 0.9321688,
    width * 0.9081126,
    height * 0.9414675,
  );
  path.cubicTo(
    width * 0.8037550,
    height * 0.9606883,
    width * 0.6283444,
    height * 0.9890130,
    width * 0.4999669,
    height * 0.9890130,
  );
  path.cubicTo(
    width * 0.3716026,
    height * 0.9890130,
    width * 0.1961921,
    height * 0.9607013,
    width * 0.09183444,
    height * 0.9414675,
  );
  path.cubicTo(
    width * 0.04139073,
    height * 0.9321688,
    width * 0.003284768,
    height * 0.8488312,
    width * 0.003284768,
    height * 0.7494416,
  );
  path.lineTo(
    width * 0.003284768,
    height * 0.2415714,
  );
  path.close();

  return path;
}

class _CustomBorder extends OutlinedBorder {
  const _CustomBorder({BorderSide side = BorderSide.none}) : super(side: side);

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return _CustomBorder(side: side ?? this.side);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getButtonShape(rect.width, rect.height);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getButtonShape(rect.width, rect.height);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    switch (side.style) {
      case BorderStyle.none:
        break;
      case BorderStyle.solid:
        canvas.drawPath(
            _getButtonShape(rect.width, rect.height),
            Paint()
              ..style = PaintingStyle.stroke
              ..color = Colors.black
              ..strokeWidth = 1.0);
    }
  }

  @override
  ShapeBorder scale(double t) => _CustomBorder(side: side.scale(t));
}
