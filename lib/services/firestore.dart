import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of events
  final CollectionReference _eventsCollection =
      FirebaseFirestore.instance.collection('events');

//create a new event
  String addEvent(Map<String, dynamic> event) {
    return _eventsCollection.add(event).toString();
  }

//get all events in the collection
  Stream<QuerySnapshot> getEvents() {
    return _eventsCollection.snapshots();
  }

//update event
  Future<void> updateEvent(eventId, Map<String, dynamic> event) {
    return _eventsCollection.doc(eventId).update(event);
  }

//delete event
  Future<void> deleteEvent(eventId) {
    return _eventsCollection.doc(eventId).delete();
  }
}
