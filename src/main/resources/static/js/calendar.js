document.addEventListener('DOMContentLoaded', function () {
    // 외부 이벤트를 Draggable로 설정
    new FullCalendar.Draggable(document.getElementById('todolist'), {
        itemSelector: '.fc-event', // 드래그 가능한 요소의 클래스
        eventData: function (eventEl) {
            return {
                title: eventEl.innerText.trim(), // 이벤트 제목
                backgroundColor: eventEl.style.backgroundColor || '#3788d8',
                borderColor: eventEl.style.backgroundColor || '#3788d8',
                textColor: '#fff'
            };
        }
        
    });

    // 캘린더 설정 (기존 코드 유지)
    var calendarEl = document.getElementById('calendar1');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        editable: true,
        droppable: true,
        headerToolbar: {
            start: 'dayGridMonth,timeGridWeek',
            center: 'title',
            end: 'today prev,next'
        },
        selectable: true,
        events: [],

        drop: function (info) {
            if (info.draggedEl.dataset.added == "true") {
                return;
            }
            console.log("오류1"+info);
            
            info.draggedEl.dataset.added = "true";
            const eventObj = {
                title: info.draggedEl.innerText.trim(),
                start: info.date,
                backgroundColor: info.draggedEl.style.backgroundColor || '#3788d8',
                borderColor: info.draggedEl.style.backgroundColor || '#3788d8',
                textColor: '#fff'
            };

            calendar.addEvent(eventObj); // 캘린더에 이벤트 추가
            info.draggedEl.remove(); // 드래그된 요소 삭제
        },

      // 종원 추가 캘린더 삭제 이벤트
      // 이벤트 클릭 시 삭제하는 기능 추가
      eventClick: function(info) {
          // 사용자에게 확인 메시지를 보여줍니다.
          if (confirm("이 이벤트를 삭제하시겠습니까?")) {
              // 확인을 클릭하면 해당 이벤트를 삭제합니다.
              info.event.remove();
          }
      }
    });

    calendar.render();
});
