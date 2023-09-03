/*// Check local storage on page load and set the active tab
document.addEventListener('DOMContentLoaded', function() {
  var activeTabId = localStorage.getItem('activeTab');
  if (activeTabId) {
    var activeTabLink = document.querySelector('#nav .container a[href="' + activeTabId + '"]');
    if (activeTabLink) {
      setActiveLink(activeTabLink);
    }
  }
});

function setActiveLink(link) {
  var links = document.querySelectorAll('#nav .container a');
  links.forEach(function(item) {
    item.classList.remove('active');
  });
  link.classList.add('active');

  // Store the active tab in local storage
  var activeTabId = link.getAttribute('href');
  localStorage.setItem('activeTab', activeTabId);
}

// Call setActiveLink for the navigation links
var navLinks = document.querySelectorAll('#nav .container a');
navLinks.forEach(function(link) {
  link.addEventListener('click', function(e) {
    e.preventDefault();
    setActiveLink(this);
  });
});*/