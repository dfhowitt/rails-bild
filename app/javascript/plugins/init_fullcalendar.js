import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

const initFullCalendar = () => {
  const calendarElement = document.getElementById('calendar');

  if (calendarElement) {
    const calendar = new Calendar(calendarElement, {
      plugins: [ dayGridPlugin ],
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true
    });

    calendar.render();
  }

}

export { initFullCalendar };
