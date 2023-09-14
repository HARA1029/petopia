document.addEventListener('DOMContentLoaded', function() {
  var userButtons = document.querySelectorAll('.user-button');
  var navLinks = document.querySelectorAll('#nav .container a');
  var activeTabId = localStorage.getItem('activeTab');

  // 로컬 스토리지에서 활성 탭을 가져와 설정합니다.
  if (activeTabId) {
    var activeTabLink = document.querySelector('#nav .container a[href="' + activeTabId + '"]');
    if (activeTabLink) {
      setActiveLink(activeTabLink);
    }
  }

  // 사용자 버튼에 클릭 이벤트 리스너를 추가합니다.
  userButtons.forEach(function(button) {
    button.addEventListener('click', function(event) {
      event.preventDefault(); // 기본 폼 제출 동작을 막습니다.

      // 현재 클릭한 버튼의 'active' 클래스를 토글합니다.
      button.classList.toggle('active');

      // 다른 버튼에서 'active' 클래스를 제거합니다.
      userButtons.forEach(function(item) {
        if (item !== button) {
          item.classList.remove('active');
        }
      });

      // 버튼의 hover 상태 제거
      userButtons.forEach(function(item) {
        item.classList.remove('hover');
      });

      var form = button.closest('form');
      if (form) {
        var targetHref = form.getAttribute('action');
        if (targetHref) {
          window.location.href = targetHref;
        }
      }
    });
  });

  // 탐색 링크에 클릭 이벤트 리스너를 추가합니다.
  navLinks.forEach(function(link) {
    link.addEventListener('click', function(event) {
      event.preventDefault(); // 기본 링크 탐색 동작을 막습니다.

      // 다른 링크에서 'active' 클래스를 제거합니다.
      navLinks.forEach(function(item) {
        if (item !== link) {
          item.classList.remove('active');
        }
      });

      // 링크의 hover 상태 제거
      navLinks.forEach(function(item) {
        item.classList.remove('hover');
      });

      link.classList.add('active'); // 클릭한 링크에 'active' 클래스 추가

      var targetHref = link.getAttribute('href');
      if (targetHref) {
        window.location.href = targetHref;
      }
    });
  });

  function setActiveLink(link) {
    navLinks.forEach(function(item) {
      item.classList.remove('active');
    });
    userButtons.forEach(function(item) {
      item.classList.remove('active');
    });
    link.classList.add('active'); // 활성 링크에 'active' 클래스 추가

    // 활성 탭을 로컬 스토리지에 저장합니다.
    var activeTabId = link.getAttribute('href');
    localStorage.setItem('activeTab', activeTabId);
  }
});
