// HTML DOM 요소 선택
const todoInput = document.querySelector('#todoform input[type="text"]'); // 할 일 입력 필드
const todoListUl = document.querySelector('#todolist'); // 할 일 리스트 UL
const colorPicker = document.querySelector('#color-picker'); // HTML에 이미 있는 색상 선택 UI

let selectedColor = '#3788d8'; // 기본 색상

// 색상 선택 이벤트 리스너
colorPicker.addEventListener('click', function (event) {
    if (event.target.classList.contains('color-option')) {
        selectedColor = event.target.getAttribute('data-color'); // 선택된 색상 저장
        document.querySelectorAll('.color-option').forEach(option => option.classList.remove('selected'));
        event.target.classList.add('selected'); // 선택된 색상 강조 표시
    }
});

// 폼 제출 이벤트 핸들러
function handleToDoSubmit(event) {
    event.preventDefault(); // 폼 제출 기본 동작 막기

    const todoText = todoInput.value.trim(); // 입력된 텍스트 가져오기

    // 입력값이 비어있는 경우 처리
    if (!todoText.trim()) {
        alert('할 일을 입력하세요!');
        return;
    }


    // 드래그 가능한 블록 생성 및 추가
    const todoDiv = document.createElement('div'); // 드래그 가능한 블록 생성
    todoDiv.classList.add('fc-event'); // FullCalendar의 드래그 가능한 이벤트 클래스 추가
    todoDiv.setAttribute('draggable', 'true'); // 드래그 가능 속성 설정
    todoDiv.style.backgroundColor = selectedColor; // 선택된 색상 적용
    todoDiv.style.color = '#fff'; // 텍스트 색상 설정
    todoDiv.innerText = todoText; // 텍스트 설정

    // 블록을 todolist에 추가
    todoListUl.appendChild(todoDiv);

    // 드래그 이벤트 추가
    todoDiv.addEventListener('dragstart', handleDragStart);
    todoDiv.addEventListener('dragend', handleDragEnd);


    // 입력 필드 초기화
    todoInput.value ='';
}

// 드래그 시작 이벤트 핸들러
function handleDragStart(event) {
    event.dataTransfer.setData('text/plain', event.target.innerText); // 드래그한 텍스트 저장
    event.target.classList.add('dragging'); // 드래그 시 스타일 변경
}

// 드래그 종료 이벤트 핸들러
function handleDragEnd(event) {
    // 드래그 종료 시 스타일만 복원
    event.target.classList.remove('dragging');
}

// 폼에 이벤트 리스너 추가
document.querySelector('#todoform').addEventListener('submit', handleToDoSubmit);
