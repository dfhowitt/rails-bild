import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

const initFullCalendar = () => {
  const calendarElement = document.getElementById('calendar');

  if (calendarElement) {
    const events = JSON.parse(calendarElement.dataset.events);
    console.log(events)

    const calendar = new Calendar(calendarElement, {
      plugins: [ dayGridPlugin ],
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true,
      events: events
    });

    calendar.render();
  }

}

export { initFullCalendar };
