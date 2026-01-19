import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mobile_scanner/mobile_scanner.dart'; // REQUIRED for QR Code

// -------------------------------------------------------
// 1. REAL-TIME QR CODE SCANNER
// -------------------------------------------------------
class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final MobileScannerController controller = MobileScannerController(
    returnImage: false,
  );

  bool _isScanning = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (!_isScanning) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    setState(() {
      _isScanning = false; // Pause scanning
    });

    final String code = barcodes.first.rawValue ?? "Unknown";

    // Show Medicine Details Popup
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 350,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 30),
                const SizedBox(width: 10),
                const Text(
                  "Medicine Detected",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 30),
            _buildDetailRow(Icons.qr_code, "Code ID", code),
            _buildDetailRow(Icons.medication, "Medicine", "Amoxicillin 500mg"),
            _buildDetailRow(Icons.calendar_today, "Expiry", "Dec 2026"),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _isScanning = true; // Resume scanning
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Scan Another"),
              ),
            ),
          ],
        ),
      ),
    ).then((_) {
      setState(() {
        _isScanning = true;
      });
    });
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 15),
          Text(
            "$label:",
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Scan Medicine"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_off, color: Colors.white),
            onPressed: () => controller.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch, color: Colors.white),
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(controller: controller, onDetect: _onDetect),
          Container(
            decoration: ShapeDecoration(
              shape: QrScannerOverlayShape(
                borderColor: const Color(0xFF009688),
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          const Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Align QR code within frame",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------
// 2. SOS EMERGENCY SCREEN
// -------------------------------------------------------
class SOSScreen extends StatelessWidget {
  const SOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text("EMERGENCY MODE"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pulse(
              infinite: true,
              child: const Icon(
                Icons.warning_amber_rounded,
                size: 100,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sending Alert to Family...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Calling Ambulance...",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
              ),
              child: const Text("CANCEL ALERT"),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------
// 3. DIET PLAN SCREEN
// -------------------------------------------------------
class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Diet Plan")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildCard(
            "Breakfast",
            "Oatmeal with Fruits",
            "300 Kcal",
            Icons.wb_sunny,
          ),
          _buildCard(
            "Lunch",
            "Grilled Chicken Salad",
            "500 Kcal",
            Icons.wb_cloudy,
          ),
          _buildCard(
            "Dinner",
            "Steamed Vegetables",
            "250 Kcal",
            Icons.nights_stay,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String food, String cal, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(food),
        trailing: Text(
          cal,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------
// 4. EXERCISE SCREEN
// -------------------------------------------------------
class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fitness & Yoga")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _buildExCard("Yoga", Icons.self_improvement, Colors.purple),
          _buildExCard("Cardio", Icons.directions_run, Colors.red),
          _buildExCard("Meditation", Icons.spa, Colors.teal),
          _buildExCard("Strength", Icons.fitness_center, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildExCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// -------------------------------------------------------
// 5. HOSPITAL LOCATOR
// -------------------------------------------------------
class HospitalScreen extends StatelessWidget {
  const HospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nearby Hospitals")),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.red),
            title: Text("City General Hospital"),
            subtitle: Text("1.2 km away • Open 24/7"),
            trailing: Icon(Icons.directions, color: Colors.blue),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.red),
            title: Text("Sunrise Medical Center"),
            subtitle: Text("3.5 km away • Open 8am-8pm"),
            trailing: Icon(Icons.directions, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

// Helper Class for QR Overlay (Required to avoid errors)
class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  QrScannerOverlayShape({
    this.borderColor = Colors.red,
    this.borderWidth = 10.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return getLeftTopPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final borderWidthSize = width / 2;
    final height = rect.height;
    final borderOffset = borderWidth / 2;
    final mCutOutSize = cutOutSize;
    final mBorderLength = borderLength;
    final mBorderRadius = borderRadius;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    final cutOutRect = Rect.fromLTWH(
      rect.left + width / 2 - mCutOutSize / 2 + borderOffset,
      rect.top + height / 2 - mCutOutSize / 2 + borderOffset,
      mCutOutSize - borderOffset * 2,
      mCutOutSize - borderOffset * 2,
    );

    canvas.saveLayer(rect, backgroundPaint);
    canvas.drawRect(rect, backgroundPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(cutOutRect, Radius.circular(mBorderRadius)),
      Paint()..blendMode = BlendMode.clear,
    );
    canvas.restore();

    final path = Path();
    path.moveTo(cutOutRect.left, cutOutRect.top + mBorderLength);
    path.lineTo(cutOutRect.left, cutOutRect.top + mBorderRadius);
    path.quadraticBezierTo(
      cutOutRect.left,
      cutOutRect.top,
      cutOutRect.left + mBorderRadius,
      cutOutRect.top,
    );
    path.lineTo(cutOutRect.left + mBorderLength, cutOutRect.top);

    path.moveTo(cutOutRect.right, cutOutRect.top + mBorderLength);
    path.lineTo(cutOutRect.right, cutOutRect.top + mBorderRadius);
    path.quadraticBezierTo(
      cutOutRect.right,
      cutOutRect.top,
      cutOutRect.right - mBorderRadius,
      cutOutRect.top,
    );
    path.lineTo(cutOutRect.right - mBorderLength, cutOutRect.top);

    path.moveTo(cutOutRect.right, cutOutRect.bottom - mBorderLength);
    path.lineTo(cutOutRect.right, cutOutRect.bottom - mBorderRadius);
    path.quadraticBezierTo(
      cutOutRect.right,
      cutOutRect.bottom,
      cutOutRect.right - mBorderRadius,
      cutOutRect.bottom,
    );
    path.lineTo(cutOutRect.right - mBorderLength, cutOutRect.bottom);

    path.moveTo(cutOutRect.left, cutOutRect.bottom - mBorderLength);
    path.lineTo(cutOutRect.left, cutOutRect.bottom - mBorderRadius);
    path.quadraticBezierTo(
      cutOutRect.left,
      cutOutRect.bottom,
      cutOutRect.left + mBorderRadius,
      cutOutRect.bottom,
    );
    path.lineTo(cutOutRect.left + mBorderLength, cutOutRect.bottom);

    canvas.drawPath(path, borderPaint);
  }

  @override
  ShapeBorder scale(double t) {
    return QrScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}
