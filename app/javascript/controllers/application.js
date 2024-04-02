import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

console.log(vapidPublicKey)

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/service_worker.js')
  .then(function(reg) {
    navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
      serviceWorkerRegistration.pushManager
      .subscribe({
        userVisibleOnly: true,
        applicationServerKey: vapidPublicKey
      }).then(function(sub){
        console.log(sub);
      })
    })
  });
}
// Otherwise, no push notifications :(
else {
  console.error('Service worker is not supported in this browser');
}

