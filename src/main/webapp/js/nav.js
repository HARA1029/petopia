// setActiveLink 함수: 링크를 활성화시키는 함수
function setActiveLink(link) {
  var links = document.querySelectorAll('.list a'); // 모든 링크 요소 선택
  links.forEach(function(item) {
    item.classList.remove('active'); // 모든 링크에서 'active' 클래스 제거
  });
  link.classList.add('active'); // 주어진 링크에 'active' 클래스 추가

  // 활성 탭을 로컬 저장소에 저장
  var activeTabId = link.getAttribute('href'); // 주어진 링크의 href 속성 값 가져옴
  localStorage.setItem('activeTab', activeTabId); // 로컬 저장소에 'activeTab' 이름으로 저장
}

// 페이지 로드 시 로컬 저장소를 확인하고 활성 탭을 설정하는 코드
document.addEventListener('DOMContentLoaded', function() {
  var activeTabId = localStorage.getItem('activeTab'); // 로컬 저장소에서 'activeTab' 값을 가져옴
  if (activeTabId) {
    var activeTabLink = document.querySelector('.list a[href="' + activeTabId + '"]');
    // 로컬 저장소에 저장된 활성 탭에 해당하는 링크를 선택
    if (activeTabLink) {
      setActiveLink(activeTabLink); // 활성 탭 링크를 활성화시키는 함수 호출
    }
  }
});
