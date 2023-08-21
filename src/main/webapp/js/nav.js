function setActiveLink(link) {
  var links = document.querySelectorAll('.list a');
  links.forEach(function(item) {
    item.classList.remove('active');
  });
  link.classList.add('active');

  // Store the active tab in local storage
  var activeTabId = link.getAttribute('href');
  localStorage.setItem('activeTab', activeTabId);
}

// Check local storage on page load and set the active tab
document.addEventListener('DOMContentLoaded', function() {
  var activeTabId = localStorage.getItem('activeTab');
  if (activeTabId) {
    var activeTabLink = document.querySelector('.list a[href="' + activeTabId + '"]');
    if (activeTabLink) {
      setActiveLink(activeTabLink);
    }
  }
});
