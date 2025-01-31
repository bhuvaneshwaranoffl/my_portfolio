import 'package:flutter/material.dart';
import 'package:portfolio/view/aboutsection.dart';
import 'package:portfolio/view/contact.dart';
import 'package:portfolio/view/homesection.dart';
import 'package:portfolio/view/project.dart';
import 'package:portfolio/view/skills.dart';
import 'package:portfolio/view/study.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Study': GlobalKey(),
    'Contact': GlobalKey(),
  };

  String _activeSection = 'Home';

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _activeSection = section;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: isMobile
          ? AppBar(
            backgroundColor: Colors.black,
            surfaceTintColor: Colors.transparent,
              title: Text('My Portfolio',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            )
          : AppBar(
              backgroundColor: Colors.black,
              title: Text('My Portfolio',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              actions: _sectionKeys.keys.map((section) {
                return TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  tween: Tween<double>(
                    begin: _activeSection == section ? 0 : 1,
                    end: _activeSection == section ? 1 : 0,
                  ),
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () => _scrollToSection(section),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              section,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                shadows: _activeSection == section
                                    ? [
                                        Shadow(
                                          blurRadius: 15.0,
                                          color:
                                              Colors.purple.shade800,
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: value * 40, // Animated width
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.purple.shade800,
                                borderRadius: BorderRadius.circular(2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple.shade800,
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('My Portfolio',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                  ..._sectionKeys.keys.map((section) {
                    return ListTile(
                      title: Text(
                        section,
                        style: TextStyle(
                          color: _activeSection == section
                              ? Colors.purple
                              : Colors.black,
                          fontWeight: _activeSection == section
                              ? FontWeight.bold
                              : FontWeight.normal,
                          shadows: _activeSection == section
                              ? [
                                  Shadow(
                                    blurRadius: 15.0,
                                    color: Colors.purple,
                                  ),
                                ]
                              : [],
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _scrollToSection(section);
                      },
                    );
                  }),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
                key: _sectionKeys['Home'], height: 500, child: Homesection()),
            SizedBox(
                key: _sectionKeys['About'], height: 500, child: Aboutsection()),
            SizedBox(key: _sectionKeys['Skills'], height: 500, child: Skills()),
            SizedBox(
                key: _sectionKeys['Projects'], height: 500, child: Project()),
            SizedBox(key: _sectionKeys['Study'], height: 500, child: Study()),
            SizedBox(
                key: _sectionKeys['Contact'], height: 500, child: Contact()),
          ],
        ),
      ),
    );
  }
}
