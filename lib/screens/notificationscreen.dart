import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Initially, all notifications are unread
  List<NotificationItem> notifications = [
    // Your notifications go here
  ];

  List<NotificationItem> get unreadNotifications =>
      notifications.where((n) => !n.isRead).toList();
  List<NotificationItem> get readNotifications =>
      notifications.where((n) => n.isRead).toList();

  void markAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text('Notifications'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Handle more actions
              },
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Unread'),
              Tab(text: 'Read'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildNotificationList(context, notifications, markAsRead, 'All'),
            _buildNotificationList(
                context, unreadNotifications, markAsRead, 'Unread'),
            _buildNotificationList(
                context, readNotifications, markAsRead, 'Read'),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(
    BuildContext context,
    List<NotificationItem> notificationList,
    Function(int) markAsRead,
    String tab,
  ) {
    if (notificationList.isEmpty) {
      // Display empty state based on the tab
      String message = tab == 'Unread'
          ? 'All caught up!\nThere are no new notifications.'
          : 'No notifications!';
      String imagePath = tab == 'Unread' ? 'images/Noconnection.png' : '';

      return Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagePath.isNotEmpty) Image.asset(imagePath, width: 250),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      );
    } else {
      // Display list of notifications
      return ListView(
        children: notificationList
            .asMap()
            .entries
            .map((entry) => _buildNotificationItem(
                  context,
                  entry.value,
                  () => markAsRead(entry.key),
                ))
            .toList(),
      );
    }
  }

  Widget _buildNotificationItem(
    BuildContext context,
    NotificationItem notification,
    VoidCallback onRead,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: notification.color,
              child: Icon(notification.iconData, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              notification.title,
              style: TextStyle(
                fontWeight:
                    notification.isRead ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(notification.dateTime),
            SizedBox(height: 8.0),
            if (!notification.isRead) ...[
              TextButton(
                child: Text('Share'),
                onPressed: () {
                  // TODO: Implement share functionality
                },
              ),
              TextButton(
                child: Text('Add to Profile'),
                onPressed: () {
                  // TODO: Implement add to profile functionality
                },
              ),
            ],
            IconButton(
              icon: Icon(notification.isRead
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: onRead,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem {
  IconData iconData;
  Color color;
  String title;
  String dateTime;
  bool isRead;

  NotificationItem({
    required this.iconData,
    required this.color,
    required this.title,
    required this.dateTime,
    this.isRead = false,
  });
}
