// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as material from "./material"

// document.addEventListener('turbo:render', () => M.AutoInit())
document.addEventListener('turbo:load', () => {
  material.autoinitMaterial()
})

document.addEventListener('turbo:before-visit', function() {
  // This routine was set to avoid a problem that has never been 
  // patched where sidenav, toasts and other instances 
  // glitches when a turbo request is dispatched
  const sidenavs = document.querySelectorAll('.sidenav');
 
  sidenavs.forEach(sidenav =>{
    var instance = M.Sidenav.getInstance(sidenav);
    if (instance){
      instance.destroy();
    }
  })
  M.Toast.dismissAll();
});