import 'package:flutter/material.dart';

class AboutScrren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('About'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Developing apps for mobile devices requires considering the constraints and features of these devices. Mobile devices run on battery and have less powerful processors than personal computers and also have more features such as location detection and cameras. Developers also have to consider a wide array of screen sizes, hardware specifications and configurations because of intense competition in mobile software and changes within each of the platforms (although these issues can be overcome with mobile device detection).Mobile application development requires the use of specialized integrated development environments. Mobile apps are first tested within the development environment using emulators and later subjected to field testing. Emulators provide an inexpensive way to test applications on mobile phones to which developers may not have physical access.citation neededMobile user interface (UI) Design is also essential. Mobile UI considers constraints and contexts, screen, input and mobility as outlines for design. The user is often the focus of interaction with their device, and the interface entails components of both hardware and software. User input allows for the users to manipulate a system, and device's output allows the system to indicate the effects of the users' manipulation. Mobile UI design constraints include limited attention and form factors, such as a mobile device's screen size for a user's hand. Mobile UI contexts signal cues from user activity, such as location and scheduling that can be shown from user interactions within a mobile application. Overall, mobile UI design's goal is primarily for an understandable, user-friendly interface.Mobile UIs, or front-ends, rely on mobile back-ends to support access to enterprise systems. The mobile back-end facilitates data routing, security, authentication, authorization, working off-line, and service orchestration. This functionality is supported by a mix of middleware components including mobile app servers, Mobile Backend as a service (MBaaS), and SOA infrastructure.Conversational interfaces display the computer interface and present interactions through text instead of graphic elements. They emulate conversations with real humans.[14] There are two main types of conversational interfaces: voice assistants (like the Amazon Echo) and chatbots.[14]Conversational interfaces are growing particularly practical as users are starting to feel overwhelmed with mobile apps (a term known as app fatigue).[15][16]David Limp, Amazon's senior vice president of devices, says in an interview with Bloomberg, ",
              style: TextStyle(
                fontSize: 20,
            ),
            ),
          )
        ],
      ),
    );
  }
}
