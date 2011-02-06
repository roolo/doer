// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


if (window.webkitNotifications) {
  desktopNotificationsEnabled = true;
} else {
  desktopNotificationsEnabled = false;
  
}

function RequestPermission(callback)
{
    window.webkitNotifications.requestPermission(callback);
}

function notifHTML(url) {
  if (window.webkitNotifications.checkPermission() > 0) {
    RequestPermission(notif);
  } else {
    notification = window.webkitNotifications.createHTMLNotification(url);
    notification.show();
  }
  
}

//document.observe("dom:loaded", function() {
//  notifHTML('http://kazimir:3000/suggestions/2/news_from/1297011362');
//});

