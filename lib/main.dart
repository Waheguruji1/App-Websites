import 'dart:ui'; // For ImageFilter
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const InspiropageApp());
}

class InspiropageApp extends StatelessWidget {
  const InspiropageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspiropage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0214), // Deep Void Violet
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double contentPadding = screenWidth > 800 ? screenWidth * 0.25 : 24.0;

    return Scaffold(
      body: Stack(
        children: [
          // --- BACKGROUND LAYER (Cosmic Glows) ---
          Positioned(
            top: -100,
            left: -100,
            child: _GlowOrb(
              color: const Color(0xFF6A0dad),
              diameter: 400,
            ), // Royal Purple
          ),
          Positioned(
            bottom: 200,
            right: -100,
            child: _GlowOrb(
              color: const Color(0xFF00E5FF),
              diameter: 300,
            ), // Cyan
          ),
          // Frost Overlay to blend the glows
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 90.0, sigmaY: 90.0),
            child: Container(color: Colors.transparent),
          ),

          // --- FOREGROUND CONTENT ---
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),

                  // 1. HEADER LOGO
                  Text(
                    "INSPIROPAGE",
                    style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 5.0,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.purpleAccent.withValues(alpha: 0.5),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // 2. COMPACT PHONE MOCKUP
                  Transform.rotate(
                    angle: -0.1,
                    child: const _PhoneFrame(
                      child: Center(
                        child: Text(
                          "App Screen\nAsset",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // 3. GRADIENT HEADLINE
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.white, Color(0xFFB39DDB)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    child: Text(
                      "Stay Inspired.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 4. GLASS BUTTONS
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _GlassButton(
                        icon: FontAwesomeIcons.apple,
                        label: "App Store",
                        onTap: () {},
                      ),
                      _GlassButton(
                        icon: FontAwesomeIcons.googlePlay,
                        label: "Google Play",
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 100),

                  // 5. PERSONA (Typewriter)
                  Column(
                    children: [
                      Text(
                        "Created for",
                        style: GoogleFonts.inter(
                          fontSize: 19,
                          color: const Color.fromARGB(230, 255, 255, 255),
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 13),
                      SizedBox(
                        height: 50,
                        child: DefaultTextStyle(
                          style: GoogleFonts.inter(
                            letterSpacing: 2.0,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              const Shadow(
                                color: Colors.purpleAccent,
                                blurRadius: 15,
                              ),
                            ],
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Tired Days.',
                                speed: Duration(milliseconds: 80),
                              ),
                              TypewriterAnimatedText(
                                'Busy Minds.',
                                speed: Duration(milliseconds: 80),
                              ),
                              TypewriterAnimatedText(
                                'A Quiet Reset.',
                                speed: Duration(milliseconds: 80),
                              ),
                              TypewriterAnimatedText(
                                'One Gentle Story.',
                                speed: Duration(milliseconds: 80),
                              ),
                              TypewriterAnimatedText(
                                'A Better Direction.',
                                speed: Duration(milliseconds: 80),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 100),

                  // 6. HEADING: WHAT IT OFFERS
                  _SectionHeader(title: "WHAT IT OFFERS"),

                  const SizedBox(height: 40),

                  // 7. GLOWING FEATURES
                  _GlowingFeature(
                    emoji: "🌊",
                    text: "Drift through ideas without the noise.",
                  ),
                  _GlowingFeature(
                    emoji: "🕯️",
                    text:
                        "Meaningful reads for mornings, nights, and in-between .",
                  ),
                  _GlowingFeature(
                    emoji: "✨",
                    text: "Curated mood paths - not endless feeds.",
                  ),
                  _GlowingFeature(
                    emoji: "💬",
                    text: "Soft reminders that support you, at your own pace.",
                  ),

                  const SizedBox(height: 100),

                  // 8. THE STORY (Glass Card)
                  Container(
                    padding: const EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.auto_awesome,
                              color: Colors.cyanAccent,
                              size: 18,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Evening Ride (Fictional)",
                              style: GoogleFonts.inter(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyanAccent,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text(
                          "Luca walked his bicycle along a quiet street in Florence.\n\n The day felt full, but unfinished. 😵‍💫\n\n He stopped by the river and sat for a moment.\n\n Not to scroll — just to pause.\n\n A short read on InspiroPage.\n\n One simple thought: you don’t have to carry everything home. 📖\n\n The water kept moving.\n\n So did his thoughts. 🌊\n\n He got back on the bike.\n\n The ride felt lighter. 🌿 ",
                          style: GoogleFonts.lora(
                            fontSize: 18,
                            height: 1.3,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),

                  // 9. THE DIFFERENCE (Comparison)
                  _SectionHeader(title: "THE DIFFERENCE"),
                  const SizedBox(height: 40),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.withValues(
                            alpha: 0.05,
                          ), // Subtle red tint left
                          Colors.teal.withValues(
                            alpha: 0.05,
                          ), // Subtle teal tint right
                        ],
                        stops: const [0.49, 0.51],
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // BAD SIDE
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _CompareItem(
                                text: "Loud motivation",
                                isPositive: false,
                              ),
                              _CompareItem(
                                text: "Endless scrolling",
                                isPositive: false,
                              ),
                              _CompareItem(
                                text: "Toxic productivity",
                                isPositive: false,
                              ),
                            ],
                          ),
                        ),
                        // DIVIDER
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          width: 1,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.white.withValues(alpha: 0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        // GOOD SIDE
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CompareItem(
                                text: "Calm reading",
                                isPositive: true,
                              ),
                              _CompareItem(
                                text: "Gentle perspective",
                                isPositive: true,
                              ),
                              _CompareItem(
                                text: "Emotional clarity",
                                isPositive: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),

                  // FOOTER
                  Text(
                    "PhantomCode © 2025",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.white30,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- WIDGETS ---

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. The Text (Bigger, Brighter, Glowing)
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18, // Increased from 12
            fontWeight: FontWeight.w900,
            color: Colors.white, // Pure white instead of dimmed
            letterSpacing: 4.0, // Wider spacing
            shadows: [
              // Cyan glow behind the text
              Shadow(
                color: Colors.cyanAccent.withValues(alpha: 0.8),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),

        // 2. The Line (Wider Neon Bar)
        Container(
          width: 60, // Wider (was 30)
          height: 3, // Thicker (was 2)
          decoration: BoxDecoration(
            color: Colors.cyanAccent, // Neon Cyan
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              // The line glows too
              BoxShadow(
                color: Colors.cyanAccent.withValues(alpha: 0.6),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double diameter;
  const _GlowOrb({required this.color, required this.diameter});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.35),
      ),
    );
  }
}

class _PhoneFrame extends StatelessWidget {
  final Widget child;
  const _PhoneFrame({required this.child});

  @override
  Widget build(BuildContext context) {
    // UPDATED DIMENSIONS: 250 x 460 (Shorter/Squatter)
    return Container(
      width: 230,
      height: 440,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFF202020), width: 6),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A0dad).withValues(alpha: 0.5),
            blurRadius: 60,
            spreadRadius: -5,
          ),
          const BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                color: const Color(0xFF1E1E1E),
                child: Image(
                  image: AssetImage('assets/Story.jpg'),
                ), // <--- IMAGE GOES HERE
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 80,
              height: 22,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _GlassButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: Colors.white, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      label,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlowingFeature extends StatelessWidget {
  final String emoji;
  final String text;
  const _GlowingFeature({required this.emoji, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withValues(alpha: 0.02), // Very subtle backing
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(
                fontSize: 22,
                shadows: [Shadow(color: Colors.purple, blurRadius: 15)],
              ),
            ),
            const SizedBox(width: 15),
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 17,
                  color: Colors.white.withValues(alpha: 0.9),
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompareItem extends StatelessWidget {
  final String text;
  final bool isPositive;
  const _CompareItem({required this.text, required this.isPositive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPositive) ...[
            const Icon(Icons.check, color: Colors.cyanAccent, size: 14),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              text,
              textAlign: isPositive ? TextAlign.left : TextAlign.right,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: isPositive ? Colors.white : Colors.white54,
                decoration: isPositive ? null : TextDecoration.lineThrough,
                decorationColor: Colors.red.withValues(alpha: 0.8),
              ),
            ),
          ),
          if (!isPositive) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.close,
              color: Colors.redAccent.withValues(alpha: 0.6),
              size: 14,
            ),
          ],
        ],
      ),
    );
  }
}
