import 'package:flutter/material.dart';
import 'package:flutter_ui_design/API%20League/Meme%20API/meme_model.dart';
import 'service.dart';

class RandomMemeScreen extends StatefulWidget {
  const RandomMemeScreen({super.key});

  @override
  _RandomMemeScreenState createState() => _RandomMemeScreenState();
}

class _RandomMemeScreenState extends State<RandomMemeScreen> {
  RandomMeme? meme;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getNewmeme();
  }

  Future<void> _getNewmeme() async {
    setState(() {
      isLoading = true;
    });

    final newmeme = await ApiService().fetchRandomMeme();

    setState(() {
      meme = newmeme;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text("Random Meme"),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : meme != null 
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            meme!.url,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            meme!.description,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed:
                                _getNewmeme,
                            child: const Text("Generate New meme"),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Text(
                    "No meme available",
                  ),
      ),
    );
  }
}
