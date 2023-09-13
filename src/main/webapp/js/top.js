// testFuction 함수: 로그아웃 폼을 제출하는 함수
function testFuction() {
   document.getElementById("logoutForm").submit(); // 로그아웃 폼 제출
}

// 사용자 버튼에 클릭 이벤트 리스너를 추가합니다.
document.querySelectorAll('.user-button').forEach(function(button) {
  button.addEventListener('click', function(event) {
    event.preventDefault(); // 기본 폼 제출 동작을 막습니다.

    // 현재 클릭한 버튼의 'active' 클래스를 토글합니다.
    button.classList.toggle('active');

    // 다른 버튼에서 'active' 클래스를 제거합니다.
    document.querySelectorAll('.user-button').forEach(function(item) {
      if (item !== button) {
        item.classList.remove('active');
      }
    });

    // 버튼의 hover 상태 제거
    document.querySelectorAll('.user-button').forEach(function(item) {
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
document.querySelectorAll('#nav .container a').forEach(function(link) {
  link.addEventListener('click', function(event) {
    event.preventDefault(); // 기본 링크 탐색 동작을 막습니다.

    // 다른 링크에서 'active' 클래스를 제거합니다.
    document.querySelectorAll('#nav .container a').forEach(function(item) {
      if (item !== link) {
        item.classList.remove('active');
      }
    });

    // 링크의 hover 상태 제거
    document.querySelectorAll('#nav .container a').forEach(function(item) {
      item.classList.remove('hover');
    });

    link.classList.add('active'); // 클릭한 링크에 'active' 클래스 추가

    var targetHref = link.getAttribute('href');
    if (targetHref) {
      window.location.href = targetHref;
    }
  });
});

// 페이지 로드 시 로컬 저장소를 확인하고 활성 탭을 설정합니다.
document.addEventListener('DOMContentLoaded', function() {
  var activeTabId = localStorage.getItem('activeTab');
  if (activeTabId) {
    var activeTabLink = document.querySelector('#nav .container a[href="' + activeTabId + '"]');
    if (activeTabLink) {
      setActiveLink(activeTabLink); // 활성 탭을 설정하는 함수 호출
    }
  }
});

// setActiveLink 함수: 활성 링크를 설정하는 함수
function setActiveLink(link) {
  document.querySelectorAll('#nav .container a').forEach(function(item) {
    item.classList.remove('active'); // 모든 링크에서 'active' 클래스 제거
  });
  document.querySelectorAll('.user-button').forEach(function(item) {
    item.classList.remove('active'); // 모든 버튼에서 'active' 클래스 제거
  });
  link.classList.add('active'); // 주어진 링크에 'active' 클래스 추가

  // 활성 탭을 로컬 저장소에 저장합니다.
  var activeTabId = link.getAttribute('href');
  localStorage.setItem('activeTab', activeTabId);
}
