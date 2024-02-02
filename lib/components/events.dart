import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/services/firestore.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final FirestoreService _firestoreService = FirestoreService();
  List<Event> eventList = [];
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  void _addEvent(String? docId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Event'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a date';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _timeController,
                  decoration: const InputDecoration(
                    labelText: 'Time',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a time';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final event = Event(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    location: _locationController.text,
                    date: _dateController.text,
                    time: _timeController.text,
                  );
                  setState(() {
                    if (docId != null) {
                      _firestoreService.updateEvent(docId, {
                        'title': event.title,
                        'description': event.description,
                        'location': event.location,
                        'date': event.date,
                        'time': event.time,
                      });
                    } else {
                      _firestoreService.addEvent({
                        'title': event.title,
                        'description': event.description,
                        'location': event.location,
                        'date': event.date,
                        'time': event.time,
                      });
                    }
                    eventList.add(event);

                    //clear text fields
                    _titleController.clear();
                    _descriptionController.clear();
                    _locationController.clear();
                    _dateController.clear();
                    _timeController.clear();
                  });

                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestoreService.getEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DocumentSnapshot> eventDocs = snapshot.data!.docs;

              return ListView.builder(
                itemCount: eventDocs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = eventDocs[index];
                  String docId = doc.id;

                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;

                  return ListTile(
                    title: Text(data['title']),
                    subtitle: Text(data['description']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _addEvent(docId),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Delete eventList
                            setState(() {
                              _firestoreService.deleteEvent(docId);
                              eventList.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No events found'),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _addEvent(null);
        },
      ),
    );
  }
}

class Event {
  final String title;
  final String description;
  final String location;
  final String date;
  final String time;

  Event(
      {required this.title,
      required this.description,
      required this.location,
      required this.date,
      required this.time});
}
