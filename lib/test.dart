class CustomRightSheet extends StatefulWidget {
  @override
  _CustomRightSheetState createState() => _CustomRightSheetState();
}

class _CustomRightSheetState extends State<CustomRightSheet> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Right Sheet")),
      body: Stack(
        children: [
          Center(child: Text("Main Content")),

          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            right: _isOpen ? 0 : -250,
            child: Container(
              width: 250,
              color: Colors.blue[100],
              child: Column(
                children: [
                  SizedBox(height: 60),
                  ListTile(title: Text("Item 1")),
                  ListTile(title: Text("Item 2")),
                ],
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                setState(() {
                  _isOpen = !_isOpen;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
