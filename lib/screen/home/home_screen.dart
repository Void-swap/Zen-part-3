import 'package:flutter/material.dart';
import 'package:rive_animation/screen/council_hub/contact_doctor.dart';
import 'package:rive_animation/screen/council_hub/contact_intern.dart';
//import 'package:rive_animation/screen/council_hub/council_entry.dart';
import 'package:rive_animation/screen/council_hub/doctor_intern_instance.dart';
//import 'package:rive_animation/zen_zone/chat_room.dart';

class Hello1Page extends StatelessWidget {
  const Hello1Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello 1'),
      ),
      body: Center(
        child: Text('Hello 1 page Content'),
      ),
    );
  }
}

class Hello3Page extends StatelessWidget {
  const Hello3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Hello 1'),
            ),
            body: Center(
              child: Text('Hello 1 Page Content'),
            )));
  }
}

class Hello4Page extends StatelessWidget {
  Hello4Page({Key? key}) : super(key: key);
  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Smith",
      occupation: "Psychiatrist",
      imagefrmAsset: "doctor1.jpg",
      description:
          "I am Dr. Smith, a seasoned psychiatrist with a wealth of experience in diagnosing and treating a wide range of mental health conditions. My practice is based in the vibrant city of New York, NY. ",
      location: "New York, NY",
      timings: "9:00 AM - 5:00 PM",
      services: "Psychiatric Evaluation, Medication Management",
      contact: "1800-123-4567",
      fees: 1500,
    ),
    Doctor(
      name: "Dr. Johnson",
      occupation: "Clinical Psychologist",
      imagefrmAsset: "doctor2.jpg",
      description:
          "Greetings, I'm Dr. Johnson, a dedicated clinical psychologist based in Mumbai, India. I specialize in providing therapy and support to individuals facing emotional and psychological challenges.",
      location: "Mumbai, India",
      timings: "10:00 AM - 6:00 PM",
      services: "Individual Counseling, CBT, DBT",
      contact: "1800-987-6543",
      fees: 1800,
    ),
    Doctor(
      name: "Dr. Davis",
      occupation: "Psychiatrist",
      imagefrmAsset: "doctor3.jpg",
      description:
          "Hello, I'm Dr. Davis, an experienced psychiatrist located in the heart of Chicago, IL. I offer comprehensive psychiatric evaluations and personalized medication management to support your mental well-being.",
      location: "Chicago, IL",
      timings: "8:00 AM - 4:00 PM",
      services: "Psychiatric Evaluation, Medication Management",
      contact: "1800-567-8901",
      fees: 2200,
    ),
    Doctor(
      name: "Dr. Wilson",
      occupation: "Clinical Psychologist",
      imagefrmAsset: "doctor4.jpg",
      description:
          "I'm Dr. Wilson, a clinical psychologist based in beautiful San Francisco, CA. I offer individual counseling and specialize in various therapeutic approaches, ensuring you receive the support you need to thrive.",
      location: "San Francisco, CA",
      timings: "11:00 AM - 7:00 PM",
      services: "Individual Counseling, CBT, DBT",
      contact: "1800-345-6789",
      fees: 2600,
    ),
    Doctor(
      name: "Dr. Anderson",
      occupation: "Family Therapist",
      imagefrmAsset: "doctor5.jpg",
      description:
          "Greetings, I'm Dr. Anderson, a dedicated family therapist practicing in Houston, TX. My mission is to provide counseling and support to individuals and families facing mental health challenges. I specialize in family therapy and individual counseling to promote well-being.",
      location: "Houston, TX",
      timings: "9:00 AM - 5:00 PM",
      services: "Family Therapy, Counseling",
      contact: "1800-234-5678",
      fees: 2300,
    ),
    Doctor(
      name: "Dr. Martin",
      occupation: "Trauma Specialist",
      imagefrmAsset: "doctor6.jpg",
      description:
          "I'm Dr. Martin, a trauma specialist practicing in sunny Miami, FL. My goal is to help individuals recover from trauma and emotional distress through specialized counseling. I offer trauma counseling and mental health support to guide you on your healing journey.",
      location: "Miami, FL",
      timings: "10:00 AM - 6:00 PM",
      services: "Trauma Counseling, Mental Health Support",
      contact: "1800-876-5432",
      fees: 1400,
    ),
    Doctor(
      name: "Dr. White",
      occupation: "Mental Health Counselor",
      imagefrmAsset: "doctor7.jpg",
      description:
          "Hello, I'm Dr. White, a dedicated mental health counselor with expertise in diagnosing and treating mental health conditions. My practice is focused on individual counseling and emotional support to help you achieve mental well-being.",
      location: "Phoenix, AZ",
      timings: "8:30 AM - 4:30 PM",
      services: "Mental Health Counseling, Emotional Support",
      contact: "1800-789-0123",
      fees: 1700,
    ),
  ];

  final List<Interns> interns = [
    Interns(
      name: "Alice",
      occupation: "Bachelor's in Communication",
      imagefrmAsset: "intern1.jpg",
      description:
          "I'm Alice, a passionate individual eager to gain practical experience in the field of psychology. My dedication lies in assisting in various aspects of counseling and therapy. I'm here to provide support to help you on your journey.",
      location: "New York, NY",
      timings: "9:00 AM - 5:00 PM",
      services: "Assisting Counseling, Supportive Services",
      contact: "1800-555-1234",
    ),
    Interns(
      name: "Bob",
      occupation: "Master's in Psychology",
      imagefrmAsset: "intern2.jpg",
      description:
          "Hi there, I'm Bob, a psychology enthusiast eager to gain hands-on experience in the field. I'm committed to helping individuals improve their mental well-being through internship counseling and mental health support.",
      location: "Los Angeles, CA",
      timings: "10:00 AM - 6:00 PM",
      services: "Internship Counseling, Mental Health Support",
      contact: "1800-555-5678",
    ),
    Interns(
      name: "Charlie",
      occupation: "Bachelor's in Social Work",
      imagefrmAsset: "intern3.jpg",
      description:
          "I'm Charlie, thrilled to learn and contribute to the field of psychology as a psychology intern. My dedication lies in assisting individuals on their mental health journey, providing support and counseling.",
      location: "Chicago, IL",
      timings: "8:00 AM - 4:00 PM",
      services: "Internship Support, Psychological Assistance",
      contact: "1800-555-9012",
    ),
    Interns(
      name: "David",
      occupation: "Bachelor's in Educational Psychology",
      imagefrmAsset: "intern4.jpg",
      description:
          "Hello, I'm David, a psychology intern with enthusiasm for gaining practical knowledge in the field. My commitment is to help you achieve well-being through counseling.",
      location: "San Francisco, CA",
      timings: "11:00 AM - 7:00 PM",
      services: " Mental Health Assistance",
      contact: "1800-555-3456",
    ),
    Interns(
      name: "Ella",
      occupation: "Psychology Enthusiast",
      imagefrmAsset: "intern5.jpg",
      description:
          "I'm Ella, a psychology intern dedicated to learning and providing support to individuals facing emotional and psychological challenges. My passion lies in helping you on your journey to mental well-being through internship support and counseling.",
      location: "Mumbai, India",
      timings: "9:00 AM - 5:00 PM",
      services: "Internship Support, Counseling",
      contact: "1800-555-6789",
    ),
    Interns(
      name: "Frank",
      occupation: "PhD in Neuropsychology",
      imagefrmAsset: "intern6.jpg",
      description:
          "Greetings, I'm Frank, a psychology intern eager to gain hands-on experience in the field. My commitment is to assist individuals on their mental health journey through internship counseling and mental health support.",
      location: "Miami, FL",
      timings: "10:00 AM - 6:00 PM",
      services: "Internship Counseling, Mental Health Support",
      contact: "1800-555-4321",
    ),
    Interns(
      name: "Grace",
      occupation: "Master's in Marriage and Family Therapy",
      imagefrmAsset: "intern7.jpg",
      description:
          "Hello, I'm Grace, a psychology enthusiast enthusiastic about learning and contributing to the field of psychology. My dedication is to provide support to individuals in need through internship support and psychological assistance.",
      location: "New York, NY",
      timings: "8:30 AM - 4:30 PM",
      services: "Internship Support, Psychological Assistance",
      contact: "1800-555-7890",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),

        SingleChildScrollView(
          //padding: EdgeInsets.only(top: 40),
          child: Stack(
            children: [
              _backBgCover(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hello User",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Paid Counselors",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Number of rows
                      ),
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        Doctor doctor = doctors[index]; //doctor objects
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContactScreenForPaid(
                                  doctorName: doctor.name,
                                  occupation: doctor.occupation,
                                  imagefrmAsset: doctor.imagefrmAsset,
                                  description: doctor.description,
                                  location: doctor.location,
                                  timings: doctor.timings,
                                  services: doctor.services,
                                  contact: doctor.contact,
                                  fees: doctor.fees,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 9),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      "assets/images/${doctor.imagefrmAsset}"),
                                ),
                                Text(
                                  doctor.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  doctor.occupation,
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      "4.9",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  /**/ SizedBox(height: 15),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(),
                        height: MediaQuery.sizeOf(context).height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFA8C0FF), Color(0xFF5540DE)],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.all(9),
                            child: Text(
                              "Fresh Counselors",
                              style: TextStyle(
                                 fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    //crossAxisSpacing: 10, // horizontal spacing
                                    // mainAxisSpacing: 10,
                                  ),
                                  itemCount: interns.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    Interns internobj = interns[
                                        index]; // Access the Doctor object
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ContactScreen(
                                              internName: internobj.name,
                                              occupation: internobj.occupation,
                                              imagefrmAsset:
                                                  internobj.imagefrmAsset,
                                              description:
                                                  internobj.description,
                                              location: internobj.location,
                                              timings: internobj.timings,
                                              services: internobj.services,
                                              contact: internobj.contact,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 9, horizontal: 9),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 4,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 35,
                                              backgroundImage: AssetImage(
                                                  "assets/images/${internobj.imagefrmAsset}"),
                                            ),
                                            Text(
                                              internobj.name,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Text(
                                              internobj.occupation,
                                              style: TextStyle(
                                                color: Colors.black45,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            /*Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  Text(
                                                    "4.9",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              )*/
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        //  _greetings(),
      ],
    );
  }

  Container _backBgCover() {
    return Container(
      height: 235,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.center,
          colors: [Color(0xFFA8C0FF), Color(0xFF5540DE)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }
}

class Hello5Page extends StatelessWidget {
  const Hello5Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello 1'),
      ),
      body: Center(
        child: Text('Hello 5 Page Content'),
      ),
    );
  }
}
