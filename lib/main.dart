
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => _MainPageState(),
      '/second': (context) => SecondRoute(),
      '/third': (context) => const ThirdRoute(),
      '/fourth': (context) => const FourthRoute(),
      '/fifth' : (context) => const LoginForm(),
    },
  )); //MaterialApp
}

// ignore: must_be_immutable
class _MainPageState extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text('Curriculum Vitae '),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius:100.0,
              backgroundColor: Colors.green[300],
              backgroundImage: AssetImage('images/home.gif'),
            ),
            const Text(
              ' Click Proceed to continue. ' ,
              style: TextStyle(
                fontFamily: 'McLaren',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 150),
                          child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                Navigator.pushNamed(context, '/fifth');
                              },
                              color: Colors.purpleAccent,
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Text('Proceed'))),

                    ],
                  ),
                ))
          ],
        ),
      );
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  TextEditingController uname = TextEditingController();
  TextEditingController upaswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Login Image
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 400,
                  height: 200,
                  child: Image.asset(
                    'assets/images/secured.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            //Edit Text
            SizedBox(height: 20.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: uname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Please Enter User Name'),
              ),
            ),

            SizedBox(height: 10.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: upaswd,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Please Enter Password'),
              ),
            ),

            SizedBox(height: 20.0),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {


                  String _name = uname.text.toString().trim();
                  String _paswd = upaswd.text.toString();

                  if (_name.isEmpty) {
                    print('Please Enter User Name');

                  } else if (_paswd.isEmpty) {
                    print('Please Enter Password');

                  } else {
                    if (_name == 'admin' && _paswd == 'admin') {
                      Navigator.pushNamed(context, '/second');
                    } else {
                      print('Login Fail');
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SecondRoute extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Curriculum Vitae'),
          backgroundColor: Colors.deepPurpleAccent
      ), // AppBar
      body: SafeArea(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.green[200],
              backgroundImage: AssetImage('images/pascual.jpg'),
            ),
            Text(
              'Generoso Paningbatan Pascual',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'BS in Information Technology',
              style: TextStyle(
                fontFamily: 'Lobster',
                color: Colors.black,
                fontSize: 15.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.normal,
              ),
            ),

            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),


            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 110.0),
              child: ListTile(
                title: Text(
                  'CREDENTIALS',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontFamily: 'Acme'),
                ),

              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // background
                foregroundColor: Colors.black, // foreground
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              icon: Icon(Icons.account_tree_outlined),
              label: Text('Educational Background'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ), // ElevatedButton
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // background
                foregroundColor: Colors.black, // foreground
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              icon: Icon(Icons.info_outline),
              label: Text('About Me'),
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey, // background
                foregroundColor: Colors.black, // foreground
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
              icon: Icon(Icons.home),
              label: Text('Home'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),

          ],

        ),

      ),
    ); // Scaffold
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Education"),
        backgroundColor: Colors.deepPurpleAccent,
      ), // AppBar
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/bg.png'),
            ),
            SizedBox(
              height: 15.0,
              width: 100.0,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
                title: Text(
                  'Tertiary Education ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Orbitron',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text('College'
                ),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Philippine College of Science and Technology',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text('Bachelor of Science in Information Technology 2020-2024'
                ),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
                title: Text(
                  'Secondary Education',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'Orbitron'),
                ),
                subtitle: Text('Junior High School & Senior High School'
                ),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Bayambang National High School',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text('Senior High School 2016-2018'
                ),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Hermosa National High School',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text('Junior High School 2012-2016'
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
                title: Text(
                  'Primary Education',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'Orbitron'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
              child: ListTile(
                title: Text(
                  'Malioer Elementary School',
                  style: TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text('Year Graduated: 2012'
                ),
              ),
            ),
          ],

        ),
      ), // Center
    ); // Scaffold
  }
}

class FourthRoute extends StatelessWidget {
  const FourthRoute({key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Professional Background"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.green[200],
              backgroundImage: AssetImage('images/educ.jpg'),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                title: Text(
                  "Professional Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lobster',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text("A highly motivated and freshly graduated  out of college. I am skilled in a variety of programming languages and have a strong background in object-oriented programming and software development. My greatest strengths in my ability is to solve complex problems quickly and effectively.", textAlign: TextAlign.justify,

                ),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.add_task_rounded,
                  color: Colors.black,
                ),
                title: Text(
                  'Skills',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lobster',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text("HTML, CSS, JAVASCRIPT, PHP, SQL & PYTHON "
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.build_sharp,
                  color: Colors.black,
                ),
                title: Text(
                  'Web-Development',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lobster',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text("I am web-developer way back before when I was in college."
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.cast_for_education,
                  color: Colors.black,
                ),
                title: Text(
                  'Certificates',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lobster',
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text("NCII Computer System Servicing "
                ),
              ),
            ),
          ],

        ),
      ), /// AppBar

    ); // Scaffold
  }
}



